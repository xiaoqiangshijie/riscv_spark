#########################test##########################
###################    one name    ####################
#########################test##########################

# count = 3
# import random
# answer = random.randint(1,10)

# while count > 0:
#     temp  = input("guess number:")
#     guess = int(temp)

#     if guess == answer:
#         print("you are ture")
#         break
#     else:
#         if guess < answer:
#             print("you are input less")
#         else:
#             print("you are input more")
#     count = count - 1

# print("game over")

#########################test##########################
###################      while     ####################
#########################test##########################

# count = 3
# while count > 0:
#     print("I love you")
#     count = count - 1
#     # break

#########################test##########################
###################      random    ####################
#########################test##########################

# import random
# num = random.randint(1,10)
# print(num)

#########################test##########################
###################       decimal         #############
#########################test##########################

# import decimal
# select = input("decimal or nodecimal:")
# num = int(select)
# if num == 1:
#     a = decimal.Decimal('0.1')
#     b = decimal.Decimal('0.2')
#     print(a + b)
# else:
#     a = 0.1
#     b = 0.2
#     print(a + b)

#########################test##########################
###########       compound number         #############
#########################test##########################

# x = 1 + 2j
# print(x.real)
# print(x.imag)

#########################test##########################
###########         not > and > or        #############
#########################test##########################



#########################test##########################
###########           condition           #############
#########################test##########################

# if "xiaoqiang" == "xiaoqiang1":
#     print("123")
# elif "xiaoqiang" == "xiaoqiang2":
#     print("456")
# else:
#     print("789")

# a = 3
# b = 5
# flag = 0 
# if a < b:
#     if flag == 1:
#         small = a
#     else:
#         small = b
# else:
#     small = b 
# print(small)

# #condition express
# small = a if a < b else b
# print(small)


#########################test##########################
###########             cycle             #############
#########################test##########################


#########################(1)

# love = "yes"
# while love == "yes":
#     love = input("do you love me today?")

#########################(2)

# i = 1
# sum = 0
# while i <= 1000000:
#     sum = sum + i
#     i   = i + 1
# print(sum)

#########################(3)

# while True:
#     print("my task is continuous work")


#########################test##########################
#############          while            ###############
#########################test##########################


#########################(1)
# i = 0
# while i < 10:
#     i = i + 1
#     if i % 2 == 0:
#         continue
#     print(i)

#########################(2)
# day = 1
# while day <= 7:
#     answer = input("do you study today?")
#     if answer != "yes":
#         break
#     day = day + 1
# else:
#     print("nice!,you hold for seven days")

#########################(3)
# i = 1
# while i <= 9:
#     j = 1
#     while j <= i:
#         print(j,"*",i,"=",j*i,end="")
#         j = j + 1
#     print()
#     i = i + 1

#########################(4)
# day = 1
# hour = 1
# while day <= 7:
#     while hour <= 8:
#         print("be sure to study for eight hours today")
#         hour = hour + 1
#         if hour > 1:
#             break
#     day = day + 1

#########################test##########################
###############          for           ################
#########################test##########################

#########################(1)
# for name in "wangqiang":
#     print(name)

#########################(1)
# for name in "wangqiang":
#     print(name)

#########################(2)
# for number in range(11):
#     print(number)

# for number in range(5,11):
#     print(number)

# for number in range(5,11,2):
#     print(number)

# for number in range(10,5,-2):
#     print(number)

#########################(3)
# i = 1
# sum = 0
# for i in range(1000001):
#     sum = sum + i
# print(sum)

#########################(3)
# for n in range(2,10):
#     for x in  range(2,n):
#         if n % x == 0:
#             print(n,"=",x,"x",n//x)
#             break
#     else:
#         print(n,"number is prime number")

#########################test##########################
###############        listbox         ################
#########################test##########################

#########################(1)

# list = [1,2,3,4,5,"go mountain hit tiger"]
# print(list[0:6:2])
# print(list[::-1])

#########################(2)

# heros = ["wang","qiang"]
# heros.append("lili")
# print(heros[::])

#########################(3)

# heros = ["wang","qiang"]
# heros.extend(["lili","xue"])
# print(heros[::])

#########################(4)

# s = [1,3,4,5]
# s.insert(1,2)
# print(s)

#########################(4)

# s = [1,3,4,5]
# s.remove(1)
# print(s)

#########################(5)

# s = [1,3,4,5]
# s.pop(2)
# print(s)

#########################(6)

# s = [1,3,4,5]
# s.clear()
# print(s)

#########################test##########################
###############        listbox         ################
#########################test##########################
# heros    =  ["wang","qiang"]
# heros[0] =  "xiao"
# print(heros)

# heros    =  ["wang","qiang","shi","jie"]
# heros[1:] =  ["b","o","x"]
# print(heros)

#########################test##########################
###############        listbox         ################
#########################test##########################

#########################(1)

# heros    =  ["wang","qiang"]
# heros[0] =  "xiao"
# print(heros)

#########################(2)

# heros    =  ["wang","qiang","shi","jie"]
# heros[1:] =  ["b","o","x"]
# print(heros)

#########################(3)

# nums    =  [3,1,9,6,8,3,5,3]
# nums.sort()
# print(nums)

#########################(4)

# heros    =  ["wang","qiang","shi","jie"]
# print(heros.index("qiang"))

#########################(5)

# heros    =  ["wang","qiang","shi","jie"]
# heros_copy = heros.copy()
# print(heros)

#########################test##########################
###############        listbox         ################
#########################test##########################

#########################(1)

