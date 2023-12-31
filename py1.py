############################################################################################
############################################################################################
############################################################################################
#################################                        ###################################
#################################      Python学习碎片     ###################################
#################################                        ###################################
############################################################################################
############################################################################################
############################################################################################





############################################################################################
############################################## 变量 #########################################
############################################################################################

########################## （1）初识变量

# x=3
# x=5
# y=5
# z=x+y
# print(z)

########################## （2）通过变量交换x，y值

# x=3
# y=5
# z=x #z=3
# x=y #x=5
# y=z #y=3
# print(x,y)

########################## （3）变量存储字符串,并拼接

# x="王"
# y="强"
# z=x+y
# print(z)

############################################################################################
############################################## 字符串 #######################################
############################################################################################

########################## （1）打印出let's go 

# print("let's go")  #使用双引号表示字符串
# print('let\'s go') #使用单引号表示字符串，并插入转意字符

########################## （2）打印出"Life is short,let's learn python"

#print('\"Life is short,let\'s learn python\"') #对只是'和"符号用途进行转意

########################## （3）打印出 小强世界 辽源强霸 并换行

#print("小强世界\n辽源强霸")

########################## （4）使用原始字符串打印C:\now路径

# print("C:\\now") #通过\对\进行转意
# print(r"C:\now") #通过原始字符串r对所有的\进行转意

########################## （5）长字符串,打印一首古诗

# print("""
#     海上生明月
#     天涯共此时
#     入我相思门
#     知我相思苦
# """)

########################## （6）重复“我爱你”三千遍

# print("我爱你\n"*3000)


############################################################################################
##################################### 用python设计的第一个游戏 ################################
############################################################################################

########################## （1）设计韩信的技能

# temp = input("哼哼，你猜一猜吧:")
# guess = int(temp)
# if guess == 8:
#     print("你获得了目标手牌")
# else:
#     print("你获得了目标手牌")
#     print("你失去了一点生命值")

########################## （2）设计韩信的技能+次数限制

# count = 3

# while count != 0:
#     temp = input("呵呵，你猜一猜吧:")
#     guess = int(temp)
#     if guess == 8:
#         print("你获得了目标手牌")
#         break
#     else:
#         count=count-1
#         if count == 0:
#             print("你获得了目标手牌")
#             print("你失去了一点生命值")

########################## （3）设计韩信的技能+次数限制+提示

# count = 3

# while count != 0:
#     temp = input("呵呵，你猜一猜吧:")
#     guess = int(temp)
#     if guess == 8:
#         print("你获得了目标手牌")
#         break
#     else:
#         if guess > 8:
#             print("呵，大了")
#         else:
#             print("呵，小了")
#         count=count-1
#         if count == 0:
#             print("你获得了目标手牌")
#             print("你失去了一点生命值")

########################## （4）设计韩信的技能+次数限制+提示+随机数

# import random
# answer = random.randint(1,10)
# count = 3

# while count != 0:
#     temp = input("呵呵，你猜一猜吧:")
#     guess = int(temp)
#     if guess == answer:
#         print("你获得了目标手牌")
#         break
#     else:
#         if guess > answer:
#             print("呵，大了")
#         else:
#             print("呵，小了")
#         count=count-1
#         if count == 0:
#             print("你获得了目标手牌")
#             print("你失去了一点生命值")
#             print("目标手牌的数值是:",answer)

########################################################################################
###################################### 数字类型 #########################################
########################################################################################

########################## （1）整型

# print(888888/4) #结果为浮点型 

########################## （2）浮点型
##decimal精准而优雅

# print(0.1+0.2) #结果为0.3000004

# import decimal
# a=decimal.Decimal('0.1')
# b=decimal.Decimal('0.2')
# print(a+b)     #结果为0.3

##科学计数法

# print(0.00005)

########################## （3）复数型

# x=1+2j
# print(x.real)
# print(x.imag)

