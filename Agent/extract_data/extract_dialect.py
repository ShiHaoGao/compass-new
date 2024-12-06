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


class Dialect(BaseModel):
    """Information about a person."""

    namespace_name: Optional[str] = Field(
        default=None, description="The name of the namespace"
    )

    dialect_name: Optional[str] = Field(default=None, description="the name of dialect")

llm_extract = llm.with_structured_output(schema=Dialect)

class Dialects(BaseModel):
    """Information about a person."""

    dialects : List[Dialect]

llm_extract = llm.with_structured_output(schema=Dialects)



# Define a custom prompt to provide instructions and any additional context.
# 1) You can add examples into the prompt template to improve extraction quality
# 2) Introduce additional parameters to take context into account (e.g., include metadata
#    about the document from which the text was extracted.)
prompt_template_extract_dialect = ChatPromptTemplate.from_messages(
    [
        (
            "system",
            "You are an expert MLIR dialect extraction algorithm. "
            "Only extract MLIR dialect relevant information from the text. "
            "If you do not know the value of an attribute asked to extract, "
            "return null for the attribute's value."
            "please remember extract dialect relevant information, if not dialect relevant ,don't show me ",
        ),
        # Please see the how-to about improving performance with
        # reference examples.
        MessagesPlaceholder("examples"),
        ("human", "{text}"),
    ]
)


examples_extract_dialect = [
    {
        "role": "user",
        "content": """ 
def TMTensor_Dialect : Dialect {
  let name = "tm_tensor";
  let cppNamespace = "::mlir::torch::TMTensor";
  let description = [{
    The tm_tensor (tm = torch-mlir) dialect is a temporary staging ground in
    the torch-mlir project for a set of widely-accepted tensor compute
    operations that are not well-served by existing representations in MLIR
    upstream. These ops are currently heavily inspired by the linalg_ext
    dialect (which itself is heavily inspired by the structured ops of the
    linalg dialect). But while linalg_ext is meant to power specific codegen
    transformations, the tm_tensor dialect is a much more pure "interface
    dialect" agnostic to any particular set of transformations applied to
    the operations. We simply require a way to name the specified operations
    for interchange between projects, without taking strong opinions on the
    mechanics of transformations. 
  }];
  let hasCanonicalizer = 1;
}

""",
    },
    {
        "role": "assistant",
        "content": """
    根据 <let cppNamespace = "::mlir::torch::TMTensor";> 我能够知道:
    namespace_name: "::mlir::torch::TMTensor"
    根据<let name = "tm_tensor";>我可以知道:
    dialect_name: " tm_tensor "
""",
    },
    {
        "role": "user",
        "content": """     
def TMTensorInterface : OpInterface<"TMTensorOp"> {
  let methods = [
    //===------------------------------------------------------------------===//
    // Num input/output arguments handling.
    //===------------------------------------------------------------------===//
    // `inputs` must be defined by each op that wants to implement the
    // LinalgStructuredInterface.
    InterfaceMethod<
      /*desc=*/[{
        Return the input shape operands.
      }],
      /*retTy=*/"ValueRange",
      /*methodName=*/"getInputs",
      /*args=*/(ins)
    >,
    // These special methods rely on `inputs` and `outputs` being defined by
    // each op that wants to implement the LinalgStructuredInterface.
    InterfaceMethod<
      /*desc=*/[{
        Return the number of inputs.
      }],
      /*retTy=*/"int64_t",
      /*methodName=*/"getNumInputs",
      /*args=*/(ins),
      /*methodBody=*/"",
      /*defaultImplementation=*/[{
        return $_op.getInputs().size();
      }]
    >,
""",
    },
    {
        "role": "assistant",
        "content": """
没有dialect相关,所以输出null.    
""",
    },
    {
        "role": "user",
        "content": """ 

def Torch_Dialect : Dialect {
  let name = "torch";
  let cppNamespace = "::mlir::torch::Torch";
  let description = [{
    Top-level dialect for interfacing PyTorch and MLIR.

    This dialect maintains a fairly isomorphic representation with TorchScript.

    This dialect also provides transforms that lower it to the
    "Torch backend contract", which is an IR form that we present to
    later conversions.
    The Torch backend contract significantly simplifies the IR representation
    and puts it in a form easier for later lowering to work on. Specifically:
    - The TorchScript object graph has been flattened to a list of globals (see
      the GlobalizeObjectGraph tranformation).
  }];

  let hasRegionArgAttrVerify = 1;
  let hasConstantMaterializer = 1;
  let useDefaultTypePrinterParser = 0;

  let extraClassDeclaration = [{
    /// Parse a type registered to this dialect.
    Type parseType(DialectAsmParser &parser) const override;
    /// Print a type registered to this dialect.
    void printType(Type type, DialectAsmPrinter &printer) const override;
  }];
}
 
""",
    },
    {
        "role": "assistant",
        "content": """

    根据 <  let cppNamespace = "::mlir::torch::Torch";> 我能够知道:
    namespace_name: "::mlir::torch::Torch"
    根据<let name = "torch";>我可以知道:
    dialect_name: " torch "

""",
    },
]


def do_extract_dialect(text):

    prompt = prompt_template_extract_dialect.invoke(
        {"text": text, "examples": examples_extract_dialect}
    )
    data = llm_extract.invoke(prompt)
    # 转换为字典
    data_dict = data.model_dump()

    # 写入 YAML 文件
    with open("extract_dialect_HLO.yaml", "a") as yaml_file:
        yaml.dump(data_dict, yaml_file, default_flow_style=False, allow_unicode=True)



# 示例使用
if __name__ == "__main__":
    td_path_files = read_paths_from_file("/home/liuyang/project/buddy-compass/compass-new/Agent/extract_data/td_file_pathes/HLO_td/hlo_dialect_td")  # 替换为实际路径文件

    for path in td_path_files:
        print("*" * 20)
        print(path)
        tokens = read_tokens_from_file(path)
        for token in tokens:
          do_extract_dialect(token)
