from typing import Dict, List, Set, Optional, TypeVar
from dataclasses import dataclass, field
from abc import ABC, abstractmethod
from enum import Enum, auto
from .state import MLIRCodeState
import random
from agent.Agent import Agent
import logging

logger = logging.getLogger(__name__)

class NodeType(Enum):
    POST_DIALECT = auto()
    POST_PASS = auto()

class Node(ABC):
    """
    表示搜索树中的一个节点
    """
    _id_counter = 0  # 类变量，用于生成唯一ID

    def __init__(self, parent: Optional['Node'] = None, node_type: NodeType = NodeType.POST_PASS):
        self.parent = parent  # 父节点
        self.children: List['Node'] = []  # 子节点
        self.id = Node._id_counter  # 分配唯一ID
        self.node_type = node_type 
        Node._id_counter += 1
        
        if parent:
            parent.children.append(self)
            
    def get_type(self) -> NodeType:
        return self.node_type
            
    def get_transformation_sequence(self) -> List[str]:
        """获取从根节点到当前节点的转换序列"""
        path = self.get_path()
        sequence = []
        for node in path[1:]:  # 跳过根节点
            if node.get_type() == NodeType.POST_PASS:
                sequence.extend(node.applied_passes)
        return sequence

    def add_child(self, node: 'Node'):
        """
        添加子节点并返回新节点
        """
        self.children.append(node)
      
    def remove_child(self, child_id: int) -> bool:
        """
        移除指定ID的子节点
        
        Args:
            child_id: 要移除的子节点ID
            
        Returns:
            是否成功移除
        """
        for i, child in enumerate(self.children):
            if child.id == child_id:
                self.children.pop(i)
                return True
        return False
      
    def get_path(self) -> List['Node']:
        """
        获取从根节点到当前节点的路径
        """
        path = []
        current = self
        while current is not None:
            path.append(current)
            current = current.parent
        return list(reversed(path))
      
    def get_depth(self) -> int:
        """
        获取当前节点的深度(到根节点的距离)
        
        Returns:
            节点深度
        """
        depth = 0
        current = self
        while current.parent is not None:
            depth += 1
            current = current.parent
        return depth

    def find_node(self, node_id: int) -> Optional['Node']:
        """
        在子树中查找指定ID的节点
        
        Args:
            node_id: 要查找的节点ID
            
        Returns:
            找到的节点,未找到返回None
        """
        if self.id == node_id:
            return self
            
        for child in self.children:
            result = child.find_node(node_id)
            if result:
                return result
        return None

    def __str__(self):
        """
        打印节点信息（包括路径和状态摘要）
        """
        lines = [f"Node {self.id} (Type: {self.node_type.name}):"]
        if self.parent:
            lines.append(f"  Parent Node ID: {self.parent.id}")
        else:
            lines.append("  Root Node")

        return "\n".join(lines)
    
    def visualize_subtree(self, depth: int = 0, max_depth: Optional[int] = None) -> None:
        """
        可视化子树
        
        Args:
            depth: 当前深度
            max_depth: 最大显示深度
        """
        if max_depth is not None and depth > max_depth:
            return
            
        prefix = "  " * depth
        print(f"{prefix}{str(self)}")
        
        for child in self.children:
            child.visualize_subtree(depth + 1, max_depth)

    @abstractmethod
    def try_gen_next_node(self):
        pass
    


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
        self.agent = Agent()

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
        if pass_name in self.active_passes:
            self.active_passes.remove(pass_name)

    def select_next_passes(self) -> Optional[List[str]]:
        """选择下一个要尝试的pass"""
        # 删除历史使用过的passes
        self.active_passes = [x for x in self.active_passes if x not in self.code_state.pass_pipeline]
        
        if len(self.active_passes) == 0:
            return None

        # 在active_passes中随机选择一个pass
        chosen_pass_name = random.choice(self.active_passes)
        
        # 用agent推荐一个pass
        # chosen_pass_name = self.agent.choose_pass(code_state=self.code_state, activate_passes=self.active_passes)
        
        #TODO：用rule选择一个pass
        
        selected_passes = [chosen_pass_name]
        
        # 处理next_pass逻辑
        chosen_pass_obj = self.code_state.registry.get_pass_by_name(chosen_pass_name)
        if chosen_pass_obj.has_next_pass():
            next_pass_name = chosen_pass_obj.get_next_pass()
            selected_passes.append(next_pass_name)
        return selected_passes

    def try_gen_next_node(self) -> Optional['PostPassDecisionNode']:
        
        while True:
            selected_passes = self.select_next_passes()
            
            if selected_passes is None:
                logger.debug(f"PostDialectDecisionNode: don't have active passes. Backtrack!")
                return None # 当前节点已经无法继续生成新节点
            
            logger.debug(f"History pass pipeline: {self.code_state.pass_pipeline}")
            logger.debug(f"Selected new passes: {selected_passes}")
            new_pass_pipeline = self.code_state.pass_pipeline
            for pass_name in selected_passes:
                new_pass_pipeline = new_pass_pipeline.append_pass(pass_name)
                self.remove_pass(pass_name)

            logger.debug(f"Current new pass pipeline: {new_pass_pipeline}")
            
            new_mlir_code_state = self.code_state.try_pass(new_pass_pipeline)
            if new_mlir_code_state is not None:
                return PostPassDecisionNode(code_state=new_mlir_code_state, applied_passes=selected_passes)
            else:
                logger.debug(f"new_mlir_code_state is None.")
                continue
            

            