########################## （4）布尔类型

# print(bool(1))
# print(bool(0))
# print(bool(False))


########################################################################################
######################################   运算    #######################################
########################################################################################


# print(3+2)               #加
# print(3-2)               #减
# print(3*2)               #乘
# print(3/2)               #除
# print(3//2)              #地板除，向小的值取
# print(divmod(3,2))       #divmod函数        3//2,3%2
# print(pow(2,3))          #表示幂次方         结果为8
# print(2**3)              #表示幂次方         结果为8
# print(int("520"))        #转换成整数类型
# print(float("520"))      #转换成浮点类型
# print(complex("1+2j"))   #转换成复数类型
# print(abs(-3))           #转换成绝对值类型

##逻辑运算 and or not
# print(3<4 and 3>4) #逻辑与
# print(3<4 or 3>4)  #逻辑或
# print(not 3>4)     #逻辑反
# print(3 and 4)     #逻辑与数值取后者
# print(3 or 4)      #逻辑或数值取前者
# print((not 1) or (0 and 1) or (3 and 4) or (5 and 6)) #短路原则
# print(not 1 or 0 and 1 or 3 and 4 or 5 and 6)         #优先级原则


########################################################################################
###################################   分支与循环   ######################################
########################################################################################


############################
#########  条件分支   #######
############################

############################ （1）对学生分数进行分类

# temp=input("请输入学生的分数:")
# score=int(temp)

# if score>=90:
#     print("优秀")
# elif 90>score>=80:  #PY中else if为elif
#     print("良好")
# elif 80>score>=60:      
#     print("及格")
# else:      
#     print("不及格")

############################ （2）条件表达式的运用-一行就把条件分支写完

# a = 3
# b = 5
# if a < b:
#     small = a
# else:
#     small = b
# print(small)

# a = 3
# b = 5
# small = a if a < b else b  #修改成条件表达式
# print(small)

############################
#########  while循环   ######
############################

############################ （1）女朋友的唠叨

# answer = "yes"
# while answer == "yes" :
#     answer = input("你今天还爱我吗")

############################ （2）从1加到100，你试试？

# i = 1
# sum = 0
# while i<=100:
#     sum = sum + i
#     i = i + 1
# print(sum)

############################ （3）无限月读以及break打破

# while True:
#     answer = input("你了解痛楚了吗")
#     if answer == "yes":
#         break


############################ （4）将1~30中的奇数打印出来-continue打破

# i=0
# while True:
#     if i<=30:
#         i=i+1
#         if i%2==0:
#             continue
#         print(i)

############################ （5）做一周打卡小程序-while-else联用

# day = 1
# while day <= 7:
#     answer = input("今天任务完成了吗")
#     if answer == "yes":
#         day = day + 1
#     else:
#         break
# else:
#     print("已经坚持一疗程学习")

############################ （6）做出9*9乘法表-循环的嵌套

# i = 1
# while i<=9:
#     j = 1
#     while j<=i:
#         print(j,"*",i,"=",j*i,end="")
#         j += 1
#     print()
#     i += 1

############################
#########  for循环   #######
############################

############################ （1）初识for

# for i in "wang":
#     print(i)

############################ （2）for的好朋友range

# for i in range(10):
#     print(i)

# sum = 0
# for i in range(1,10):
#     sum = sum + i
# print(sum)

############################ （3）利用for循环嵌套找出10以内的素数-有点难

# for i in range(2,10):
#     for j in range(2,i):
#         if i%j==0:
#             break
#     else:
#         print(i)


########################################################################################
########################################   列表   ######################################
########################################################################################


############################
#########  一维列表   #######
############################

############################ （1）初识列表

# list = [1,2,3,"wangqiang"]
# print(list)
# print(list[0])
# print(list[1])
# print(list[2])
# print(list[3])    #列表中最后一个
# print(list[-1])   #列表中最后一个

# print(len(list))  #列表中元素的个数

