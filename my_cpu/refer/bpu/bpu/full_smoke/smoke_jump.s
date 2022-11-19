.text
.align 1
.global main
main:



#BEQ
BEQ:

#beq 


li x4,0x8000000000000000
li x5,0xaaaaaaaaaaaaaaaa
beq x4,x5,TEST_FAIL

li x4,0x8000000000000000
li x5,0x0000000000000000
beq x4,x5,TEST_FAIL

li x4,0x8000000000000000
li x5,0x5555555555555555
beq x4,x5,TEST_FAIL

li x4,0x8000000000000000
li x5,0x7fffffffffffffff
beq x4,x5,TEST_FAIL

li x4,0x8000000000000000
li x5,0x8000000000000000
beq x4,x5,BEQ_TWO


#BEQ_TWO
BEQ_TWO:
li x4,0xaaaaaaaaaaaaaaaa
li x5,0x8000000000000000
beq x4,x5,TEST_FAIL

li x4,0xaaaaaaaaaaaaaaaa
li x5,0x0000000000000000
beq x4,x5,TEST_FAIL

li x4,0xaaaaaaaaaaaaaaaa
li x5,0x5555555555555555
beq x4,x5,TEST_FAIL

li x4,0xaaaaaaaaaaaaaaaa
li x5,0x7fffffffffffffff
beq x4,x5,TEST_FAIL

li x4,0xaaaaaaaaaaaaaaaa
li x5,0xaaaaaaaaaaaaaaaa
beq x4,x5,BEQ_THREE


#BEQ_THREE
BEQ_THREE:
li x4,0x0000000000000000
li x5,0x8000000000000000
beq x4,x5,TEST_FAIL

li x4,0x0000000000000000
li x5,0xaaaaaaaaaaaaaaaa
beq x4,x5,TEST_FAIL

li x4,0x0000000000000000
li x5,0x7fffffffffffffff
beq x4,x5,TEST_FAIL

li x4,0x0000000000000000
li x5,0x5555555555555555
beq x4,x5,TEST_FAIL

li x4,0x0000000000000000
li x5,0x0000000000000000
beq x4,x5,BEQ_FOUR


#BEQ_FOUR
BEQ_FOUR:
li x4,0x5555555555555555
li x5,0x8000000000000000
beq x4,x5,TEST_FAIL

li x4,0x5555555555555555
li x5,0xaaaaaaaaaaaaaaaa
beq x4,x5,TEST_FAIL

li x4,0x5555555555555555
li x5,0x7fffffffffffffff
beq x4,x5,TEST_FAIL

li x4,0x5555555555555555
li x5,0x0000000000000000
beq x4,x5,TEST_FAIL

li x4,0x5555555555555555
li x5,0x5555555555555555
beq x4,x5,BEQ_FIVE


#BEQ_FIVE
BEQ_FIVE:


li x4,0x7fffffffffffffff
li x5,0x8000000000000000
beq x4,x5,TEST_FAIL

li x4,0x7fffffffffffffff
li x5,0xaaaaaaaaaaaaaaaa
beq x4,x5,TEST_FAIL

li x4,0x7fffffffffffffff
li x5,0x0000000000000000
beq x4,x5,TEST_FAIL

li x4,0x7fffffffffffffff
li x5,0x5555555555555555
beq x4,x5,TEST_FAIL

li x4,0x7fffffffffffffff
li x5,0x7fffffffffffffff
beq x4,x5,BNE_LABEL


#BNE
BNE_LABEL:
bne x4,x4,TEST_FAIL
bne x0,x4,BLT_LABEL 
beq x0,x0,TEST_FAIL


#BLT
BLT_LABEL:          
  
li x4,0x8000000000000000
li x5,0x8000000000000000
blt x4,x5,TEST_FAIL

li x4,0x8000000000000000
li x5,0xaaaaaaaaaaaaaaaa
blt x4,x5,BLT_1
beq x0,x0,TEST_FAIL

BLT_1:

