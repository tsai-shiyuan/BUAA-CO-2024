import random

"""
说明:
eret 只会出现在中断处理程序中, mfc0和mtc0在中断处理程序中有, 所以也不单独测了
"""

"""
我们要测的指令有:
add, sub, and, or, slt, sltu, lui
addi, andi, ori
lb, lh, lw, sb, sh, sw
mult, multu, div, divu, mfhi, mflo, mthi, mtlo  (要防止除0)
beq, bne, jal, jr
syscall
"""

list_R = ["add", "sub", "and", "or", "slt", "sltu"]
list_I = ["ori", "lui", "addi", "andi"]
list_LS = ["lw", "lh", "lb", "sw", "sh", "sb"]
list_B = ["beq", "bne"]
#list_Md = ["mult", "multu", "div", "divu"]
list_Md = ["mult", "multu"]
list_Mf = ["mfhi", "mflo"]
list_Mt = ["mthi", "mtlo"]


def R_test(file, n):
    for _ in range(n):
        k = random.randint(0, 10000000) % len(list_R)
        rs = random.randint(0, 10000000) % 8
        rt = random.randint(0, 10000000) % 8
        rd = random.randint(0, 10000000) % 8
        s = "{} ${}, ${}, ${}\n".format(list_R[k], rd, rs, rt)
        file.write(s)

def I_test(file, n):
    for _ in range(n):
        k = random.randint(0, 10000000) % len(list_I)
        rs = random.randint(0, 10000000) % 8
        rt = random.randint(0, 10000000) % 8
        imm = random.randint(-32768, 32768)
        abs_imm = random.randint(0, 65536)
        if list_I[k] == "lui":
            s = "{} ${}, {}\n".format(list_I[k], rt, abs_imm)
        else:
            s = "{} ${}, ${}, {}\n".format(list_I[k], rt, rs, imm)
        file.write(s)

def LS_test(file, n):
    for _ in range(n):
        k = random.randint(0, 10000000) % len(list_LS)
        ins = list_LS[k]
        imm = random.randint(0, 16384)
        rt = random.randint(0, 10000000) % 8
        s = "{} ${}, {}($0)\n".format(ins, rt, imm)
        file.write(s)

def md_test(file, n):
    for _ in range(n):
        k = random.randint(0, 10000000) % len(list_Md)
        rs = random.randint(0, 10000000) % 8
        rt = random.randint(0, 10000000) % 8
        rd1 = random.randint(0, 10000000) % 8
        rd2 = random.randint(0, 10000000) % 8
        ins = list_Md[k]
        if (ins[0] == "d"):
            while (rt == 0):
                rt = random.randint(0, 10000000) % 8
        s = "{} ${}, ${}\n".format(list_Md[k], rs, rt)
        file.write(s)
        times = random.randint(0, 10000000) % 4
        R_test(file, times)
        t = random.randint(0, 10000000) % len(list_Mf)
        s = "{} ${}\n".format(list_Mf[t], rd1)
        file.write(s)
        s = "{} ${}\n".format(list_Mf[1-t], rd2)
        file.write(s)

def B_test(file, lable):
    k = random.randint(0,10000000) % len(list_B)
    rs = random.randint(0, 10000000) % 8
    rt = random.randint(0, 10000000) % 8
    s = "{} ${}, ${}, {}\n".format(list_B[k], rs, rt, lable)
    file.write(s)

def b_begin(file, n):
    file.write("\nb_test_{}_1st:\n".format(n))
    B_test(file, "b_test_{}_1st_then".format(n))
    R_test(file, 1)     # 延迟槽
    LS_test(file, 1)
    I_test(file, 1)
    file.write("b_test_{}_2nd:\n".format(n))
    B_test(file, "b_test_{}_2nd_then".format(n))
    I_test(file, 1)     # 延迟槽
    R_test(file, 1)
    LS_test(file, 1)
    file.write("b_test_{}_3rd:\n".format(n))
    B_test(file, "b_test_{}_3rd_then".format(n))
    I_test(file, 1)
    R_test(file, 1)
    LS_test(file, 1)
    file.write("jal_test_{}:\n".format(n))
    file.write("jal jal_test_{}_then\n".format(n))
    I_test(file, 1)

    file.write("end_{}:\n\n".format(n))

    R_test(file, 1)
    I_test(file, 1)
    LS_test(file, 1)

def b_end(file, n):
    file.write("\nb_test_{}_1st_then:\n".format(n))
    R_test(file, 1)
    I_test(file, 1)
    LS_test(file, 1)
    file.write("beq $0, $0, b_test_{}_2nd\n".format(n))
    R_test(file, 1)
    
    file.write("\nb_test_{}_2nd_then:\n".format(n))
    R_test(file, 1)
    I_test(file, 1)
    LS_test(file, 1)
    file.write("beq $0, $0, b_test_{}_3rd\n".format(n))
    I_test(file, 1)

    file.write("\nb_test_{}_3rd_then:\n".format(n))
    R_test(file, 1)
    I_test(file, 1)
    LS_test(file, 1)
    file.write("jal jal_test_{}\n".format(n))
    file.write("add $1, $ra, $0\n")

    file.write("\njal_test_{}_then:\n".format(n))
    R_test(file, 1)
    I_test(file, 1)
    LS_test(file, 1)
    file.write("addi $ra,$ra, 8\n".format(n))
    B_test(file, "end_{}".format(n))
    R_test(file, 1)
    I_test(file, 1)
    LS_test(file, 1)
    file.write("jr $ra\n".format(n))

def li(file, i):
    temp = random.randint(0, 65536)
    s = "lui ${}, {}\n".format(i, temp)
    file.write(s)
    temp = random.randint(-32768, 32768)
    s = "ori ${}, ${}, {}\n".format(i, i, temp)
    file.write(s)

