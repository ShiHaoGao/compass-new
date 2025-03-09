#!/bin/bash

# 递归查找当前目录下的所有 test 目录
TARGET_DIRS=$(find . -type d -name "test" 2>/dev/null)

# 初始化计数器
total_files=0
total_lines=0

if [ -n "$TARGET_DIRS" ]; then
    echo "找到以下 test 目录:"
    echo "$TARGET_DIRS"
    echo "统计所有 test 目录下的 .mlir 文件数量和总代码行数"

    # 遍历每个 test 目录
    for dir in $TARGET_DIRS; do
        echo "------------------------------------"
        echo "目录: $dir"

        # 统计该 test 目录下的 .mlir 文件数量
        file_count=$(find "$dir" -type f -name "*.mlir" | wc -l)
        echo "  .mlir 文件数量: $file_count"
        total_files=$((total_files + file_count))

        # 统计该 test 目录下的 .mlir 文件总代码行数
        line_count=$(find "$dir" -type f -name "*.mlir" -exec wc -l {} + | awk '{s+=$1} END {print s}')
        echo "  .mlir 文件总代码行数: $line_count"
        total_lines=$((total_lines + line_count))
    done

    # 输出总计
    echo "===================================="
    echo "所有 test 目录合计 .mlir 文件数量: $total_files"
    echo "所有 test 目录合计 .mlir 文件总代码行数: $total_lines"
    echo "===================================="
else
    echo "错误: 未在当前目录及其子目录中找到任何 test 目录！"
    exit 1
fi
