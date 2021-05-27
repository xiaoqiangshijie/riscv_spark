# -*- coding:utf-8 -*-

# import os
# import re
# import datetime


# def create_folder(out_file_path): # 判断输出文件夹是否存在，不存在则创建
#     if not os.path.exists(out_file_path):
#         os.makedirs(out_file_path)

# def execute_command(name, cmd): # 命令执行函数
#     """
#     执行cmd命令，返回运行结果
#     """
#     with os.popen(cmd) as r:
#         text = r.read()
#         if "PASS" in text :
#             print(name+" "+"pass!")
#             return "pass"
#         else:
#             print(name+" "+"fail!")
#             return "fail"

# def get_command(file_path): # 获取测试名和测试命令函数，只需要in.txt路径输入
#     """
#     包装in.txt文件，并从中逐条取出命令
#     """
#     with open(file_path, 'r') as f:
#         while True:
#             test_name = f.readline().split(":")[-1].strip()
#             if not test_name:
#                 break  # 到达文件末尾时readline获取到的是空字符串
#             test_command = f.readline().split(":")[-1].strip()  # 把命令取出来执行
#             # test_time = int(f.readline().split(":")[-1].strip())  # 该命令的超时时间
#             _ = f.readline()  # 取出空行，无作用
#             yield test_name, test_command

# def write_output(file_path, test_name, test_result): # 结果输出到文本函数
#     """
#     将单独一次的运行结果写入out.txt文件
#     """
#     with open(file_path, 'a') as f:  # a为追加模式，不会把之前的内容覆盖
#         f.writelines(["test name: " + test_name + "\n",
#                       "test result: " + test_result + "\n" + "\n"])

# def write_result(file_path, pass_num, fail_num):
#     """
#     将通过、失败、超时的数量写入out.txt文件
#     """
#     with open(file_path,'a') as f:
#         f.writelines(["test number : "+"%d\n" % (pass_num + fail_num),
#                       "pass number : "+"%d\n" % pass_num,
#                       "fail number : "+"%d\n" % fail_num])

# def get_current_time( ): #获取系统时间函数，并将返回值作为输出名
#     """
#     获取系统当前时间，并将其作为输出名
#     """
#     curr_time = datetime.datetime.now( )
#     return curr_time.strftime("out_%Y%m%d_%H%M%S.txt")

# if __name__ == "__main__":
#     in_file_path = r"in.txt"            # 输入文件路径
#     out_file_path = r"out.txt"     # 输出文件路径
#     create_folder(out_file_path)  
#     out_file = os.path.join(out_file_path, get_current_time())
#     pass_num, fail_num = 0, 0
#     for test_name, test_command in get_command(in_file_path):
#         test_result = execute_command(test_name, test_command)
#         write_output(out_file, test_name, test_result)
#         if test_result == "pass":
#             pass_num += 1
#         elif test_result == "fail":
#             fail_num += 1
#     write_result(out_file, pass_num, fail_num)

import os
import re

def execute_command(name, cmd):
    with os.popen(cmd) as r:
        text = r.read()
        if "PASS" in text :
            print(name+" "+"pass!")
            return "pass"
        else:
            print(name+" "+"fail!")
            return "fail"

def get_command(file_path): 
    with open(file_path, 'r') as f:
        while True:
            test_name = f.readline().split(":")[-1].strip()
            if not test_name:
                break  # 到达文件末尾时readline获取到的是空字符串
            test_command = f.readline().split(":")[-1].strip() 
            _ = f.readline()  # 取出空行，无作用
            yield test_name, test_command

if __name__ == "__main__":
    in_file_path = r"in.txt"           # 输入文件路径
    for test_name, test_command in get_command(in_file_path):
        execute_command(test_name, test_command)