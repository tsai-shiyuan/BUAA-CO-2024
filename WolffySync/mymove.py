import os
import shutil

def movefile(src_dir, file_name):
    current_dir = os.getcwd()
    src_path = os.path.join(src_dir, file_name)

    if not os.path.exists(src_dir):
        print(f"Error: Source directory '{src_dir}' does not exist.")
        return
    if not os.path.isfile(src_path):
        print(f"Error: File {file_name} doesn't exist in '{src_dir}'.")
        return
    if os.path.exists(file_name):
        os.remove(file_name)
        
    shutil.move(src_path, current_dir)