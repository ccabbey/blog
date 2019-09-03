# PYTHON无师自通学习笔记
## PART 1
### CH1 & CH2 
None
### CH3 编程概论
1. 可以使用单引号或双引号来表示字符串，但是前后的引号必须保持一致。
2. 自加的方法: 
    * `x=x+1`
    * `x+=1`
3. Python有两种错误：语法错误(Syntax Error)和异常(Exception)，异常相当于语义错误。*常见的异常：ValueError(注意大小写)。*
4. 运算顺序PAMDAS:PE_MD_AS。
   * 第一梯队：括号（parentheses）、指数（exponents）
   * 第二梯队：乘法（multiplication）、除法（division）
   * 第三梯队：加法（addition）、减法（subtraction）
5. 一个if 语句中，包括一行以if关键字开头的代码行，if关键字之后是一个表达式，还有**冒号**、缩进。
6. 为什么if代码头要加冒号？*因为if-else是复合语句（从句）。*
   >从句包括两行或多行代码：代码头（header）及紧随其后的配套代码（suite）。**代码头指的是从句中包含关键字的那行代码**，之后是一个冒号和一行或多行带缩进的代码。
7. Python中对象的定义：
   >对象：Python 中具有3个属性的数据值---唯一标识、数据类型和值。
### CH4 函数
1. 函数必须包含return 语句。如果函数没有return 语句，则会返回None。
2. 如果在函数（或类，本书第二部分将介绍）之外定义了一个变量，则变量拥有全局作用域（global scope）。*这点与VB相同。*
3. 可以在程序的任何地方对全局变量进行写操作，但是在局部作用域中需稍加注意：必须明确使用global 关键字，并在其后写上希望修改的变量。*否则非常容易导致同名变量混淆，赋值错误。*
4. 异常处理：使用try 和except 关键字。Python 中的每一个异常都是一个对象。except关键字后添加圆括号，并用逗号分隔两个异常即可将二者捕获。*比如：'except(ZeroDivisionError, ValueError):'，作为从句，try和except后都要加冒号。*
5. 不要在except 语句中使用try 语句定义的变量，因为异常可能是在变量定义之前发生的。例子：
    ```python
    try:
        10 / 0
        c = "I will never get defined."
    except ZeroDivisionError:
        print(c)
    ```
6. 在编写函数时，在函数顶部留下注释来解释每个参数应该为何种数据类型，是比较好的做法。这些注释被称为文档字符串（docstring）。
    ```
    推荐的样式是：
    purpose: ...
    :param x: int
    :param y: str
    :return: int, description...
    ```
### CH5 容器
1. 方法是与指定数据类型紧密相关的函数。
2. **列表（list）是以固定顺序保存对象的容器。** 列表是可变的（mutable）。
   * `.append` 方法向列表中添加一个新元素。但append 方法永远是将新元素添加至列表的末尾；
   * `list[n]= x` 修改列表中的元素；
   * `.pop` 方法移除列表中的最后一个元素；
   * 使用加法操作符来合并两个列表。`list1+list2`；
   * 使用关键字`in` 检查某个元素是否在列表中；
   * 使用函数`len` 可获得列表的大小（包含元素的个数）。
3. 字符串、列表和元组都是可迭代的（iterable）。如果可以使用循环访问对象中的每一个元素，那么该对象是可迭代的，被称为可迭代对象。
4. **元组（tuple）是存储有序对象的一种容器。** 用圆括号表示元组，且必须用逗号分隔元组中的元素。有两种语法可以创建元组:
   * `my_tuple = tuple()`
   * `my_tuple = ()`
5. 即使元组中只有一个元素，也需要在该元素的后面加上逗号。*否则Python会识别为运算顺序的括号*
6. 字典（dictionary）用来链接键（key）和值（value）这两个对象。将一个对象链接至另一个对象，称为映射（mapping），结果为产生一个键值对（key-value pair）。字典用花括号表示。
   * `my_dict = dict()`
   * `my_dict = {}`
   * 通过语法“`[字典名][[键]] = [值]`”添加新的键值对，并通过语法“`[字典名][[键]]`”查找值;
   * 使用关键字in 检查某个键是否在字典中。在从字典中查找单词之前，记得先用in 关键字检查字典中是否存在对应的键。
   * `del dict[abc]` 删除字典中的键值对。
