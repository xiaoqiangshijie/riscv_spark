.text
.align 1
.global main
main:


#SLT
 SLT:


li   x4, 0x8000000000000000
li   x5, 0x8000000000000000
slt  x3, x4, x5
li   x6, 0x0
bne  x3, x6, TEST_FAIL

li   x4, 0x8000000000000000
li   x5, 0xaaaaaaaaaaaaaaaa
slt  x3, x4, x5
li   x6, 0x1
bne  x3, x6, TEST_FAIL

li   x4, 0x8000000000000000
li   x5, 0x0000000000000000
slt  x3, x4, x5
li   x6, 0x1
bne  x3, x6, TEST_FAIL

li   x4, 0x8000000000000000
li   x5, 0x5555555555555555
slt  x3, x4, x5
li   x6, 0x1
bne  x3, x6, TEST_FAIL

li   x4, 0x8000000000000000
li   x5, 0x7fffffffffffffff
slt  x3, x4, x5
li   x6, 0x1
bne  x3, x6, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0x8000000000000000
slt  x3, x4, x5
li   x6, 0x0
bne  x3, x6, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0xaaaaaaaaaaaaaaaa
slt  x3, x4, x5
li   x6, 0x0
bne  x3, x6, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0x0000000000000000
slt  x3, x4, x5
li   x6, 0x1
bne  x3, x6, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0x5555555555555555
slt  x3, x4, x5
li   x6, 0x1
bne  x3, x6, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0x7fffffffffffffff
slt  x3, x4, x5
li   x6, 0x1
bne  x3, x6, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0x8000000000000000
slt  x3, x4, x5
li   x6, 0x0
bne  x3, x6, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0xaaaaaaaaaaaaaaaa
slt  x3, x4, x5
li   x6, 0x0
bne  x3, x6, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0x0000000000000000
slt  x3, x4, x5
li   x6, 0x0
bne  x3, x6, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0x5555555555555555
slt  x3, x4, x5
li   x6, 0x1
bne  x3, x6, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0x7fffffffffffffff
slt  x3, x4, x5
li   x6, 0x1
bne  x3, x6, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0x8000000000000000
slt  x3, x4, x5
li   x6, 0x0
bne  x3, x6, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0xaaaaaaaaaaaaaaaa
slt  x3, x4, x5
li   x6, 0x0
bne  x3, x6, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0x0000000000000000
slt  x3, x4, x5
li   x6, 0x0
bne  x3, x6, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0x5555555555555555
slt  x3, x4, x5
li   x6, 0x0
bne  x3, x6, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0x7fffffffffffffff
slt  x3, x4, x5
li   x6, 0x1
bne  x3, x6, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0x8000000000000000
slt  x3, x4, x5
li   x6, 0x0
bne  x3, x6, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0xaaaaaaaaaaaaaaaa
slt  x3, x4, x5
li   x6, 0x0
bne  x3, x6, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0x0000000000000000
slt  x3, x4, x5
li   x6, 0x0
bne  x3, x6, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0x5555555555555555
slt  x3, x4, x5
li   x6, 0x0
bne  x3, x6, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0x7fffffffffffffff
slt  x3, x4, x5
li   x6, 0x0
bne  x3, x6, TEST_FAIL


#SLTI
SLTI:


li   x4, 0x8000000000000000
slti x3, x4, -2048
li   x6, 0x1
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
slti x3, x4, -1366
li   x6, 0x1
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
slti x3, x4, 0x000
li   x6, 0x1
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
slti x3, x4, 0x555
li   x6, 0x1
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
slti x3, x4, 0x7ff
li   x6, 0x1
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
slti x3, x4, -2048
li   x6, 0x1
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
slti x3, x4, -1366
li   x6, 0x1
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
slti x3, x4, 0x000
li   x6, 0x1
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
slti x3, x4, 0x555
li   x6, 0x1
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
slti x3, x4, 0x7ff
li   x6, 0x1
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
slti x3, x4, -2048
li   x6, 0x0
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
slti x3, x4, -1366
li   x6, 0x0
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
slti x3, x4, 0x000
li   x6, 0x0
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
slti x3, x4, 0x555
li   x6, 0x1
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
slti x3, x4, 0x7ff
li   x6, 0x1
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
slti x3, x4, -2048
li   x6, 0x0
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
slti x3, x4, -1366
li   x6, 0x0
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
slti x3, x4, 0x000
li   x6, 0x0
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
slti x3, x4, 0x555
li   x6, 0x0
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
slti x3, x4, 0x7ff
li   x6, 0x0
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
slti x3, x4, -2048
li   x6, 0x0
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
slti x3, x4, -1366
li   x6, 0x0
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
slti x3, x4, 0x000
li   x6, 0x0
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
slti x3, x4, 0x555
li   x6, 0x0
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
slti x3, x4, 0x7ff
li   x6, 0x0
bne  x6, x3, TEST_FAIL

#SLTU
 SLTU:


li   x4, 0x8000000000000000
li   x5, 0x8000000000000000
sltu  x3, x4, x5
li   x6, 0x0
bne  x3, x6, TEST_FAIL

