
from dataclasses import dataclass, field
from typing import Set, Dict, Optional, List, TypeVar, Union


@dataclass
class Dialect:
    name: str
    description: str
    pass_list: List[str] = field(default_factory=list)

    def add_conversion_pass(self, pass_name: str):
        self.pass_list.append(pass_name)
