from dataclasses import dataclass
from typing import Dict, Optional

@dataclass
class PassStatistics:
    """记录pass的使用统计信息"""
    total_calls: int = 0
    successful_calls: int = 0
    average_time: float = 0.0
    
class PassStatisticsCollector:
    def __init__(self):
        self.stats: Dict[str, PassStatistics] = {}
        
    def record_pass_execution(self, pass_name: str, success: bool, execution_time: float):
        if pass_name not in self.stats:
            self.stats[pass_name] = PassStatistics()
            
        stat = self.stats[pass_name]
        stat.total_calls += 1
        if success:
            stat.successful_calls += 1
        stat.average_time = (stat.average_time * (stat.total_calls - 1) + 
                           execution_time) / stat.total_calls
                           
    def get_pass_statistics(self, pass_name: str) -> Optional[PassStatistics]:
        return self.stats.get(pass_name)
        
    def get_all_statistics(self) -> Dict[str, PassStatistics]:
        return self.stats
