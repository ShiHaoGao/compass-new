from dataclasses import dataclass, field
from typing import Dict, List, Set, Optional, Union, Tuple
from collections import Counter, defaultdict
import hashlib
from core.Pass import PassPipeline
from core.pass_exec_engine import MLIRPassExecutionEngine
from core.Registry import Registry
import logging
import random

logger = logging.getLogger(__name__)

class MLIRCodeState:

    def __init__(self,
                 initial_content: str,
                 content: str, 
                 registry: Registry, 
                 mlir_exec_engine: MLIRPassExecutionEngine,
                 history_dialects: Tuple[str] = (),
                 pass_pipeline: PassPipeline = PassPipeline()):
        self.initial_content: str = initial_content  # 原本的MLIR内容
        self.content: str = content  # 当前MLIR内容
        self.registry: Registry = registry
        self.mlir_exec_engine: MLIRPassExecutionEngine = mlir_exec_engine
        self.dialects: Dict[str, Set[str]] # 当前MLIR代码的dialect和op集合
        self.op_statistics: Dict[str, int] # 每个op的数量
        self.available_dialects: Tuple[str] = ()
        self.available_passes: Tuple[str] = ()
        self.history_dialects: Tuple[str] = history_dialects
        self.pass_pipeline: PassPipeline = pass_pipeline
        self.content_hash: bytes = hashlib.sha256(self.content.encode()).digest()
        self._gen_dialects_and_ops()
        self._gen_available_dialects_and_passes()
    
        
    def _gen_dialects_and_ops(self):
        # 非 circt
        # self.dialects, self.op_statistics = self.mlir_exec_engine.parse_mlir_content(self.initial_content, self.pass_pipeline)
        # circt：
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
        return (sum(counter.values()) for counter in self.op_statistics.values())

    def get_specific_dialect_total_op_count(self, dialect: str) -> int:
        """
        获取特定dialect的op总数
        """
        op_count = self.get_specific_dialect_op_count(dialect)
        total_count = 0
        for op, count in op_count.items():
            total_count += count
        return total_count

    def get_specific_dialect_op_count(self, dialect: str) -> Dict[str, int]:
        """获取特定dialect的 {op: countr}

        Args:
            dialect (str): _description_

        Returns:
            Dict: {op1: 3, op2: 3, ...}
        """
        op_set = self.dialects[dialect]
        op_count = {}
        for op in op_set:
            op_count[op] = self.op_statistics[op]
        return op_count

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
        """返回MLIR代码状态的完整字符串表示，包含代码内容和统计信息"""
        lines = ["=== MLIR Code State ==="]
        
        # 添加初始代码内容
        lines.append("\n=== Initial MLIR Content ===")
        lines.append(self.initial_content if self.initial_content else "[Empty]")
        
        # 添加当前代码内容
        lines.append("\n=== Current MLIR Content ===")
        lines.append(self.content if self.content else "[Empty]")
        
        # 添加统计信息头部
        lines.append("\n=== Statistics ===")
        
        # 添加总操作数
        total_ops = sum(counter for counter in self.op_statistics.values())
        lines.append(f"\nTotal Operations: {total_ops}")
        
        # 添加当前可用的dialect信息
        lines.append(f"Available Dialects: {len(self.available_dialects)}")
        lines.append(f"Dialects: {', '.join(sorted(self.available_dialects))}")
        
        # 添加可用的pass信息
        lines.append(f"Available Passes: {len(self.available_passes)}")
        
        # 添加历史dialect信息
        if self.history_dialects:
            lines.append(f"History Dialects: {', '.join(self.history_dialects)}")
        
        # 添加当前pass pipeline信息
        lines.append(f"\nCurrent Pass Pipeline: {self.pass_pipeline}")
        
        # 添加每个dialect的详细统计信息
        if self.dialects:
            lines.append("\n=== Dialect Statistics ===")
            for dialect, op_set in sorted(self.dialects.items()):
                # 计算该dialect的总操作数
                dialect_op_count = self.get_specific_dialect_op_count(dialect)
                dialect_total = self.get_specific_dialect_total_op_count(dialect)
                
                lines.append(f"\n{dialect} (Total Ops: {dialect_total}):")
                # 按操作数量降序排列显示各个操作
                sorted_op_count = sorted(dialect_op_count.items(), key=lambda x: x[1], reverse=True)
                for (op, count) in sorted_op_count:
                    lines.append(f"  - {op}: {count}")
                    
        return "\n".join(lines)

    def try_pass(self, pass_pipeline: PassPipeline) -> Optional['MLIRCodeState']:
        """
        尝试应用一个pass
        
        Returns:
            新状态 或 None
        """

        logger.debug(f"Attempting pass pipeline: {pass_pipeline}")
        
        new_mlir_content = self.mlir_exec_engine.apply_pass(self.initial_content, pass_pipeline)

        if new_mlir_content is None:
            logger.debug(f"new_mlir_content is None")
            return None

        # 解析新状态
        new_mlir_code_state = MLIRCodeState(initial_content=self.initial_content,
                                            content=new_mlir_content,
                                            registry=self.registry,
                                            mlir_exec_engine=self.mlir_exec_engine, 
                                            history_dialects=self.history_dialects,
                                            pass_pipeline=pass_pipeline)
        
        # 检查是否有变化
        if not new_mlir_code_state.is_different_from(self):
            logger.debug(f"{pass_pipeline} did not change the MLIR")
            return None

        logger.debug(f"{pass_pipeline} generates new MLIR state")
        return new_mlir_code_state

    def clean_content(self):
        self.content = self.mlir_exec_engine.clean_code(self.content)

    def available_dialects_are_core_dialects(self) -> bool:
        for d in self.available_dialects:
            if not self.registry.is_core_dialect(d):
                return False
                
        return True

