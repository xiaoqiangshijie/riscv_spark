.text
.align 1
.global main
main:

li x10,0x0000000000000000


#LABLE 001000111-001000111
LABLE:

li x4,0x8000000000000000
li x5,0xaaaaaaaaaaaaaaaa
beq x4,x5,TEST_FAIL

li x4,0x8000000000000000
li x5,0x0000000000000000
beq x4,x5,TEST_FAIL

li x4,0x0
li x5,0x0
beq x4,x5,LABLE1

LABLE1:

li x4,0x8000000000000000
li x5,0xaaaaaaaaaaaaaaaa
beq x4,x5,TEST_FAIL

li x4,0x8000000000000000
li x5,0xaaaaaaaaaaaaaaaa
beq x4,x5,TEST_FAIL

li x4,0x8000000000000000
li x5,0xaaaaaaaaaaaaaaaa
beq x4,x5,TEST_FAIL

li x4,0x0
li x5,0x0
beq x4,x5,LABLE2

LABLE2:

li x4,0x0
li x5,0x0
beq x4,x5,LABLE3

LABLE3:

addi x10,x10,0x0000000000000001
li   x11,0x0000000000000020
bne  x10,x11,LABLE

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


#li   x4,0x0
#li   x5,0x0
#add  x3,x4,x5
#li   x6,0x0
#bne  x3,x6,TEST_FAIL
#
#li   x4,0x0
#li   x5,0x7fffffffffffffff
#add  x3,x4,x5
#li   x6,0x7fffffffffffffff
#bne  x3,x6,TEST_FAIL
#
#li   x4,0x7fffffffffffffff
#li   x5,0x0
#add  x3,x4,x5
#li   x6,0x7fffffffffffffff
#bne  x3,x6,TEST_FAIL
#
#
##SUB
#SUB:
#
#li   x5,0x7fffffffffffffff
#sub  x3,x4,x5
#li   x6,0x0000000000000000
#bne  x3,x6,TEST_FAIL
#
#li   x4,0x7fffffffffffffff
#li   x5,0x0000000000000001
#sub  x3,x4,x5
#li   x6,0x7ffffffffffffffe
#bne  x3,x6,TEST_FAIL
#
#li   x4,0x0000000000000001
#li   x5,0x7fffffffffffffff
#sub  x3,x4,x5
#li   x6,0x8000000000000002
#bne  x3,x6,TEST_FAIL
#
#li   x4,0x7fffffffffffffff
#li   x5,0xffffffffffffffff
#sub  x3,x4,x5
#li   x6,0x8000000000000000
#bne  x3,x6,TEST_FAIL
