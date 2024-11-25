from dataclasses import dataclass, field
from typing import Dict, List, Set, Optional, Union, Tuple
from collections import Counter, defaultdict
from .node import Node, NodeType
import hashlib
import json
from core.pass_exec_engine import MLIRPassExecutionEngine
from core.pass_registry import DialectPassRegistry
import logging

logger = logging.getLogger(__name__)

class MLIRCodeState:

    def __init__(self, content: str, 
                 registry: DialectPassRegistry, 
                 mlir_exec_engine: MLIRPassExecutionEngine,
                 history_dialects: Tuple[str] = [],
                 history_passes: Tuple[str] = []):
        self.content: str = content  # MLIR内容
        self.registry: DialectPassRegistry = registry
        self.mlir_exec_engine: MLIRPassExecutionEngine = mlir_exec_engine
        self.dialects: Dict[str, Set[str]] # 当前MLIR代码的dialect和op集合
        self.op_statistics: Dict[str, Counter] # 每个dialect中各个op的数量
        self.available_dialects: Tuple[str] = ()
        self.available_passes: Tuple[str] = ()
        self.history_dialects: Tuple[str] = history_dialects
        self.history_passes: Tuple[str] = history_passes
        self.content_hash: bytes = hashlib.sha256(self.content.encode()).digest()
        self._gen_dialects_and_ops()
        self._gen_available_dialects_and_passes()
    
        
    def _gen_dialects_and_ops(self):
        self.dialects, self.op_statistics = self.mlir_exec_engine.parse_mlir_content(self.content)

    def _gen_available_dialects_and_passes(self):
        self.available_dialects = self.dialects.keys()
        available_pass_list = []
        for d in self.available_dialects:
            available_pass_list.extend(self.registry.get_dialect_passes(d))
        self.available_passes = (available_pass_list)

    def get_available_dialects(self) -> Tuple:
        """获取所有可用的dialects"""
        return tuple(self.available_dialects)

    def get_available_passes(self) -> Tuple:
        """获取所有可用的passes"""
        return tuple(self.available_passes)

    def get_total_op_count(self) -> int:
        """获取所有算子的总数"""
        return sum(sum(counter.values()) for counter in self.op_statistics.values())

    def get_specific_op_count(self, dialect: str, op: str) -> int:
        """
        获取特定算子的数量
        
        Args:
            dialect: dialect名称
            op: 操作名称
            
        Returns:
            特定操作的数量
        """
        return self.op_statistics.get(dialect, Counter()).get(op, 0)

    def get_hash(self) -> bytes:
        return self.content_hash

    def compare_with(self, other: 'MLIRCodeState') -> Dict[str, Union[Dict[str, Union[Counter, Dict[str, int]]], Set[str]]]:
        """
        比较两个MLIR代码状态的差异，提供详细的操作变化信息，包括dialect级别的变化

        Args:
            other: 要比较的另一个MLIRCodeState实例
                
        Returns:
            Dict with the following structure:
            {
                'new_dialects': {'dialect1', 'dialect2', ...},  # 新增的dialect集合
                'removed_dialects': {'dialect3', 'dialect4', ...},  # 删除的dialect集合
                'new_ops': {
                    dialect_name: Counter({op_name: count, ...}),
                    ...
                },
                'removed_ops': {
                    dialect_name: Counter({op_name: count, ...}),
                    ...
                },
                'changed_ops': {
                    dialect_name: {
                        op_name: count_difference,
                        ...
                    },
                    ...
                }
            }
        """
        changes = {
            'new_dialects': set(),    # 新增的dialect
            'removed_dialects': set(), # 删除的dialect
            'new_ops': {},            # 新增的操作
            'removed_ops': {},        # 删除的操作
            'changed_ops': {}         # 数量发生变化的操作
        }

        # 检测dialect级别的变化
        current_dialects = set(self.dialects.keys())
        other_dialects = set(other.dialects.keys())

        # 找出新增和删除的dialect
        changes['new_dialects'] = current_dialects - other_dialects
        changes['removed_dialects'] = other_dialects - current_dialects

        # 对所有dialect进行操作级别的比较
        all_dialects = current_dialects | other_dialects

        for dialect in all_dialects:
            # Initialize counters only when needed
            current_ops = self.op_statistics.get(dialect, Counter())
            other_ops = other.op_statistics.get(dialect, Counter())
            
            # Track changes for this dialect
            dialect_new_ops = Counter()
            dialect_removed_ops = Counter()
            dialect_changed_ops = {}
            
            # Find new and changed operations
            for op, count in current_ops.items():
                other_count = other_ops.get(op, 0)
                if other_count == 0:
                    # Operation is new
                    dialect_new_ops[op] = count
                elif count != other_count:
                    # Operation count has changed
                    dialect_changed_ops[op] = count - other_count
            
            # Find removed operations
            for op, count in other_ops.items():
                if op not in current_ops:
                    dialect_removed_ops[op] = count
            
            # Only add non-empty changes to the result
            if dialect_new_ops:
                changes['new_ops'][dialect] = dialect_new_ops
            if dialect_removed_ops:
                changes['removed_ops'][dialect] = dialect_removed_ops
            if dialect_changed_ops:
                changes['changed_ops'][dialect] = dialect_changed_ops

        return changes

    def is_different_from(self, other: 'MLIRCodeState') -> bool:
        """
        检查当前状态是否与另一个状态不同，包括dialect和操作级别的变化
        
        Args:
            other: 要比较的另一个MLIRCodeState实例
                
        Returns:
            如果状态有变化返回True，否则返回False
            
        Raises:
            TypeError: 如果other参数不是MLIRCodeState类型
        """
        if not isinstance(other, type(self)):
            raise TypeError(f"Expected MLIRCodeState object, got {type(other).__name__}")
        
        return self.get_hash() != other.get_hash()

    def __str__(self) -> str:
        """返回MLIR代码状态的字符串表示"""
        lines = ["MLIR Code State:"]
        
        # 添加总操作数
        total_ops = self.get_total_op_count()
        lines.append(f"Total Operations: {total_ops}")
        
        # 添加每个dialect的信息
        if self.dialects:
            lines.append("\nDialects and Operations:")
            for dialect, ops in self.dialects.items():
                lines.append(f"\n{dialect}:")
                dialect_ops = self.op_statistics.get(dialect, Counter())
                for op in sorted(ops):
                    count = dialect_ops.get(op, 0)
                    lines.append(f"  - {op}: {count}")
                    
        return "\n".join(lines)

    def try_pass(self, pass_name: str) -> Optional['MLIRCodeState']:
        """
        尝试应用一个pass
        
        Returns:
            新状态 或 None
        """

        logger.debug(f"Attempting pass: {pass_name}")
        
        new_mlir_content = self.mlir_exec_engine.apply_pass(self.content, pass_name)

        if new_mlir_content is None:
            logger.debug(f"new_mlir_content is None")
            return None

        # 解析新状态
        new_mlir_code_state = MLIRCodeState(content=new_mlir_content,
                                            registry=self.registry,
                                            mlir_exec_engine=self.mlir_exec_engine, 
                                            history_dialects=self.history_dialects,
                                            history_passes=(*self.history_passes, pass_name))
        
        # 检查是否有变化
        if not new_mlir_code_state.is_different_from(self):
            logger.debug(f"Pass {pass_name} did not change the MLIR")
            return None

        logger.debug(f"Pass: {pass_name} generates new MLIR state")
        return new_mlir_code_state

    def clean_content(self):
        self.content = self.mlir_exec_engine.clean_code(self.content)