# for i in list:    #使用for循环打印出来
#     print(i)

############################ （2）列表切片-左闭右开区间

# list = [1,2,3,"wangqiang"]
# print(list[0:2])    #打印前两个元素
# print(list[0:4:2])  #跨度打印1，3
# print(list[::-1])   #向后打印列表

############################ （3）向列表增加元素

# list = [1,2,3,"wangqiang"] 
# list.append("add")                 #append方法加入一个
# print(list)

# list = [1,2,3,"wangqiang"] 
# list.extend(["add","sub"])         #extend方法加入多个
# print(list)

# list = [1,2,3,"wangqiang"] 
# list[len(list):] = ["add","sub"]   #切片方法加入多个
# print(list)

# list = [1,2,3,"wangqiang"] 
# list.insert(3,4)                   #insert在任意位置加入
# print(list)

############################ （4）从列表删除元素

# list = [1,2,3,"wangqiang"] 
# list.remove("wangqiang")           #remove删除指定的元素
# print(list)

# list = [1,2,3,"wangqiang"] 
# list.pop(0)                        #pop删除指定位置的元素
# print(list)

# list = [1,2,3,"wangqiang"] 
# list.clear()                       #clear清空列表的元素
# print(list)

############################ （5）在列表更改元素

# list = [1,2,3,"wangqiang"] 
# list[3] = "海泥"                     #利用切片更改列表的元素
# print(list)

# list = [1,2,3,"wangqiang"] 
# list[1:] = ["海泥","王强"]            #利用切片更改列表的多个元素
# print(list)

# list = [1,3,2] 
# list.sort()                          #对列表的数字进行正排序
# print(list)

# list = [1,3,2] 
# list.reverse()                       #对列表的数字位置进行翻转
# print(list)

############################ （6）查询列表中的元素

# list = [1,1,2,3,"wangqiang"] 
# print(list.count(1))                  #count查询列表中出现元素的个数

# list = [1,1,2,3,"wangqiang"] 
# print(list.index(1))                  #index查询列表中元素的位置

# list = [1,1,2,3,"wangqiang"] 
# print(list.index(1,1,3))              #index查询列表中元素的位置,并设置起末位置。

# list = [1,1,2,3,"wangqiang"] 
# list[list.index(2)] = 3               #index查询并替换列表中元素
# print(list)

# list = [1,1,2,3,"wangqiang"] 
# list[list.index(2)] = 3               #index查询并替换列表中元素
# print(list)

############################ （7）复制列表中的元素

# list = [1,1,2,3,"wangqiang"] 
# list1 = list.copy()                     #copy实现列表的复制
# print(list1)

# list = [1,1,2,3,"wangqiang"] 
# list1 = list[:]                         #切片实现列表的复制
# print(list1)

############################
#########  二维列表   #######
############################

############################ （1）认识二维列表

# list = [[1,2,3],[4,5,6],[7,8,9]]
# print(list)

# list = [
#         [1,2,3],
#         [4,5,6],
#         [7,8,9]
#                 ]
# print(list)

############################ （2）print打印二维列表

# list = [[1,2,3],[4,5,6],[7,8,9]]
# for i in list:
#     for j in i:
#         print(j,end='')
#     print()

############################ （3）查询二维列表

# list = [[1,2,3],[4,5,6],[7,8,9]]
# print(list[0])                              #查询某行
# print(list[0][1])                           #查询某行中的某列

############################ （4）创建二维列表

# list = [0] * 3
# for i in range(3):
#     list[i] = [0] * 3
# print(list)

############################
#########  列表的复制   ######
############################


############################ （1）列表的引用到不同的变量，但本身只有一个列表，实际上不是copy

# x = [1,2,3]                            
# y = x
# print(y)
# x[0] = 4
# print(y)

############################ （2）使用copy对一维数组实现浅拷贝

# x = [1,2,3]                            
# y = x.copy()
# x[0] = 4
# print(y)

