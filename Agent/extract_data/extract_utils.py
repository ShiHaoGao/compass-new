from langchain_text_splitters import CharacterTextSplitter
import yaml

def read_file(file_path):
    """
    读取指定文件的内容并返回。
    
    :param file_path: 文件的路径
    :return: 文件内容字符串
    """
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            content = file.read()
            return content
    except FileNotFoundError:
        print(f"错误: 文件 '{file_path}' 未找到！")
    except IOError as e:
        print(f"读取文件时发生错误: {e}")

def read_first_200_lines(file_path):
    """
    读取指定文件的前200行并返回。
    
    :param file_path: 文件的路径
    :return: 文件前200行组成的字符串
    """
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            lines = []
            for i, line in enumerate(file):
                if i >= 200:
                    break
                lines.append(line)
            return ''.join(lines)
    except FileNotFoundError:
        print(f"错误: 文件 '{file_path}' 未找到！")
    except IOError as e:
        print(f"读取文件时发生错误: {e}")



def read_tokens_from_file(file_path):
    """
    读取包含路径的文件，每行一个路径。
    
    :param file_path: 路径文件的路径
    :return: 包含所有路径的列表
    """
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            state_of_the_union = file.read()
            text_splitter = CharacterTextSplitter.from_tiktoken_encoder(
                encoding_name="cl100k_base", chunk_size=5000, chunk_overlap=0
            )
            texts = text_splitter.split_text(state_of_the_union)

            return texts
    except FileNotFoundError:
        print(f"文件未找到: {file_path}")
        return []
    except IOError as e:
        print(f"读取文件时发生错误: {e}")
        return []



def read_paths_from_file(file_path):
    """
    读取包含路径的文件，每行一个路径。
    
    :param file_path: 路径文件的路径
    :return: 包含所有路径的列表
    """
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            paths = [line.strip() for line in file if line.strip()]  # 去除空行和多余空格
        return paths
    except FileNotFoundError:
        print(f"文件未找到: {file_path}")
        return []
    except IOError as e:
        print(f"读取文件时发生错误: {e}")
        return []


def read_yaml_file(file_path):
    """
    读取 YAML 文件并解析为 Python 数据结构。
    
    :param file_path: YAML 文件的路径
    :return: 解析后的数据
    """
    with open(file_path, 'r', encoding='utf-8') as file:
        data = yaml.safe_load(file)
    return data

# 示例用法
if __name__ == "__main__":
    # 替换为你的 YAML 文件路径
    yaml_file_path = "/home/liuyang/project/buddy-compass/compass-new/Agent/extract_data/extract_pass.yaml"
    parsed_data = read_yaml_file(yaml_file_path)
    
    # 打印解析后的数据
    print(parsed_data)