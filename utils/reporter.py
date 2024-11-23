
from typing import Dict, List
from core.state import MLIRCodeState

class LoweringReporter:
    @staticmethod
    def generate_pass_sequence_report(history: List[str], statistics: Dict) -> str:
        """生成pass序列报告"""
        report_lines = ["\nPass Sequence:"]
        for i, pass_name in enumerate(history, 1):
            stats = statistics[pass_name]
            report_lines.extend([
                f"{i}. {pass_name}",
                f"   Success Rate: {stats['success_rate']:.2%}",
                f"   Average Time: {stats['average_time']:.3f}s"
            ])
        return "\n".join(report_lines)

    @staticmethod
    def generate_state_report(state: MLIRCodeState) -> str:
        """生成状态报告"""
        return str(state)