li x4,0x8000000000000000
li x5,0x0000000000000000
blt x4,x5,BLT_2
beq x0,x0,TEST_FAIL

BLT_2:

li x4,0x8000000000000000
li x5,0x5555555555555555
blt x4,x5,BLT_3
beq x0,x0,TEST_FAIL

BLT_3:

li x4,0x8000000000000000
li x5,0x7fffffffffffffff
blt x4,x5,BLT_4
beq x0,x0,TEST_FAIL

BLT_4:

li x4,0xaaaaaaaaaaaaaaaa
li x5,0x8000000000000000
blt x4,x5,TEST_FAIL

li x4,0xaaaaaaaaaaaaaaaa
li x5,0xaaaaaaaaaaaaaaaa
blt x4,x5,TEST_FAIL

li x4,0xaaaaaaaaaaaaaaaa
li x5,0x0000000000000000
blt x4,x5,BLT_6
beq x0,x0,TEST_FAIL

BLT_6:

li x4,0xaaaaaaaaaaaaaaaa
li x5,0x5555555555555555
blt x4,x5,BLT_7
beq x0,x0,TEST_FAIL

BLT_7:

li x4,0xaaaaaaaaaaaaaaaa
li x5,0x7fffffffffffffff
blt x4,x5,SB_LB
beq x0,x0,TEST_FAIL

BLT_8:

li x4,0x0000000000000000
li x5,0x8000000000000000
blt x4,x5,TEST_FAIL

li x4,0x0000000000000000
li x5,0xaaaaaaaaaaaaaaaa
blt x4,x5,TEST_FAIL

li x4,0x0000000000000000
li x5,0x0000000000000000
blt x4,x5,TEST_FAIL

li x4,0x0000000000000000
li x5,0x5555555555555555
blt x4,x5,BLT_9
beq x0,x0,TEST_FAIL

BLT_9:

li x4,0x0000000000000000
li x5,0x7fffffffffffffff
blt x4,x5,BLT_10
beq x0,x0,TEST_FAIL

BLT_10:

li x4,0x5555555555555555
li x5,0x8000000000000000
blt x4,x5,TEST_FAIL

li x4,0x5555555555555555
li x5,0xaaaaaaaaaaaaaaaa
blt x4,x5,TEST_FAIL

li x4,0x5555555555555555
li x5,0x0000000000000000
blt x4,x5,TEST_FAIL

li x4,0x5555555555555555
li x5,0x5555555555555555
blt x4,x5,TEST_FAIL

li x4,0x5555555555555555
li x5,0x7fffffffffffffff
blt x4,x5,BLT_11
beq x0,x0,TEST_FAIL

BLT_11:

li x4,0x7fffffffffffffff
li x5,0x8000000000000000
blt x4,x5,TEST_FAIL

li x4,0x7fffffffffffffff
li x5,0xaaaaaaaaaaaaaaaa
blt x4,x5,TEST_FAIL

li x4,0x7fffffffffffffff
li x5,0x0000000000000000
blt x4,x5,TEST_FAIL

li x4,0x7fffffffffffffff
li x5,0x5555555555555555
blt x4,x5,TEST_FAIL

li x4,0x7fffffffffffffff
li x5,0x7fffffffffffffff
blt x4,x5,TEST_FAIL

#BLTU
BLTU_LABEL:          
  

li x4,0x8000000000000000
li x5,0x8000000000000000
bltu x4,x5,TEST_FAIL

li x4,0x8000000000000000
li x5,0xaaaaaaaaaaaaaaaa
bltu x4,x5,BLTU_1
beq x0,x0,TEST_FAIL

BLTU_1:

li x4,0x8000000000000000
li x5,0x0000000000000000
bltu x4,x5,TEST_FAIL

li x4,0x8000000000000000
li x5,0x5555555555555555
bltu x4,x5,TEST_FAIL

li x4,0x8000000000000000
li x5,0x7fffffffffffffff
bltu x4,x5,TEST_FAIL

