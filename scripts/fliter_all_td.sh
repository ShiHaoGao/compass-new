#!/bin/bash

# 帮助信息函数
usage() {
    echo "用法: $0 -s <源目录> -d <目标目录>"
    echo "例如: $0 -s /path/to/source -d /path/to/destination"
    exit 1
}

# 初始化变量
SOURCE_DIR=""
DEST_DIR=""

# 处理命令行参数
while getopts "s:d:" opt; do
    case $opt in
        s)
            SOURCE_DIR="$OPTARG"
            ;;
        d)
            DEST_DIR="$OPTARG"
            ;;
        \?)
            echo "无效的选项"
            usage
            ;;
        :)
            echo "选项 -$OPTARG 需要参数"
            usage
            ;;
    esac
done

# 检查必需参数
if [ -z "$SOURCE_DIR" ] || [ -z "$DEST_DIR" ]; then
    echo "错误: 源目录和目标目录都是必需的"
    usage
fi

# 规范化源目录路径（移除末尾的斜杠）
SOURCE_DIR=$(echo "$SOURCE_DIR" | sed 's:/*$::')

# 检查源目录是否存在
if [ ! -d "$SOURCE_DIR" ]; then
    echo "错误: 源目录 '$SOURCE_DIR' 不存在"
    exit 1
fi

# 检查目标目录是否存在，如果不存在则创建
if [ ! -d "$DEST_DIR" ]; then
    echo "目标目录 '$DEST_DIR' 不存在，正在创建..."
    mkdir -p "$DEST_DIR"
    if [ $? -ne 0 ]; then
        echo "错误: 无法创建目标目录"
        exit 1
    fi
fi

# 输出当前设置
echo "源目录: $SOURCE_DIR"
echo "目标目录: $DEST_DIR"
echo "------------------------"

# 计数器变量
total_files=0
copied_files=0

# 查找并复制文件
echo "开始查找并复制文件..."
while IFS= read -r file; do
    ((total_files++))
    
    # 获取相对路径（从源目录开始）
    rel_path=${file#"$SOURCE_DIR"/}
    
    # 将路径中的斜杠替换为下划线
    new_filename=$(echo "$rel_path" | sed 's/\//_/g')
    
    # 复制文件到目标目录，使用新文件名
    cp "$file" "$DEST_DIR/$new_filename"
    if [ $? -eq 0 ]; then
        ((copied_files++))
        echo "已复制: $file -> $DEST_DIR/$new_filename"
    else
        echo "错误: 无法复制 $file"
    fi
done < <(find "$SOURCE_DIR" -type f -name "*.td")

# 输出统计信息
echo "------------------------"
echo "复制完成!"
echo "总共找到: $total_files 个.td文件"
echo "成功复制: $copied_files 个文件"
if [ $total_files -ne $copied_files ]; then
    echo "失败复制: $((total_files - copied_files)) 个文件"
fi