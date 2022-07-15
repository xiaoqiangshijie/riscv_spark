############################################################################################
############################################################################################
############################################################################################
#################################                        ###################################
#################################      Python学习碎片     ###################################
#################################                        ###################################
############################################################################################
############################################################################################
############################################################################################


########################################################################################
#########################################   函数   #####################################
########################################################################################

############################
#######  函数的基本知识 ######
############################

############################ （1）认识函数

# def myfunc():                                       #def  为定义一个函数，myfunc为函数名
#     pass                                            #pass 为函数体

# print(myfunc())                                     #myfunc 函数什么都没干

############################ （2）使用函数书写循环

# def myfunc():                                       #def  为定义一个函数，myfunc为函数名
#     for i in range(3):
#         print("I Love WangQiang")                   #pass 为函数体
# myfunc()

############################ （3）使用函数传入参数

# def myfunc(name,times):                             #def  name作为字符串传入，times为打印次数
#     for i in range(times):
#         print(f"I Love {name}")                     #pass 为函数体

# myfunc("wangqiang",2)

############################ （4）传入参数并返回值（做出一个除法函数）

# def div(x,y):                                       #def    x作为被除数，y为除数
#     z = x / y
#     return z                                        #return 返回值z

# print(div(6,2))

# def div(x,y):                                       #def    x作为被除数，y为除数
#     if y == 0:
#         return "除数不能为0"
#     else:
#         return x / y
# print(div(6,1))

############################ （5）位置参数和关键字参数和默认参数

# def myfunc(x,y,z):
#     return "".join((z,y,x))
# print(myfunc("我","打了","狗"))                        #采用位置参数
# print(myfunc(z="我",y="打了",x="狗"))                  #采用关键字参数

# def myfunc(x,y,z="狗"):                               #采用默认参数（摆到最后）
#     return "".join((z,y,x))
# print(myfunc("我","咬了"))                             #采用默认参数
# print(myfunc("我","咬了","猫"))                        #覆盖默认参数

# def myfunc(x,y,/,z="狗"):                             # /左侧只能使用位置参数
# def myfunc(x,y,*,z="狗"):                             # *右侧只能使用关键字参数

############################ （6）搜集参数（无视参数的数量）

# def func(*x):                                           # 使用搜集参数(打包操作)
#     print(x)
#     print("有{}个参数".format((len(x))))
# func(1,2,3)                                             # 可以传入任意参数
# func(1,2,3,4)

# def func(*x):                                           # 使用搜集参数
#     print(type(x))                                      # 可以看出传参为元组类型
#     return 1,2,3                          
# print(func())                                           # 打印出了元组

# def func(*x,a,b):                                       # 使用搜集参数和普通参数组合                                   
#     return x,a,b                          
# print(func(1,2,3,a=4,b=5))                              # 打印出了元组

############################ （7）字典参数

# def func(**x):                                          # 使用字典类型参数传递                                   
#     print(x)
# func(a=1,b=2)

# def func(a,*b,**c):                                     # 使用不同类型的形参自动匹配                                 
#     print(a,b,c)
# func(1,2,3,4,5,x=6,y=7)

############################ （8）解包

# x = (1,2,3)
# print(*x)                                               # 对元组用*可以将x解包为3个元素 

# x = (1,2,3)
# def func(a,b,c):                                       
#     print(a,b,c)
# func(*x)                                                # 解包之后在进行调用

# y = {"a":1,"b":2,"c":3}                                 # 对字典用**可以将y解包为3个元素 
# def func(a,b,c):                                       
#     print(a,b,c)
# func(**y)                                               # 解包之后再进行调用

############################
#########  函数作用域 ########
############################

############################ （1）局部作用域以及全局作用域

# x = 50
# def func():
#     x = 100
#     print(x)
#     print(id(x))                                        # 局部变量的id
# func()                                                  # 调用的函数采用函数内部的变量值
# print(x)                                                # 打印的是全局变量
# print(id(x))                                            # 全局变量的id

