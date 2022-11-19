.text
.align 1
.global main
main:


#ADD
ADD:


li   x4,0x0
li   x5,0x0
add  x3,x4,x5
li   x6,0x0
bne  x3,x6,TEST_FAIL

li   x4,0x0
li   x5,0x7fffffffffffffff
add  x3,x4,x5
li   x6,0x7fffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x0
add  x3,x4,x5
li   x6,0x7fffffffffffffff
bne  x3,x6,TEST_FAIL
  
li   x4,0x0
li   x5,0x1
add  x3,x4,x5
li   x6,0x1
bne  x3,x6,TEST_FAIL

li   x4,0x1
li   x5,0x0
add  x3,x4,x5
li   x6,0x1
bne  x3,x6,TEST_FAIL

li   x4,0x0
li   x5,0xffffffffffffffff
add  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0xffffffffffffffff
li   x5,0x0
add  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x0
li   x5,0x8000000000000000
add  x3,x4,x5
li   x6,0x8000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x0
add  x3,x4,x5
li   x6,0x8000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0
li   x5,0x11
add  x3,x4,x5
li   x6,0x11
bne  x3,x6,TEST_FAIL

li   x4,0x11
li   x5,0x0
add  x3,x4,x5
li   x6,0x11
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x7fffffffffffffff
add  x3,x4,x5
li   x6,0xfffffffffffffffe
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x0000000000000001
add  x3,x4,x5
li   x6,0x8000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000001
li   x5,0x7fffffffffffffff
add  x3,x4,x5
li   x6,0x8000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0xffffffffffffffff
add  x3,x4,x5
li   x6,0x7ffffffffffffffe
bne  x3,x6,TEST_FAIL

li   x4,0xffffffffffffffff
li   x5,0x7fffffffffffffff
add  x3,x4,x5
li   x6,0x7ffffffffffffffe
bne  x3,x6,TEST_FAIL

li   x4,0xffffffffffffffff
li   x5,0x7fffffffffffffff
add  x3,x4,x5
li   x6,0x7ffffffffffffffe
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x8000000000000000
add  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x7fffffffffffffff
add  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x0000000000000011
add  x3,x4,x5
li   x6,0x8000000000000010
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000011
li   x5,0x7fffffffffffffff
add  x3,x4,x5
li   x6,0x8000000000000010
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000001
li   x5,0x0000000000000001
add  x3,x4,x5
li   x6,0x0000000000000002
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000001
li   x5,0xffffffffffffffff
add  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0xffffffffffffffff
li   x5,0x0000000000000001
add  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000001
li   x5,0x8000000000000000
add  x3,x4,x5
li   x6,0x8000000000000001
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x0000000000000001
add  x3,x4,x5
li   x6,0x8000000000000001
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000001
li   x5,0x0000000000000011
add  x3,x4,x5
li   x6,0x0000000000000012
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000011
li   x5,0x0000000000000001
add  x3,x4,x5
li   x6,0x0000000000000012
bne  x3,x6,TEST_FAIL

li   x4,0xffffffffffffffff
li   x5,0xffffffffffffffff
add  x3,x4,x5
li   x6,0xfffffffffffffffe
bne  x3,x6,TEST_FAIL

li   x4,0xffffffffffffffff
li   x5,0x8000000000000000
add  x3,x4,x5
li   x6,0x7fffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0xffffffffffffffff
add  x3,x4,x5
li   x6,0x7fffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0xffffffffffffffff
li   x5,0x0000000000000011
add  x3,x4,x5
li   x6,0x0000000000000010
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000011
li   x5,0xffffffffffffffff
add  x3,x4,x5
li   x6,0x0000000000000010
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x8000000000000000
add  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x0000000000000011
add  x3,x4,x5
li   x6,0x8000000000000011
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000011
li   x5,0x8000000000000000
add  x3,x4,x5
li   x6,0x8000000000000011
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x5555555555555555
add  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x8000000000000000
add  x3,x4,x5
li   x6,0xd555555555555555
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x7fffffffffffffff
add  x3,x4,x5
li   x6,0xd555555555555554
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x8000000000000000
add  x3,x4,x5
li   x6,0x2aaaaaaaaaaaaaaa
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x7fffffffffffffff
add  x3,x4,x5
li   x6,0x2aaaaaaaaaaaaaa9
bne  x3,x6,TEST_FAIL

