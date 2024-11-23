import os
from search.lowering import DynamicLowering
from utils.reporter import LoweringReporter
from config.configuration import LoweringConfig
from config.logging_config import setup_logging
import json

import logging
logger = logging.getLogger(__name__)


def process_mlir_file(mlir_file: str, config: LoweringConfig) -> bool:
    """处理单个MLIR文件"""
    logger.info(f"Processing file: {mlir_file}")
    
    lowering = DynamicLowering(config)
    

    # 执行转换
    result = lowering.lower(mlir_file)
    logger.info("Lowered MLIR:")
    logger.info(result)
    
    # 生成报告
    report = lowering.generate_report()
    logger.info(f"Report for {mlir_file}:")
    logger.info(json.dumps(report, indent=2, ensure_ascii=False))
    logger.info("-" * 50)
    if result is not None:
        return True
    else:
        return False

def main():
    # 配置logging
    setup_logging(log_level=logging.DEBUG)
    
    # 示例1：测试单个文件
    single_file = "tests/single_file_dir/linalg-batch-matmul-dync.mlir"
    # 创建自定义配置
    config = LoweringConfig.for_single_file(
        max_iterations=1000,
        debug_mode=True,
        save_intermediate_states=True,
        output_dir="custom_output",
        target_dialect="llvm",
        file_path=single_file,
    )
    
    # 示例2：处理目录中的所有文件（递归）
    # config = LoweringConfig(
    #     max_iterations=1000,
    #     debug_mode=True,
    #     save_intermediate_states=True,
    #     output_dir="custom_output",
    #     target_dialect="llvm",
    #     test_config=TestConfig(
    #         test_path="tests/single_file_dir",
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

    
    # 查找所有MLIR文件
    mlir_files = config.find_test_files()
    
    if not mlir_files:
        logger.warning(f"No .mlir files found in {config.test_config.test_path}")
        return
    
    logger.info(f"Found {len(mlir_files)} .mlir files")
    
    # 处理结果统计
    success_count = 0
    failure_count = 0
    
    # 处理每个文件
    for mlir_file in mlir_files:
        if process_mlir_file(mlir_file, config):
            success_count += 1
        else:
            failure_count += 1
    
    # 打印总结
    logger.info("\nProcessing Summary:")
    logger.info(f"Total files: {len(mlir_files)}")
    logger.info(f"Successful: {success_count}")
    logger.info(f"Failed: {failure_count}")

if __name__ == "__main__":
    main()