############################ （2）global全局函数

# x = 50
# def func():
#     global x                                            # 将全局变量覆盖
#     x = 100
#     print(x)
# func()
# print(x)

############################
#########  函数嵌套 #########
############################

############################ （1）认识函数的嵌套

# def func1():
#     x = 50
#     def func2():
#         x = 100
#         print("内部函数的x值为",x)
#     func2()
#     print("外部函数中x的值为",x)
# func1()

############################ （2）nonlacal修改外部函数变量的值
 
# def func1():
#     x = 50
#     def func2():
#         nonlocal x                                #将外部变量修改为内部变量的值
#         x = 100
#         print("内部函数的x值为",x)
#     func2()
#     print("外部函数中x的值为",x)
# func1()

############################ （3）内置作用域

# str = "我毁了str这个BIF内置函数"                     #避免起与内置函数中相同的函数名
# print(str(520))                         

############################ （4）作用域之法宝 LEGB

## 1.local    局部作用域
## 2.Enclosed 嵌套内层函数的外层作用域
## 3.glocal   全局作用域
## 4.Build-in 内置作用域

############################
########### 闭包 ###########
############################

############################ （1）闭包的概念

# x = 50
# def power(exp):
#     def exp_of(base):
#         return base ** exp
#     return exp_of                       # 返回内置函数
# exp = power(3)
# print(exp(2))                           # 保留外置函数的变量值

############################ （2）带有记忆功能的函数

# def outer():
#     x = 0
#     y = 0
#     def inner(x1,y1):
#         nonlocal x,y
#         x = x + x1
#         y = y + y1
#         print(f"现在，x={x}，y={y}")
#     return inner

# outer_pop = outer()                     
# outer_pop(1,2)
# outer_pop(3,4)

#############################
########### 装饰器 ###########
#############################

############################ （1）将函数作为参数调用

# def myfunc():
#     print("正在调用函数func。。。。") 

# def report(func):
#     print("开始调用函数")
#     func()
#     print("函数调用完毕")
# report(myfunc)                           # 将函数作为参数进行传递

############################ （2）设计一个打印运行时间的程序

# import time
# def time_master(func):                        # 定义时间管理函数
#     print("开始运行程序....")
#     start = time.time()                       # 设置起始时间
#     func()
#     stop = time.time()                        # 设置结束时间
#     print("程序运行结束")
#     print(f"一共耗费了{(stop-start):.6f}秒")

# def func_text():                              # 测试程序
#     time.sleep(2)                             # 使程序睡眠2秒钟
#     print("hello python")

# time_master(func_text)                        # 在时间管理函数中调用测试程序

############################ （3）装饰器的使用（经典）

# import time
# def time_master(func):                        # 定义时间管理函数
#     def func_call():                          # 定义装饰器函数
#         print("开始运行程序....")
#         start = time.time()                       # 设置起始时间
#         func()
#         stop = time.time()                        # 设置结束时间
#         print("程序运行结束")
#         print(f"一共耗费了{(stop-start):.3f}秒")
#     return func_call                           # 返回装饰器

# def func_text():                               # 测试程序
#     time.sleep(2)                              # 使程序睡眠2秒钟
#     print("hello python")

# my_func = time_master(func_text)              # 在时间管理函数中调用测试程序
# my_func()

############################ （4）使用语法糖设计装饰器

# import time
# def time_master(func):                        # 定义时间管理函数
#     def func_call():                          # 定义装饰器函数
#         print("开始运行程序....")
#         start = time.time()                       # 设置起始时间
#         func()
#         stop = time.time()                        # 设置结束时间
#         print("程序运行结束")
#         print(f"一共耗费了{(stop-start):.3f}秒")
#     return func_call                           # 返回装饰器

# @time_master                                   # 表示将下面函数送进装饰器中
# def func_text():                               # 测试程序
#     time.sleep(2)                              # 使程序睡眠2秒钟
#     print("hello python")
         
# func_text()

############################ （5）实现多个装饰器的调用

