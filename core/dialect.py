
from dataclasses import dataclass, field
from typing import Set, Dict, Optional, List, TypeVar, Union
from .Pass import Pass


@dataclass
class Dialect:
    name: str
    description: str
    pass_obj_list: List[Pass] = field(default_factory=list)

    def add_conversion_pass(self, pass_obj: Pass):
        self.pass_obj_list.append(pass_obj)