############################ （3）使用copy中的deepcopy函数对二维列表实现深拷贝

# import copy
# x =[[1,2,3],
#     [4,5,6],
#     [7,8,9]]                       
# y = copy.deepcopy(x)
# x[1][1] = 0
# print(y)

############################
#########  列表的推导式   ####   [表达式 for 表达式中的变量 in 范围] 
############################

############################ （1）认识列表推导式

# list = [i for i in range(3)]
# print(list)

############################ （2）利用列表推导式快速创立二维列表

# list = [[0] * 3 for i in range(3)]
# print(list)

############################ （3）通过列表推导式将二维数组的列取出

# x =[[1,2,3],
#     [4,5,6],
#     [7,8,9]] 
# x = [row[1] for row in x]
# print(x)

############################ （4）利用列表推导式以及ord将字符串转换为ASCII

# list = [ord(i) for i in "wangqiang"]
# print(list)

############################ （5）对列表推导式加入条件分支

# list = [i for i in range(10) if i % 2 == 0] #先执行for语句，再执行条件分支，最后执行表达式
# print(list)

# word = ["apple","sub","add"]
# word = [i for i in word if i[0] == "a"]     #列表推导式识别首字母为a的字符串
# print(word)


########################################################################################
########################################   元组   ######################################
########################################################################################


############################ （1）认识元组(tuple)

# tuple = (1,2,3,4,5,"上山打老虎")
# tuple[0] = 0                                   #元组的内容不可修改


############################ （2）查询元组中的元素

# tuple = (1,2,3,3,4,4,4,5,"上山打老虎")
# print(tuple[2:])                      
# x=tuple[2:]                                     #利用切片赋值给新的变量
# print(x)

# print(tuple.count(4))                           #查看元组中的元素的个数
# print(tuple.index(4))                           #利用元组中的元素的位置

############################ （3）建立只有一个元素的元组

# x = (520,)                                       #要在元素后加逗号
# print(type(x))

############################ （4）元组的解包和打包

# tuple = (520,"book",0.1)                          #对于列表和字符串也通用
# x,y,z=tuple
# print(x)
# print(y)
# print(z)

############################ （5）元组中的列表是可变的

# x = [1,2,3]
# y = [4,5,6]
# z = [7,8,9]
# p = (x,y,z)
# print(p)
# p[1][1] = 0                                        #元组中的列表


########################################################################################
########################################   字符串   #####################################
########################################################################################


############################ （1）利用字符串查看是否是回文数

# x = "12321"
# if x == x[::-1]:
#     print("是回文数")
# else:
#     print("不是回文数")

############################ （2）字符串中的大小写字母转换

# string = "I Love WangQiang"
# print(string.capitalize())                            #capitalize 首字母大写，其他小写
# print(string.title())                                 #title      所有单词以首字母大写开始，其余小写
# print(string.casefold())                              #casefold   所有字符串的符号均小写
# print(string.lower())                                 #lower      所有字母均小写
# print(string.upper())                                 #upper      所有字母均大写
# print(string.swapcase())                              #swapcase   所有字母大小写翻转

############################ （3）字符串中的左中右对齐

# string = "I Love WangQiang"                             
# print(string.center(25))                              #center    设置字符串的宽度，并居中对齐
# print(string.center(25,"退"))                         #center    居中对齐，将左侧补自定义字符 
# print(string.ljust(25))                               #ljust     左对齐
# print(string.rjust(25))                               #rjust     右对齐
# print(string.zfill(25))                               #zfill     居中对齐，将左侧补0

############################ （4）字符串中的查找功能

# string = "王强是王者" 
# print(string.count("王"))                             #count     查看字符出现的次数
# print(string.count("王",0,2))                         #count     查看字符出现的次数（设置起始位置）
# print(string.find("王"))                              #find      查看字符出现的位置（从左往右）
# print(string.rfind("王"))                             #rfind     查看字符出现的位置（从右往左）
# print(string.index("王"))                             #index     查看字符出现的位置（从左往右）
# print(string.rindex("王"))                            #rindex    查看字符出现的位置（从右往左）

