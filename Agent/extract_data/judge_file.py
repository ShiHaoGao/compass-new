
import os
from langchain_openai import ChatOpenAI
from langchain_core.messages import HumanMessage, SystemMessage
from typing import Optional
from pydantic import BaseModel, Field
from typing import List, Optional
import yaml
from langchain_core.prompts import ChatPromptTemplate, MessagesPlaceholder
from typing import Optional
from pydantic import BaseModel, Field
from extract_utils import *

from typing import Optional

from langchain_core.prompts import ChatPromptTemplate, MessagesPlaceholder
from pydantic import BaseModel, Field


os.environ["OPENAI_API_KEY"] = "sk-39rCeBi8aGNWrsLoLFNvwGmluGTXV5a7Q0f0I4t0HWPhbc6q"
llm = ChatOpenAI(model="gpt-4o",base_url="https://api.ai.cs.ac.cn/v1")


prompt_template = ChatPromptTemplate.from_messages(
    [
        (
            "system",
            "You are an expert extraction algorithm. "
            "Only extract relevant information from the text. "
            "If you do not know the value of an attribute asked to extract, "
            "return null for the attribute's value."
            "there are many examples",
        ),
        # Please see the how-to about improving performance with
        # reference examples.
        MessagesPlaceholder('examples'),
        ("human", "{text}"),
    ]
)

examples = [
    {"role": "user", "content": """ 
    
def InlineGlobalSlots : Pass<"torch-inline-global-slots", "ModuleOp"> {
let summary = "Inlines torch.global_slot ops.";
let constructor = "mlir::torch::Torch::createInlineGlobalSlotsPass()";
let description = [{
    Inlines torch.global_slot ops when it is safe to do so.

    Note: This pass inlines everything that is safe to inline. That is, it
    doesn't have a cost model. This is likely to pessimize programs with
    significant amounts of computation inside torch.initialize.global_slotsr
    regions (but this currently doesn't happen due to how TorchScript modules
    are imported -- the contents are just constants).
}];
}

"""},
    {"role": "assistant", "content": """
    passes:
    - name: "torch-inline-global-slots "
        type: ModuleOp
        dialect : torch
        description: "Inlines torch.global_slot ops when it is safe to do so."

其中 name 是在Pass<"torch-inline-global-slots", "ModuleOp">中的torch-inline-global-slots,type是ModuleOp,dialect在let constructor中,
mlir::torch中的torch"""},
    {"role": "user", "content": """
    
def FuncBackendTypeConversionForStablehlo : Pass<"torch-func-backend-type-conversion-for-stablehlo", "ModuleOp"> {
let summary = "Convert functions to operate on builtin tensors for stablehlo backend";
let constructor = "mlir::torch::TorchConversion::createFuncBackendTypeConversionForStablehloPass()";
let description = [{
    Partial type conversion pass analogous in scope to the upstream
    `func-bufferize` pass. See details there.
}];
}"""},
    {"role": "assistant", "content": """
    passes:
    - name: "torch-func-backend-type-conversion-for-stablehlo"
        type: ModuleOp
        dialect : torch
        description: "Partial type conversion pass analogous in scope to the upstream"

其中 name 是在Pass<"torch-func-backend-type-conversion-for-stablehlo", "ModuleOp">中的torch-func-backend-type-conversion-for-stablehlo,type是ModuleOp,dialect在let constructor中,
mlir::torch中的torch"""},

]

def do_llm(text):
    

    prompt = prompt_template.invoke({"text": text,"examples": examples})


    data = structured_llm.invoke(prompt)

    # 转换为字典
    data_dict = data.dict()

    # 写入 YAML 文件
    with open("output.yaml", "a") as yaml_file:
        yaml.dump(data_dict, yaml_file, default_flow_style=False, allow_unicode=True)





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


# 示例使用
if __name__ == "__main__":
    td_path_files = read_paths_from_file("all_td_filepath.log")  # 替换为实际路径文件

    for path in td_path_files:
        print("*"*20)
        print(path)
        text_200 = read_first_200_lines(path)
        print(text_200)
        # text = read_file(path)
        # do_llm(text)
  