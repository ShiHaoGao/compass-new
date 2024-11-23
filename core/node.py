from typing import Dict, List, Set, Optional, TypeVar
from dataclasses import dataclass, field
from abc import ABC, abstractmethod
from enum import Enum, auto

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
                sequence.append(node.applied_pass)
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