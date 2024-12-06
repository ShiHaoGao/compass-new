import os
from langchain_openai import ChatOpenAI
from langchain_core.messages import HumanMessage, SystemMessage
from typing import Optional
from pydantic import BaseModel, Field
from typing import List, Optional, Literal
import yaml
from langchain_core.prompts import ChatPromptTemplate, MessagesPlaceholder
from typing import Optional
from pydantic import BaseModel, Field
from extract_utils import *


os.environ["OPENAI_API_KEY"] = "sk-39rCeBi8aGNWrsLoLFNvwGmluGTXV5a7Q0f0I4t0HWPhbc6q"
llm = ChatOpenAI(model="gpt-4o", base_url="https://api.ai.cs.ac.cn/v1")


class Pass(BaseModel):
    """Information about a person."""

    # ^ Doc-string for the entity Person.
    # This doc-string is sent to the LLM as the description of the schema Person,
    # and it can help to improve extraction results.

    # Note that:
    # 1. Each field is an `optional` -- this allows the model to decline to extract it!
    # 2. Each field has a `description` -- this description is used by the LLM.
    # Having a good description can help improve extraction results.
    name: Optional[str] = Field(default=None, description="The name of the pass")
    type: Optional[str] = Field(default=None, description="type of the pass ")
    dialect: Optional[str] = Field(
        default=None, description="which dialect is this pass belong to "
    )
    description: Optional[str] = Field(
        default=None, description="The description of the pass"
    )


class Data(BaseModel):
    """Extracted data about people."""

    # Creates a model so that we can extract multiple entities.
    passes: List[Pass]


llm_extract = llm.with_structured_output(schema=Data)


class Judge(BaseModel):
    """Information about a person."""

    is_pass_td: Literal["yes", "no"]


llm_judge = llm.with_structured_output(schema=Judge)

from typing import Optional

from langchain_core.prompts import ChatPromptTemplate, MessagesPlaceholder
from pydantic import BaseModel, Field

# Define a custom prompt to provide instructions and any additional context.
# 1) You can add examples into the prompt template to improve extraction quality
# 2) Introduce additional parameters to take context into account (e.g., include metadata
#    about the document from which the text was extracted.)
prompt_template_extract = ChatPromptTemplate.from_messages(
    [
        (
            "system",
            "You are an expert <<<pass>>> extraction algorithm. "
            "Only extract <<<pass>>> relevant information from the text. "
            "If you do not know the value of an attribute asked to extract, "
            "return null for the attribute's value."
            "please remember extract pass relevant information, if not pass relevant ,don't show me "
            """
            你的任务是分析我给你的内容，并提取关于 pass 的关键信息，包括：
            1. pass 的名称和类型（对应 Pass<"..."> 的内容）。
            2. pass 所属的 dialect 信息（代码中的功能描述（例如 description 或 summary）
            说明了这个pass可能作用的dialect范围，请你结合description或summary还有pass的名字，
            推断出pass属于哪个dialect。如果代码中没有明确提到所属 dialect，请标明“未指定”。
            """,
        ),
        # Please see the how-to about improving performance with
        # reference examples.
        MessagesPlaceholder("examples"),
        ("human", "{text}"),
    ]
)

prompt_template_extract_from_gpt = ChatPromptTemplate.from_messages(
    [
        (
            "system",
'''
You are an MLIR pass extraction expert. Your task is to analyze the provided MLIR code and extract only relevant information about passes. Specifically, for each pass, you need to provide the following attributes:
	1.	Name: The name of the pass (e.g., derived from Pass<"...">).
	2.	Type: The type of the pass (if explicitly provided; otherwise, default to ModuleOp).
	3.	Dialect: The dialect the pass belongs to, inferred from the pass name, summary, description, or any mentioned dialects in the code. If the dialect cannot be determined, return “Unspecified”.
	4.	Description: A concise description of the pass derived from the description or summary.

If a segment of code does not include information related to a pass, ignore it entirely. Return all results in a structured YAML format.

Example Input:

def ConvertLinalgToLoopsPass : Pass<"convert-linalg-to-loops"> {{
  let summary = "Lower the operations from the linalg dialect into loops";
  let description = [{{
    Lowers the `linalg` ops to loop nests using `scf.for`.

    Pre-condition: the operands used by the `linalg` ops have buffer semantics,
    i.e., tensor operands and results must be converted to memrefs via
    bufferization.
  }}];
  let dependentDialects = [
    "linalg::LinalgDialect",
    "scf::SCFDialect",
    "affine::AffineDialect"
  ];
}}

Expected Output:

passes:
  - name: "convert-linalg-to-loops"
    type: ModuleOp
    dialect: "linalg"
    description: "Lowers the `linalg` ops to loop nests using `scf.for`."

If the provided input does not reference a pass, return nothing.

Task:

Analyze and extract the required attributes for each pass in the input MLIR code. Maintain the structure and accuracy, and ensure the dialect attribution is inferred logically from the code context.

'''
                ,
        ),
        # Please see the how-to about improving performance with
        # reference examples.
        # MessagesPlaceholder("examples"),
        ("human", "{text}"),
    ]
)


prompt_template_judge = ChatPromptTemplate.from_messages(
    [
        (
            "system",
            "I will provide a.td file, please help me determine whether this file is related to Pass (optimization or transformation Pass)."
            "If relevant, specify which parts, contents, or keywords in the file are relevant to Pass and briefly explain its purpose, at finel , print yes. If not, please explain why,at finel , print no.",
        ),
        # Please see the how-to about improving performance with
        # reference examples.
        MessagesPlaceholder("examples"),
        ("human", "{text}"),
    ]
)


