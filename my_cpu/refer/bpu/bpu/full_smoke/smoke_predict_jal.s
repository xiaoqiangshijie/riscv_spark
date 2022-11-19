.text
.align 1
.global main
main:

li x10,0x0000000000000000


#LABLE
LABLE:

nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop


#CALL
CALL:

jal x1,RTE                        #x1 is A addr  : call 

A:
jal x0,END                        #j  :ret addr


#RET
RTE:

nop
nop
nop
nop
nop

jalr  x0,x1,0x0                  #jump to A   



#END
END:

addi x10,x10,0x0000000000000001
li   x11,0x0000000000000003
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