# def add(func):
#     def inner():
#       x = func()
#       return x + 1
#     return inner

# def cube(func):
#     def inner():
#         x = func()
#         return x * x 
#     return inner

# @add                                             # 后执行
# @cube                                            # 先执行
# def test():
#     return 2 

# print(test())

############################ （6）装饰器传入参数（有难度）

# import time

# def logger(msg):
#     def time_master(func):
#         def call_func():
#             start = time.time()
#             func()
#             stop = time.time()
#             print(f"[{msg}]一共耗费了{(stop - start):.2f}")
#         return call_func
#     return time_master

# @logger(msg="A")
# def funA():
#     time.sleep(1)
#     print("正在调用funA...")

# @logger(msg="B")
# def funB():
#     time.sleep(1)
#     print("正在调用funB...")
# funA()
# funB()
 
################################
########### 函数式编程 ###########
################################

############################ （1）lambda函数设计一个数的平方

# def square(x):                      # 使用普通函数
#     return x * x
# print(square(3))

# square = lambda x: x * x            # 使用lambda
# print(square(3))

############################ （2）lambda函数应用

# x = [lambda x:x*x,2,3]
# print(x[0](2))                                      # 在列表中引用函数

# mapped = map(lambda x : x*2 , [2])                  # 利用map来调用函数
# print(list(mapped))
 
# def func(x):                                        # 打包函数给map用
#     return ord(x)
# print(list(map(func,"a")))

# print(list(filter(lambda x:x % 2 == 0,range(10))))  # 利用filter来调用函数

############################ （3）生成器

# def counter():
#     i = 0
#     while i <= 5:
#         yield i                                        # 第一种 产生生成器
#         i = i + 1
# print(counter)

# t = (i ** 2 for i in range(10))                      # 第二种 生成器表达式产生生产器（[为列表推导式]）
# print(t)
# print(next(t))
# print(next(t))
# print(next(t))

# t = [i ** 2 for i in range(10)]                      # 列表推导式
# print(t)

################################
############# 递归 #############
################################
#函数调用函数

############################ （1）初识递归

# def funA():
#     print("自己打自己")                                     
#     funA()                                            # 自己调用自己（死循环）
# funA()

############################ （2）递归的应用(需要结束条件)

# def func(i):
#     if i > 0:
#         print("我要调用我自己了")
#         i = i - 1
#         func(i)
# func(8)

############################ （3）用不同的方法实现阶乘

# def func(n):                                          # 采用正常方式实现阶乘
#     result = n
#     for i in range(1,n):
#         result = result * i
#     return result
# print(func(5))

# def func(n):                                          # 采用递归的方式实现阶乘
#     if n == 1:
#         return 1
#     else:
#         return n * func(n-1)
# print(func(5))

############################ （4）用不同的方式实现斐波那契数列

# def func(n):                                            # 采用递归的方式实现斐波那契数列
#     a = 1
#     b = 1
#     c = 1
#     while n > 2:
#         c = a + b
#         a = b
#         b = c
#         n = n - 1
#     return c
# print(func(12))

# def func(n):                                            # 采用递归的方式实现斐波那契数列
#     if n == 1 or n == 2:                                # 采用递归的方式效率很低
#         return 1
#     else:
#         return func(n-1) + func(n-2)
# print(func(12))

############################ （5）采用递归的方式实现汉诺塔(？)

# def hanoi(n,x,y,z):
#     if n == 1:
#         print(x, "-->", z)                 #如果只有一层，直接金片从x移动到z
#     else:
#         hanoi(n-1,x,z,y)                   #将x上的n-1个金片移动到y
#         print(x, "-->", z)                 #将最底下的金片从x移动到z
#         hanoi(n-1, y, x, z)                #将y上的 n-1 个金片移动到z
# n = int(input("请输入汉诺塔的层数:"))
# hanoi(n, "A", "B", "C")

##################################
############# 函数文档 ############
##################################

############################ （1）函数文档的应用

