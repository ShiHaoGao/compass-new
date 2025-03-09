#!/bin/bash

# 目标目录
TARGET_DIRS=("Conversion" "Dialect")

# 统计文件数和代码行数
total_files=0
total_lines=0

echo "统计 .mlir 文件数量和总代码行数"

for dir in "${TARGET_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        echo "目录: $dir"
        
        # 统计 .mlir 文件的数量
        file_count=$(find "$dir" -type f -name "*.mlir" | wc -l)
        echo "  .mlir 文件数量: $file_count"
        total_files=$((total_files + file_count))

        # 统计 .mlir 文件的总行数
        line_count=$(find "$dir" -type f -name "*.mlir" -exec wc -l {} + | awk '{s+=$1} END {print s}')
        echo "  .mlir 文件总代码行数: $line_count"
        total_lines=$((total_lines + line_count))
    else
        echo "警告: 目录 '$dir' 不存在，跳过..."
    fi
done

# 输出总数
echo "------------------------------------"
echo "总计 .mlir 文件数量: $total_files"
echo "总计 .mlir 文件总代码行数: $total_lines"