############################ （5）字符串中的替换功能

# note = "在吗，我在你家楼下，快点下来"
# print(note.replace("在吗","想你"))                     #replace   替换字符串

# note = "在吗，我在你家楼下，快点下来"
# table = str.maketrans("在","干","下来")                #translate  设计替换规则,脚本中用到
# print(note.translate(table))

############################ （6）字符串中的判断功能

# string = "I Love WangQiang"
# print(string.startswith("I"))                         #startswith  判断首字符
# print(string.startswith("",1,3))                      #startswith  判断首字符(设置边界)
# print(string.endswith("g"))                           #endswith    判断尾字符
# print(string.istitle())                               #istitle     判断每个单词首字母是否大写，其余小写
# print(string.isupper())                               #isupper     判断每个单词是否都是大写
# print(string.upper().isupper())                       #isupper     方法的迭代,先改成大写，然后判断
# print(string.lower().islower())                       #islower     方法的迭代,先改成小写，然后判断
# print(string.isalpha())                               #alpha       判断是否全是字母构成，空格不是字母
# print(string.isspace())                               #isspace     判断是否空白字符串
# print(string.isprintable())                           #isprintable 判断是否可打印(转义字符不可打印)

# string = "12345"
# print(string.isdecimal())                             #isdecimal    判断是否数字（不可兼容特殊写法）
# print(string.isdigit())                               #isspace      判断是否数字（不可兼容大写数字）
# print(string.isnumeric())                             #isnumeric    判断是否数字（兼容性最强）
# print(string.isidentifier())                          #isidentifier 判断是否是一个合法的变量名（必须由数字、字母、下划线组成）

############################ （7）字符串中的截取功能

# string = "    不，要留，白\n "                                  
# print(string.lstrip())                                  #lstrip       删除左侧空白
# print(string.rstrip())                                  #rstrip       删除右侧空白
# print(string.strip())                                   #strip        删除左右侧空白
# print(string.partition("留"))                           #partition    以指令字符为中心拆分
# print(string.split("，"))                               #split        以指令字符为中心拆分，指令元素删除
# print(string.rsplit("，",1))                            #rsplit       以指令字符为中心拆分，指令元素删除,同时指令拆分个数
# print(string.splitlines())                              #splitlines   以换行符为中心拆分
# print(".".join(["wang","qiang","pin"]))                 #join         以指定的字符串插入各个子字符中

############################ （8）格式化字符串

# x = 98
# string = "王强的得分为{}".format(x)                       #format   引用变量到字符串中
# string = "名字为{0}，得分为{1}".format("王强","98")          
# string = "名字为{name}，得分为{score}".format(name="王强",score="98")          
# print(string)

# x = 520
# string = "{0:^10}".format(x)                            #format   引用变量到字符串中,同时设置宽度居中
# string = "{0:%>10}{1:%<10}".format(520,250)             #format   引用变量到字符串中,同时设置宽度填充左右对齐
# print(string) 

# print("{:+} {:-}".format(1,-2))                           #format   添加正负号
# print("{:_}".format(1234567))                             #format   千位分隔符
# print("{:,}".format(1234567))                             #format   千位逗号符
# print("{:.2f}".format(1234567))                           #format   保留小数点后两位
# print("{:.2g}".format(1234567))                           #format   保留两位有效数字
# print("{:.6}".format("1234567"))                          #format   保留字符串前6位
# print("{:b}".format(80))                                  #format   二进制形式输出
# print("{:c}".format(80))                                  #format   字符形式输出
# print("{:d}".format(80))                                  #format   十进制形式输出
# print("{:o}".format(80))                                  #format   八进制形式输出
# print("{:x}".format(80))                                  #format   十六进制形式输出
# print("{:#x}".format(80))                                 #format   十六进制形式输出（显示前缀）
# print("{:e}".format(80))                                  #format   科学计数法形式输出
# print("{:g}".format(1234.369))                            #format   自适应输出
# print("{:%}".format(0.98))                                #format   百分号形式输出
# print("{:.2%}".format(0.98))                              #format   百分号形式输出（设置精度）
# print("{:.{prec}f}".format(3.1415,prec=2))                #format   参数化设计
# print("{:{fill}{align}{width}.{prec}{ty}}".format(3.1415,fill="+",align="^",width=10,prec=3,ty="g"))     #format   超级参数化设计

