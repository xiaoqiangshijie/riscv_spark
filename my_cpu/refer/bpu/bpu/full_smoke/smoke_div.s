.text
.align 1
.global main
main:


#DIV
DIV:

li   x4,0x8000000000000000
li   x5,0xffffffffffffffff
div  x3,x4,x5
li   x6,0x8000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x8000000000000000
div  x3,x4,x5
li   x6,0x0000000000000001
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0xaaaaaaaaaaaaaaaa
div  x3,x4,x5
li   x6,0x0000000000000001
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x0000000000000000
div  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x5555555555555555
div x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x7fffffffffffffff
div  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x8000000000000000
div  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0xaaaaaaaaaaaaaaaa
div  x3,x4,x5
li   x6,0x0000000000000001
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x0000000000000000
div  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x5555555555555555
div  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x7fffffffffffffff
div  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x8000000000000000
div  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0xaaaaaaaaaaaaaaaa
div  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x0000000000000000
div  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x5555555555555555
div  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x7fffffffffffffff
div  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x8000000000000000
div  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0xaaaaaaaaaaaaaaaa
div  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x0000000000000000
div  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x5555555555555555
div  x3,x4,x5
li   x6,0x0000000000000001
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x7fffffffffffffff
div  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x8000000000000000
div  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0xaaaaaaaaaaaaaaaa
div  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x0000000000000000
div  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x5555555555555555
div  x3,x4,x5
li   x6,0x0000000000000001
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x7fffffffffffffff
div  x3,x4,x5
li   x6,0x0000000000000001
bne  x3,x6,TEST_FAIL


#DIVU
DIVU:


li   x4,0x8000000000000000
li   x5,0x8000000000000000
divu  x3,x4,x5
li   x6,0x0000000000000001
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0xaaaaaaaaaaaaaaaa
divu  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x0000000000000000
divu  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x5555555555555555
divu x3,x4,x5
li   x6,0x0000000000000001
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x7fffffffffffffff
divu  x3,x4,x5
li   x6,0x0000000000000001
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x8000000000000000
divu  x3,x4,x5
li   x6,0x0000000000000001
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0xaaaaaaaaaaaaaaaa
divu  x3,x4,x5
li   x6,0x0000000000000001
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x0000000000000000
divu  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x5555555555555555
divu  x3,x4,x5
li   x6,0x0000000000000002
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x7fffffffffffffff
divu  x3,x4,x5
li   x6,0x0000000000000001
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x8000000000000000
divu  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0xaaaaaaaaaaaaaaaa
divu  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x0000000000000000
divu  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x5555555555555555
divu  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x7fffffffffffffff
divu  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x8000000000000000
divu  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0xaaaaaaaaaaaaaaaa
divu  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x0000000000000000
divu  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x5555555555555555
divu  x3,x4,x5
li   x6,0x0000000000000001
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x7fffffffffffffff
divu  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x8000000000000000
divu  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0xaaaaaaaaaaaaaaaa
divu  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x0000000000000000
divu  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x5555555555555555
divu  x3,x4,x5
li   x6,0x0000000000000001
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x7fffffffffffffff
divu x3,x4,x5
li   x6,0x0000000000000001
bne  x3,x6,TEST_FAIL


#REM
REM:

li   x4,0x8000000000000000
li   x5,0xffffffffffffffff
rem  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x8000000000000000
rem  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0xaaaaaaaaaaaaaaaa
rem  x3,x4,x5
li   x6,0xd555555555555556
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x0000000000000000
rem  x3,x4,x5
li   x6,0x8000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x5555555555555555
rem x3,x4,x5
li   x6,0xd555555555555555
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x7fffffffffffffff
rem  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x8000000000000000
rem  x3,x4,x5
li   x6,0xaaaaaaaaaaaaaaaa
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0xaaaaaaaaaaaaaaaa
rem  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x0000000000000000
rem  x3,x4,x5
li   x6,0xaaaaaaaaaaaaaaaa
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x5555555555555555
rem  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x7fffffffffffffff
rem  x3,x4,x5
li   x6,0xaaaaaaaaaaaaaaaa
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x8000000000000000
rem  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0xaaaaaaaaaaaaaaaa
rem  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x0000000000000000
rem  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x5555555555555555
rem  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x7fffffffffffffff
rem  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x8000000000000000
rem  x3,x4,x5
li   x6,0x5555555555555555
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0xaaaaaaaaaaaaaaaa
rem  x3,x4,x5
li   x6,0x5555555555555555
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x0000000000000000
rem  x3,x4,x5
li   x6,0x5555555555555555
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x5555555555555555
rem  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x7fffffffffffffff
rem  x3,x4,x5
li   x6,0x5555555555555555
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x8000000000000000
rem  x3,x4,x5
li   x6,0x7fffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0xaaaaaaaaaaaaaaaa
rem  x3,x4,x5
li   x6,0x2aaaaaaaaaaaaaa9
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x0000000000000000
rem  x3,x4,x5
li   x6,0x7fffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x5555555555555555
rem  x3,x4,x5
li   x6,0x2aaaaaaaaaaaaaaa
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x7fffffffffffffff
rem x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL


#REMU
REMU:


li   x4,0x8000000000000000
li   x5,0x8000000000000000
remu  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0xaaaaaaaaaaaaaaaa
remu  x3,x4,x5
li   x6,0x8000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x0000000000000000
remu  x3,x4,x5
li   x6,0x8000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x5555555555555555
remu x3,x4,x5
li   x6,0x2aaaaaaaaaaaaaab
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x7fffffffffffffff
remu  x3,x4,x5
li   x6,0x0000000000000001
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x8000000000000000
remu  x3,x4,x5
li   x6,0x2aaaaaaaaaaaaaaa
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0xaaaaaaaaaaaaaaaa
remu  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x0000000000000000
remu  x3,x4,x5
li   x6,0xaaaaaaaaaaaaaaaa
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x5555555555555555
remu  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x7fffffffffffffff
remu  x3,x4,x5
li   x6,0x2aaaaaaaaaaaaaab
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x8000000000000000
remu  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0xaaaaaaaaaaaaaaaa
remu  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x0000000000000000
remu  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x5555555555555555
remu  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x7fffffffffffffff
remu  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x8000000000000000
remu  x3,x4,x5
li   x6,0x5555555555555555
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0xaaaaaaaaaaaaaaaa
remu  x3,x4,x5
li   x6,0x5555555555555555
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x0000000000000000
remu  x3,x4,x5
li   x6,0x5555555555555555
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x5555555555555555
remu  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x7fffffffffffffff
remu  x3,x4,x5
li   x6,0x5555555555555555
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x8000000000000000
remu  x3,x4,x5
li   x6,0x7fffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0xaaaaaaaaaaaaaaaa
remu  x3,x4,x5
li   x6,0x7fffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x0000000000000000
remu  x3,x4,x5
li   x6,0x7fffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x5555555555555555
remu  x3,x4,x5
li   x6,0x2aaaaaaaaaaaaaaa
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x7fffffffffffffff
remu x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL


#DIVW
DIVW:


li   x4,0x0000000080000000
li   x5,0xffffffffffffffff
divw  x3,x4,x5
li   x6,0xffffffff80000000
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x8000000000000000
divw  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0xaaaaaaaaaaaaaaaa
divw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x0000000000000000
divw  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x5555555555555555
divw x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x7fffffffffffffff
divw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x8000000000000000
divw  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0xaaaaaaaaaaaaaaaa
divw  x3,x4,x5
li   x6,0x0000000000000001
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x0000000000000000
divw  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x5555555555555555
divw  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x7fffffffffffffff
divw  x3,x4,x5
li   x6,0x0000000055555556
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x8000000000000000
divw  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0xaaaaaaaaaaaaaaaa
divw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x0000000000000000
divw  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x5555555555555555
divw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x7fffffffffffffff
divw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x8000000000000000
divw  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0xaaaaaaaaaaaaaaaa
divw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x0000000000000000
divw  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x5555555555555555
divw  x3,x4,x5
li   x6,0x0000000000000001
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x7fffffffffffffff
divw  x3,x4,x5
li   x6,0xffffffffaaaaaaab
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x8000000000000000
divw  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0xaaaaaaaaaaaaaaaa
divw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x0000000000000000
divw  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x5555555555555555
divw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x7fffffffffffffff
divw  x3,x4,x5
li   x6,0x0000000000000001
bne  x3,x6,TEST_FAIL


#DIVUW
DIVUW:


