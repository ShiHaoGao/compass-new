from dataclasses import dataclass
from typing import Dict, List, Set, Optional, Tuple, Union
from core.node import Node, NodeType, PostDialectDecisionNode, PostPassDecisionNode
from core.state import MLIRCodeState

@dataclass
class SearchMetrics:
    """搜索过程的统计指标"""
    total_states: int = 0  # 总探索状态数
    visited_states: int = 0  # 已访问状态数
    successful_paths: int = 0  # 成功路径数
    failed_paths: int = 0  # 失败路径数
    max_depth: int = 0  # 最大搜索深度
    total_time: float = 0.0  # 总搜索时间

class PassSearchTree:
    """使用回溯搜索的pass选择树"""
    
    def __init__(self):
        self.root: Optional[Node] = None
        self.current: Optional[Node] = None
        self.visited_states: Set[bytes] = set()  # 记录已访问的状态哈希
        self.metrics = SearchMetrics()  # 搜索统计指标
        self.successful_paths: List[List[Node]] = []  # 成功路径记录
        
    def initialize(self, initial_node: PostPassDecisionNode):
        """
        初始化搜索树
        """
        self.root = initial_node
        self.current = self.root
        self.metrics = SearchMetrics()
                
    def has_been_visited(self, state: Union[PostDialectDecisionNode, PostPassDecisionNode]) -> bool:
        """
        检查状态是否已访问过
        
        Args:
            state: 要检查的状态
            
        Returns:
            是否访问过
        """
        if state.get_type() == NodeType.POST_DIALECT:
            return False
        return state.get_code_state_hash() in self.visited_states
        
    def mark_state_visited(self, state: Union[PostDialectDecisionNode, PostPassDecisionNode]) -> None:
        """
        标记状态为已访问
        
        Args:
            state: 要标记的状态
        """
        if state.get_type() == NodeType.POST_DIALECT:
            return
        
        state_hash = state.get_code_state_hash()
        if state_hash not in self.visited_states:
            self.visited_states.add(state_hash)
            self.metrics.visited_states += 1
            
    def add_state(self, state: Union[PostDialectDecisionNode, PostPassDecisionNode]) -> Node:
        """
        添加新状态到搜索树
        
        Args:
            state: 新状态
            
        Returns:
            新创建的节点
        """
        state.parent = self.current
        self.current.add_child(state)
        self.metrics.total_states += 1
        self.metrics.max_depth = max(self.metrics.max_depth, state.get_depth())
        self.current = state  # 自动切换到新节点
        return state
        
    def backtrack(self):
        """
        回溯到父节点
        """
        self.current = self.current.parent

    def current_is_empty(self) -> bool:
        return self.current == None
        
    def record_successful_path(self) -> None:
        """记录当前成功的路径"""
        if self.current:
            path = self.current.get_path()
            self.successful_paths.append(path)
            self.metrics.successful_paths += 1
    
    def get_transformation_sequence(self) -> List[str]:
        """
        获取当前路径的转换序列
        
        Returns:
            pass名称列表
        """
        if self.current:
            return self.current.get_transformation_sequence()
        return []
            
    def get_best_path(self) -> Optional[List[Node]]:
        """
        获取最优的转换路径
        
        Returns:
            最优路径的节点列表,如果没有成功路径则返回None
        """
        if not self.successful_paths:
            return None
            
        if len(self.successful_paths) == 1:
            return self.successful_paths[0]
        
        # 按照转换指标(如时间开销)选择最优路径    
        def path_cost(path: List[Node]) -> float:
            total_cost = 0.0
            for node in path:
                if node.metrics:
                    total_cost += node.metrics.time_cost
            return total_cost
            
        return min(self.successful_paths, key=path_cost)
                                     
    def visualize(self, max_depth: Optional[int] = None) -> None:
        """
        可视化搜索树
        
        Args:
            max_depth: 最大显示深度
        """
        if self.root:
            print("Search Tree Visualization:")
            self.root.visualize_subtree(max_depth=max_depth)
            print("\nSearch Metrics:")
            print(f"Total States Explored: {self.metrics.total_states}")
            print(f"Visited States: {self.metrics.visited_states}")
            print(f"Successful Paths: {self.metrics.successful_paths}")
            print(f"Failed Paths: {self.metrics.failed_paths}")
            print(f"Max Depth: {self.metrics.max_depth}")
            print(f"Total Time: {self.metrics.total_time:.2f}s")