# def exchange(dollar,rate=6.54):
#     """
#     功能:汇率换算，美元 -> 人民币
#     汇率:6.54
#     日期:2018-06-25
#     """
#     return dollar * 6.54
# print(exchange(10))
# print(help(exchange))

############################ （2）类型注释

# def func(s:str,n:int) -> str:               #对输入的形参和输出的类型进行注释
#     return s * n
# print(func("wang",3))


# def func(s:str = "wang",n:int = 3) -> str:  #使用默认参数
#     return s * n
# print(func())

# def func(s:list,n:int = 3) -> list:         #采用列表类型
#     return s * n
# print(func([1,2,3]))

# def func(s:dict,n:int = 3) -> list:         #采用字典类型
#     return list(s.keys()) * n
# print(func({"A":1,"B":2,"C":3}))

############################ （3）内省

# def func():
#     return 1
# print(func.__name__)                       #检查自己的名字

##################################
############# 高阶函数 ############
##################################

############################ （1）reduce函数

# def add(x,y):                                  #reduce 使参数迭代
#     return x + y
# import functools
# print(functools.reduce(add,[1,2,3]))           #采用reduce方式迭代
# print(add(add(1,2),3))                         #采用正常方式迭代

############################ （2）采用lambda和reduce实现阶乘

# import functools
# print(functools.reduce(lambda x,y:x*y,range(1,11)))  #reduce使迭代

############################ （3）偏函数

# import functools
# square = functools.partial(pow, exp=2)           #平方
# print(square(2))
# cube = functools.partial(pow, exp=3)             #3次方
# print(cube(2))

############################ （4）@wraps装饰器

##正常装饰器的镜子

# import time
# def time_master(func):                        # 定义时间管理函数
#     def func_call():                          # 定义装饰器函数
#         print("开始运行程序....")
#         start = time.time()                       # 设置起始时间
#         func()
#         stop = time.time()                        # 设置结束时间
#         print("程序运行结束")
#         print(f"一共耗费了{(stop-start):.3f}秒")
#     return func_call                           # 返回装饰器

# def func_text():                               # 测试程序
#     time.sleep(2)                              # 使程序睡眠2秒钟
#     print("hello python")

# my_func = time_master(func_text)              # 在时间管理函数中调用测试程序
# my_func()
# print(my_func.__name__)

##@wrap装饰器的作用--打印出嵌套函数的真实面目

# import functools
# import time
# def time_master(func):                        # 定义时间管理函数
#     @functools.wraps(func)
#     def func_call():                          # 定义装饰器函数
#         print("开始运行程序....")
#         start = time.time()                       # 设置起始时间
#         func()
#         stop = time.time()                        # 设置结束时间
#         print("程序运行结束")
#         print(f"一共耗费了{(stop-start):.3f}秒")
#     return func_call                           # 返回装饰器

# def func_text():                               # 测试程序
#     time.sleep(2)                              # 使程序睡眠2秒钟
#     print("hello python")

# my_func = time_master(func_text)               # 在时间管理函数中调用测试程序
# my_func()
# print(my_func.__name__)

########################################################################################
########################################   永久存储   ####################################
########################################################################################

############################ （1）采用python建立一个文件

# f = open("crow.txt",mode="w")                       # 在本目录下创建一个crow.txt文件，模式是可写
# f.write("I Love crow\n")                            # write     写入一行字符串 
# f.writelines(["I Love Wang\n","I Love Qiang"])      # writeline 写入几行字符串 
# f.close()                                           # close将写入的文件关闭
# f.flush()                                           # flush写入硬盘中

# f = open("crow.txt",mode="w")                       # 写入模式后，不作任何操作就关闭，会清空文件
# f.close() 

# f = open("crow.txt",mode="r+")                      # 采用实时更新的方式打开
# print(f.readable())                                 # 判断是否可读
# print(f.writable())                                 # 判断是否可写
# for i in f:
#     print(i)                                        # 采用迭代的方式打印

############################ （2）文件指针

