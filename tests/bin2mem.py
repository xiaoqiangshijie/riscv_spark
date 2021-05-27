# # -*- coding:utf-8 -*-

# import sys
# import os


# def bin2mem(infile, outfile):
#     binfile = open(infile, 'rb')  # 以二进制读模式打开
#     binfile_content = binfile.read(os.path.getsize(infile))  # 根据文件大小一次性读取infile文件
#     memfile = open(outfile, 'w')  # 以非二进制写模式打开

#     b0, b1, b2, b3, index = 0, 0, 0, 0, 0

#     # 每四个元素（类型为整数）为一组，获取一次后放在列表中，然后用bytearray将其转为字节数组
    
#     for b in  binfile_content:
#         if index == 0:
#             b0 = b
#             index = index + 1
#         elif index == 1:
#             b1 = b
#             index = index + 1
#         elif index == 2:
#             b2 = b
#             index = index + 1
#         elif index == 3:
#             b3 = b
#             index = 0  # 到了第四个字符后将index设置为0，这样又从第一个if条件开始
#             array = []
#             array.append(b3)
#             array.append(b2)
#             array.append(b1)
#             array.append(b0)
#             memfile.write(bytearray(array).hex() + '\n')  # 转为十六进制形式的字符串，然后写入memfile文件中

#     binfile.close()
#     memfile.close()


# if __name__ == '__main__':
#     bin2mem(sys.argv[1], sys.argv[2])

# -*- coding:utf-8 -*-

import sys
import os


def bin2mem(infile, outfile):
    with open(infile, 'rb') as binfile:  # 以二进制读模式打开
        binfile_content = binfile.read(os.path.getsize(infile))  # 根据文件大小一次性读取infile文件 # bytes型数据
        with open(outfile, 'w') as memfile:  # 以非二进制写模式打开
            for i in range(len(binfile_content) // 4):
                # 转为十六进制形式的字符串，然后写入memfile文件中
                memfile.write(bytearray(binfile_content[i*4:i*4+4][::-1]).hex() + '\n')

if __name__ == '__main__':
    bin2mem(sys.argv[1], sys.argv[2])