class PostPassDecisionNode(Node):
    
    def __init__(self, code_state: MLIRCodeState,
                 applied_passes: Optional[List[str]]):
        """初始化 PostPassDecisionState

        Args:
            code_state: 当前MLIR代码状态
            applied_passes: 应用的passes
            active_dialects: 应用当前pass激活的dialect列表
        """
        super().__init__(node_type=NodeType.POST_PASS)
        self.code_state: MLIRCodeState = code_state
        self.active_dialects = list(code_state.get_available_dialects())
        self.applied_passes: List[str] = applied_passes
        self.agent = Agent()

    def __str__(self) -> str:
        """返回Post-Pass决策状态的字符串表示"""
        lines = [super().__str__(), "Post-Pass Decision State:"]
        
        lines.append(str(self.code_state))
                
        if self.active_dialects:
            lines.append("\nActive Passes:")
            for pass_name in self.active_dialects:
                lines.append(f"  - {pass_name}")
                
        if self.applied_passes:
            lines.append(f"\nApplied Pass: {self.applied_passes}")
            
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
        
        logger.debug(f"available_dialects: {self.code_state.get_available_dialects()}")
        logger.debug(f"active_dialects: {self.active_dialects}")
        
        # 随机选择一个dialect
        chosen_dialect = random.choice(self.active_dialects)
        
        # 用rule选择一个dialect
        if self.code_state.registry.has_pipeline():
            dialects = self.code_state.registry.get_pipeline_by_name("tosa-to-llvm").get_stage_dialects_from(self.active_dialects)
            if len(dialects) != 1:
                # 用agent选择一个dialect
                # chosen_dialect = self.agent.choose_dialect(code_state=self.code_state, activate_dialects=dialects)
                chosen_dialect = random.choice(dialects)
            else:
                chosen_dialect = random.choice(dialects)
        return chosen_dialect
    
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
        
        
        new_mlir_code_state = MLIRCodeState(initial_content=self.code_state.initial_content,
                        content=self.code_state.content,
                      registry=self.code_state.registry,
                      mlir_exec_engine=self.code_state.mlir_exec_engine,
                      history_dialects=(*self.code_state.history_dialects, dialect_name),
                      pass_pipeline=self.code_state.pass_pipeline)

        return PostDialectDecisionNode(code_state=new_mlir_code_state, applied_dialect=dialect_name)
    
class InitialNode(PostPassDecisionNode):
    
    def __init__(self, code_state: MLIRCodeState):
        super().__init__(code_state=code_state, applied_passes=None)

        