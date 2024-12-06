import yaml
from collections import defaultdict

def convert_a_to_b(input_file, output_file):
    # Step 1: Load A.yaml
    with open(input_file, 'r') as file:
        data = yaml.safe_load(file)
    
    # Step 2: Organize by dialect
    dialects = defaultdict(lambda: {"description": "", "passes": []})
    for pass_entry in data.get("passes", []):
        dialect = pass_entry.get("dialect", "unknown")
        name = pass_entry.get("name", "unknown")
        description = pass_entry.get("description", "No description provided")
        pass_type = pass_entry.get("type", "ModuleOp")

        # Append to dialect
        dialects[dialect]["passes"].append({
            "name": name,
            "description": description,
            "type": pass_type,
            "next_pass": None  # Add `next_pass` if needed
        })

    # Step 3: Generate new structure
    b_yaml_structure = {"dialects": {}}
    for dialect, content in dialects.items():
        b_yaml_structure["dialects"][dialect] = {
            "description": f"{dialect} dialect",
            "passes": content["passes"]
        }

    # Step 4: Save as B.yaml
    with open(output_file, 'w') as file:
        yaml.dump(b_yaml_structure, file, default_flow_style=False, sort_keys=False)

def clean_passes_in_document(input_file, output_file):
    """
    读取文档形式的 YAML 文件，删除重复的 `passes:`，只保留第一个，并写入新的文件。
    
    :param input_file: 输入文件路径
    :param output_file: 输出清理后的文件路径
    """
    with open(input_file, 'r', encoding='utf-8') as file:
        lines = file.readlines()
    
    cleaned_lines = []
    passes_found = False

    for line in lines:
        if  "passes:" in line:
            if not passes_found:
                passes_found = True
                cleaned_lines.append(line)  # 保留第一个 passes:
        else:
            cleaned_lines.append(line)

    # 将清理后的内容写入新的文件
    with open(output_file, 'w', encoding='utf-8') as file:
        file.writelines(cleaned_lines)

# 示例用法
if __name__ == "__main__":
    input_file = "extract_pass_hlo.yaml"  # 替换为你的输入文件路径
    output_file = "tmp.yaml"  # 替换为你的输出文件路径
    clean_passes_in_document(input_file, output_file)
    print(f"清理后的文档已保存到 {output_file}")


    # Specify input and output files
    input_file = "tmp.yaml"
    output_file = "after_convert_HLO.yaml"

    # Convert A.yaml to B.yaml
    convert_a_to_b(input_file, output_file)