class PostDialectDecisionNode(Node):
    
    def __init__(self, code_state: MLIRCodeState,
                 applied_dialect: str = None):
        """初始化 PostDialectDecisionState

        Args:
            code_state: 当前MLIR代码状态
            applied_dialect: 应用的dialect
            active_passes: 当前应用dialect的激活pass列表  
        """
        super().__init__(node_type=NodeType.POST_DIALECT)
        self.code_state: MLIRCodeState = code_state
        self.applied_dialect = applied_dialect
        self.active_passes = list(self.code_state.registry.get_dialect_passes(applied_dialect))


    def __str__(self) -> str:
        """返回Post-Dialect决策状态的字符串表示"""
        lines = [super().__str__(), "Post-Dialect Decision State:"]
        
        lines.append(str(self.code_state))
                
        if self.active_dialects:
            lines.append("\nActive Dialects:")
            for dialect in self.active_dialects:
                lines.append(f"  - {dialect}")
                
        if self.applied_dialect:
            lines.append(f"\nApplied Dialect: {self.applied_dialect}")
            
        return "\n".join(lines)

    def get_code_state_hash(self) -> str:
        return self.code_state.get_hash()
    
    def get_mlir_code_state(self) -> MLIRCodeState:
        return self.code_state

    def remove_pass(self, pass_name: str):
        self.active_passes.remove(pass_name)

    def select_next_pass(self) -> Optional[str]:
        """选择下一个要尝试的pass"""
        # 删除历史使用过的passes
        self.active_passes = [x for x in self.active_passes if x not in self.code_state.history_passes]
        
        if len(self.active_passes) == 0:
            return None

        # 选择第一个可用的pass
        return self.active_passes[0]

    def try_gen_next_node(self) -> Optional['PostPassDecisionNode']:
        
        while True:
            pass_name = self.select_next_pass()
            
            if pass_name is None:
                logger.debug(f"PostDialectDecisionNode: don't have active passes. Backtrack!")
                return None # 当前节点已经无法继续生成新节点
            
            logger.debug(f"history pass list: {self.code_state.history_passes}")
            logger.debug(f"select new pass: {pass_name}")
            new_pass_pipeline = list(self.code_state.history_passes)
            new_pass_pipeline.append(pass_name)
            logger.debug(f"Current pass pipeline: {new_pass_pipeline}")
            self.remove_pass(pass_name)
            
            new_mlir_code_state = self.code_state.try_pass(pass_name)
            if new_mlir_code_state is not None:
                return PostPassDecisionNode(code_state=new_mlir_code_state, applied_pass=pass_name)
            else:
                logger.debug(f"new_mlir_code_state is None.")
                continue
            

            