li   x4,0x8000000000000000
li   x5,0x8000000000000000
divuw  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0xaaaaaaaaaaaaaaaa
divuw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x0000000000000000
divuw  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x5555555555555555
divuw x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x7fffffffffffffff
divuw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x8000000000000000
divuw  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0xaaaaaaaaaaaaaaaa
divuw  x3,x4,x5
li   x6,0x0000000000000001
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x0000000000000000
divuw  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x5555555555555555
divuw  x3,x4,x5
li   x6,0x0000000000000002
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x7fffffffffffffff
divuw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x8000000000000000
divuw  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0xaaaaaaaaaaaaaaaa
divuw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x0000000000000000
divuw  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x5555555555555555
divuw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x7fffffffffffffff
divuw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x8000000000000000
divuw  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0xaaaaaaaaaaaaaaaa
divuw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x0000000000000000
divuw  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x5555555555555555
divuw  x3,x4,x5
li   x6,0x0000000000000001
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x7fffffffffffffff
divuw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x8000000000000000
divuw  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0xaaaaaaaaaaaaaaaa
divuw  x3,x4,x5
li   x6,0x0000000000000001
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x0000000000000000
divuw  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x5555555555555555
divuw  x3,x4,x5
li   x6,0x0000000000000003
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x7fffffffffffffff
divuw  x3,x4,x5
li   x6,0x0000000000000001
bne  x3,x6,TEST_FAIL


#REMW
REMW:

li   x4,0x0000000080000000
li   x5,0xffffffffffffffff
remw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x8000000000000000
remw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0xaaaaaaaaaaaaaaaa
remw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x0000000000000000
remw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x5555555555555555
remw x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x7fffffffffffffff
remw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x8000000000000000
remw  x3,x4,x5
li   x6,0xffffffffaaaaaaaa
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0xaaaaaaaaaaaaaaaa
remw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x0000000000000000
remw  x3,x4,x5
li   x6,0xffffffffaaaaaaaa
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x5555555555555555
remw  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x7fffffffffffffff
remw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x8000000000000000
remw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0xaaaaaaaaaaaaaaaa
remw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x0000000000000000
remw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x5555555555555555
remw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x7fffffffffffffff
remw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x8000000000000000
remw  x3,x4,x5
li   x6,0x0000000055555555
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0xaaaaaaaaaaaaaaaa
remw  x3,x4,x5
li   x6,0x0000000055555555
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x0000000000000000
remw x3,x4,x5
li   x6,0x0000000055555555
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x5555555555555555
remw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x7fffffffffffffff
remw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x8000000000000000
remw  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0xaaaaaaaaaaaaaaaa
remw  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x0000000000000000
remw  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x5555555555555555
remw  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x7fffffffffffffff
remw x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL


#REMUW
REMUW:


li   x4,0x8000000000000000
li   x5,0x8000000000000000
remuw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0xaaaaaaaaaaaaaaaa
remuw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x0000000000000000
remuw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x5555555555555555
remuw x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x7fffffffffffffff
remuw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x8000000000000000
remuw  x3,x4,x5
li   x6,0xffffffffaaaaaaaa
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0xaaaaaaaaaaaaaaaa
remuw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x0000000000000000
remuw  x3,x4,x5
li   x6,0xffffffffaaaaaaaa
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x5555555555555555
remuw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x7fffffffffffffff
remuw  x3,x4,x5
li   x6,0xffffffffaaaaaaaa
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x8000000000000000
remuw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0xaaaaaaaaaaaaaaaa
remuw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x0000000000000000
remuw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x5555555555555555
remuw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x7fffffffffffffff
remuw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x8000000000000000
remuw  x3,x4,x5
li   x6,0x0000000055555555
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0xaaaaaaaaaaaaaaaa
remuw  x3,x4,x5
li   x6,0x0000000055555555
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x0000000000000000
remuw x3,x4,x5
li   x6,0x0000000055555555
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x5555555555555555
remuw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x7fffffffffffffff
remuw  x3,x4,x5
li   x6,0x0000000055555555
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x8000000000000000
remuw  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0xaaaaaaaaaaaaaaaa
remuw  x3,x4,x5
li   x6,0x0000000055555555
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x0000000000000000
remuw  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x5555555555555555
remuw  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x7fffffffffffffff
remuw x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL







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
