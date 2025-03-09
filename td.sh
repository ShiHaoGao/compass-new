#!/bin/bash

# 统计 .td 文件的数量
file_count=$(find . -type f -name "*.td" | wc -l)

# 统计 .td 文件的总行数
line_count=$(find . -type f -name "*.td" -exec wc -l {} + | awk '{s+=$1} END {print s}')

# 输出结果
echo "统计当前目录及子目录下的 .td 文件"
echo "------------------------------------"
echo "  .td 文件数量: $file_count"
echo "  .td 文件总代码行数: $line_count"
echo "------------------------------------"