def R_Instr(file, rd, rs, rt):
    k = random.randint(0, 10000000) % len(list_R)
    s = "{} ${}, ${}, ${}\n".format(list_R[k], rd, rs, rt)
    file.write(s)

def I_Instr(file, rt, rs):
    k = random.randint(0, 10000000) % len(list_I)
    imm = random.randint(-32768, 32768)
    abs_imm = random.randint(0, 65536)
    if list_I[k] == "lui":
        s = "{} ${}, {}\n".format(list_I[k], rt, abs_imm)
    else:
        s = "{} ${}, ${}, {}\n".format(list_I[k], rt, rs, imm)
    file.write(s)

def Lw_Instr(file, rt, rs):
    imm = random.randint(0, 16384)
    k = random.randint(0, 10000000) % len(list_LS)
    ins = list_LS[k]
    while ins[0] != "l":
        k = random.randint(0, 10000000) % len(list_LS)
        ins = list_LS[k]
    s = "{} ${}, {}($0)\n".format(ins, rt, imm)
    file.write(s)

def Sw_Instr(file, rt, rs):
    imm = random.randint(0, 16384)
    k = random.randint(0, 10000000) % len(list_LS)
    ins = list_LS[k]
    while ins[0] != "s":
        k = random.randint(0, 10000000) % len(list_LS)
        ins = list_LS[k]
    s = "{} ${}, {}($0)\n".format(ins, rt, imm)
    file.write(s)

def B_Instr(file, rs, rt, lable):
    k = random.randint(0,10000000) % len(list_B)
    s = "{} ${}, ${}, {}\n".format(list_B[k], rs, rt, lable)
    file.write(s)

def Hazard(file, n):
    for i in range(n):
        r1 = random.randint(0, 10000000) % 8
        r2 = random.randint(0, 10000000) % 8
        r3 = random.randint(0, 10000000) % 8
        R_Instr(file, r3, r1, r2)
        R_Instr(file, r1, r2, r3)
        R_Instr(file, r2, r1, r3)
        R_Instr(file, r3, r1, r2)
        I_Instr(file, r3, r2)
        I_Instr(file, r1, r3)
        Sw_Instr(file, r2, r3)
        Lw_Instr(file, r2, r3)
        R_Instr(file, r3, r2, r1)
        I_Instr(file, r1, r2)
        Lw_Instr(file, r3, r1)
        Sw_Instr(file, r3, r3)

        R_Instr(file, r3, r2, r1)
        file.write("h1_{}:\n".format(i))
        R_Instr(file, r1, r2, r3)
        R_Instr(file, r2, r3, r2)
        B_Instr(file, r1, r2, "h1_end_{}".format(i))
        R_Instr(file, r2, r3, r1)
        Lw_Instr(file, r3, r2)
        file.write("h2_{}:\n".format(i))
        B_Instr(file, r2, r3, "h2_end_{}".format(i))
        I_Instr(file, r2, r3)
        I_Instr(file, r3, r1)
        m_and_d(file, r1, r2, r3, r2)
        file.write("beq $0, $0, end_hazard_{}\n".format(i))
        file.write("h1_end_{}:\n".format(i))
        m_and_d(file, r3, r2, r2, r1)
        I_Instr(file, r2, r3)
        I_Instr(file, r1, r2)
        file.write("beq $0, $0, h2_{}\n".format(i))
        file.write("h2_end_{}:\n".format(i))
        I_Instr(file, r1, r1)
        I_Instr(file, r2, r2)
        file.write("end_hazard_{}:\n".format(i))

def m_and_d(file, rs, rt, t1, t2):
    t = random.randint(0, 10000000) % len(list_Md)
    ins = list_Md[t]
    if (ins[0] == "d"):
        while (rt == 0):
            rt = random.randint(0, 10000000) % 8
    s = "{} ${}, ${}\n".format(ins, rs, rt)
    file.write(s)
    times = random.randint(0, 10000000) % 5
    I_test(file, times)
    t = random.randint(0, 10000000) % 2
    s = "{} ${}\n".format(list_Mf[t], t1)
    file.write(s)
    s = "{} ${}\n".format(list_Mf[1-t], t2)
    file.write(s)

def generate():
    with open("code.asm", "w") as file:
        file.write("addi $2, $2, 0xfc01\n")
        file.write("mtc0 $2, $12\n")
        file.write("ori $4, $4, 64\n")
        file.write("sw $4, 0x7f04($0)\n")
        file.write("ori $3, $3, 11\n")
        file.write("sw $3, 0x7f00($0)\n")

        for i in range(8):
            li(file, i)
        
        # md最前
        md_test(file, 10)
        for i in range(8):
            li(file, i)
        R_test(file, 20)
        I_test(file, 10)
        LS_test(file, 20)

        file.write("\n")

        index = random.randint(0, 10000000) % 8
        file.write("lui ${}, 32\n".format(index))
        index = random.randint(0, 10000000) % 8
        file.write("lui ${}, 32\n".format(index))
        index = random.randint(0, 10000000) % 8
        file.write("lui ${}, 32\n".format(index))

        Hazard(file, 10)

        index = random.randint(0, 10000000) % 8
        file.write("lui ${}, 32\n".format(index))
        index = random.randint(0, 10000000) % 8
        file.write("lui ${}, 32\n".format(index))
        index = random.randint(0, 10000000) % 8
        file.write("lui ${}, 32\n".format(index))

        for i in range(6):
            b_begin(file, i+1)
        file.write("beq $0, $0, final\n")
        for i in range(6):
            b_end(file, i+1)
        file.write("final:\n")
        file.write("nop\n")

        file.write("sw $0, 0x7f04($0)\n")
        file.write("sw $0, 0x7f00($0)\n")