import os
import shutil

def copyfile(src_file, path_to):
    des_file = os.path.join(path_to, "code.txt")
    shutil.copy(src_file, des_file)