7. **字符串**或**元组**可以用作字典的键，但是列表或字典不可以。
8. 容器嵌套容器：
   * 可以在列表中存储元素，在元组中存储列表，还可以在列表或元组中存储字典；
   * 列表、字典或元组都可以成为字典中的值；
### CH6 字符串操作
1. 如果字符串跨越一行以上，可以使用三引号：
   ```python 
   """line1
   line2
   line3
   """
   ```
2. 与列表和元组一样，字符串也是可迭代的。可使用索引查找字符串中的每个字符。Python 还支持使用负索引（negative index）查找列表中的元素。切片（slicing）可将一个可迭代对象中元素的子集，创建为一个新的可迭代对象。切片的语法是`[可迭代对象][[起始索引:结束索引]]`。切片时包含起始索引位置的元素，但不包括结束索引位置的元素。例如：
```python
s=[1,2,3,4,5] #len(s) >>5
s[0] #1
s[-1] #5
#切片时包含起始索引位置的元素，但不包括结束索引位置的元素。
s[0:3] #[1,2,3]
s[0:-3] #[3,4,5]
# 如果结束索引是可迭代对象中最后一个元素的索引，那么可以将结束索引的位置留空
s[:2] #等价于s[0:2],结果为[1,2](不包含s[2])
s[2:] #[3,4,5]
# 起始索引和结束索引均留空，则会返回原可迭代对象
s[:] #[1,2,3,4,5]
```
1. 字符串运算
   * 使用加法操作符，将两个或多个字符串组合在一起。
     * `"cat" + "in" + "hat" >> 'catinhat'`
   * 使用乘法操作符，将字符串与数字相乘。
     * `"Sawyer" * 3 >> 'SawyerSawyerSawyer'`
   * `.upper()`方法：将字符串转为大写；
   * `.lower()`方法：将字符串转为小写；
   * `.capitalize()`方法：将字符串首字母大写；
2. 字符串格式化
   * `.format()`方法：把字符串中的“{}”替换为传入的字，花括号可以重复使用。例:
     * `"Hello {}! {} world!".format("world","hello") >> 'Hello world! hello world!'`
3. 字符串分割
   * `.split()`方法可用来将字符串分割为两个或多个字符串。标准方法是：`[target_string].split("[delimiter]")`
     * `"I jumped over the puddle. It was 12 feet!".split(".") >> ["I jumped over the puddle", "It was 12 feet!"]`
4. 字符串连接
   * `.join()`方法可以在字符串的每个字符间添加新字符, 标准方法是：`"[delimiter]".join([target_string])"`
5. 去除空格
   * `.strip()`方法去除字符串开头和末尾的空白字符, 标准方法是：`"string".strip()`
   * `"   my string   ".strip() >> 'mystring'`
6. 替换字符串
   * `.replace()`方法用来替换字符串中的关键字，标准方法是：`[target_string].replace([original_string], [replaced_string])`第一个参数是要被替换的字符串，第二个参数是用来替换的字符串。
     * `"All animals are equal.".replace("a","@") >> 'All @nim@ls @re equ@l.'`
7. 查找索引
   * `.index()`方法获得字符串中某个字符第一次出现的索引，标准方法是：`string.index([char])`。如果index 方法没有找到匹配的结果， Python 会报告异常错误。例：
   ```python
   "animal".index("m") #3
   "animal".index("z") #ValueError: substring not found
   #规避index报异常
   try:
     "animal"index("z")
   except(ValueError)
     print("Not found.")
   ```