# f = open("crow.txt",mode="r+")                      # 采用实时更新的方式打开
# print(f.tell())                                     #tell     查看指针的当前位置
# print(f.read())                                     #read     从指针的开头读取文件内容
# print(f.seek(0))                                    #seek     将指针移动到文件开头
# print(f.readline())                                 #readline 将打印第一行的字符
# f.truncate(29)                                      #截取从0到19的指针位置的内容

############################ （3）文件路径

# from pathlib import Path                              #从pathlib中获取path
# print(Path.cwd())                                     #cwd方法 获取当前路径
# p = Path("/home/host/riscv_soc1")                     #将路径传递给一个变量
# print(p)                                              #再次打印
# print(p.is_dir())                                     #判断p是不是个文件夹
# print(p.name)                                         #获取路径的最后部分

# q = p/"crow.txt"                                      #指定路径中的文件
# print(q)                                              #打印路径中的文件
# print(q.is_file())                                    #判断q是不是个文件
# print(q.exists())                                     #判断q路径是不是存在
# print(q.name)                                         #获取路径的最后部分
# print(q.stem)                                         #获取文件名
# print(q.suffix)                                       #获取文件后缀


########################################################################################
########################################   类和对象  ####################################
########################################################################################


#####################################
############# 类和对象基础 ############   --修炼多重影分身之术
#####################################

############################ （1）认识类和对象-封装-分身术

#建立一个类
# class WangQiang:

#     ##属性
#     head = 1
#     eyes = 2
#     legs = 2
#     arm  = 2

#     ##方法
#     def nature(self):
#         print("我性格很好，爱与别人交流，但是不喜欢别人打扰我睡觉")
#     def eat(self):
#         print("喜欢吃口味比较重的食物，喜欢吃辣")
#     def hobby(self):
#         print("喜欢唱歌弹吉他")

# #创建一个对象t1
# wq1 = WangQiang()
# print(wq1)                               #影分身1的身份证号       
# print(wq1.legs)                          #影分身1的属性  
# wq1.nature()                             #影分身1的技能 
# wq1.eat()
# wq1.hobby()

# ##创建一个对象t2
# wq2 = WangQiang()
# print(wq2)                               #影分身2的身份证号  
# print(wq2.legs)                          #影分身2的属性 
# wq2.legs = 1                             #影分身2的腿摔断一个
# print(wq2.legs)
# wq2.car  = 1                             #给影分身2的买个车
# print(dir(wq2))                          #看一下影分身2的属性，多一个车
# print(wq1.legs)                          #看一下影分身1的腿有事没有？

############################ （2）继承-多重影分身术
  
# class A:                                   #创建一个父类
#     x = 520
#     def hello(self):
#         print("您好，我是A")

# class B(A):                                #创建一个子类
#     x = 850
#     def hello(self):
#         print("你好，我是B")

# b = B()                                    #创建一个子类的对象
# print(b.x)                                 #对象的属性
# b.hello()                                  #对象的方法

# print(isinstance(b,B))                     #isinstance 判断对象是否属于子类
# print(isinstance(b,A))                     #isinstance 判断对象是否也属于父类
# print(issubclass(B,A))                     #issubclass 判断B是否为A的子类

############################ （3）多重继承-类合体！！-类之间有互相相同的能力也有相互不同的能力

# class A:                                   #创建一个类1
#     x = 520
#     def hello(self):
#         print("您好，我是A")

# class B:                                   #创建一个类2
#     x = 850
#     y = 900
#     def hello(self):
#         print("你好，我是B")

# class C(A,B):                              #创建一个合体类
#     pass

# c = C()                                    #创建一个合体类的对象
# print(c.x)                                 #合体对象优先使用前者的属性
# print(c.y)                                 #前者的能力没有后，使用后者的属性

############################ （4）组合 - 类之间没有相同的能力

# class Trutle:                             #类-乌龟
#     def say(self):
#         print("不积跬步，无以至千里")

# class Cat:                                #类-猫
#     def say(self):
#         print("喵喵喵~")

