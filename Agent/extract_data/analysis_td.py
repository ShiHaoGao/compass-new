
import re
from extract_utils import *
def analyze_td_file(file_path):
    """
    Analyzes a .td file and extracts classes, definitions, fields, and inheritance relationships.
    
    Args:
        file_path (str): Path to the .td file.
    
    Returns:
        dict: A dictionary containing extracted information.
    """
    result = {
        "classes": [],
        "definitions": [],
        "fields": [],
        "inheritance": {}  # Maps definitions to their base classes
    }
    
    try:
        with open(file_path, "r") as f:
            content = f.read()
        
        # Extract class names
        class_pattern = r"class\s+(\w+)"
        result["classes"] = re.findall(class_pattern, content)
        
        # Extract definitions and their base classes
        def_pattern = r"def\s+(\w+)\s*:\s*([\w:]+)"
        definitions = re.findall(def_pattern, content)
        result["definitions"] = [d[0] for d in definitions]
        result["inheritance"] = {d[0]: d[1] for d in definitions}
        
    except FileNotFoundError:
        print(f"Error: File {file_path} not found.")
    except Exception as e:
        print(f"An error occurred: {e}")
    
    return result

def print_analysis_result(result):
    """
    Prints the analysis result in a readable format.
    
    Args:
        result (dict): The result dictionary from analyze_td_file.
    """
    print("Analysis Result:")
    
    print("\nClasses:")
    for cls in result["classes"]:
        print(f"  - {cls}")
    
    print("\nDefinitions:")
    for definition in result["definitions"]:
        base_class = result["inheritance"].get(definition, "None")
        print(f"  - {definition} (inherits from: {base_class})")
    


def extract_def(input_file):

    # 定义正则表达式匹配每个 def 块
    def_pattern = re.compile(r"(def\s+\w+\s*:\s*[\s\S]*?)(?=(def\s+\w+\s*:)|\Z)")

    # 读取文件内容
    with open(input_file, "r", encoding="utf-8") as file:
        td_content = file.read()

    # 提取所有的 def 块
    content = [match[0].strip() for match in def_pattern.findall(td_content)]

    # 打印结果
    for idx, item in enumerate(content, start=1):
        print(f"Def {idx}:\n{item}\n{'-'*80}")

    # 示例：输出内容到变量
    print(f"Total {len(content)} 'def' blocks extracted.")

if __name__ == "__main__":
    # Path to the .td file to analyze

    td_path_files = read_paths_from_file("all_td_filepath.log")  # 替换为实际路径文件

    for path in td_path_files:
        print("*"*20)
        print(path)

        # Analyze the .td file
        analysis_result = extract_def(path)
        
    

    