8. 字符串转义:字符串转义（escaping），指的是在Python 中有特殊意义的字符（上例中为双引号）前加上一个符号，告诉Python 在本例中该符号代表的是一个字符，而没有特殊意义。在Python 中用反斜杠进行转义。`\n`标识换行符。例：
    ```python
    "She said "Surely."" #SyntaxError: invalid syntax
    "She said \"Surely.\"" #正确
    #推荐方法：在字符串中使用单引号，而非双引号，则不需要进行转义。
    "She said 'Surely'" #正确
    'She said "Surely."' #正确
    print("line1\nline2\nline3")
    # >> line1
    # >> line2
    # >> line3
    ```
9. 切片：见[CH6.2](#CH6-字符串操作)
### CH9 循环
1. For 循环：一种用来遍历可迭代对象的循环。这个过程被称为遍历（iterating）, 标准语法："`for [变量名] in [可迭代对象名]: [指令]`"。
    * 可以遍历的数据类型有：
      * 列表 list
      * 元组 tuple
      * 字典 dict
      * 字符串 str
      * 其他任何可迭代对象 iterable object
    * 由于访问可迭代对象中索引和元素是很常见的操作，Python 提供了一个专门的语法：
        ```python
        tv = ["GOT", "Narcos", "Vice"]
        for i, show in enumerate(tv): # i是索引变量(index variable), show是元素
            print(show)
        ```
    * 使用`range`函数创建整数序列，然后通过for遍历：range 函数接受两个参数：序列起始数字和结束数字，返回的整数序列包含从第一个参数到第二个参数之间（**不含第二个参数**）的所有整数。例：
        ```python
        for i in range(1,10)
            print(i) # print 1 to 9(10 not included)
        ```
2. while 循环
    * while 循环：只要表达式的值为True 就一直执行代码的循环。while 循环的语法是"`while [表达式]: [执行代码]`"。例如：
    ```python
    while True:
        print("hello world!") # 除非按Ctrl+C强制中断，否则不会退出循环
    ```
    * 如果你定义的while 循环的表达式求值永远为True，循环将不会停止执行。一个不会停止执行的循环也被称为死循环（infinite loop）。
3. break和continue
    * break 语句（带关键字break 的语句）用来终止循环。
    * continue 语句（带关键字continue 的语句）来终止循环的当前迭代，并进入下一次迭代。
    ```python
    for i in range(1,10):
        if i==3:
            continue # 3 will never be printed
        if i==8:
            break # 9 will never be printed
        print(i)
4. 嵌套循环: 内部包含一个循环的循环称为外循环（outer loop），嵌套的循环称为内循环（inner loop）。
### CH8 模块
1. 程序员将大型程序分割成多个包含Python 代码的文件，也被称为模块（module）。使用模块之前，必须先导入（import）：使用语法import [模块名]导入模块。
    ```python
    import math
    num=[1,2,3,4,5]
    print(math.mean(num)) # 3
    ```
2. 导入模块时，其中的代码都会被执行。比如你的模块中可能有测试代码，不希望在导入时执行，那么将模块中所有的代码放置在`if __name__ == "__main__"`语句中，即可解决该问题。
    ```python
    if __name__ == "__main__":
        print("Hello!") # this will not run when import
    ```
### CH9 文件
1. txt文件
   * 处理文件的第一步是使用Python 内置的open 函数打开文件。open 函数有两个参数：一个代表要打开文件路径的字符串，另一个代表打开文件的模式。为了避免程序在不同操作系统中运行出错，应使用内置的os 模块来创建文件路径。
    ```python
    import os
    os.path.join("Users","bob","st.txt") #>> 'Users/bob/st.txt'
    ```
   * open 接受的打开模式：
     * `"r"` 以只读模式打开文件。
     * `"w"` 以只写模式打开文件。如果文件已存在，会覆盖文件。如果文件不存在，则会创建一个新文件。
     * `"w+"` 以可读可写模式打开文件。如果文件已存在，会覆盖原文件。如果文件不存在，则创建一个新文件进行读写操作。
     * open 函数会返回一个叫文件对象（file object）的对象。
    ```python
    # 使用文件对象的write 方法写入文件，并通过close 方法关闭文件
    st = open("st.txt", "w")
    st.write("Hi from Python!")
    st.close()
    # 为了避免忘记关闭文件，将所有需要访问的文件对象的代码写在with 语句之中
    with open("st.txt", "w") as f:
        f.write("Hi from Python!")
    # 使用.read()方法返回一个包含文件所有行的可迭代对象
    with open("st.txt", "r") as f:
        print(f.read()) # >> "Hi from Python!"
    ```
   * 在没有关闭又重新打开文件的情况下，只能调用文件对象的read 方法一次。最好将文件保存在列表中，以便后续读取。
    ```python
    my_list = list()
    with open("st.txt", "r") as f:
    my_list.append(f.read())
    print(my_list) #>> ['Hi from Python!']
    ```
2. CSV文件
   * `csv.reader([file],"[delimiter]")`方法读取csv文件中每一行的内容
   * `w=csv.writter([file],"[delimiter]")`方法将返回一个可写入的csv对象w，然后用`w.writerow(list())`向w中写入一行。
    ```python
    import csv
    # 写csv
    with open("st.csv", "w") as f:
        w = csv.writer(f,delimiter=",")
        w.writerow(["one", "two", "three"])
        w.writerow(["four", "five", "six"])
    # 读csv
    with open("st.csv", "r") as f:
        r = csv.reader(f, delimiter=",")
        for row in r:
            lst.append(",".join(row))
            print(",".join(row))
    ```
### CH10 综合练习
1. hangman游戏
### CH11 练习
None
## PART 2 面向对象编程简介
### CH12 编程范式
1. 过程式编程：这种编程风格要求你编写一系列步骤来解决问题，每步都会改变程序的状态。“先做这个，再做那个”。
2. 函数式编程：源自拉姆达运算（lambda calculus），不依赖当前函数之外的数据，也不改变当前函数之外的数据。
    ```python
    a=0
    #过程式编程，有副作用：改变了全局变量
    def increment():
        global a
        a += 1
    #函数式编程，无副作用
    def increment(a):
        return a + 1
    ```
3. 面向对象（object-oriented）编程：范式也是通过消除全局状态来解决过程式编程引发的问题，但并不是用函数，而是用对象来保存状态。在面向对象编程中，类（class）定义了一系列相互之间可进行交互的对象。
    * 使用语法`class [类名]:[代码主体]`来定义类;
    * 类名都是以大写字母开头，且采用驼峰命名法; 方法的命名遵循函数命名规则，都是小写，并用下划线分隔;
    * 按照惯例，方法的第一个参数总是被命名为self。创建方法时，至少要定义一个参数，因为在对象上调用方法时，Python会自动将调用方法的对象作为参数传入。
    * 双下划线包围的方法（如__init__），被称为魔法方法（magic method），即Python 用于创建对象等特殊用途的方法。
    * 使用`[类名]([参数])`的语法来创建类的实例。创建对象之后，使用语法`[对象名].[变量名]`获取实例变量的值，使用语法`[对象名].[变量名] = [新的值]`改变实例变量的值。
    ```python
    class Triangle:
        # 定义类的初始化方法
        def __init__(self, base, height):
            self.base = base
            self.height = height
        # 定义计算类面积的方法
        def calculate_area(self):
            return self.base * self.height *0.5
    #实例化类并生成对象
    triangle = Triangle(10,20)
    # 获得对象的属性
    print(triangle.base,triangle.height) #>> 10 20
    # 调用对象的方法
    print(triangle.calculate_area())
    ```
    * 优点：
      * 鼓励代码复用，从而减少了开发和维护的时间；
      * 鼓励拆解问题，使代码更容易维护。
    * 缺点:
      * 编写程序时要多下些功夫，因为要做很多的事前规划和设计。
### CH13 面向对象编程的四大支柱
1. 面向对象编程有四大概念：封装、抽象、多态和继承。
2. 封装（encapsulation）包含两个概念：
    * 对象将变量（状态）和方法（用来改变状态或执行涉及状态的计算）集中在一个地方—即对象本身；
    * 封装包含的第二个概念，指的是隐藏类的内部数据，以避免客户端（client）代码（即类外部的代码）直接进行访问。
3. 在Python 中，如果有调用者不应该访问的变量或方法，则应在名称前加`下划线`；
    ```python
    class PublicPrivateExample:
        def __init__(self):
            self.public = "safe"    # 客户端可以使用
            self._unsafe = "unsafe" # 客户端不应使用
        def public_method(self):    # 客户端可以使用
            pass
        def _unsafe_method(self):   # 客户端不应使用
            pass
    ```
4. 抽象（abstraction）指的是“`剥离事物的诸多特征，使其只保留最基本的特质`”的过程。
5. 多态（polymorphism）指的是“`为不同的基础形态（数据类型）提供相关接口的能力`”。接口，指的是函数或方法。
6. 继承（inheritance）：在创建类时，该类也可以从另一个类那里继承方法和变量。被继承的类，称为父类（parent class）；继承的类则被称为子类（child class）。
    ```python
    class Parent():
        def method_parent(self):
            pass
    class Child(Parent): #继承父类
        #子类与其他类没有区别，它可以定义新的方法和变量，不会影响父类。
        def child_method(self):
            pass
        def method_parent(): #覆盖父类的方法
            pass
    
    child=Child()
    child.method_parent() # 调用父类的方法(当覆盖父类方法时，调用覆盖后的方法)
    ```
7. 组合（composition）：通过组合技巧，将一个对象作为变量保存在另一个对象中，可以模拟“拥有”关系。
    ```python
    class Dog():
        def __init__(self,name,breed,owner):
            self.name = name
            self.breed = breed
            self.owner = owner
    class Person():
        def __init__(self, name):
            self.name = name

    mick = Person("Mick Jagger")
    stan = Dog("Stanley","Bulldog",mick) # mick是Person类的实例，作为参数传递给了实体变量owner
    print(stan.owner.name)
    ```
### CH14 深入面向对象编程
1. 在Python 中，类即对象。Python 中的每个类，都是type 类的一个实例对象。Python 中所有的类，均继承自一个叫Object 的父类。
2. 关于object和type: object是所有类的父类（超类），type是所有类的类。即：`type的父类是object，但同时object的类是type。`
    ```python
    object.__bases__ #>> ()
    type.__bases__ #>> (<class 'object'>,)
    type.__class__ #>> <class 'type'>
    object.__class__ #>> <class 'type'>
    ```
3. 类中有两种类型的变量：类变量（class ariable）和实例变量（instance variable）。实例变量通过语法`self.[变量名] = [变量值]`定义。
4. 类变量属于Python 为每个类定义创建的对象，以及类本身创建的对象。类变量可以在不使用全局变量的情况下，在类的所有实例之间共享数据。
    ```python
    class Person():
        person_count=0
        persons=[]
    def __init__(self,name,age):
        self.name=name
        self.age=age
        Person.person_count+=1 #对类变量person_count进行自增运算
        self.persons.append((self.name,self.age)) #访问类变量persons
    alex=Person("Alex Li",26)
    blex=Person("Blex Li",30)
    print(Person.person_count) #>> 2
    print(Person.persons) #>> [('Alex Li', 26), ('Blex Li', 30)]
    ```
5. 表达式中的操作数必须有一个运算符是用来对表达式求值的魔法方法。例如，在表达式2 + 2 中，每个整型数对象都有一个叫__add__的方法，Python 在对表达式求值时就会调用该方法。
6. 如果两个对象是相同的对象，`关键字is` 返回True，反之则返回False。is和==的区别:
    * is 用于判断两个变量引用对象是否为同一个， == 用于判断引用变量的值是否相等。
    * a is b 相当于 id(a)==id(b)，id() 能够获取对象的内存地址。
    * 交互模式和脚本模式中，python对于内存分配的方式并不相同，这会导致is 关键字返回不同的结果。具体的细节参考[Python is 与 == 区别](https://www.runoob.com/note/33502)。
### CH15 综合练习（War Game）
code see [war_game.py](.\war_game.py)
## PART 3 编程工具简介
### CH16 BASH
1. `命令行`、`包管理器`、`正则表达式`和`版本控制`，这些都是程序员工具库中的核心成员。
    * 命令行：
      * Windows：`命令提示符`(Command Prompt)
      * UNIX/LINUX：`Bash`(使用git bash)
    * 包管理器：python：`pip`
    * 版本控制：`git`
    * 正则表达式：
      * bash: `grep`
      * python: `import re`
2. 相对路径与绝对路径: 目录（directory）是文件夹的另一种叫法, 在使用 Bash 时，其必然是会位于某个目录中。路径（path）就是表达该位置的一种方式。
    * 使用命令`pwd`(print working directory)来打印当前所在的目录的名称。
    * 绝对路径（absolute path）：以/开头，表示根目录。如：`/c/users/`
    * 相对路径（relative path）：从当前目录层级开始，输入下级目录位置，如：`home/github_repo/`
3. Bash常用命令
    * `echo`: 相当于python中的print。
    * `history`: 查看所有最近命令列表。
    * `cd [相对路径/绝对路径]`: 导航至目标路径。
      * `cd ~`： 进入home目录;
      * `cd /`: 返回根目录;
      * `cd ..`: 返回上一级目录；
    * `ls`: 打印当前工作目录下的所有目录和文件夹。
    * `mkdir [dir_name]`: 在当前路径下新建目录，目录不能有空格。
    * `rmdir [dir_name]`: 删除当前路径下指定目录。
    * `touch [file_name]`: 在当前路径下新建文件。
    * `whoami`: 打印操作系统当前用户的名称。
    * `grep [pattern] [file/string]`: 在指定文件/文本中检索指定模式。
4. 旗标（flag）: 旗标对于命令来说，是一些值为True 或False 的执行选项。一个命令的所有旗标默认置为False。通过在命令后加上`-[flag]`或`--[flag]`可以改变命令的执行方式。
5. 隐藏文件的名称以英文句点开头，如.hidden。`ls -a`可以显示所有文件。
6. 在类UNIX 操作性系统中，竖直线“|”被称为管道（pipe）。管道将一个命令的输出，传入另一个命令作为输入。如:
    ```bash
    echo i love $. | grep \$ # 表示将echo的输出（即'i love $.'）所谓grep命令的参数
    #$ i love $.
    ```
7. 环境变量（environment variable）是保存在操作系统中的变量，使用语法`export[变量名]=[变量值]`，即可在Bash 中新建一个环境变量。引用环境变量，必须在其名称前加一个$符号。这样创建的环境变量只能存在于当前的Bash 窗口。使用相同语法，将环境变量添加到home/.profile文件中，可以永久保留环境变量。
### CH17 正则表达式
1. 正则表达式（regular expression）：定义搜索模式(Pattern)的一组字符串。
2. grep 命令接受两个参数：一个正则表达式和检索正则表达式中定义模式的文件路径：`grep [pattern] [file/string]`。
    * grep -i : 忽略大小写
    * grep -o : 只打印匹配项
3. `^`匹配行的起始位置，`$`匹配行的结束位置。
4. 将正则表达式的多个字符放在`[]`中，即可定义一个匹配多个字符的模式。
5. 使用`[[:digit:]]`匹配字符串中的数字，在python中，使用`\d`匹配数字。
6. 重复匹配：
    * 星号`*`是贪婪匹配（greedy），会尽可能多地匹配文本。星号前面的元素可匹配零或多次；
    * 句号`.`匹配一个任意字符；
    * 句号后加一个星号`.*`，匹配任意字符零或多次;
    * 在星号后面加个问号`?`，使得正则表达式变成非贪婪模式（non-greedy）。一个非贪婪的正则表达式会尽可能少地进行匹配。**grep不支持非贪婪匹配，python支持。**
    ```bash
    echo two twoo not too. | grep -o two* # two twoo
    echo __hello__there | grep -o __.*__ # __hello__
    echo __hi__bye__hi__there | grep -o __.*__ # __hi__bye__hi__there 贪婪匹配
    ```
7. 在Python中使用regex: 导入re模块，例：
    ```python
    import re
    s="Beautiful is better than ugly."
    string="Two too"
    result=re.findall("beautiful",s,re.IGNORECASE)
    print(result) # >> ['Beautiful']
    print(re.findall("^b",s,re.IGNORECASE)) # >> ['B']
    print(re.findall("ugly.$",s)) #>> ['ugly.']
    print(re.findall("t[ow]o",string,re.IGNORECASE))
    #>> ['Two', 'too']
    ```
8. 在正则表达式中的字符前加上一个反斜杠\即可进行转义（忽略字符的意义，直接进行匹配）。
    ```bash
    $ echo I love $ | grep \\$ # I love $
    #通常情况下，美元符号的意思是出现在匹配文本行尾时才有效，但是由于我们进行了转义，这个正则表达式只是匹配目标文本中的美元符号。
    ```
9. 学习正则的工具网站：[regxr.com](https://regexr.com/)
### CH18 包管理器
1. 包管理器（package manager）是用来安装和管理其他程序的程序。
2. 元数据（metadata）：有关软件名称、版本号和依赖（dependencies）等的数据。
3. 使用语法`pip install[包名称]`安装新的程序包。
4. 使用命令`pip freeze` 查看已经安装了哪些包。
### CH19 版本控制
1. 代码仓库（repository）是Git 等版本控制系统创建的一种数据结构，用来记录编程项目中所有的变动。
2. 项目成员在本地计算机上有一个本地代码仓库（local repository），记录自己对项目做的修改。同时还有一个托管在Github 等类似网站的中央代码仓库（central repository），所有本地代码仓库要与其保持同步。
3. 推送(push): 将本地所做的修改更新至中央代码仓库。
4. 拉取(pull): 是将中央代码仓库的新修改同步到本地。
5. `git remote -v`（-v 是一个常用的旗标，用来打印详细信息）可打印本地代码仓库推送和拉取代码的目标URL 链接。
6. 使用命令`git log` 查看项目的提交历史。
7. 将编号传入命令`git checkout` 即可将项目切换到对应的提交版本。
8. `git diff` 可实现本地代码仓库与中央代码仓库之间文件的差别对比。在
9. 推送修改到中央代码仓库共分3 步。
    * 暂存（stage）文件：
      * `git add[文件名]`: 暂存文件；
      * `git status`: 显示项目之于代码仓库的当前状态;
      * `git reset[文件路径]`: 取消暂存;
    * 提交(Commit)文件:
      * `git commit -m [信息]`: 创建一次提交（commit）;
    * 推送(push)文件:
      * `git push origin master`: 将本地的修改推送到中央代码;
### CH20 融会贯通
1. HTML：超文本标记语言。HTML 是程序员开发网站时用到的最基本的语言之一，另外两个为CSS 和JavaScript。
2. `<title></title>`中间的文本显示在选项卡中。标签中还可以嵌入其他标签，`<head></head>`标签中的内容都是关于网页的元数据，而`<body></body>`标签中的内容才是网站本身。`<a></a>`标签可以创建超链接。
3. Python 提供了一个支持处理网络链接的内置模块urllib。
4. 抓取谷歌新闻链接中包含"articles"的新闻，然后把标题和链接写入csv文件的爬虫程序。
[source code](scrape_google_news.py)
## PART 4 计算机科学简介
### CH21 数据结构
1. 数据结构（data structure）是用来存储和组织信息的一种形式。
2. 栈（stack）：先进后出（LIFO）型数据结构。将元素从栈中移除，被称为出栈（popping）。将元素放回栈中，被称为入栈（pushing）。
    * 栈有5 个方法：
      * `is_empty` : 如果栈为空，is_empty 返回True，反之则返回False;
      * `push` : push 向栈的顶部添加一个元素;
      * `pop` : pop 从顶部移除一个元素;
      * `peek` : peek 返回顶部的元素，但不会将其移除;
      * `size` : size 返回一个表示栈中元素数量的整型数。
3. 栈可用来逆转可迭代对象，因为所有放入栈中的元素都会逆序取出。