#SUB
SUB:


li   x4,0x0000000000000000
li   x5,0x0000000000000000
sub  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0
li   x5,0x7fffffffffffffff
sub  x3,x4,x5
li   x6,0x8000000000000001
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x0
sub  x3,x4,x5
li   x6,0x7fffffffffffffff
bne  x3,x6,TEST_FAIL
  
li   x4,0x0
li   x5,0x1
sub  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x1
li   x5,0x0
sub  x3,x4,x5
li   x6,0x1
bne  x3,x6,TEST_FAIL

li   x4,0x0
li   x5,0xffffffffffffffff
sub  x3,x4,x5
li   x6,0x0000000000000001
bne  x3,x6,TEST_FAIL

li   x4,0xffffffffffffffff
li   x5,0x0
sub  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x0
li   x5,0x8000000000000000
sub  x3,x4,x5
li   x6,0x8000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x0
sub  x3,x4,x5
li   x6,0x8000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0
li   x5,0x11
sub  x3,x4,x5
li   x6,0xffffffffffffffef
bne  x3,x6,TEST_FAIL

li   x4,0x11
li   x5,0x0
sub  x3,x4,x5
li   x6,0x11
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x7fffffffffffffff
sub  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x0000000000000001
sub  x3,x4,x5
li   x6,0x7ffffffffffffffe
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000001
li   x5,0x7fffffffffffffff
sub  x3,x4,x5
li   x6,0x8000000000000002
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0xffffffffffffffff
sub  x3,x4,x5
li   x6,0x8000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0xffffffffffffffff
li   x5,0x7fffffffffffffff
sub  x3,x4,x5
li   x6,0x8000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x8000000000000000
sub  x3,x4,x5
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x7fffffffffffffff
sub  x3,x4,x5
li   x6,0x0000000000000001
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x0000000000000011
sub  x3,x4,x5
li   x6,0x7fffffffffffffee
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000011
li   x5,0x7fffffffffffffff
sub  x3,x4,x5
li   x6,0x8000000000000012
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000001
li   x5,0x0000000000000001
sub  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000001
li   x5,0xffffffffffffffff
sub  x3,x4,x5
li   x6,0x0000000000000002
bne  x3,x6,TEST_FAIL

li   x4,0xffffffffffffffff
li   x5,0x0000000000000001
sub  x3,x4,x5
li   x6,0xfffffffffffffffe
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000001
li   x5,0x8000000000000000
sub  x3,x4,x5
li   x6,0x8000000000000001
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x0000000000000001
sub  x3,x4,x5
li   x6,0x7fffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000001
li   x5,0x0000000000000011
sub  x3,x4,x5
li   x6,0xfffffffffffffff0
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000011
li   x5,0x0000000000000001
sub  x3,x4,x5
li   x6,0x0000000000000010
bne  x3,x6,TEST_FAIL

li   x4,0xffffffffffffffff
li   x5,0xffffffffffffffff
sub  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0xffffffffffffffff
li   x5,0x8000000000000000
sub  x3,x4,x5
li   x6,0x7fffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0xffffffffffffffff
sub  x3,x4,x5
li   x6,0x8000000000000001
bne  x3,x6,TEST_FAIL

li   x4,0xffffffffffffffff
li   x5,0x0000000000000011
sub  x3,x4,x5
li   x6,0xffffffffffffffee
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000011
li   x5,0xffffffffffffffff
sub  x3,x4,x5
li   x6,0x0000000000000012
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x8000000000000000
sub  x3,x4,x5
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x0000000000000011
sub  x3,x4,x5
li   x6,0x7fffffffffffffef
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000011
li   x5,0x8000000000000000
sub  x3,x4,x5
li   x6,0x8000000000000011
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x5555555555555555
sub  x3,x4,x5
li   x6,0x5555555555555555
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x8000000000000000
sub  x3,x4,x5
li   x6,0xd555555555555555
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
li   x5,0xaaaaaaaaaaaaaaaa
sub  x3,x4,x5
li   x6,0xaaaaaaaaaaaaaaab
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x8000000000000000
sub  x3,x4,x5
li   x6,0x2aaaaaaaaaaaaaaa
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x7fffffffffffffff
sub  x3,x4,x5
li   x6,0x2aaaaaaaaaaaaaab
bne  x3,x6,TEST_FAIL

#ADDI
ADDI:


