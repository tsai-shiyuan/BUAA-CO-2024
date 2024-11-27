import os
run_time = "30us"

def run_ise(p_path, xilinx_path, out):
    file_list = []
    for k in os.walk(p_path):
        for file in k[2]:
            if file.endswith(".v"):
                file_list.append(file)

    with open(p_path + "\\mips.prj", "w") as prj:
        for i in range(len(file_list)):
            prj.write("Verilog work \"" + p_path + "\\" + file_list[i] + "\"\n")
    with open(p_path + "\\mips.tcl", "w") as tcl:
        tcl.write("run " + run_time +";\nexit")
    prj.close()
    tcl.close()

    original_path = os.getcwd()
    os.chdir(p_path)
    os.environ["XILINX"] = xilinx_path
    os.system(xilinx_path + "\\bin\\nt64\\fuse -nodebug -prj mips.prj -o mips.exe mips_txt > mips.log")
    os.system("mips.exe -nolog -tclbatch mips.tcl > " + out) # run
    os.chdir(original_path)