# string = f"王强的得分为{98}"                                #format   f-string语法糖
# print(string)
# print(f"{1234567:_}")                                     #format   f-string语法糖表示格式化字符串


########################################################################################
#########################################   序列   #####################################
########################################################################################


############################ （1）序列分为列表、元组、字符串

# x = [1,2,3]                                                 
# y = [1,2,3]
# print(id(x))
# print(id(y))
# print(x is y)                                               #列表开辟了不同的空间保存两个变量

# x = (1,2,3)                                                 
# y = (1,2,3)
# print(id(x))
# print(id(y))
# print(x is y)                                               #元组开辟了一个的空间指向两个变量

# x = "1,2,3"                                                 
# y = "1,2,3" 
# print(id(x))
# print(id(y))
# print(x is y)                                               #字符串开辟了一个的空间指向两个变量

############################ （2）运用序列的一些方法

# print("1" in "1,2,3,4")                                       #字符串检测包含关系

# x = [1,2,3]
# del x[0:1]                                                    #del   删除序列
# print(x)

# x = [1,2,3]                                                   #del 清除列表
# del x[:]                                                      #或者x.clear()                                                   
# print(x)

############################ （3）序列之间的相互转换

# print(list("a,b,c"))                                          #将字符串转换成列表
# print(list((1,2,3)))                                          #将元组转换成列表

# print(tuple("a,b,c"))                                         #将字符串转换成元组
# print(tuple([1,2,3]))                                         #将列表转换成元组

# print(str([1,2,3]))                                           #将列表转换成字符串
# print(str((1,2,3)))                                           #将元组转换成字符串

# x = [1,2,0]
# print(all(x))                                                   #与操作
# print(any(x))                                                   #或操作

############################ （4）迭代器（一次性的）

# x = ["wang","qiang"]
# print(list(enumerate(x)))                                       #enumerate 引入索引号

# x = [1,2,3]
# y = [4,5,6]
# z = "a,b,c"
# print(list(zip(x,y,z)))                                         #zip    返回列压缩元组

# print(list(map(ord,"a,b,c")))                                   #map    利用函数计算ASCII码
# print(list(map(pow,[1,2],[2,4])))                               #map    利用函数计算平方

# print(list(filter(str.islower,"a,B,c")))                            #filter 将小写过滤出来

# x = [1,2,3,4,5]
# y = iter(x)                                                     #iter   将迭代对象转换成迭代器
# print(type(x))                                                  
# print(type(y))

# print(next(y))                                                  #iter   每一次显示迭代器中的一个字符
# print(next(y))
# print(next(y))
# print(next(y))
# print(next(y))
# print(next(y,"没有了"))


########################################################################################
#########################################   字典   #####################################
########################################################################################


############################ （1）初识字典

# x = {"关羽":"云长","诸葛亮":"孔明"}
# print(x["关羽"])                                     #关羽为键，云长为信息
# print(type(x))
# x["刘备"] = "玄德"                                    #增加一个字典
# print(x)

############################ （2）创建字典的5种方法

