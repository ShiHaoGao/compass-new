# config/configuration.py
from dataclasses import dataclass, field
from typing import Optional, List, Union
import os
from pathlib import Path
from typing import Optional
import logging

logger = logging.getLogger(__name__)

@dataclass
class TestPathConfig:
    """测试相关配置"""
    # 可以是单个文件路径或目录路径
    test_path: Union[str, Path] = Path("tests/")
    file_pattern: str = "*.mlir"
    recursive_search: bool = True
    
    def __post_init__(self):
        self.test_path = Path(self.test_path)
        
    def is_single_file(self) -> bool:
        """判断是否为单个文件测试"""
        return self.test_path.is_file()
        
    def find_mlir_files(self) -> List[Path]:
        """查找符合条件的MLIR文件"""
        # 如果是单个文件，直接返回
        if self.is_single_file():
            if self.test_path.suffix == '.mlir':
                logger.debug(f"Using single test file: {self.test_path}")
                return [self.test_path]
            else:
                logger.warning(f"Specified file {self.test_path} is not a .mlir file")
                return []
        
        # 如果是目录，进行搜索
        mlir_files = []
        if self.recursive_search:
            for root, _, files in os.walk(self.test_path):
                for file in files:
                    if file.endswith('.mlir'):
                        mlir_files.append(Path(root) / file)
        else:
            mlir_files = list(self.test_path.glob(self.file_pattern))
            
        logger.debug(f"Found {len(mlir_files)} MLIR files in {self.test_path}")
        return mlir_files

@dataclass
class LoweringConfig:
    # 基本配置
    max_iterations: int = 1000
    verify_each_step: bool = True
    debug_mode: bool = False
    
    # pass相关配置
    third_party_config_path: Path = None
    core_config_path: Path = Path("config/core_config.yaml")
    target_dialect: str = "llvm"
    
    # mlir-opt 路径设置
    mlir_opt_path: Path = Path("tools/mlir-opt")
    mlir_translate_path: Path = Path("tools/mlir-translate")
    
    # 输出配置
    output_dir: Path = Path("output")
    save_intermediate_states: bool = True
    
    # 搜索配置
    backtrack_limit: Optional[int] = None
    allow_partial_lowering: bool = False
    
    # 性能配置
    parallel_search: bool = False
    timeout: float = 300.0  # 秒
    
    # 测试配置
    test_config: TestPathConfig = field(default_factory=TestPathConfig)
    
    def __post_init__(self):
        """确保路径是Path对象"""
        self.core_config_path = Path(self.core_config_path)
        if self.third_party_config_path:
            self.third_party_config_path = Path(self.third_party_config_path)
        self.output_dir = Path(self.output_dir)
        self.mlir_opt_path = Path(self.mlir_opt_path)
        self.mlir_translate_path = Path(self.mlir_translate_path)
        
        # 如果test_config是字典，转换为TestConfig对象
        if isinstance(self.test_config, dict):
            self.test_config = TestPathConfig(**self.test_config)
            
    def find_test_files(self) -> List[Path]:
        """查找测试文件的便捷方法"""
        return self.test_config.find_mlir_files()
        
    @classmethod
    def for_single_file(cls, file_path: Union[str, Path], **kwargs) -> 'LoweringConfig':
        """创建用于单个文件测试的配置"""
        return cls(
            test_config=TestPathConfig(test_path=file_path),
            **kwargs
        )