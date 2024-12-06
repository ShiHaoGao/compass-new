import os
import time
import subprocess
import shutil
from typing import List, Optional


def cleanup_directory(directory: str) -> None:
    """
    清理指定目录的内容。如果目录不存在则创建，如果存在则删除其中的所有内容。

    Args:
        directory: 要清理的目录路径
    """
    if os.path.exists(directory):
        shutil.rmtree(directory)
    os.makedirs(directory)


def get_mlir_file_paths(directory: str) -> List[str]:
    """
    遍历指定目录下的所有 .mlir 文件，返回它们的绝对路径列表。

    Args:
        directory: 要遍历的目录路径

    Returns:
        包含所有 .mlir 文件绝对路径的列表
    """
    mlir_file_paths = []
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith(".mlir"):
                absolute_path = os.path.abspath(os.path.join(root, file))
                mlir_file_paths.append(absolute_path)
    return mlir_file_paths


def split_and_save_modules(input_file: str, output_dir: str, original_filename: str) -> None:
    """
    将输入文件中的代码按分隔符 "// -----" 分割，并保存为独立的文件。

    Args:
        input_file: 输入文件路径
        output_dir: 输出目录
        original_filename: 原始文件名，用于生成新文件名
    """
    try:
        with open(input_file, "r") as file:
            content = file.read()
        
        modules = content.split("// -----")
        timestamp = int(time.time())
        base_name = os.path.splitext(os.path.basename(original_filename))[0]

        for idx, module in enumerate(modules, start=1):
            module = module.strip()
            if module:
                file_name = f"{base_name}_split_{timestamp}_{idx}.mlir"
                output_path = os.path.join(output_dir, file_name)
                with open(output_path, "w") as output_file:
                    output_file.write(module)
                print(f"Saved: {output_path}")
    
    except Exception as e:
        print(f"Error processing file {input_file}: {str(e)}")


def apply_split_pass(mlir_opt_path: str, mlir_file_path: str) -> Optional[str]:
    """
    应用 MLIR split pass 并返回输出文件路径。

    Args:
        mlir_opt_path: mlir-opt 工具的路径
        mlir_file_path: 要处理的 MLIR 文件路径

    Returns:
        处理后的输出文件路径，如果处理失败则返回 None
    """
    output_file = f"split_{os.path.basename(mlir_file_path)}"
    cmd = f"{mlir_opt_path} --split-input-file -allow-unregistered-dialect {mlir_file_path} > {output_file}"
    
    print(f"Running command: {cmd}")
    
    try:
        process = subprocess.run(
            cmd,
            shell=True,
            text=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            check=True
        )
        
        if process.stderr:
            print("Standard Error:")
            print(process.stderr)
            
        return output_file
        
    except subprocess.CalledProcessError as e:
        print(f"Command execution failed with return code {e.returncode}")
        print(f"Error output: {e.stderr}")
        return None
    except Exception as e:
        print(f"An unexpected error occurred: {str(e)}")
        return None


def main() -> None:
    """
    主函数，处理MLIR文件的完整流程。
    """
    # 配置路径
    target_directory = "/home/gaoshihao/learn/python/compass/tests/circt_tests/Conversion/FSMToSV"
    mlir_opt_path = "/home/gaoshihao/learn/python/compass/tools/circt-opt"
    output_dir = "output_modules"

    # 清理输出目录
    cleanup_directory(output_dir)

    # 获取所有MLIR文件
    mlir_files = get_mlir_file_paths(target_directory)
    print(f"Found {len(mlir_files)} .mlir files:")
    
    # 处理每个文件
    for mlir_file_path in mlir_files:
        print(f"\nProcessing: {mlir_file_path}")
        
        # 应用split pass
        split_result = apply_split_pass(mlir_opt_path, mlir_file_path)
        if split_result is None:
            print(f"Skipping file due to split pass failure: {mlir_file_path}")
            continue
            
        # 分割并保存模块
        split_and_save_modules(split_result, output_dir, mlir_file_path)
        
        # 清理中间文件
        if os.path.exists(split_result):
            os.remove(split_result)

    print("\nProcessing completed!")


if __name__ == "__main__":
    main()