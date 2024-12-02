from dataclasses import dataclass, field
from typing import Set, Dict, Optional, List, TypeVar, Union
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
    ANY = ""

T = TypeVar('T', str, PassType)

@dataclass
class Pass:
    name: str
    description: str = ""
    applicable_dialects: Set[str] = field(default_factory=set)
    type: PassType = PassType.ANY
    next_pass: Optional[str] = None  
    
    def __post_init__(self):
        """Initialization processing"""
        if not isinstance(self.applicable_dialects, set):
            self.applicable_dialects = set([self.applicable_dialects])
    
    def has_next_pass(self) -> bool:
        return self.next_pass is not None
    
    def get_next_pass(self) -> Optional[str]:
        return self.next_pass