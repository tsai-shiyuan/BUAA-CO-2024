# WolffySync说明文档

`WolffySync` 是为了测试 P7 的计时器中断而搭建的评测机。每64周期产生一个中断信号。评测机使用ISE仿真并和他人对拍。

评测机文件列表:

```bash
│  run.py
│  removetime.py
│  runISE.py
│  compare.py
│  datamaker.py
│  Mars.jar
│  mycopy.py
│  mymove.py
│  code.asm
│  code.txt
│  out_bat.txt
│  out_my.txt
```

## 使用方法

### 修改参数

`xilinx_path` 为你的ISE安装路径

`path_my` 为你的ISE工程文件夹路径

`path_bat` 为对拍的工程文件夹路径

`.tb` 文件的名字默认为 `mips.txt` ，也可以在 `runISE.py` 中修改

### 运行

运行 `run.py` ，在终端输入想要测试的次数即可

### 查看结果

如果仿真输出结果一致，会在终端得到 

```bash
Accepted:)
```

如果某次评测结果不一致，会在当前文件夹下生成 `diff.html` 比对报告，并停止评测

## 自主测试

可以修改 `datamaker.py` 来生成期望的测试数据