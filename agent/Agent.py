
from langchain_openai import ChatOpenAI
from langchain_core.messages import HumanMessage, SystemMessage
from langchain_core.prompts import ChatPromptTemplate, PromptTemplate
from core.state import MLIRCodeState
from typing import Optional, List, Tuple
from langchain_core.output_parsers import JsonOutputParser
from pydantic import BaseModel, Field
import logging
import random

logger = logging.getLogger(__name__)


# Define your desired data structure.
class Selection(BaseModel):
    answer: str = Field(description="The name of the selected dialect or pass.")
    reason: str = Field(description="A brief explanation of why this selection is the most appropriate for the current state.")



# GPT接受当前状态的所有信息
# 通过这些信息，做出选择
# 输出选择的pass

class Agent:
    

    
    def __init__(self):

        model = ChatOpenAI(model="gpt-3.5-turbo-1106")
        system_prompt = """
You are an MLIR optimization export tasked with analyzing the current MLIR code state and making decisions for lowering. Depending on the specific situation, you will either:

- Select one dialect to activate from the provided activate_dialects list, or
- Select one pass to activate from the provided activate_passes list.

Your decision must be based on the following priorities:

- Hierarchical lowering of dialects: Lower high-level dialects (e.g., tosa) into lower-level dialects (e.g., arith, tensor).
- Optimization and compatibility: Ensure the chosen dialect or pass prepares the MLIR code for successful lowering to the target backend.
- Logical progression: The selection should logically lead to further lowering and simplification.
""" 
        parser = JsonOutputParser(pydantic_object=Selection)
        prompt = ChatPromptTemplate.from_messages(
            [
            ("system",system_prompt,),
            ("human", "{input}"),
            ]
        )
        
        self.chain = prompt | model | parser
    
    def choose_pass(self, code_state: MLIRCodeState, activate_passes: List[str]) -> str:
        input = f"""
Input Details:
- Available Passes: {activate_passes}

```
{code_state}
```

Output Format:
Provide your output in JSON format with the following keys:

- answer: The name of the selected or pass.
- reason: A brief explanation of why this selection is the most appropriate for the current state.

"""
        selection = self.chain.invoke({"input": input})
        logger.debug(f"answer: {selection["answer"]}")
        logger.debug(f"reason: {selection["reason"]}")
        
        if selection["answer"] not in activate_passes:
            return random.choice(activate_passes)
        else:
            return selection["answer"]
        
        
    
    def choose_dialect(self, code_state: MLIRCodeState, activate_dialects: List[str]) -> str:
        

        input = f"""
Input Details:
- Available Dialects: {activate_dialects}

```
{code_state}
```

Output Format:
Provide your output in JSON format with the following keys:

- answer: The name of the selected dialect.
- reason: A brief explanation of why this selection is the most appropriate for the current state.

"""
        selection = self.chain.invoke({"input": input})
        logger.debug(f"answer: {selection["answer"]}")
        logger.debug(f"reason: {selection["reason"]}")
        # 检验返回是否正确
        if selection["answer"] not in activate_dialects:
            return random.choice(activate_dialects)
        else:
            return selection["answer"]
        
    



if __name__ == '__main__':
    agent = Agent()