# x = {"关羽":"云长","诸葛亮":"孔明"}                    
# y = dict(关羽 = "云长",诸葛亮 = "孔明")
# z = dict([("关羽","云长"),("诸葛亮","孔明")])
# m = dict({"关羽":"云长","诸葛亮":"孔明"})
# n = dict({"关羽":"云长"},诸葛亮 = "孔明")
# k = dict(zip(["关羽","云长"],["诸葛亮","孔明"]))

############################ （3）字典元素的 增-改

# x = dict.fromkeys("wang",250)                         #所有的键赋予相同的值
# print(x)

# x["w"] = 30                                           #修改键中对应的值
# print(x)

# x["q"] = 40                                           #增加一个键以及对应的值
# print(x)

############################ （4）字典元素的 删

# x = dict.fromkeys("wang",250)
# x.pop("w")                                             #pop      删除一个键以及对应的值
# print(x)

# x = dict.fromkeys("wang",250)
# x.popitem()                                            #popitem  删除最近添加的一个键以及对应的值
# print(x)

# x = dict.fromkeys("wang",250)
# del x["w"]                                             #del      删除一个键以及对应的值
# print(x)

# x = dict.fromkeys("wang",250)
# del x                                                  #del      删除整个字典
# print(x)

# x = dict.fromkeys("wang",250)
# x.clear()                                              #clear    清空字典的内容
# print(x)

############################ （5）字典元素的 改

# x = dict.fromkeys("wang",250)                          #修改字典的基本方式
# x["w"] = 150
# print(x)

# x = dict.fromkeys("wang",250)                          #update 修改多个键值
# x.update({"w":50,"a":100})
# x.update(w="50",a="100")
# print(x)

############################ （6）字典元素的 查

# x = dict.fromkeys("wang",250)
# print(x["w"])                                           #查字典的基本方式
# print(x.get("l","这里没有"))                             #采用get查字典，可以打印注释
# print(x.setdefault("l",300))                            #采用setdefault查字典，查不到则建立新的键值

############################ （7）字典元素的 复制

# x = dict.fromkeys("wang",250)
# y = x.copy()                                             #copy   使用copy进行浅拷贝
# print(y)

############################ （8）字典元素的 视图对象

# x = dict.fromkeys("wang",250)
# keys   = x.keys()                                        #keys   保存键
# values = x.values()                                      #values 保存值
# items  = x.items()                                       #items  保存键值
# print(keys)
# print(values)
# print(items)

############################ （9）字典元素的 一些方法

# x = dict.fromkeys("wang",250) 
# print(len(x))                                              #items    查看键长
# print("a" in x)                                            #in       判断是否包含
# print(list(x))                                             #list     键转换成列表
# print(list(x.values()))                                    #x.values 值转换成列表
# y = iter(x)                                                #x.values 键转换成迭代器
# print(next(y))

# x = dict.fromkeys("wang",250) 
# x["w"] = 50
# print(list(reversed(x.values())))                          #items    将键值倒序及转换成列表

############################ （10）字典元素的 嵌套

# score = {"王强":{"数学":"99","政治":"59"},"徐振鹏":{"数学":"64","政治":"99"}}    
# print(score)
# print(score["王强"]["数学"])                                  #字典嵌套字典

# score = {"王强":[1,2,3],"徐振鹏":[4,5,6]}    
# print(score)
# print(score["王强"][0])                                      #字典嵌套列表

############################ （11）字典推导式

# x = {"关羽":"云长","诸葛亮":"孔明"}
# c = {v:k for k,v in x.items()}                               #交换键和值
# print(c)


# c = {x:ord(x) for x in "wangqiang"}                          #求出字符串对应的编码值
# print(c)


########################################################################################
#########################################   集合   #####################################
########################################################################################


############################ （1）认识集合（无序且唯一）

# x = {"a"}                                                  #集合的基本构造
# print(type(x))

############################ （2）创建集合

# x = {"a","b","c"}                                          #集合的创建

# y = {x for x in "wang"}                                    #采用集合推导式创建
# print(y)

