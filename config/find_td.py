import os

def find_td_files(directory):
    """
    Find all .td files in the given directory and its subdirectories.
    
    Args:
        directory (str): The root directory to start searching.
    
    Returns:
        list: A list of paths to all .td files.
    """
    td_files = []
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith('.td'):
                td_files.append(os.path.join(root, file))
    return td_files

# Set the directory to search
directory_to_search = "/home/liuyang/Experiments/MLIR-experiments/mlir-related-projects/torch-mlir"

# Find and print all .td files
td_files = find_td_files(directory_to_search)
for file_path in td_files:
    print(file_path)