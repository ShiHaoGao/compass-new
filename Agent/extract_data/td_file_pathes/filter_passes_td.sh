#!/bin/bash

# 设置脚本执行时的错误处理
set -e
set -o pipefail

# 显示使用方法
show_usage() {
    echo "用法: $0 -p <搜索路径>"
    echo "选项:"
    echo "  -p <路径>    指定要递归搜索的路径（必需）"
    echo "  -h, --help   显示此帮助信息"
}

SEARCH_PATH=""

# 解析命令行参数
while [[ $# -gt 0 ]]; do
    case $1 in
        -p)
            if [ -n "$2" ]; then
                SEARCH_PATH="$2"
                shift 2
            else
                echo "错误：-p 参数需要指定路径"
                show_usage
                exit 1
            fi
            ;;
        -h|--help)
            show_usage
            exit 0
            ;;
        *)
            echo "错误：未知参数 $1"
            show_usage
            exit 1
            ;;
    esac
done

# 验证是否提供了搜索路径
if [ -z "$SEARCH_PATH" ]; then
    echo "错误：必须使用 -p 参数指定搜索路径"
    show_usage
    exit 1
fi

# 验证搜索路径是否存在
if [ ! -d "$SEARCH_PATH" ]; then
    echo "错误：搜索路径 '$SEARCH_PATH' 不存在或不是一个目录"
    exit 1
fi

# 创建当前目录下的td目录
rm -rf Pass_td
mkdir -p Pass_td

# 查找所有符合条件的 xxxPasses.td 文件
echo "开始搜索 *Passes.td 文件..."
find "$SEARCH_PATH" \( -type d -name "llvm*" -prune \) -o \
    \( -type f \( -path "*/Dialect/*" -o -path "*/Conversion/*" \) -name "*Passes.td" -exec sh -c '
        file="$1"
        rel_path="${file#$2/}"  # 移除搜索路径前缀
        # 将路径中的斜杠替换为下划线
        new_name=$(echo "$rel_path" | tr "/" "_")
        cp -v "$file" "Pass_td/$new_name"
    ' sh {} "$SEARCH_PATH" \; \)

echo "完成！所有 *Passes.td 文件已复制到 td 目录"

exit 0