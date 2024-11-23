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
    applicable_dialects: Set[str] = field(default_factory=set)
    type: PassType = PassType.ANY
    priority: int = 1
    description: str = ""
    dependencies: Set[str] = None  
    
    def __post_init__(self):
        """后初始化处理"""
        if not isinstance(self.applicable_dialects, set):
            self.applicable_dialects = set([self.applicable_dialects])
        # 确保dependencies是集合
        if not isinstance(self.dependencies, set):
            self.dependencies = set(self.dependencies)

class DialectLevel(Enum):
    HIGH = 3    # 高级抽象dialect (如TOSA)
    MEDIUM = 2  # 中级dialect (如Linalg)
    LOW = 1     # 底层dialect (如LLVM)

@dataclass
class Dialect:
    name: str
    level: DialectLevel
    pass_obj_list: List[Pass] = field(default_factory=list)

    def add_lowering_pass(self, pass_obj: Pass):
        self.pass_obj_list.append(pass_obj)
    
    def get_level(self):
        return self.level

class DialectPassRegistry:
    def __init__(self, config_path: str = "config/pass_config.yaml"):
        self.dialects_lookup: Dict[str, Dialect] = {}
        self.pass_lookup: Dict[str, Pass] = {}
        self.load_config(config_path)
        
    def load_config(self, config_path: str):
        path = Path(config_path)
        if not path.exists():
            raise FileNotFoundError(f"Pass config file not found: {config_path}")
            
        try:
            with open(path) as f:
                config = yaml.safe_load(f)
            
            if not isinstance(config, dict) or "dialects" not in config:
                raise ValueError("Invalid config format: missing 'dialects' section")
            
            self.dialects_lookup.clear()
            self.pass_lookup.clear()
            
            for dialect_name, dialect_info in config["dialects"].items():
                # 验证必需的字段
                if not dialect_name or not isinstance(dialect_info, dict):
                    continue
                try:
                    # 处理 level,使用默认值并处理大小写
                    level = dialect_info.get("level", "MEDIUM").upper()
                    if level not in DialectLevel.__members__:
                        level = "MEDIUM"
                
                
                
                    dialect = Dialect(
                        name=dialect_name,
                        level=DialectLevel[level]
                    )
                
                    # 处理passes
                    for pass_info in dialect_info.get("passes", []):
                        if not isinstance(pass_info, dict):
                            continue
                            
                        try:
                            # 验证必需的name字段
                            if "name" not in pass_info:
                                continue
                                
                            # 处理type,使用默认值
                            pass_type = pass_info.get("type", "ANY").upper()
                            if pass_type not in PassType.__members__:
                                pass_type = "ANY"
                                
                            pass_obj = Pass(
                                name=pass_info["name"],
                                applicable_dialects={dialect_name},
                                type=PassType[pass_type],
                                priority=pass_info.get("priority", 0),
                                description=pass_info.get("description", ""),
                                dependencies=set(pass_info.get("dependencies", []))
                            )
                            
                            dialect.add_lowering_pass(pass_obj)
                            self.pass_lookup[pass_obj.name] = pass_obj
                            
                        except Exception as e:
                            raise ValueError(f"Error parsing pass {pass_info.get('name')}: {str(e)}")
                               
                    self.dialects_lookup[dialect_name] = dialect
                    
                except Exception as e:
                    raise ValueError(f"Error parsing dialect {dialect_name}: {str(e)}")
                    
        except yaml.YAMLError as e:
            raise ValueError(f"Error parsing YAML config: {e}")

    def get_dialect_passes(self, dialect: str) -> List[str]:
        dialect_obj = self.dialects_lookup.get(dialect)
        passes = []
        if dialect_obj:
            passes = [p.name for p in dialect_obj.pass_obj_list]
        return passes
    
    def get_dialect_obj_by_name(self, name: str) -> Optional[Dialect]:
        return self.dialects_lookup.get(name)
    
    def get_pass_obj_by_name(self, name: str) -> Optional[Pass]:
        return self.pass_lookup.get(name)
        
    def print_registry(self):
        """
        打印注册表的内容，包括方言和 Pass 的信息。
        """
        print("DialectPassRegistry:")
        print("  Dialects:")
        for name, dialect in self.dialects_lookup.items():
            print(f"    -{name}: {dialect}")
        print("  Pass Lookup:")
        for name, pass_obj in self.pass_lookup.items():
            print(f"    -{name}: {pass_obj}")
    
    
if __name__ == "__main__":
    registry = DialectPassRegistry(config_path='../config/pass_config.yaml')
    registry.print_registry()