li   x4,0x0000000000000000
addi x3,x4,0x000
li   x6,0x000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
addi x3,x4,-1
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
addi x3,x4,0x011
li   x6,0x0000000000000011
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
addi x3,x4,0x000
li   x6,0x7fffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
addi x3,x4,-1
li   x6,0x7ffffffffffffffe
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
addi x3,x4,0x011
li   x6,0x8000000000000010
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000001
addi x3,x4,0x000
li   x6,0x0000000000000001
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000001
addi x3,x4,-1
li   x6,0x0000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000001
addi x3,x4,0x011
li   x6,0x0000000000000012
bne  x3,x6,TEST_FAIL

li   x4,0xffffffffffffffff
addi x3,x4,0x000
li   x6,0xffffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0xffffffffffffffff
addi x3,x4,-1
li   x6,0xfffffffffffffffe
bne  x3,x6,TEST_FAIL

li   x4,0xffffffffffffffff
addi x3,x4,0x011
li   x6,0x0000000000000010
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
addi x3,x4,0x000
li   x6,0x8000000000000000
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
addi x3,x4,-1
li   x6,0x7fffffffffffffff
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
addi x3,x4,0x011
li   x6,0x8000000000000011
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000011
addi x3,x4,0x000
li   x6,0x0000000000000011
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000011
addi x3,x4,-0x1
li   x6,0x0000000000000010
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
addi x3,x4,-1536
li   x6,0xfffffffffffffa00
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
addi x3,x4,-0x600
li   x6,0xfffffffffffffa00
bne  x3,x6,TEST_FAIL

li   x4,0x8000000000000000
addi x3,x4,-2048
li   x6,0x7ffffffffffff800
bne  x3,x6,TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
addi x3,x4,-2048
li   x6,0xaaaaaaaaaaaaa2aa
bne  x3,x6,TEST_FAIL

li   x4,0x0000000000000000
addi x3,x4,-2048
li   x6,0xfffffffffffff800
bne  x3,x6,TEST_FAIL

li   x4,0x5555555555555555
addi x3,x4,-2048
li   x6,0x5555555555554d55
bne  x3,x6,TEST_FAIL

li   x4,0x7fffffffffffffff
addi x3,x4,-2048
li   x6,0x7ffffffffffff7ff
bne  x3,x6,TEST_FAIL


#LUI
LUI:


#lui     x3, 0x0           
#li      x6, 0x0
#bne     x6, x3, TEST_FAIL

#ui     x3, 0x7ffff           
#li      x6, 0x7ffff000
#bne     x6, x3, TEST_FAIL

#lui     x3, 0x11111           
#li      x6, 0x11111000
#bne     x6, x3, TEST_FAIL

#lui     x3, 0xfffff           
#li      x6, 0xfffff000
#bne     x6, x3, TEST_FAIL

#lui     x3, 0x000fa           
#li      x6, 0xfa000
#bne     x6, x3, TEST_FAIL


#AUiPC
 AUIPC:


auipc   x4, 0x0
li      x5, 0xa010
add     x3, x4, x5
auipc   x6, 0xa
bne     x3, x6, TEST_FAIL


#ADDW
ADDW:


li    x4,0x8000000000000000
li    x5,0x8000000000000000
addw  x3,x4,x5
li    x6,0x0000000000000000
bne   x3,x6,TEST_FAIL

li    x4,0x8000000000000000
li    x5,0xaaaaaaaaaaaaaaaa
addw  x3,x4,x5
li    x6,0xffffffffaaaaaaaa
bne   x3,x6,TEST_FAIL

li    x4,0x8000000000000000
li    x5,0x0000000000000000
addw  x3,x4,x5
li    x6,0x0000000000000000
bne   x3,x6,TEST_FAIL

li    x4,0x8000000000000000
li    x5,0x5555555555555555
addw  x3,x4,x5
li    x6,0x0000000055555555
bne   x3,x6,TEST_FAIL

li    x4,0x8000000000000000
li    x5,0x7fffffffffffffff
addw  x3,x4,x5
li    x6,0xffffffffffffffff
bne   x3,x6,TEST_FAIL

li    x4,0xaaaaaaaaaaaaaaaa
li    x5,0x8000000000000000
addw  x3,x4,x5
li    x6,0xffffffffaaaaaaaa
bne   x3,x6,TEST_FAIL