# class Dog:                                #类-狗
#     def say(self):
#         print("汪汪，我是一只小狗")

# class Garden:                             #组合类-狗
#     t = Trutle()
#     c = Cat()
#     d = Dog()
#     def say(self):
#         self.t.say()
#         self.c.say()
#         self.d.say()

# g = Garden()                              #组合的对象
# print(g.say())                            #组合的方法


#####################################
############# 类和对象本质 ############           ----修炼仙人模式
#####################################


############################ （1）探寻本质（仙人模式修炼）

# class C:
#     def get_self(self):
#         print(self)
# c = C()
# print(c.get_self())                          #类的方法-本质是对象
# print(c)                                     #实例对象-和类的方法是相同的
# print(C.get_self(c))                         #传递进类方法的参数为对象

# d = C()
# d.x = 250 
# c.x = 520                                    #为c的新添加属性
# print(c.x)                                   #d的属性，c不可以使用
# print(c.__dict__)                            #__dict__ c的内省的函数-意字典形式存储属性            

############################ （2）通过方法建立属性（仙人模式的开启）

# class A:                                       #给A哥配置一个力量属性
#     def strength(self,v):
#         self.strength = v

# a = A()                                        #A哥人物生成
# print(a.__dict__)                              #查看A哥的属性
# a.strength(250)                                #提供力量属性
# print(a.__dict__)                              #查看A哥的属性

############################ （3）探寻仙人的本质

# class A:
#     x = 100
#     def strength(self,v):
#         x = v
# a = A()                                                                                   
# a.strength(250)                                  #仅仅改动了strength函数的局部变量          
# print(a.x)                                       #查看A哥的属性，                         a哥分身的能力
# print(a.__dict__)                                #查看A哥对象的属性                       a哥分身本质的能力
# A.x = 250                                        #通过类修改A哥类的属性（不建议）            a哥本体的能力
# print(a.__dict__)                                #查看A哥对象的属性-可以看出对象由类继承的    a哥分身本质的能力

############################ （4）创建一个最小的类-空手练习

# class C:
#     pass

# c = C()
# c.x = 250
# c.y = "小甲鱼"
# c.z = [1,2,3]

# print(c.x)
# print(c.y)
# print(c.z)

# print(C.__dict__)
# print(c.__dict__)


#####################################
############## 构造函数 ##############           -- __init__()  
#####################################

############################ （1）构造函数

# class C:
#     def __init__(self,x,y):                     #构造函数
#         self.x = x 
#         self.y = y
#     def add(self):
#         return self.x + self.y
#     def mul(self):
#         return self.x + self.y

# c = C(2,3)                                       #从类传入参数  
# print(c.add())                                      
# print(c.mul())                         
# print(c.__dict__)            

############################ （2）重写

# class C:
#     def __init__(self,x,y):                     #父类
#         self.x = x 
#         self.y = y
#     def add(self):
#         return self.x + self.y
#     def mul(self):
#         return self.x + self.y

# class D:
#     def __init__(self,x,y,z):                     #子类覆盖父类
#         C.__init__(self,x,y)                      #调用未绑定的父类的方法
#         self.z = z
#     def add(self):
#         return C.add(self) + self.y               #子类调用父类的方法
#     def mul(self):
#         return C.add(self) + self.y               #子类调用父类的方法

# d = D(2,3,4)
# print(d.add())                                    #调用未绑定的父类的方法

############################ （3）砖石继承

# class A:
#     def __init__(self):
#         print("哈喽 我是A")

# class B1(A):
#     def __init__(self):
#         A.__init__(self)                            #调用未绑定的父类的方法
#         print("哈喽 我是B1")

# class B2(A):
#     def __init__(self):
#         A.__init__(self)                            #调用未绑定的父类的方法
#         print("哈喽 我是B2")

# class C(B1,B2):
#     def __init__(self):
#         B1.__init__(self)
#         B2.__init__(self)
#         print("哈喽，我是C")