examples_extract = [
    {
        "role": "user",
        "content": """ 
    
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

""",
    },
    {
        "role": "assistant",
        "content": """
结果是:
    passes:
        - name: "torch-inline-global-slots "
        type: ModuleOp
        dialect : mlir::torch::Torch
        description: "Inlines torch.global_slot ops when it is safe to do so."
理由是: 我根据 def InlineGlobalSlots : Pass<"torch-inline-global-slots", "ModuleOp"> 这一行,能够知道这个是个Pass类,并且
Pass的name是"torch-inline-global-slots",Pass的type是ModuleOp,
根据 let constructor = "mlir::torch::Torch::createInlineGlobalSlotsPass()";这行,我能够知道Pass的dialect是mlir::torch::Torch
        
""",
    },
    {
        "role": "user",
        "content": """
    
def FuncBackendTypeConversionForStablehlo : Pass<"torch-func-backend-type-conversion-for-stablehlo", "ModuleOp"> {
let summary = "Convert functions to operate on builtin tensors for stablehlo backend";
let constructor = "mlir::torch::TorchConversion::createFuncBackendTypeConversionForStablehloPass()";
let description = [{
    Partial type conversion pass analogous in scope to the upstream
    `func-bufferize` pass. See details there.
}];

}""",
    },
    {
        "role": "assistant",
        "content": """
    passes:
    - name: "torch-func-backend-type-conversion-for-stablehlo"
        type: ModuleOp
        dialect : mlir::torch::TorchConversion
        description: "Partial type conversion pass analogous in scope to the upstream"

理由是: 我根据 def FuncBackendTypeConversionForStablehlo : Pass<"torch-func-backend-type-conversion-for-stablehlo", "ModuleOp"> 这一行,能够知道这个是个Pass类,并且
Pass的name是"torch-func-backend-type-conversion-for-stablehlo",Pass的type是ModuleOp,
根据 let constructor = "mlir::torch::TorchConversion::createFuncBackendTypeConversionForStablehloPass();这行,我能够知道Pass的dialect是mlir::torch::TorchConversion
""",
    },
]


examples_judge = [
    {
        "role": "user",
        "content": 
        """ 
    
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

""",
    },
    {
        "role": "assistant",
        "content": """
is_pass_td:"yes"    
理由是:def InlineGlobalSlots : Pass<"torch-inline-global-slots", "ModuleOp"> 这一行说明是Pass类
所以是Pass的td文件

""",
    },
    {
        "role": "user",
        "content": """

def Torch_NnModuleOp : Torch_Op<"nn_module", [
    DeclareOpInterfaceMethods<SymbolUserOpInterface>,
    SingleBlockImplicitTerminator<"::mlir::torch::Torch::NnModuleTerminatorOp">]> {
  let summary = "Constructs a torch.nn.Module";
  let description = [{
    This op is used to represent a torch.nn.Module when importing a
    graph of Python objects.

    This op returns a new torch.nn.Module as an SSA value, with a set of
    declaratively specified properties.

    Example:

    ```mlir
    %2 = torch.nn_module {
      torch.slot "b", %bool_true : !torch.bool
      torch.slot "i", %int3 : !torch.int
      torch.slot "f", %float : !torch.float
      torch.slot "t", %t : !torch.tensor
      torch.slot "submodule", %1 : !torch.nn.Module
    } : !torch.nn.Module<"my_class_name">
    ```

    This op is tightly coupled to the `torch.class_type` op named in the
    `!torch.nn.Module<"my_class_name">` type. Each slot must match precisely
    with the corresponding `torch.attr` in the `torch.class_type`.
    See the documentation for `torch.class_type` for information.
  }];

  let arguments = (ins);
  let results = (outs Torch_NnModuleType:$result);
  let regions = (region SizedRegion<1>:$region);
  let hasVerifier = 1;

  let assemblyFormat = "$region attr-dict `:` qualified(type($result))";

  let extraClassDeclaration = [{
    StringRef getClassName() { return getType().getClassName(); }
    ClassTypeOp getClassType(::mlir::SymbolTable &symbolTable) {
      return symbolTable.lookup<ClassTypeOp>(getClassName());
    }
  }];
}

""",
    },
    {
        "role": "assistant",
        "content": """

is_pass_td:"no"
理由是:def Torch_NnModuleOp : Torch_Op<"nn_module", 说明不是Pass类

""",
    },
]


def do_extract(text):

    prompt = prompt_template_extract.invoke(
        {"text": text, "examples": examples_extract}
    )
    data = llm_extract.invoke(prompt)
    # 转换为字典
    data_dict = data.model_dump()

    # 写入 YAML 文件
    with open("extract_pass_hlo_fromgpt.yaml", "a") as yaml_file:
        yaml.dump(data_dict, yaml_file, default_flow_style=False, allow_unicode=True)


def judge_td_file_is_pass(text):

    prompt = prompt_template_extract.invoke({"text": text, "examples": examples_judge})
    judge_res = llm_judge.invoke(prompt)
    # 转换为字典
    judge_dic = judge_res.model_dump()

    # print(judge_dic["is_pass_td"])
    if judge_dic["is_pass_td"] == "no":
        return False
    else:
        return True


# 示例使用
if __name__ == "__main__":
    td_path_files = read_paths_from_file(
        "/home/liuyang/project/buddy-compass/compass-new/Agent/extract_data/td_file_pathes/HLO_td/hlo_pass_td"
    )  # 替换为实际路径文件

    for path in td_path_files:
        print("*" * 20)
        print(path)
        tokens = read_tokens_from_file(path)
        if not judge_td_file_is_pass(tokens[0]):
            print("<" * 20, "no")
            continue
        else:
            for token in tokens:
                do_extract(token)