li    x4,0xaaaaaaaaaaaaaaaa
li    x5,0xaaaaaaaaaaaaaaaa
addw  x3,x4,x5
li    x6,0x0000000055555554
bne   x3,x6,TEST_FAIL

li    x4,0xaaaaaaaaaaaaaaaa
li    x5,0x0000000000000000
addw  x3,x4,x5
li    x6,0xffffffffaaaaaaaa
bne   x3,x6,TEST_FAIL

li    x4,0xaaaaaaaaaaaaaaaa
li    x5,0x5555555555555555
addw  x3,x4,x5
li    x6,0xffffffffffffffff
bne   x3,x6,TEST_FAIL

li    x4,0xaaaaaaaaaaaaaaaa
li    x5,0x7fffffffffffffff
addw  x3,x4,x5
li    x6,0xffffffffaaaaaaa9
bne   x3,x6,TEST_FAIL

li    x4,0x0000000000000000
li    x5,0x8000000000000000
addw  x3,x4,x5
li    x6,0x0000000000000000
bne   x3,x6,TEST_FAIL

li    x4,0x0000000000000000
li    x5,0xaaaaaaaaaaaaaaaa
addw  x3,x4,x5
li    x6,0xffffffffaaaaaaaa
bne   x3,x6,TEST_FAIL

li    x4,0x0000000000000000
li    x5,0x0000000000000000
addw  x3,x4,x5
li    x6,0x0000000000000000
bne   x3,x6,TEST_FAIL

li    x4,0x0000000000000000
li    x5,0x5555555555555555
addw  x3,x4,x5
li    x6,0x0000000055555555
bne   x3,x6,TEST_FAIL

li    x4,0x0000000000000000
li    x5,0x7fffffffffffffff
addw  x3,x4,x5
li    x6,0xffffffffffffffff
bne   x3,x6,TEST_FAIL

li    x4,0x5555555555555555
li    x5,0x8000000000000000
addw  x3,x4,x5
li    x6,0x0000000055555555
bne   x3,x6,TEST_FAIL

li    x4,0x5555555555555555
li    x5,0xaaaaaaaaaaaaaaaa
addw  x3,x4,x5
li    x6,0xffffffffffffffff
bne   x3,x6,TEST_FAIL

li    x4,0x5555555555555555
li    x5,0x0000000000000000
addw  x3,x4,x5
li    x6,0x0000000055555555
bne   x3,x6,TEST_FAIL

li    x4,0x5555555555555555
li    x5,0x5555555555555555
addw  x3,x4,x5
li    x6,0xffffffffaaaaaaaa
bne   x3,x6,TEST_FAIL

li    x4,0x5555555555555555
li    x5,0x7fffffffffffffff
addw  x3,x4,x5
li    x6,0x0000000055555554
bne   x3,x6,TEST_FAIL

li    x4,0x5555555555555555
li    x5,0x7fffffffffffffff
addw  x3,x4,x5
li    x6,0x0000000055555554
bne   x3,x6,TEST_FAIL

li    x4,0x7fffffffffffffff
li    x5,0x8000000000000000
addw  x3,x4,x5
li    x6,0xffffffffffffffff
bne   x3,x6,TEST_FAIL

li    x4,0x7fffffffffffffff
li    x5,0xaaaaaaaaaaaaaaaa
addw  x3,x4,x5
li    x6,0xffffffffaaaaaaa9
bne   x3,x6,TEST_FAIL

li    x4,0x7fffffffffffffff
li    x5,0x0000000000000000
addw  x3,x4,x5
li    x6,0xffffffffffffffff
bne   x3,x6,TEST_FAIL

li    x4,0x7fffffffffffffff
li    x5,0x5555555555555555
addw  x3,x4,x5
li    x6,0x0000000055555554
bne   x3,x6,TEST_FAIL

li    x4,0x7fffffffffffffff
li    x5,0x7fffffffffffffff
addw  x3,x4,x5
li    x6,0xfffffffffffffffe
bne   x3,x6,TEST_FAIL

#SUBW
SUBW:


li    x4,0x8000000000000000
li    x5,0x8000000000000000
subw  x3,x4,x5
li    x6,0x0000000000000000
bne   x3,x6,TEST_FAIL

li    x4,0x8000000000000000
li    x5,0xaaaaaaaaaaaaaaaa
subw  x3,x4,x5
li    x6,0x0000000055555556
bne   x3,x6,TEST_FAIL

