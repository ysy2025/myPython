https://zhuanlan.zhihu.com/p/36173202
本文介绍了Python中单下划线和双下划线（"dunder"）的各种含义和命名约定,名称修饰（name mangling）的工作原理,以及它如何影响你自己的Python类.

单下划线和双下划线在Python变量和方法名称中都各有其含义.有一些含义仅仅是依照约定,被视作是对程序员的提示 - 而有一些含义是由Python解释器严格执行的.

如果你想知道"Python变量和方法名称中单下划线和双下划线的含义是什么？",我会尽我所能在这里为你解答.

在本文中,我将讨论以下五种下划线模式和命名约定,以及它们如何影响Python程序的行为

单前导下划线:_var
单末尾下划线:var_
双前导下划线:__var
双前导和末尾下划线:__var__
单下划线:_

在文章结尾处,你可以找到一个简短的"速查表",总结了五种不同的下划线命名约定及其含义,以及一个简短的视频教程,可让你亲身体验它们的行为.

1. 单前导下划线 _var
当涉及到变量和方法名称时,单个下划线前缀有一个约定俗成的含义. 它是对程序员的一个提示 - 意味着Python社区一致认为它应该是什么意思,但程序的行为不受影响.

下划线前缀的含义是告知其他程序员:以单个下划线开头的变量或方法仅供内部使用. 该约定在PEP 8中有定义.

这不是Python强制规定的. Python不像Java那样在"私有"和"公共"变量之间有很强的区别. 这就像有人提出了一个小小的下划线警告标志,说:

前导下划线的确会影响从模块中导入名称的方式.
单个下划线是一个Python命名约定,表示这个名称是供内部使用的. 它通常不由Python解释器强制执行,仅仅作为一种对程序员的提示.

2. 单末尾下划线 var_
有时候,一个变量的最合适的名称已经被一个关键字所占用. 因此,像class或def这样的名称不能用作Python中的变量名称. 在这种情况下,你可以附加一个下划线来解决命名冲突.
总之,单个末尾下划线（后缀）是一个约定,用来避免与Python关键字产生命名冲突. PEP 8解释了这个约定.

3. 双前导下划线 __var
到目前为止,我们所涉及的所有命名模式的含义,来自于已达成共识的约定. 而对于以双下划线开头的Python类的属性（包括变量和方法）,情况就有点不同了.

双下划线前缀会导致Python解释器重写属性名称,以避免子类中的命名冲突.

这也叫做名称修饰（name mangling） - 解释器更改变量的名称,以便在类被扩展的时候不容易产生冲突.

Python解释器自动将名称__mangled扩展为_MangledGlobal__mangled,因为它以两个下划线字符开头.这表明名称修饰不是专门与类属性关联的.它适用于在类上下文中使用的两个下划线字符开头的任何名称.

4. 双前导和双末尾下划线 _var_
也许令人惊讶的是,如果一个名字同时以双下划线开始和结束,则不会应用名称修饰.但是,Python保留了有双前导和双末尾下划线的名称,用于特殊用途. 这样的例子有,__init__对象构造函数,或__call__ --- 它使得一个对象可以被调用.

这些dunder方法通常被称为神奇方法 - 但Python社区中的许多人（包括我自己）都不喜欢这种方法.

5.单下划线 _
按照习惯,有时候单个独立下划线是用作一个名字,来表示某个变量是临时的或无关紧要的.

例如,在下面的循环中,我们不需要访问正在运行的索引,我们可以使用"_"来表示它只是一个临时值:

你也可以在拆分(unpacking)表达式中将单个下划线用作"不关心的"变量,以忽略特定的值. 同样,这个含义只是"依照约定",并不会在Python解释器中触发特殊的行为. 单个下划线仅仅是一个有效的变量名称,会有这个用途而已.