class PostPassDecisionNode(Node):
    
    def __init__(self, code_state: MLIRCodeState,
                 applied_pass: Optional[str]):
        """初始化 PostPassDecisionState

        Args:
            code_state: 当前MLIR代码状态
            applied_pass: 应用的pass
            active_dialects: 应用当前pass激活的dialect列表
        """
        super().__init__(node_type=NodeType.POST_PASS)
        self.code_state: MLIRCodeState = code_state
        self.active_dialects = list(code_state.get_available_dialects())
        self.applied_pass: str = applied_pass

    def __str__(self) -> str:
        """返回Post-Pass决策状态的字符串表示"""
        lines = [super().__str__(), "Post-Pass Decision State:"]
        
        lines.append(str(self.code_state))
                
        if self.active_dialects:
            lines.append("\nActive Passes:")
            for pass_name in self.active_dialects:
                lines.append(f"  - {pass_name}")
                
        if self.applied_pass:
            lines.append(f"\nApplied Pass: {self.applied_pass}")
            
        return "\n".join(lines)
    
    def get_code_state_hash(self) -> str:
        return self.code_state.get_hash()
    
    def get_mlir_code_state(self) -> MLIRCodeState:
        return self.code_state
    
    def remove_dialect(self, dialect_name: str):
        self.active_dialects.remove(dialect_name)
        
    def select_next_dialect(self) -> Optional[str]:
        """选择下一个要处理的dialect"""
        if len(self.active_dialects) == 0:
            return None
        
        # current_levels = {d: self.code_state.registry.get_dialect_obj_by_name(d).level.value 
        #                  for d in self.active_dialects}
        
        # # 选择最高level的可用pass                 
        # return max(self.active_dialects, key=lambda d: current_levels[d])
        return self.active_dialects[0]
    
    def try_gen_next_node(self) -> Optional[PostDialectDecisionNode]:
        dialect_name = self.select_next_dialect()
        
        if dialect_name is None:
            logger.debug(f"PostPassDecisionNode: don't have active dialects. Backtrack!")
            return None # 无法继续生成节点，需要回溯
        
        logger.debug(f"history dialect list: {self.code_state.history_dialects}")
        logger.debug(f"select new dialect: {dialect_name}")
        new_dialect_pipeline = list(self.code_state.history_dialects)
        new_dialect_pipeline.append(dialect_name)
        logger.debug(f"Current dialect list: {new_dialect_pipeline}")
        self.remove_dialect(dialect_name)
        
        
        new_mlir_code_state = MLIRCodeState(content=self.code_state.content,
                      registry=self.code_state.registry,
                      mlir_exec_engine=self.code_state.mlir_exec_engine,
                      history_dialects=(*self.code_state.history_dialects, dialect_name),
                      history_passes=self.code_state.history_passes)
        
        return PostDialectDecisionNode(code_state=new_mlir_code_state, applied_dialect=dialect_name)
    
class InitialNode(PostPassDecisionNode):
    
    def __init__(self, code_state: MLIRCodeState):
        code_state.clean_content()
        super().__init__(code_state=code_state, applied_pass=None)

        