li x4,0xaaaaaaaaaaaaaaaa
li x5,0x8000000000000000
bltu x4,x5,TEST_FAIL

li x4,0xaaaaaaaaaaaaaaaa
li x5,0xaaaaaaaaaaaaaaaa
bltu x4,x5,TEST_FAIL

li x4,0xaaaaaaaaaaaaaaaa
li x5,0x0000000000000000
bltu x4,x5,TEST_FAIL

li x4,0xaaaaaaaaaaaaaaaa
li x5,0x5555555555555555
bltu x4,x5,TEST_FAIL

li x4,0xaaaaaaaaaaaaaaaa
li x5,0x7fffffffffffffff
bltu x4,x5,TEST_FAIL

li x4,0xaaaaaaaaaaaaaaaa
li x5,0x7fffffffffffffff
bltu x4,x5,TEST_FAIL

li x4,0x0000000000000000
li x5,0x8000000000000000
bltu x4,x5,BLTU_2
beq x0,x0,TEST_FAIL

BLTU_2:

li x4,0x0000000000000000
li x5,0xaaaaaaaaaaaaaaaa
bltu x4,x5,BLTU_3
beq x0,x0,TEST_FAIL

BLTU_3:

li x4,0x0000000000000000
li x5,0x0000000000000000
bltu x4,x5,TEST_FAIL

li x4,0x0000000000000000
li x5,0x5555555555555555
bltu x4,x5,BLTU_4
beq x0,x0,TEST_FAIL

BLTU_4:

li x4,0x0000000000000000
li x5,0x7fffffffffffffff
bltu x4,x5,BLTU_5
beq x0,x0,TEST_FAIL

BLTU_5:

li x4,0x5555555555555555
li x5,0x8000000000000000
bltu x4,x5,BLTU_6
beq x0,x0,TEST_FAIL

BLTU_6:

li x4,0x5555555555555555
li x5,0xaaaaaaaaaaaaaaaa
bltu x4,x5,BLTU_7
beq x0,x0,TEST_FAIL

BLTU_7:

li x4,0x5555555555555555
li x5,0x0000000000000000
bltu x4,x5,TEST_FAIL

li x4,0x5555555555555555
li x5,0x5555555555555555
bltu x4,x5,TEST_FAIL

li x4,0x5555555555555555
li x5,0x7fffffffffffffff
bltu x4,x5,BLTU_8
beq x0,x0,TEST_FAIL

BLTU_8:

li x4,0x7fffffffffffffff
li x5,0x8000000000000000
bltu x4,x5,BLTU_9
beq x0,x0,TEST_FAIL

BLTU_9:

li x4,0x7fffffffffffffff
li x5,0xaaaaaaaaaaaaaaaa
bltu x4,x5,BLTU_10
beq x0,x0,TEST_FAIL

BLTU_10:

li x4,0x7fffffffffffffff
li x5,0x0000000000000000
bltu x4,x5,TEST_FAIL

li x4,0x7fffffffffffffff
li x5,0x5555555555555555
bltu x4,x5,TEST_FAIL

li x4,0x7fffffffffffffff
li x5,0x7fffffffffffffff
bltu x4,x5,TEST_FAIL


#BGE_LABLE
BGE_LABLE:


li x4,0x8000000000000000
li x5,0x8000000000000000
bge x4,x5,BGE_1
beq x0,x0,TEST_FAIL

BGE_1:

li x4,0x8000000000000000
li x5,0xaaaaaaaaaaaaaaaa
bge x4,x5,TEST_FAIL

li x4,0x8000000000000000
li x5,0x0000000000000000
bge x4,x5,TEST_FAIL

li x4,0x8000000000000000
li x5,0x5555555555555555
bge x4,x5,TEST_FAIL

li x4,0x8000000000000000
li x5,0x7fffffffffffffff
bge x4,x5,TEST_FAIL

li x4,0xaaaaaaaaaaaaaaaa
li x5,0x8000000000000000
bge x4,x5,BGE_2
beq x0,x0,TEST_FAIL