li    x4,0x8000000000000000
li    x5,0x0000000000000000
subw  x3,x4,x5
li    x6,0x0000000000000000
bne   x3,x6,TEST_FAIL

li    x4,0x8000000000000000
li    x5,0x5555555555555555
subw  x3,x4,x5
li    x6,0xffffffffaaaaaaab
bne   x3,x6,TEST_FAIL

li    x4,0x8000000000000000
li    x5,0x7fffffffffffffff
subw  x3,x4,x5
li    x6,0x0000000000000001
bne   x3,x6,TEST_FAIL

li    x4,0xaaaaaaaaaaaaaaaa
li    x5,0x8000000000000000
subw  x3,x4,x5
li    x6,0xffffffffaaaaaaaa
bne   x3,x6,TEST_FAIL

li    x4,0xaaaaaaaaaaaaaaaa
li    x5,0xaaaaaaaaaaaaaaaa
subw  x3,x4,x5
li    x6,0x0000000000000000
bne   x3,x6,TEST_FAIL

li    x4,0xaaaaaaaaaaaaaaaa
li    x5,0x0000000000000000
subw  x3,x4,x5
li    x6,0xffffffffaaaaaaaa
bne   x3,x6,TEST_FAIL

li    x4,0xaaaaaaaaaaaaaaaa
li    x5,0x5555555555555555
subw  x3,x4,x5
li    x6,0x0000000055555555
bne   x3,x6,TEST_FAIL

li    x4,0xaaaaaaaaaaaaaaaa
li    x5,0x7fffffffffffffff
subw  x3,x4,x5
li    x6,0xffffffffaaaaaaab
bne   x3,x6,TEST_FAIL

li    x4,0x0000000000000000
li    x5,0x8000000000000000
subw  x3,x4,x5
li    x6,0x0000000000000000
bne   x3,x6,TEST_FAIL

li    x4,0x0000000000000000
li    x5,0xaaaaaaaaaaaaaaaa
subw  x3,x4,x5
li    x6,0x0000000055555556
bne   x3,x6,TEST_FAIL

li    x4,0x0000000000000000
li    x5,0x0000000000000000
subw  x3,x4,x5
li    x6,0x0000000000000000
bne   x3,x6,TEST_FAIL

li    x4,0x0000000000000000
li    x5,0x5555555555555555
subw  x3,x4,x5
li    x6,0xffffffffaaaaaaab
bne   x3,x6,TEST_FAIL

li    x4,0x0000000000000000
li    x5,0x7fffffffffffffff
subw  x3,x4,x5
li    x6,0x0000000000000001
bne   x3,x6,TEST_FAIL

li    x4,0x5555555555555555
li    x5,0x8000000000000000
subw  x3,x4,x5
li    x6,0x0000000055555555
bne   x3,x6,TEST_FAIL

li    x4,0x5555555555555555
li    x5,0xaaaaaaaaaaaaaaaa
subw  x3,x4,x5
li    x6,0xffffffffaaaaaaab
bne   x3,x6,TEST_FAIL

li    x4,0x5555555555555555
li    x5,0x0000000000000000
subw  x3,x4,x5
li    x6,0x0000000055555555
bne   x3,x6,TEST_FAIL

li    x4,0x5555555555555555
li    x5,0x5555555555555555
subw  x3,x4,x5
li    x6,0x0000000000000000
bne   x3,x6,TEST_FAIL

li    x4,0x5555555555555555
li    x5,0x7fffffffffffffff
subw  x3,x4,x5
li    x6,0x0000000055555556
bne   x3,x6,TEST_FAIL

li    x4,0x7fffffffffffffff
li    x5,0x8000000000000000
subw  x3,x4,x5
li    x6,0xffffffffffffffff
bne   x3,x6,TEST_FAIL

li    x4,0x7fffffffffffffff
li    x5,0xaaaaaaaaaaaaaaaa
subw  x3,x4,x5
li    x6,0x0000000055555555
bne   x3,x6,TEST_FAIL

li    x4,0x7fffffffffffffff
li    x5,0x0000000000000000
subw  x3,x4,x5
li    x6,0xffffffffffffffff
bne   x3,x6,TEST_FAIL

li    x4,0x7fffffffffffffff
li    x5,0x5555555555555555
subw  x3,x4,x5
li    x6,0xffffffffaaaaaaaa
bne   x3,x6,TEST_FAIL

