from dataclasses import dataclass, field
from typing import Set, Dict, Optional, List, TypeVar, Union, Tuple, Iterator
import yaml
from pathlib import Path
from collections import defaultdict
from enum import Enum, auto


class PassType(Enum):
    """pass的类型

    Args:
        Enum (_type_): _description_
    """
    FUNC = "func.func"
    MODULE = ""

T = TypeVar('T', str, PassType)

@dataclass
class Pass:
    name: str
    description: str = ""
    applicable_dialects: Set[str] = field(default_factory=set)
    type: PassType = PassType.MODULE
    next_pass: Optional[str] = None  
    
    def __post_init__(self):
        """Initialization processing"""
        if not isinstance(self.applicable_dialects, set):
            self.applicable_dialects = set([self.applicable_dialects])
    
    def has_next_pass(self) -> bool:
        return self.next_pass is not None
    
    def get_next_pass(self) -> Optional[str]:
        return self.next_pass

    def get_str(self) -> str:
        if self.type == PassType.MODULE:
            return self.name
        else:
            return f'func.func({self.name})'

@dataclass   
class PassPipeline:
    passes: Tuple[str] = field(default_factory=tuple)
    
    def __post_init__(self):
        # 验证所有的 pass 名称都是字符串类型
        if not all(isinstance(p, str) for p in self.passes):
            raise TypeError("All passes must be strings")
    
    def append_pass(self, pass_name: str) -> 'PassPipeline':
        # 验证输入的 pass_name 是字符串类型
        if not isinstance(pass_name, str):
            raise TypeError("Pass name must be a string")
            
        # 创建一个新的元组，包含原有的 passes 和新的 pass_name
        new_passes = self.passes + (pass_name,)
        
        # 返回一个新的 PassPipeline 实例，保持不可变性
        return PassPipeline(passes=new_passes)
    
    def __str__(self) -> str:
        if not self.passes:
            return "PassPipeline(empty)"
        passes_str = " -> ".join(self.passes)
        return f"PassPipeline({passes_str})"
    
    def __repr__(self) -> str:
        return self.__str__()
    
    def __iter__(self) -> Iterator[str]:
        """让 PassPipeline 可以直接迭代"""
        return iter(self.passes)