BGE_2:

li x4,0xaaaaaaaaaaaaaaaa
li x5,0xaaaaaaaaaaaaaaaa
bge x4,x5,BGE_3
beq x0,x0,TEST_FAIL

BGE_3:

li x4,0xaaaaaaaaaaaaaaaa
li x5,0x0000000000000000
bge x4,x5,TEST_FAIL

li x4,0xaaaaaaaaaaaaaaaa
li x5,0x5555555555555555
bge x4,x5,TEST_FAIL

li x4,0xaaaaaaaaaaaaaaaa
li x5,0x7fffffffffffffff
bge x4,x5,TEST_FAIL

li x4,0x0000000000000000
li x5,0x8000000000000000
bge x4,x5,BGE_4
beq x0,x0,TEST_FAIL

BGE_4:

li x4,0x0000000000000000
li x5,0xaaaaaaaaaaaaaaaa
bge x4,x5,BGE_5
beq x0,x0,TEST_FAIL

BGE_5:

li x4,0x0000000000000000
li x5,0x0000000000000000
bge x4,x5,BGE_6
beq x0,x0,TEST_FAIL

BGE_6:

li x4,0x0000000000000000
li x5,0x5555555555555555
bge x4,x5,TEST_FAIL

li x4,0x0000000000000000
li x5,0x7fffffffffffffff
bge x4,x5,TEST_FAIL

li x4,0x5555555555555555
li x5,0x8000000000000000
bge x4,x5,BGE_7
beq x0,x0,TEST_FAIL

BGE_7:

li x4,0x5555555555555555
li x5,0xaaaaaaaaaaaaaaaa
bge x4,x5,BGE_8
beq x0,x0,TEST_FAIL

BGE_8:

li x4,0x5555555555555555
li x5,0x0000000000000000
bge x4,x5,BGE_9
beq x0,x0,TEST_FAIL

BGE_9:

li x4,0x5555555555555555
li x5,0x5555555555555555
bge x4,x5,BGE_10
beq x0,x0,TEST_FAIL

BGE_10:

li x4,0x5555555555555555
li x5,0x7fffffffffffffff
bge x4,x5,TEST_FAIL

li x4,0x7fffffffffffffff
li x5,0x8000000000000000
bge x4,x5,BGE_11
beq x0,x0,TEST_FAIL

BGE_11:

li x4,0x7fffffffffffffff
li x5,0xaaaaaaaaaaaaaaaa
bge x4,x5,BGE_12
beq x0,x0,TEST_FAIL

BGE_12:

li x4,0x7fffffffffffffff
li x5,0x0000000000000000
bge x4,x5,BGE_13
beq x0,x0,TEST_FAIL

BGE_13:

li x4,0x7fffffffffffffff
li x5,0x5555555555555555
bge x4,x5,BGE_14
beq x0,x0,TEST_FAIL

BGE_14:

li x4,0x7fffffffffffffff
li x5,0x7fffffffffffffff
bge x4,x5,BGEU_LABLE
beq x0,x0,TEST_FAIL


#BGEU_LABLE
BGEU_LABLE:


li x4,0x8000000000000000
li x5,0x8000000000000000
bgeu x4,x5,BGEU_1
beq x0,x0,TEST_FAIL

BGEU_1:

li x4,0x8000000000000000
li x5,0xaaaaaaaaaaaaaaaa
bgeu x4,x5,TEST_FAIL

li x4,0x8000000000000000
li x5,0x0000000000000000
bgeu x4,x5,BGEU_2
beq x0,x0,TEST_FAIL

BGEU_2:

li x4,0x8000000000000000
li x5,0x5555555555555555
bgeu x4,x5,BGEU_3
beq x0,x0,TEST_FAIL

BGEU_3:

li x4,0x8000000000000000
li x5,0x7fffffffffffffff
bgeu x4,x5,BGEU_4
beq x0,x0,TEST_FAIL

BGEU_4:

li x4,0xaaaaaaaaaaaaaaaa
li x5,0x8000000000000000
bgeu x4,x5,BGEU_5
beq x0,x0,TEST_FAIL

BGEU_5:

li x4,0xaaaaaaaaaaaaaaaa
li x5,0xaaaaaaaaaaaaaaaa
bgeu x4,x5,BGEU_6
beq x0,x0,TEST_FAIL

BGEU_6:

li x4,0xaaaaaaaaaaaaaaaa
li x5,0x0000000000000000
bgeu x4,x5,BGEU_7
beq x0,x0,TEST_FAIL

BGEU_7:

li x4,0xaaaaaaaaaaaaaaaa
li x5,0x5555555555555555
bgeu x4,x5,BGEU_8
beq x0,x0,TEST_FAIL

BGEU_8:

li x4,0xaaaaaaaaaaaaaaaa
li x5,0x7fffffffffffffff
bgeu x4,x5,BGEU_9
beq x0,x0,TEST_FAIL

BGEU_9:

li x4,0x0000000000000000
li x5,0x8000000000000000
bgeu x4,x5,TEST_FAIL

li x4,0x0000000000000000
li x5,0xaaaaaaaaaaaaaaaa
bgeu x4,x5,TEST_FAIL

li x4,0x0000000000000000
li x5,0x0000000000000000
bgeu x4,x5,BGEU_10
beq x0,x0,TEST_FAIL

BGEU_10:

li x4,0x0000000000000000
li x5,0x5555555555555555
bgeu x4,x5,TEST_FAIL

li x4,0x0000000000000000
li x5,0x7fffffffffffffff
bgeu x4,x5,TEST_FAIL

li x4,0x5555555555555555
li x5,0x8000000000000000
bgeu x4,x5,TEST_FAIL

li x4,0x5555555555555555
li x5,0xaaaaaaaaaaaaaaaa
bgeu x4,x5,TEST_FAIL

li x4,0x5555555555555555
li x5,0x0000000000000000
bgeu x4,x5,BGEU_11
beq x0,x0,TEST_FAIL

BGEU_11:

li x4,0x5555555555555555
li x5,0x5555555555555555
bgeu x4,x5,BGEU_12
beq x0,x0,TEST_FAIL

BGEU_12:

li x4,0x5555555555555555
li x5,0x7fffffffffffffff
bgeu x4,x5,TEST_FAIL

li x4,0x7fffffffffffffff
li x5,0x8000000000000000
bgeu x4,x5,TEST_FAIL

li x4,0x7fffffffffffffff
li x5,0xaaaaaaaaaaaaaaaa
bgeu x4,x5,TEST_FAIL

li x4,0x7fffffffffffffff
li x5,0x0000000000000000
bgeu x4,x5,BGEU_13
beq x0,x0,TEST_FAIL

BGEU_13:

li x4,0x7fffffffffffffff
li x5,0x5555555555555555
bgeu x4,x5,BGEU_14
beq x0,x0,TEST_FAIL

BGEU_14:

li x4,0x7fffffffffffffff
li x5,0x7fffffffffffffff
bgeu x4,x5,SB_LB
beq x0,x0,TEST_FAIL

#JAL_JALI
JAL_JALI:


jal x1,BRANCH_LABEL            #x1 = next pc

A:
jal x0,JREG_LABEL                 #j



BRANCH_LABEL:

#beq 
beq x0,x4,TEST_FAIL
beq x4,x4,J_LABEL 
beq x0,x0,TEST_FAIL     

J_LABEL:
jalr  x1,x1,0x0                  #jump to A

B:
jal x0,SB_LB

JREG_LABEL:
jalr  x0,x1,0x0                 #jr  jump to B











#SB_LB
SB_LB:
#ld   x7, 0x000(x4)

li   x4, 0x0000000000000001  
li   x3, 0x0000000000000001
sb   x3, 0x000(x4)
lb   x6, 0x000(x4)
bne  x3, x6, TEST_FAIL



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

