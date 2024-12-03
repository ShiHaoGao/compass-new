import os
from search.lowering import DynamicLowering
from utils.reporter import LoweringReporter
from config.configuration import LoweringConfig, TestPathConfig
from config.logging_config import setup_logging
import json
from pathlib import Path
from typing import Dict, List
from datetime import datetime

import logging
logger = logging.getLogger(__name__)

class TestResults:
    """测试结果记录类"""
    def __init__(self):
        self.successful_files: List[Path] = []
        self.failed_files: List[Path] = []
        
    def add_result(self, file_path: Path, success: bool):
        """添加测试结果"""
        if success:
            self.successful_files.append(file_path)
        else:
            self.failed_files.append(file_path)
    
    def generate_summary(self) -> Dict:
        """生成测试总结"""
        return {
            "total_files": len(self.successful_files) + len(self.failed_files),
            "successful_count": len(self.successful_files),
            "failed_count": len(self.failed_files),
            "successful_files": [str(f) for f in self.successful_files],
            "failed_files": [str(f) for f in self.failed_files]
        }
    
    def save_report(self, output_dir: Path):
        """保存测试报告"""
        # 确保输出目录存在
        output_dir.mkdir(parents=True, exist_ok=True)
        
        # 生成报告文件名（包含时间戳）
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        report_file = output_dir / f"test_report_{timestamp}.json"
        
        # 生成详细报告
        report = {
            "timestamp": timestamp,
            "summary": self.generate_summary(),
            "details": {
                "successful_files": [str(f) for f in self.successful_files],
                "failed_files": [str(f) for f in self.failed_files]
            }
        }
        
        # 保存报告
        with open(report_file, 'w', encoding='utf-8') as f:
            json.dump(report, f, indent=2, ensure_ascii=False)
        
        logger.info(f"Test report saved to: {report_file}")
        
    def print_summary(self):
        """打印测试总结"""
        summary = self.generate_summary()
        
        logger.info("\nProcessing Summary:")
        logger.info(f"Total files: {summary['total_files']}")
        logger.info(f"Successful: {summary['successful_count']}")
        logger.info(f"Failed: {summary['failed_count']}")
        
        if summary['successful_count'] > 0:
            logger.info("\nSuccessful files:")
            for file in self.successful_files:
                logger.info(f"  ✓ {file.name}")
        
        if summary['failed_count'] > 0:
            logger.info("\nFailed files:")
            for file in self.failed_files:
                logger.info(f"  ✗ {file.name}")

def process_mlir_file(mlir_file: Path, config: LoweringConfig) -> bool:
    """处理单个MLIR文件"""
    logger.info(f"Processing file: {mlir_file}")
    
    lowering = DynamicLowering(config)
    
    # 执行转换
    result = lowering.lower(str(mlir_file))
    logger.info("Lowered MLIR:")
    logger.info(result)
    
    # 生成报告
    report = lowering.generate_report()
    logger.info(f"Report for {mlir_file}:")
    logger.info(json.dumps(report, indent=2, ensure_ascii=False))
    logger.info("-" * 50)
    
    return result is not None

def main():
    # 配置logging
    setup_logging(log_level=logging.DEBUG)
    
    # 示例1：测试单个文件
    single_file = "/home/liuyang/project/buddy-compass/compass-new/tests/MLIRAffine/affine-load.mlir"
    config = LoweringConfig.for_single_file(
        max_iterations=1000000,
        debug_mode=True,
        save_intermediate_states=True,
        output_dir="custom_output",
        target_dialect="llvm",
        file_path=single_file,
        mlir_opt_path = "tools/buddy-opt",
        third_party_config_path="/home/liuyang/project/buddy-compass/compass-new/config/torchmlir_config.yaml"


    )

    # 示例2：处理目录中的所有文件（递归）
    # config = LoweringConfig(
    #     max_iterations=1000000,
    #     debug_mode=True,
    #     save_intermediate_states=True,
    #     mlir_opt_path="./tools/mlir-opt",
    #     output_dir="custom_output",
    #     third_party_config_path=None,
    #     pass_config_path="config/core_config.yaml",
    #     target_dialect="llvm",
    #     test_config=TestPathConfig(
    #         test_path="tests/MLIRVector/", 
    #         recursive_search=True
    #     )
    # )

    # 示例3：处理目录中的文件（非递归）
    # config = LoweringConfig(
    #     test_config=TestConfig(
    #         test_path="tests/test_cases",
    #         recursive_search=False
    #     )
    # )
    
    
    # 创建配置
    # config = LoweringConfig(
    #     max_iterations=10000,
    #     debug_mode=True,
    #     save_intermediate_states=True,
    #     output_dir="custom_output",
    #     target_dialect="llvm",
    #     test_config=TestConfig(
    #         test_path="tests/MLIRLinalg",
    #         recursive_search=True
    #     )
    # )
    
    # 查找所有MLIR文件
    mlir_files = config.find_test_files()
    
    if not mlir_files:
        logger.warning(f"No .mlir files found in {config.test_config.test_path}")
        return
    
    logger.info(f"Found {len(mlir_files)} .mlir files")
    
    # 创建测试结果记录器
    results = TestResults()
    
    # 处理每个文件
    for mlir_file in mlir_files:
        success = process_mlir_file(mlir_file, config)
        results.add_result(mlir_file, success)
    
    # 打印和保存结果
    results.print_summary()
    results.save_report(Path(config.output_dir) / "reports")

if __name__ == "__main__":
    main()