li   x4, 0x8000000000000000
li   x5, 0xaaaaaaaaaaaaaaaa
sltu  x3, x4, x5
li   x6, 0x1
bne  x3, x6, TEST_FAIL

li   x4, 0x8000000000000000
li   x5, 0x0000000000000000
sltu  x3, x4, x5
li   x6, 0x0
bne  x3, x6, TEST_FAIL

li   x4, 0x8000000000000000
li   x5, 0x5555555555555555
sltu  x3, x4, x5
li   x6, 0x0
bne  x3, x6, TEST_FAIL

li   x4, 0x8000000000000000
li   x5, 0x7fffffffffffffff
sltu  x3, x4, x5
li   x6, 0x0
bne  x3, x6, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0x8000000000000000
sltu  x3, x4, x5
li   x6, 0x0
bne  x3, x6, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0xaaaaaaaaaaaaaaaa
sltu  x3, x4, x5
li   x6, 0x0
bne  x3, x6, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0x0000000000000000
sltu  x3, x4, x5
li   x6, 0x0
bne  x3, x6, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0x5555555555555555
sltu  x3, x4, x5
li   x6, 0x0
bne  x3, x6, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0x7fffffffffffffff
sltu  x3, x4, x5
li   x6, 0x0
bne  x3, x6, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0x8000000000000000
sltu  x3, x4, x5
li   x6, 0x1
bne  x3, x6, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0xaaaaaaaaaaaaaaaa
sltu  x3, x4, x5
li   x6, 0x1
bne  x3, x6, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0x0000000000000000
sltu  x3, x4, x5
li   x6, 0x0
bne  x3, x6, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0x5555555555555555
sltu  x3, x4, x5
li   x6, 0x1
bne  x3, x6, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0x7fffffffffffffff
sltu  x3, x4, x5
li   x6, 0x1
bne  x3, x6, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0x8000000000000000
slt  x3, x4, x5
li   x6, 0x0
bne  x3, x6, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0xaaaaaaaaaaaaaaaa
sltu  x3, x4, x5
li   x6, 0x1
bne  x3, x6, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0x0000000000000000
sltu  x3, x4, x5
li   x6, 0x0
bne  x3, x6, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0x5555555555555555
sltu  x3, x4, x5
li   x6, 0x0
bne  x3, x6, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0x7fffffffffffffff
sltu  x3, x4, x5
li   x6, 0x1
bne  x3, x6, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0x8000000000000000
sltu  x3, x4, x5
li   x6, 0x1
bne  x3, x6, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0xaaaaaaaaaaaaaaaa
sltu  x3, x4, x5
li   x6, 0x1
bne  x3, x6, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0x0000000000000000
sltu  x3, x4, x5
li   x6, 0x0
bne  x3, x6, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0x5555555555555555
sltu  x3, x4, x5
li   x6, 0x0
bne  x3, x6, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0x7fffffffffffffff
sltu  x3, x4, x5
li   x6, 0x0
bne  x3, x6, TEST_FAIL


#SLTUI
SLTUI:


li   x4, 0x8000000000000000
sltiu x3, x4, -2048
li   x6, 0x1
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
sltiu x3, x4, -1366
li   x6, 0x1
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
sltiu x3, x4, 0x000
li   x6, 0x0
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
sltiu x3, x4, 0x555
li   x6, 0x0
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
sltiu x3, x4, 0x7ff
li   x6, 0x0
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
sltiu x3, x4, -2048
li   x6, 0x1
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
sltiu x3, x4, -1366
li   x6, 0x1
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
sltiu x3, x4, 0x000
li   x6, 0x0
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
sltiu x3, x4, 0x555
li   x6, 0x0
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
sltiu x3, x4, 0x7ff
li   x6, 0x0
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
sltiu x3, x4, -2048
li   x6, 0x1
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
sltiu x3, x4, -1366
li   x6, 0x1
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
sltiu x3, x4, 0x000
li   x6, 0x0
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
sltiu x3, x4, 0x555
li   x6, 0x1
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
sltiu x3, x4, 0x7ff
li   x6, 0x1
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
sltiu x3, x4, -2048
li   x6, 0x1
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
sltiu x3, x4, -1366
li   x6, 0x1
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
sltiu x3, x4, 0x000
li   x6, 0x0
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
sltiu x3, x4, 0x555
li   x6, 0x0
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
sltiu x3, x4, 0x7ff
li   x6, 0x0
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
sltiu x3, x4, -2048
li   x6, 0x1
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
sltiu x3, x4, -1366
li   x6, 0x1
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
sltiu x3, x4, 0x000
li   x6, 0x0
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
sltiu x3, x4, 0x555
li   x6, 0x0
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
sltiu x3, x4, 0x7ff
li   x6, 0x0
bne  x6, x3, TEST_FAIL


#---------------------------------------#
#exit
#---------------------------------------#
TEST_PASS:
la  x1, __exit 
jr  x1


#---------------------------------------#
#fail
#---------------------------------------#
TEST_FAIL:
la  x1, __fail
jr x1
