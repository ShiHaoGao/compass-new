from dataclasses import dataclass, field
from typing import Set, Dict, Optional, List, TypeVar, Union
import logging
logger = logging.getLogger(__name__)


@dataclass
class PipelineStage:
    name: str
    execute: Optional[str] = None
    
    def get_exec_dialects(self) -> Optional[str]:
        return self.execute

@dataclass
class Pipeline:
    name: str
    stages: List[PipelineStage]
    
    def get_stage_dialects_from(self, active_dialects: List[str]) -> List[str]:
        logger.debug(f"active_dialects: {active_dialects}")
        for s in self.stages:
            dialects = s.get_exec_dialects()
            logger.debug(f"Stage execute dialects: {dialects}")
            if dialects in active_dialects:
                return [dialects]
        return active_dialects