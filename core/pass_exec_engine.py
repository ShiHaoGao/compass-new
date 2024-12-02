from typing import Dict, Set, List, Tuple, Optional, Counter, Any
from collections import Counter, defaultdict
import subprocess
import re
from .Registry import Registry
from .Pass import PassType, Pass
from pathlib import Path
import os

import logging
logger = logging.getLogger(__name__)

class MLIRPassExecutionEngine:
    
    def __init__(self, 
                 registry: Optional[Registry],
                 mlir_opt_path: str):
        """
        
        Args:
            registry: Pass注册表实例
            mlir_opt_path: buddy-opt工具路径
        """
        self.registry = registry
        self.mlir_opt_path = Path(mlir_opt_path)
        
        # 验证环境
        self._validate_environment()
        
    def _validate_environment(self) -> None:
        """验证运行环境"""
        if not self.mlir_opt_path.exists():
            raise FileNotFoundError(
                f"buddy-opt not found at {self.mlir_opt_path}"
            )
        if not os.access(self.mlir_opt_path, os.X_OK):
            raise PermissionError(
                f"buddy-opt at {self.mlir_opt_path} is not executable"
            )
        
    
    def parse_mlir_content(self, mlir_content: str) -> Tuple[Dict[str, Set[str]], Dict[str, Counter]]:
        """
        解析MLIR内容中的dialect、op集合和op数量
        返回 (Dict[dialect_name, Set[op_names]], Dict[dialect_name, Counter[op_name, count]])
        """
        dialect_ops: Dict[str, Set[str]] = defaultdict(set)
        op_counts: Dict[str, Counter] = defaultdict(Counter)
        
        pattern = r'([a-zA-Z_]+)\.([a-zA-Z_]+)'
        matches = re.finditer(pattern, mlir_content)
        
        for match in matches:
            dialect = match.group(1)
            op = match.group(2)
            dialect_ops[dialect].add(op)
            op_counts[dialect][op] += 1
        
        return dialect_ops, op_counts

    def _build_command(self, mlir_pass: str) -> List[str]:
        """构建完整的命令"""
        
        mlir_pass_obj = self.registry.get_pass_by_name(mlir_pass)
        passes = []
        passes.append(mlir_pass_obj.name)
        if mlir_pass_obj.has_next_pass():
            passes.append(mlir_pass_obj.get_next_pass())
        passes_str = ", ".join(f'{x}' for x in passes)
        
        if mlir_pass_obj.type == PassType.ANY:
            pipeline = f'builtin.module({passes_str})'
        else:
            pipeline = f'builtin.module({mlir_pass_obj.type.value}({passes_str}))'
        
        return [
            self.mlir_opt_path,
            '--pass-pipeline',
            pipeline
        ]

    def clean_code(self, mlir_content: str) -> Optional[str]:
        cmd = [
            self.mlir_opt_path
        ]
        
        process = subprocess.Popen(
            cmd,
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )
        
        output, error = process.communicate(input=mlir_content)
        
        if process.returncode != 0:
            logger.error(f"Original MLIR code is unlegal!") 
            logger.error(f"ERROR: {error}")
            return None

        return output

    def apply_pass(self, mlir_content: str, mlir_pass: str) -> Optional[str]:
        """
        应用pass并返回处理后的MLIR内容
        """
        
        # 输入验证
        if not mlir_content or not mlir_content.strip():
            raise ValueError("Empty MLIR content")
        
        cmd = self._build_command(mlir_pass)
        
        logger.debug(f"apply pass command: {cmd}")
        
        process = subprocess.Popen(
            cmd,
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )
        
        output, error = process.communicate(input=mlir_content)
        
        if process.returncode != 0:
            logger.debug(f"Pass {mlir_pass} failed") # : {error}
            return None
            
        return output
