"""
程序能一次写完并正常运行的概率很小,基本不超过1%.总会有各种各样的bug需要修正.
有的bug很简单,看看错误信息就知道,有的bug很复杂,我们需要知道出错时,哪些变量的值是正确的,哪些变量的值是错误的,
因此,需要一整套调试程序的手段来修复bug.

1.print
用print()最大的坏处是将来还得删掉它,想想程序里到处都是print(),运行结果也会包含很多垃圾信息.所以,我们又有第二种方法.

2.assert
assert的意思是,表达式n != 0应该是True,否则,根据程序运行的逻辑,后面的代码肯定会出错.

如果断言失败,assert语句本身就会抛出AssertionError：
程序中如果到处充斥着assert,和print()相比也好不到哪去.不过,启动Python解释器时可以用-O参数来关闭assert：

关闭后,你可以把所有的assert语句当成pass来看.

3.logging 不用多说了吧

4.pdb
第4种方式是启动Python的调试器pdb,让程序以单步方式运行,可以随时查看运行状态.我们先准备好程序
然后启动：
python -m pdb err.py
以参数-m pdb启动后,pdb定位到下一步要执行的代码-> s = '0'.输入命令l来查看代码

这种通过pdb在命令行调试的方法理论上是万能的,但实在是太麻烦了,如果有一千行代码,要运行到第999行得敲多少命令啊.还好,我们还有另一种调试方法.

5.pdb.set_trace()
这个方法也是用pdb,但是不需要单步执行,我们只需要import pdb,然后,在可能出错的地方放一个pdb.set_trace(),就可以设置一个断点：
运行代码,程序会自动在pdb.set_trace()暂停并进入pdb调试环境,可以用命令p查看变量,或者用命令c继续运行

虽然用IDE调试起来比较方便,但是最后你会发现,logging才是终极武器.

"""

def foo(s):
    n = int(s)
    assert n!= 0, "n is not zero!"
    return 10/n
if __name__ == '__main__':
    foo('0')