# s = [1,2,3]
# t = [4,5,6]
# print(s + t)
# print(s * 3)

#########################(2)

# s = [
#      [1,2,3],
#      [4,5,6],
#      [7,8,9]
#             ]
# print(s)

#########################(3)

# s = [
#      [1,2,3],
#      [4,5,6],
#      [7,8,9]
#             ]
# print(s)

#########################(4)

# s = [
#      [1,2,3],
#      [4,5,6],
#      [7,8,9]
#             ]
# print(s[0][0])
# print(s[2][2])


#########################(5)

# x = "wang"
# y = "wang"
# print(x is y)

# m = 1
# n = 1
# print(m is n)

# a = [1,2,3]
# b = [1,2,3]
# print(a is b)

#########################test##########################
###############        listbox         ################
#########################test##########################

#########################(1)

# x = [1,2,3]
# y = x
# x[1] = 0
# print(x,y)

#########################(2)

# x = [1,2,3]
# y = x.copy()
# x[1] = 0 
# print(x,y)

#########################(3)

# x = [1,2,3]
# y = x[:]
# x[1] = 0 
# print(x,y)

#########################(3)

# x = [
#      [1,2,3],
#      [4,5,6],
#      [7,8,9]
#             ]
# y = x.copy()
# x[1][1] = 1
# print(x,y)


#########################(4) deep copy

# x = [
#      [1,2,3],
#      [4,5,6],
#      [7,8,9]
#             ]
# import copy
# y = copy.copy(x)
# x[1][1] = 1
# print(x,y)


# x = [
#      [1,2,3],
#      [4,5,6],
#      [7,8,9]
#             ]
# import copy
# y = copy.deepcopy(x)
# x[1][1] = 1
# print(x,y)

#########################test##########################
###############        listbox         ################
#########################test##########################

#########################(1)
 
# x = [1,2,3,4,5]
# for i in range(len(x)):
#     x[i] = x[i] * 2
# print(x)

#########################(2)
 
# x = [i for i in range(10)]
# print(x)

# x = [i+1 for i in range(10)]
# print(x)

#########################(3)

# x = []
# for i in range(10):
#     x.append(i+1)
# print(x)
# y = [c * 2 for c in "wangqiang"]
# print(y)

#########################(4)

# name = [ord(c) for c in "wang"]
# print(name)

#########################(5)

# x = [
#      [1,2,3],
#      [4,5,6],
#      [7,8,9]
#             ]
# col2 = [row[1] for row in x]
# print(col2)

# x = [
#      [1,2,3],
#      [4,5,6],
#      [7,8,9]
#             ]
# col2 = [x[i][i] for i in range(len(x))]
# print(col2)

#########################test##########################
###############        listbox         ################
#########################test##########################

#########################(1)

# x = [[0] * 3] * 3
# x[1][1]  = 1
# print(x)

#########################(2)

# x = [0] * 3
# for i in range(3):
#     x[i] = [0] * 3
# x[1][1] = 1
# print(x)

#########################(3)

# s = [[0] * 3 for i in range(3)]
# s[1][1] = 1 
# print(s)

#########################(4)

# s = [i for i in range(10) if i % 2 == 0]
# print(s)

#########################(5)

# s = [i + 1 for i in range(10) if i % 2 == 0]
# print(s)

#########################(6)

# words  = ["wang","qiang","shi","wo"]
# w_word = [w for w in words if w[0] == "w"]
# print(w_word)

#########################(7)

# s = [
#      [1,2,3],
#      [4,5,6],
#      [7,8,9]
#              ]
# num = []
# for row in s:
#     for col in row:
#         num.append(col)
# print(num)

#########################(8)

# s = [[1,2,3],[4,5,6],[7,8,9]]
# s = [col for row in s for col in row]
# print(s)

#########################test##########################
###############     element group     #################
#########################test##########################

#########################(1)

# group = 1,2,3,4,5,"go to hit tiger"
# group = (1,2,3,4,5,"go to hit tiger")
# print(group[0])
# print(group[:3])
# print(group[:])
# print(group[::2])
# print(group[::-1])

#########################(2)
# nums = (3,1,9,6,8,3,5,3)
# print(nums.count(3))

#########################(3)
# hero = ("wang","qiang","shi","wo")
# print(hero.index("shi"))

#########################(4)
# s = (1,2,3)
# t = (4,5,6)
# print(s+t)
# print(s * 3)
# w = s,t
# print(w)

#########################(5)
# s = (1,2,3)
# for each in s:
#     print(each)

#########################(6)
# w = ((1,2,3),(4,5,6))
# for i in w:
#     for each in i:
#         print(each)

#########################(7)
# s = (1,2,3,4,5)
# k = [each * 2 for each in s]
# print(k)

#########################(8)
# s = (1,2,3,4,5)
# k = [each * 2 for each in s]
# print(k)

#########################(9)
# s = (1,2,3,4,5)
# k = [each * 2 for each in s]
# print(k)

#########################(10)
# t = (123,'fishc',3.14)
# x,y,z = t
# print(x)
# print(y)
# print(z)

#########################(11)
# a,b,c,d,e = "fishc"
# print(a)
# print(b)
# print(c)
# print(d)
# print(e)

#########################(12)
# a,b,*c = "fishc"
# print(a,b,c)

#########################(13)
# x,y = 10,20
# _   = (10,20)
# x,y = _ 
# print(x,y)

#########################(14)
# s = [1,2,3]
# t = [4,5,6]
# w = (s,t) 
# print(w)
# w[0][1] = 9
# print(w)