# c = C()                                             #C继承与B1和B2，B1继承于A，B2继承于A，所以A调用两次

############################ （4）super函数

# class A:
#     def __init__(self):
#         print("哈喽 我是A")

# class B1(A):
#     def __init__(self):
#         super().__init__()                            #使用super自动搜索父类
#         print("哈喽 我是B1")

# class B2(A):
#     def __init__(self):
#         super().__init__()                            #使用super自动搜索父类
#         print("哈喽 我是B2")

# class C(B1,B2):
#     def __init__(self):
#         super().__init__()
#         print("哈喽，我是C")

# c = C()                                              #C继承与B1和B2，B1继承于A，B2继承于A，采用super函数避免重复


#####################################
############## 设计模式 ##############           -- 打蛙组拳  mix-in
#####################################

############################ （1）建立一个人物

# class human:
#     def __init__(self,name,age):
#         self.name = name
#         self.age  = age
#     def say(self):
#         print(f"我叫{self.name},今年{self.age}岁了")
    
# class wangqiang(human):
#     def special(self):
#         print("我的技能是弹吉他")
# wq = wangqiang("王强",27)
# wq.say()
# wq.special()

############################ （2）让我飞起来

# class human:
#     def __init__(self,name,age):
#         self.name = name
#         self.age  = age
#     def say(self):
#         print(f"我叫{self.name},今年{self.age}岁了")
    
# class fly:
#     def fly(self):
#         print("我还会飞!!!")

# class wangqiang(fly,human):
#     def special(self):
#         print("我的技能是弹吉他")

# wq = wangqiang("王强",27)
# wq.say()
# wq.special()
# wq.fly()

############################ （3）小试牛刀-经典题目

# class Displayer:
#     def display(self,message):
#         print(message)

# class LoggerMixin:
#     def log(self,message,filename="logfile.txt"):     #去参考文件生成
#         with open(filename,"a") as f:
#             f.write(message)
#     def display(self,message):
#         super().display(message)                      #super查找父类严格遵循mro顺序
#         self.log(message)

# class MySubClass(LoggerMixin,Displayer):
#     def log(self,message):
#         super().log(message,filename="subclasslog.txt")

# subclass = MySubClass()
# subclass.display("This is a test")

# print(MySubClass.mro())                               #super查找父类严格遵循mro顺序

############################ （4）多态 -- 不同的场景不同的功能--见机行事的行为

# print(len("wangqiang"))                                 #len 函数表示字符串的个数
# print(len([1,2,3]))                                     #len 函数表示列表的个数
# print(len({"王强":"a","徐振鹏":"b"}))                     #len 函数表示字典中键的个数

#采用多态定义area不同的功能

# class Shape:
#     def __init__(self,name):
#         self.name = name
#     def area(self):
#         pass

# class Square(Shape):
#     def __init__(self, length):
#         super().__init__("正方形")                        #将参数传递给父类
#         self.length = length
#     def area(self):
#         return self.length * self.length

# class Circle(Shape):
#     def __init__(self, radius):
#         super().__init__("圆形")
#         self.radius = radius
#     def area(self):
#         return 3.14 * self.radius * self.radius

# class Triangle(Shape):
#     def __init__(self,base,height):
#         super().__init__("三角形")
#         self.base = base
#         self.height = height
#     def area(self):
#         return self.base * self.height / 2

# s = Square(5)
# c = Circle(6)
# t = Triangle(3,4)
# print(s.name)
# print(c.name)
# print(t.name)                                             #打印对象的属性--继承父类
# print(s.area())
# print(c.area())
# print(t.area())                                           #打印对象的属性--继承子类

############################ （5）使用函数调用不同对象

# class Cat:
#     def __init__(self,name,age):
#         self.name = name
#         self.age  = age
#     def intro(self):
#         print(f"我是一只{self.name}，今年{self.age}岁")

# class Dog:
#     def __init__(self,name,age):
#         self.name = name
#         self.age  = age
#     def intro(self):
#         print(f"我是一只{self.name}，今年{self.age}岁")

