class A(object):
    def __init__(self, height, weight):
        self.height = height
        self.weight = weight

    def __str__(self):
        return "{weight}{height}".format(**self.__dict__)

    def __repr__(self):
        """
        {weight!r} & {height!r} 使用了 !r 格式规范来给方法提供属性值
        {__class__.__name__} 模板,有时候{__class__.__name__!s},用来提供类名的简单字符串表达
        :return:
        """
        return "{__class__.__name__}(weight={weight!r}),(height={height!r})".format(__class__=self.__class__, **self.__dict__)

if __name__ == '__main__':
    a = A(100, 40)
    print(a)
    print(a.__str__())
    print(a.__repr__())