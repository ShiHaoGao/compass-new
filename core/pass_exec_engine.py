from typing import Dict, Set, List, Tuple, Optional, Counter, Any
from collections import Counter, defaultdict
import subprocess
import re
import json
from .Registry import Registry
from .Pass import PassType, Pass, PassPipeline
from pathlib import Path
import os

import logging
logger = logging.getLogger(__name__)

class MLIRPassExecutionEngine:
    
    def __init__(self, 
                 registry: Optional[Registry],
                 mlir_opt_path: str,
                 third_party_opt_path: Optional[str]):
        """
        
        Args:
            registry: Pass注册表实例
            mlir_opt_path: buddy-opt工具路径
        """
        self.registry = registry
        self.mlir_opt_path = Path(mlir_opt_path)
        if third_party_opt_path:
            self.third_party_opt_path = Path(third_party_opt_path)
        
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
        
    def parse_mlir_content(self, mlir_content: str, pass_pipeline: PassPipeline) -> Tuple[Dict[str, Set[str]], Dict[str, Counter]]:
        """
        解析MLIR内容中的dialect、op集合和op数量
        返回 (Dict[dialect_name, Set[op_names]], Dict[dialect_name, Counter[op_name, count]])
        """
        
        # 输入验证
        if not mlir_content or not mlir_content.strip():
            raise ValueError("Empty MLIR content")
        

        # MLIR core/ torch-mlir: print-op-stats{json}
        print_op_stats_pipeline = pass_pipeline.append_pass(r'''print-op-stats{json}''')
        
        cmd = self._build_command(print_op_stats_pipeline)

        
        process = subprocess.Popen(
            cmd,
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )
        
        output, error = process.communicate(input=mlir_content)
       
        return_code = process.returncode
        if return_code != 0:
            logger.error(f"Command failed with error: {error}")

        try:
            result = json.loads(error)
            dialect_ops: Dict[str, Set[str]] = defaultdict(set)
            op_counts: Dict[str, Counter] = defaultdict(Counter)
            for op, count in result.items():
                dialect = op.split('.')[0]
                dialect_ops[dialect].add(op)
                op_counts[op] = count
        except json.JSONDecodeError as e:
            logger.error(error)
            raise ValueError(f"Invalid JSON format: {e}")

        if 'builtin' in dialect_ops:
            del dialect_ops['builtin']
        
        return dialect_ops, op_counts
        
    # def parse_mlir_content(self, mlir_content: str) -> Tuple[Dict[str, Set[str]], Dict[str, int]]:
    #     """
    #     解析MLIR内容中的dialect、op集合和op数量
    #     返回 (Dict[dialect_name, Set[op_names]], Dict[dialect_name, Counter[op_name, count]])
        
    #     Raises:
    #         ValueError: 当MLIR内容为空时
    #         SubprocessError: 当mlir-opt执行失败时
    #         JSONDecodeError: 当JSON解析失败时
    #         RuntimeError: 当正则表达式匹配失败时
    #     """
        
    #     if not mlir_content or not mlir_content.strip():
    #         raise ValueError("Empty MLIR content")
        
    #     print_op_stats_pipeline = (r'''builtin.module(print-op-count{emission-format=json})''')
        
    #     try:
    #         cmd = [
    #             self.mlir_opt_path,
    #             '--pass-pipeline', 
    #             print_op_stats_pipeline
    #         ]
            
    #         process = subprocess.Popen(
    #             cmd,
    #             stdin=subprocess.PIPE,
    #             stdout=subprocess.PIPE,
    #             stderr=subprocess.PIPE,
    #             text=True
    #         )
            
    #         output, error = process.communicate(input=mlir_content)
            
    #         if process.returncode != 0:
    #             raise subprocess.SubprocessError(f"mlir-opt failed: {error}")
                
    #         start = output.find('{')
    #         if start == -1:
    #             raise json.JSONDecodeError("No JSON object found", output, 0)
            
    #         count = 1
    #         end = start + 1
            
    #         while count > 0 and end < len(output):
    #             if output[end] == '{':
    #                 count += 1
    #             elif output[end] == '}':
    #                 count -= 1
    #             end += 1
                
    #         if count != 0:
    #             raise json.JSONDecodeError("Invalid JSON format", output, end)
                
    #         json_str = output[start:end]
    #         logger.debug(f"json string: {json_str}")
            
    #         dialect_ops: Dict[str, Set[str]] = defaultdict(set)
    #         op_counts: Dict[str, int] = defaultdict(int)
            
    #         pattern = r'([a-zA-Z_]+)\.([a-zA-Z_\.]+)'
    #         matches = re.finditer(pattern, json_str)
            
    #         match_found = False
    #         for match in matches:
    #             match_found = True
    #             dialect = match.group(1)
    #             op = match.group(2)
    #             dialect_ops[dialect].add(op)
    #             op_counts[op] += 1
                
    #         if not match_found:
    #             raise RuntimeError("No dialect operations found in JSON")
            
    #         if 'builtin' in dialect_ops:
    #             del dialect_ops['builtin']
            
    #         return dialect_ops, op_counts
            
    #     except (subprocess.SubprocessError, json.JSONDecodeError, RuntimeError) as e:
    #         logger.error(f"Error parsing MLIR content: {str(e)}")
    #         raise
    
    def _build_command(self, pass_pipeline: PassPipeline) -> List[str]:
        """构建完整的命令"""   
        
        pipeline = ""
        
        for pass_name in pass_pipeline:
            pass_obj = self.registry.get_pass_by_name(pass_name)
            pipeline += pass_obj.get_str()
            pipeline += ", "
        pipeline = pipeline[:-2]
        pipeline = f'builtin.module({pipeline})'
        
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

        logger.debug("Clean code finished!")
        return output

    def apply_pass(self, mlir_content: str, pass_pipeline: PassPipeline) -> Optional[str]:
        """
        应用pass并返回处理后的MLIR内容
        """
        
        # 输入验证
        if not mlir_content or not mlir_content.strip():
            raise ValueError("Empty MLIR content")
        
        cmd = self._build_command(pass_pipeline)
        
        logger.debug(f"Apply pass pipeline command: {cmd}")
        
        process = subprocess.Popen(
            cmd,
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )
        
        output, error = process.communicate(input=mlir_content)
        
        if process.returncode != 0:
            logger.debug(f"Pass {pass_pipeline} failed") # : {error}
            return None
            
        return output
    