# c = Cat("喵咪",5)
# d = Dog("小狗",2)

# def animal(x):
#     x.intro()

# animal(c)                           
# animal(d)   


#####################################
############## 私有变量 ##############           -- 偷偷改名字
#####################################

############################ （1）私有变量和方法
##私有属性

# class C:
#     def __init__(self,x):
#         self.__x = x                            #__x  为私有变量
#     def set_x(self,x):
#         self.__x = x
#     def get_x(self):
#         print(self.__x)
# c = C(250)
# # print(c.__x)                                    #无法访问
# print(c.get_x())
# print(c.set_x(520))
# print(c.get_x())

# print(c.__dict__)                                 #查看c的属性
# print(c._C__x)                                    #通过属性调用

##私有方法

# class D:
#     def __func(self):
#         print("被你找到了")
# d = D()
# #d.__func()                                          #无法访问
# d._D__func()                                         #通过查看属性访问


#####################################
############## 节省空间 ##############        
#####################################

############################ （1）__slots__的使用

##正常添加属性

# class C:
#     def __init__(self,x):
#         self.x = x

# c = C(250)
# print(c.x)
# print(c.__dict__)

# c.y = 520                                              #动态添加属性
# print(c.__dict__)

# c.__dict__["z"] = 666                                  #通过字典添加属性
# print(c.__dict__)

##采用__slots__控制属性

# class C:
#     __slots__ = ["x","y"]
#     def __init__(self,x):
#         self.x = x

# c = C(250)
# print(c.x)
# c.y = 520
# print(c.y)
# # c.z = 666                                              #采用__slots__控制属性只有x，y  
# # print(c.__dict__)                                      #不允许访问字典中
# print(c.__slots__)                                       #可以访问控制属性__slots__中，节省空间

############################ （2）__slots__的继承

##采用__slots__控制属性不允许继承

# class C:
#     __slots__ = ["x","y"]
#     def __init__(self,x):
#         self.x = x

# class D(C):
#     pass

# d = D(250)
# print(d.x)
# d.y = 520
# print(d.y)

# d.z = 666                                #父类中__slots__不存在的属性，存放在__dict__中
# print(d.z)

# print(d.__dict__)
# print(d.__slots__)


########################################################################################
################################   魔法方法 --你的对象听你的  ##############################
########################################################################################

############################ （1）__new__实例化调用的第一个方法

# class CapStr(str):                                   #套路学会即可
#     def __new__(cls,string):             
#         string = string.upper()                      #调用str中的方法
#         return super().__new__(cls,string)           #传给父类

# cs = CapStr("FishC")
# print(cs)

# print(cs.lower)

############################ （2）__del__ 将对象销毁方法(还需要了解)

# class C:
#     def __init__(self):
#         print("我来了~")
#     def __del__(self):
#         print("我走了~")

# c = C()
# c.a = 2
## del c                                          #直接销毁对象
# print(c.a)                                       #结束后被销毁

############################ （3）__add__ 加法

# class S(str):
#     def __add__(self, other):
#         return len(self) + len(other)

# s1 = S("wang")
# s2 = S("qiang")
# print(s1+s2)                                      #等同于s1.__add__(s2)
# print(s1+"bbq")  
# print("bbq"+s2)  

############################ （4）__radd__ 加法

# class S1(str):
#     def __add__(self, other):
#         return NotImplemented                      #魔法方法未实现

# class S2(str):
#     def __radd__(self, other):
#         return len(self) + len(other)

# s1 = S1("apple")
# s2 = S2("banana")
# print(s1+s2)

############################ （5）__iadd__ 左侧增强型加法

# class S1(str):
#     def __iadd__(self, other):
#         return len(self) + len(other)                   #魔法方法未实现

# class S2(str):
#     def __radd__(self, other):
#         return len(self) + len(other)

# s1 = S1("apple")
# s2 = S2("banana")
# s1 += s2
# print(s1)
# print(type(s1))