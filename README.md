# KNAlipayWalletTweakDemo
see https://segmentfault.com/a/1190000012199291

#anti-ptrace的思路：

1、当程序运行后，使用 debugserver *:1234 -a BinaryName 附加进程出现 segmentfault 11
时，一般说明程序内部调用了ptrace 。
2、为验证是否调用了ptrace 可以 debugserver -x backboard *:1234 /BinaryPath
（这里是完整路径），然后下符号断点 b ptrace，c 之后看ptrace第一行代码的位置，然后 p $lr 找到函数返回地址，再根据
image list -o -f 的ASLR偏移，计算出原始地址。最后在 IDA
中找到调用ptrace的代码，分析如何调用的ptrace。
3、利用MSHookFunction开始hook ptrace。