# z = set("wang")                                            #采用类型构造器创建
# print(z)

############################ （3）集合的方法

# x = {"a","b","c"}
# print("a" in x)                                            #判断是否在集合中

# print(set([1,2,2,3]))                                      #set 集合降重

# for i in x:                                                #迭代打印集合的元素
#     print(i)

# x = {"a","b","c"} 
# y = x.copy()                                               #copy 浅复制集合
# print(y)                              

# x = {"a","b","c"} 
# print(x.isdisjoint(set("nlp")))                            #isdisjoint 判断集合没有交集 
# print(x.isdisjoint("nlp"))                                 #isdisjoint 判断集合没有交集 

# x = {"a","b","c"} 
# print(x.issubset("abcde"))                                 #issubset   判断集合是否为子集
# print(x < set("abcde"))
 
# x = {"a","b","c"}
# print(x.issuperset("ab"))                                  #issubset   判断集合是否为超集
# print(x > set("ab")) 

# x = {"a","b","c"} 
# print(x.union("123"))                                      #union                 并集
# print(x | {1, 2, 3})                                         
# print(x.union("123","456"))

# x = {"a","b","c"} 
# print(x.intersection("aoe"))                               #intersection          交集
# print(x & {"a","o","e"}) 
# print(x.intersection("abe","bce"))

# x = {"a","b","c"} 
# print(x.difference("aoe"))                                 #difference            差集
# print(x - {"a","o","e"}) 
# print(x.difference("aoe","bpl"))

# x = {"a","b","c"} 
# print(x.symmetric_difference("aoe"))                       #symmetric_difference  对称差集
# print(x ^ {"a","o","e"}) 

############################ （4）可变集合和不可变集合

# x = frozenset("wang")                                        #frozenset 不可变集合定义  
# print(type(x))
# print(x)


# x = set("wang")                                              #frozenset 不可变集合与可变集合区别 
# y = frozenset("wang")                              
# x.update([1,1],"qiang")                                      #update    可以使用update更新集合            
# print(x)   
# y.update([1,1],"qiang")                                      #update    不可以使用update更新集合
# print(y) 

############################ （5）三种更新集合方式

# x = {"a","b","c"} 
# x.update("123")                                                #intersection    更新并集
# print(x)

# x = {"a","b","c"} 
# x.intersection_update("aoe")                                   #intersection    更新交集
# print(x)

# x = {"a","b","c"} 
# x.difference_update("aoe")                                     #difference_update    更新差集
# print(x)

# x = {"a","b","c"} 
# x.symmetric_difference_update("aoe")                           #symmetric_difference  更新对称差集
# print(x)

############################ （6）集合增减元素

# x = {"a","b","c"} 
# x.add("d")                                                     #add     向集合中增加一个元素
# print(x)      

# x = {"a","b","c"} 
# x.remove("d")                                                  #remomve 从集合中删除一个元素
# print(x)                                                       #若删除元素不存在，则报错

# x = {"a","b","c"} 
# x.discard("d")                                                 #discard 从集合中删除一个元素
# print(x)                                                       #若删除元素不存在，则不变

# x = {"a","b","c"} 
# x.pop()                                                        #pop 从集合中随机弹出一个元素
# print(x)                                                      

# x = {"a","b","c"} 
# x.clear()                                                      #clear 清空集合
# print(x)                                                 

############################ （7）哈希（可变的不可哈希，不可变的可哈希）
############################     只有可哈希的对象才能作为字典的键以及集合的元素

# print(hash("123"))                                          #字符串不可变     -可哈希
# print(hash((1,2,3)))                                        #元组不可变       -可哈希
# print(hash(frozenset("wang")))                              #不可变集合不可变  -可哈希

# print(hash[1,2,3])                                          #数列可变         -不可哈希
# print(hash({"a"}))                                          #集合可变         -不可哈希

# print({"王强":123,"徐振鹏":456})                              #这种没问题            