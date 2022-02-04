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
heros    =  ["wang","qiang"]
heros[0] =  "xiao"
print(heros)

heros    =  ["wang","qiang","shi","jie"]
heros[1:] =  ["b","o","x"]
print(heros)