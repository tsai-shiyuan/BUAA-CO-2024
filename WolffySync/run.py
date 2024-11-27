import os
import datamaker
import mycopy
import runISE
import mymove
import removetime
import compare

run_time = "30us"
xilinx_path = "D:\\Xilinx\\14.7\\ISE_DS\\ISE"                   # ISE下载路径
path_my = "D:\\Computer-Organization\\P7\\Wolffy\\CPU_micro"    # 我的ISE项目的位置
path_bat = "D:\\Computer-Organization\\P7\\Wolffy\\swkfk"       # 对拍的ISE项目的位置

my_out = "out_my.txt"
bat_out = "out_bat.txt"

def run():
    # make data
    # create mips code "code.asm"
    print("Create Mips codes...")
    datamaker.generate()

    # dump to hex file
    print("Run Mars...")
    os.system("java -jar Mars.jar db nc mc CompactDataAtZero a dump .text HexText code.txt code.asm")

    # move code.txt to project
    src_file = "code.txt"
    print("Move code.txt to my ISE project...")
    mycopy.copyfile(src_file, path_my)
    print("Move code.txt to bat ISE project...")
    mycopy.copyfile(src_file, path_bat)

    # run ISE
    # the outcome is stored in project folder
    print("Run my project...")
    runISE.run_ise(path_my, xilinx_path, my_out)
    print("Run bat project...")
    runISE.run_ise(path_bat, xilinx_path, bat_out)

    # move the output to current directory
    mymove.movefile(path_my, my_out)
    mymove.movefile(path_bat, bat_out)

    # remove time
    removetime.remove_time(my_out)
    removetime.remove_time(bat_out)

    # compare
    print("Compare the outputs...")
    ans = compare.compare_files(my_out, bat_out)
    return ans

def main():
    n = int(input("How many beatmatches do you want to do? "))
    flag = 1
    i = 0
    while flag == 1 and i < n:
        flag = run()
        i += 1

    if flag == 0:
        print("Wrong Answer:(")
    else: 
        print("Accepted:)")

main()
