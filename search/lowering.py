from typing import Optional, Dict, List, Set, Tuple, Union
from pathlib import Path
from core.Registry import Registry
from core.pass_exec_engine import MLIRPassExecutionEngine
from core.state import MLIRCodeState
from core.node import PostDialectDecisionNode, PostPassDecisionNode, InitialNode
from utils.statistics import PassStatisticsCollector
from .search_tree import PassSearchTree
from config.configuration import LoweringConfig
import logging

logger = logging.getLogger(__name__)


class DynamicLowering:
    
    def __init__(self, config: Optional[LoweringConfig] = None):
        # 使用默认配置或传入的配置
        self.config = config or LoweringConfig()
        
        # 根据配置初始化组件
        self.registry = Registry(core_config_path=self.config.core_config_path,
                                third_party_config_path=self.config.third_party_config_path)
        self.mlir_exec_engine = MLIRPassExecutionEngine(registry=self.registry, 
                                                        mlir_opt_path=self.config.mlir_opt_path, 
                                                        third_party_opt_path=self.config.third_party_opt_path)
        self.statistics = PassStatisticsCollector()
        self.history = []
        self.successful_pass_pipeline = []
        self.search_tree = PassSearchTree()
        
        # 设置输出目录
        self.config.output_dir.mkdir(parents=True, exist_ok=True)
    
    def is_successful_lowering_to_target(self, mlir_code_state: MLIRCodeState) -> bool:
        dialects = mlir_code_state.get_available_dialects()
        
        if self.config.target_type == "core":
            return mlir_code_state.available_dialects_are_core_dialects()
        elif self.config.target_type == "llvm":
            if len(dialects) == 1 and "llvm" in dialects:
                return True
            return False
        elif self.config.target_type == "custom":
            if all(item in dialects for item in self.config.target_dialects) \
                and self.config.illegal_dialects not in dialects:
                return True
            else:
                return False
        else:
            logger.error("Target type is illegal!")

    
    def lower(self, input_file: str) -> Optional[MLIRCodeState]:
        """
        动态降级MLIR到目标dialect
        """
        self.input_file = Path(input_file).name
        with open(input_file, 'r') as f:
            initial_content = f.read()
        # 清理源文件中注释
        initial_content = self.mlir_exec_engine.clean_code(initial_content)
        
        # 解析初始状态
        initial_mlir_code_state = MLIRCodeState(initial_content=initial_content,
                                                content=initial_content,
                                                registry=self.registry,
                                                mlir_exec_engine=self.mlir_exec_engine)
        initial_node = InitialNode(code_state=initial_mlir_code_state)
            
        # 初始化搜索树
        self.search_tree.initialize(initial_node)

        # 开始构建树搜索
        iteration = 0
        while iteration < self.config.max_iterations:
            iteration += 1
            logger.info(f"Iteration: {iteration}")
            current: Union[PostDialectDecisionNode, PostPassDecisionNode] = self.search_tree.current
            if self.search_tree.current_is_empty():
                logger.debug("No solution found - backtracking exhausted")
                return None
            
            # 获取当前节点的MLIR代码状态
            current_mlir_code_state = current.get_mlir_code_state()
            
            # 检查是否达到目标
            if self.is_successful_lowering_to_target(current_mlir_code_state):
                # 记录成功路径
                self.search_tree.record_successful_path()
                self.successful_pass_pipeline = self.search_tree.get_transformation_sequence()
                path = self.search_tree.get_transformation_sequence()
                self.history.append(path)  # 将当前path记录到成功记录中。
                self._save_current_state(current_mlir_code_state)
                logger.info("Successfully Lowering mlir!")
                return current_mlir_code_state

            new_node = current.try_gen_next_node()
            if new_node is not None:
                self.search_tree.add_state(new_node)
                # 剪枝：已经搜索过的代码状态相同，则剪枝
                if self.search_tree.has_been_visited(new_node):
                    self.search_tree.backtrack()
                    logger.debug("Current state is visited. Backtrack!")
                    continue
            else: # 生成新的节点失败
                # current向上回溯到
                self.search_tree.mark_state_visited(current)
                self.search_tree.backtrack()
                logger.debug("Generating new node failed. Backtrack!")
            
            

    def _save_current_state(self, state: MLIRCodeState):
        """保存中间状态"""
        if not self.config.save_intermediate_states:
            return
        
        state_file = Path(self.config.output_dir) / f"lowered_{self.input_file}"
        with open(state_file, 'w') as f:
            f.write(state.content)

    def _print_changes(self, changes: dict):
        """打印状态变化信息"""
        logger.debug("\nChanges after pass:")
        
        if changes['new_ops']:
            logger.debug("\nNew operators:")
            for dialect, ops in changes['new_ops'].items():
                logger.debug(f"  {dialect} dialect:")
                for op, count in ops.items():
                    logger.debug(f"    + {op}: {count}")
                    
        if changes['removed_ops']:
            logger.debug("\nRemoved operators:")
            for dialect, ops in changes['removed_ops'].items():
                logger.debug(f"  {dialect} dialect:")
                for op, count in ops.items():
                    logger.debug(f"    - {op}: {count}")
                    
        if changes['changed_ops']:
            logger.debug("\nChanged operator counts:")
            for dialect, ops in changes['changed_ops'].items():
                logger.debug(f"  {dialect} dialect:")
                for op, diff in ops.items():
                    logger.debug(f"    {op}: {diff:+d}")

    def generate_report(self) -> dict:
        """生成详细的转换报告"""
        stats = self.statistics.get_all_statistics()
        best_path = self.search_tree.get_best_path()
        
        report = {
            "applied_passes": self.history,
            "search_stats": {
                "total_states": self.search_tree.metrics.total_states,
                "visited_states": self.search_tree.metrics.visited_states,
                "successful_paths": self.search_tree.metrics.successful_paths,
                "failed_paths": self.search_tree.metrics.failed_paths,
                "max_depth": self.search_tree.metrics.max_depth,
                "total_time": self.search_tree.metrics.total_time
            },
            "pass_stats": {
                pass_name: {
                    "total_calls": stat.total_calls,
                    "success_rate": stat.successful_calls / stat.total_calls,
                    "average_time": stat.average_time
                }
                for pass_name, stat in stats.items()
            }
        }
        
        if best_path:
            report["best_path"] = {
                "pass pipeline": self.successful_pass_pipeline,
                # "total_time": sum(node.metrics.time_cost for node in best_path if node.metrics),
                # "memory_peak": max(node.metrics.memory_usage for node in best_path if node.metrics)
            }
            
        return report