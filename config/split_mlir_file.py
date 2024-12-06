import os
import time
import subprocess


def get_mlir_file_paths(directory):
    """
    遍历指定目录下的所有 .mlir 文件，返回它们的绝对路径列表。

    :param directory: 要遍历的目录路径
    :return: 包含所有 .mlir 文件绝对路径的列表
    """
    mlir_file_paths = []

    # 遍历目录及其子目录
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith(".mlir"):  # 只处理 .mlir 文件
                absolute_path = os.path.abspath(os.path.join(root, file))
                mlir_file_paths.append(absolute_path)

    return mlir_file_paths


def split_and_save_modules(input_file, output_dir,i):
    """
    将输入文件中的代码按分隔符 "// -----" 分割，并保存为独立的文件，文件名唯一。

    :param input_file: 输入文件路径
    :param output_dir: 输出目录
    """
    # 创建输出目录
    os.makedirs(output_dir, exist_ok=True)

    # 读取文件内容

    with open(input_file, "r") as file:
        content = file.read()
        # 按分隔符分割代码
        print(content)
    modules = content.split("// -----")

    # 获取时间戳，确保文件名唯一性
    timestamp = int(time.time())
    # print(f"Timestamp: {timestamp}")

    # 遍历模块并保存到文件
    for idx, module in enumerate(modules, start=1):
        module = module.strip()
        if module:  # 跳过空模块
            file_name = f"{i}_module_{timestamp}_{idx}.mlir"  # 唯一文件名
            output_path = os.path.join(output_dir, file_name)
            with open(output_path, "w") as output_file:
                output_file.write(module)
            print(f"Saved: {output_path}")

    print("All modules have been saved successfully!")


def apply_split_pass(mlir_opt_path, mlir_file_path):

    output_file = "after_split.mlir"
    """
        apply_split_pass并返回处理后的MLIR内容
    """
    # with open(mlir_file_path, "r") as f:
    #     mlir_content = f.read()

    # cmd = [
    #     mlir_opt_path,
    #     "--split-input-file",
    #     "-allow-unregistered-dialect",
    #     mlir_file_path,
    #     " > ",
    #     output_file,
    # ]
    cmd = f"{mlir_opt_path} --split-input-file -allow-unregistered-dialect {mlir_file_path} > {output_file}"

    # 打印命令以供调试
    print("Running command:", cmd)

    try:
        # 执行命令，重定向输出到文件
        with open(output_file, "w") as outfile:
            process = subprocess.run(
                cmd,
                shell=True,  # 启用 shell 模式以支持管道和重定向
                text=True,   # 使用文本模式
                stdout=outfile,  # 标准输出定向到文件
                stderr=subprocess.PIPE  # 捕获标准错误
            )

        # 打印命令完成状态
        print("Command executed successfully with status:", process.returncode)
        print("Standard Error (if any):")
        print(process.stderr)
    
    except Exception as e:
        print("An unexpected error occurred:")
        print(str(e))
        return output_file
    
    return output_file


# 示例调用
if __name__ == "__main__":

    target_directory = "/home/gaoshihao/learn/python/compass/tests/circt_tests/Conversion/CalyxToFSM"  # 替换为目标目录路径
    mlir_files = get_mlir_file_paths(target_directory)
    mlir_opt_path = (
        "/home/gaoshihao/learn/python/compass/tools/circt-opt"
    )

    # 打印结果
    print("Found .mlir files:")
    for i, mlir_file_path in enumerate( mlir_files,start=1 ):
        print(mlir_file_path)
        output_dir = "output_modules"  # 替换为你的输出目录路径
        input_file = apply_split_pass(mlir_opt_path, mlir_file_path)
        if input_file == None:
            continue
        split_and_save_modules(input_file, "output_modules",i)