li    x4,0x7fffffffffffffff
li    x5,0x7fffffffffffffff
subw  x3,x4,x5
li    x6,0x0000000000000000
bne   x3,x6,TEST_FAIL

#ADDIW
ADDIW:

li    x4,0x8000000000000000
addiw x3,x4,-2048
li    x6,0xfffffffffffff800
bne   x3,x6,TEST_FAIL

li    x4,0x8000000000000000
addiw x3,x4,-1366
li    x6,0xfffffffffffffaaa
bne   x3,x6,TEST_FAIL

li    x4,0x8000000000000000
addiw x3,x4,0x000
li    x6,0x0000000000000000
bne   x3,x6,TEST_FAIL

li    x4,0x8000000000000000
addiw x3,x4,0x555
li    x6,0x0000000000000555
bne   x3,x6,TEST_FAIL

li    x4,0x8000000000000000
addiw x3,x4,0x7ff
li    x6,0x00000000000007ff
bne   x3,x6,TEST_FAIL

li    x4,0xaaaaaaaaaaaaaaaa
addiw x3,x4,-2048
li    x6,0xffffffffaaaaa2aa
bne   x3,x6,TEST_FAIL

li    x4,0xaaaaaaaaaaaaaaaa
addiw x3,x4,-1366
li    x6,0xffffffffaaaaa554
bne   x3,x6,TEST_FAIL

li    x4,0xaaaaaaaaaaaaaaaa
addiw x3,x4,0x000
li    x6,0xffffffffaaaaaaaa
bne   x3,x6,TEST_FAIL

li    x4,0xaaaaaaaaaaaaaaaa
addiw x3,x4,0x555
li    x6,0xffffffffaaaaafff
bne   x3,x6,TEST_FAIL

li    x4,0xaaaaaaaaaaaaaaaa
addiw x3,x4,0x7ff
li    x6,0xffffffffaaaab2a9
bne   x3,x6,TEST_FAIL

li    x4,0x0000000000000000
addiw x3,x4,-2048
li    x6,0xfffffffffffff800
bne   x3,x6,TEST_FAIL

li    x4,0x0000000000000000
addiw x3,x4,-1366
li    x6,0xfffffffffffffaaa
bne   x3,x6,TEST_FAIL

li    x4,0x0000000000000000
addiw x3,x4,0x000
li    x6,0x0000000000000000
bne   x3,x6,TEST_FAIL

li    x4,0x0000000000000000
addiw x3,x4,0x555
li    x6,0x0000000000000555
bne   x3,x6,TEST_FAIL

li    x4,0x0000000000000000
addiw x3,x4,0x7ff
li    x6,0x00000000000007ff
bne   x3,x6,TEST_FAIL

li    x4,0x5555555555555555
addiw x3,x4,-2048
li    x6,0x0000000055554d55
bne   x3,x6,TEST_FAIL

li    x4,0x5555555555555555
addiw x3,x4,-1366
li    x6,0x0000000055554fff
bne   x3,x6,TEST_FAIL

li    x4,0x5555555555555555
addiw x3,x4,0x000
li    x6,0x0000000055555555
bne   x3,x6,TEST_FAIL

li    x4,0x5555555555555555
addiw x3,x4,0x555
li    x6,0x0000000055555aaa
bne   x3,x6,TEST_FAIL

li    x4,0x5555555555555555
addiw x3,x4,0x7ff
li    x6,0x0000000055555d54
bne   x3,x6,TEST_FAIL

li    x4,0x7fffffffffffffff
addiw x3,x4,-2048
li    x6,0xfffffffffffff7ff
bne   x3,x6,TEST_FAIL

li    x4,0x7fffffffffffffff
addiw x3,x4,-1366
li    x6,0xfffffffffffffaa9
bne   x3,x6,TEST_FAIL

li    x4,0x7fffffffffffffff
addiw x3,x4,0x000
li    x6,0xffffffffffffffff
bne   x3,x6,TEST_FAIL

li    x4,0x7fffffffffffffff
addiw x3,x4,0x555
li    x6,0x0000000000000554
bne   x3,x6,TEST_FAIL

li    x4,0x7fffffffffffffff
addiw x3,x4,0x7ff
li    x6,0x00000000000007fe
bne   x3,x6,TEST_FAIL



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
