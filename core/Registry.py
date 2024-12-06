from typing import Set, Dict, Optional, List, TypeVar, Union
import yaml
from pathlib import Path
from core.dialect import Dialect
from core.Pass import Pass, PassType
from core.pipeline import Pipeline, PipelineStage



    
class Registry:
    def __init__(self, core_config_path: str = "config/pass_config.yaml", 
                third_party_config_path: str = None):
        self.dialects_lookup: Dict[str, Dialect] = {}
        self.pass_lookup: Dict[str, Pass] = {}
        self.pipelines: Dict[str, Pipeline] = {}
        self.core_dialects: Set[str] = set()
        self.core_pipelines: Set[str] = set()
        self.third_party_dialects: Set[str] = set()
        self.third_party_pipelines: Set[str] = set()
        self.load_core_config(core_config_path)
        if third_party_config_path:
            self.load_third_party_config(third_party_config_path)
        
    def registry_dialects(self, config, is_core: bool):
        if "dialects" in config:
            for dialect_name, dialect_info in config["dialects"].items():
                if not dialect_name or not isinstance(dialect_info, dict):
                    continue
                    
                try:
                    dialect = Dialect(
                        name=dialect_name,
                        description=dialect_info.get("description", "")
                    )
                    
                    # Process passes
                    for pass_info in dialect_info.get("passes", []):
                        if not isinstance(pass_info, dict):
                            continue
                            
                        try:
                            pass_type = pass_info.get("type", "MODULE").upper()
                            if pass_type not in PassType.__members__:
                                pass_type = "MODULE"
                                
                            pass_obj = Pass(
                                name=pass_info["name"],
                                description=pass_info.get("description", ""),
                                applicable_dialects={dialect_name},
                                type=PassType[pass_type],
                                next_pass=pass_info.get("next_pass", None)
                            )
                            
                            dialect.add_conversion_pass(pass_obj)
                            self.pass_lookup[pass_obj.name] = pass_obj
                            
                        except Exception as e:
                            raise ValueError(f"Error parsing pass {pass_info.get('name')}: {str(e)}")
                                
                    self.dialects_lookup[dialect_name] = dialect
                    if is_core is True:
                        self.core_dialects.add(dialect_name)
                    else:
                        self.third_party_dialects.add(dialect_name)
                    
                except Exception as e:
                    raise ValueError(f"Error parsing dialect {dialect_name}: {str(e)}")

    def registry_pipelines(self, config, is_core: bool):

        for pipeline_name, pipeline_info in config["pipelines"].items():
            stages = []
            for stage_info in pipeline_info.get("stages", []):
                stage = PipelineStage(
                    name=stage_info.get("name", ""),
                    execute=stage_info.get("execute")
                )
                stages.append(stage)
            
            pipeline = Pipeline(
                name=pipeline_name,
                stages=stages
            )
            self.pipelines[pipeline_name] = pipeline
            if is_core is True:
                self.core_pipelines.add(pipeline_name)
            else:
                self.third_party_pipelines.add(pipeline_name)

    
    def load_third_party_config(self, config_path: str):
        path = Path(config_path)
        if not path.exists():
            raise FileNotFoundError(f"Pass config file not found: {config_path}")
            
        try:
            with open(path) as f:
                config = yaml.safe_load(f)
            
            if not isinstance(config, dict):
                raise ValueError("Invalid config format")
            

            # Load dialects and passes
            self.registry_dialects(config, is_core=False)
            # Load pipelines
            if "pipelines" in config:
                self.registry_pipelines(config, is_core=False)

        except yaml.YAMLError as e:
            raise ValueError(f"Error parsing YAML config: {e}")

    def load_core_config(self, config_path: str):
        path = Path(config_path)
        if not path.exists():
            raise FileNotFoundError(f"Pass config file not found: {config_path}")
            
        try:
            with open(path) as f:
                config = yaml.safe_load(f)
            
            if not isinstance(config, dict):
                raise ValueError("Invalid config format")
            

            # Load dialects and passes
            self.registry_dialects(config, is_core=True)
            # Load pipelines
            if "pipelines" in config:
                self.registry_pipelines(config, is_core=True)

        except yaml.YAMLError as e:
            raise ValueError(f"Error parsing YAML config: {e}")

    def get_dialect_passes(self, dialect: str) -> List[str]:
        """Get all passes for a given dialect"""
        dialect_obj = self.dialects_lookup.get(dialect)
        return [p.name for p in dialect_obj.pass_obj_list] if dialect_obj else []
    
    def get_dialect_by_name(self, name: str) -> Optional[Dialect]:
        """Get dialect object by name"""
        return self.dialects_lookup.get(name)
    
    def get_pass_by_name(self, name: str) -> Optional[Pass]:
        """Get pass object by name"""
        return self.pass_lookup.get(name)

    def get_pipeline_by_name(self, name: str) -> Optional[Pipeline]:
        """Get pipeline object by name"""
        return self.pipelines.get(name)
        
    def has_pipeline(self) -> bool:
        if len(self.pipelines) == 0:
            return False
        return True
        
    def print_registry(self):
        """Print registry contents"""
        print("\nDialects and Passes:")
        for dialect_name, dialect in self.dialects_lookup.items():
            print(f"\n{dialect_name}:")
            print(f"  Description: {dialect.description}")
            print("  Passes:")
            for pass_obj in dialect.pass_obj_list:
                print(f"    - {pass_obj.name}")
                print(f"      Description: {pass_obj.description}")
                print(f"      Type: {pass_obj.type.name}")
                if pass_obj.next_pass:
                    print(f"      Next Pass: {pass_obj.next_pass}")

        print("\nPipelines:")
        for pipeline_name, pipeline in self.pipelines.items():
            print(f"\n{pipeline_name}:")
            print("  Stages:")
            for stage in pipeline.stages:
                print(f"    - {stage.name}")
                print(f"      Execute: {stage.execute}")
 
    def is_core_dialect(self, dialect: str) -> bool:
        if dialect in self.core_dialects:
            return True
        return False
    
    
if __name__ == "__main__":
    registry = Registry("config/pass_config.yaml")
    registry.print_registry()