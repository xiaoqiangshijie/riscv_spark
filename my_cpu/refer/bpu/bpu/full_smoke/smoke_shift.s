.text
.align 1
.global main
main:

#SLL
SLL:


li   x4, 0x8000000000000000
li   x5, 0x8000000000000000
sll  x3,x4,x5
li   x6, 0x8000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
li   x5, 0xaaaaaaaaaaaaaaaa
sll  x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
li   x5, 0x0000000000000000
sll  x3,x4,x5
li   x6, 0x8000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
li   x5, 0x5555555555555555
sll  x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
li   x5, 0x7fffffffffffffff
sll  x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0x8000000000000000
sll  x3,x4,x5
li   x6, 0xaaaaaaaaaaaaaaaa
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0xaaaaaaaaaaaaaaaa
sll  x3,x4,x5
li   x6, 0xaaaaa80000000000
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0x0000000000000000
sll  x3,x4,x5
li   x6, 0xaaaaaaaaaaaaaaaa
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0x5555555555555555
sll  x3,x4,x5
li   x6, 0x5555555555400000
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0x7fffffffffffffff
sll  x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0x8000000000000000
sll  x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0xaaaaaaaaaaaaaaaa
sll  x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0x0000000000000000
sll  x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0x5555555555555555
sll  x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0x7fffffffffffffff
sll  x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0x8000000000000000
sll  x3,x4,x5
li   x6, 0x5555555555555555
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0xaaaaaaaaaaaaaaaa
sll  x3,x4,x5
li   x6, 0x5555540000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0x0000000000000000
sll  x3,x4,x5
li   x6, 0x5555555555555555
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0x5555555555555555
sll  x3,x4,x5
li   x6, 0xaaaaaaaaaaa00000
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0x7fffffffffffffff
sll  x3,x4,x5
li   x6, 0x8000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0x8000000000000000
sll  x3,x4,x5
li   x6, 0x7fffffffffffffff
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0xaaaaaaaaaaaaaaaa
sll  x3,x4,x5
li   x6, 0xfffffc0000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0x0000000000000000
sll  x3,x4,x5
li   x6, 0x7fffffffffffffff
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0x0000000000000000
sll  x3,x4,x5
li   x6, 0x7fffffffffffffff
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0x5555555555555555
sll  x3,x4,x5
li   x6, 0xffffffffffe00000
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0x7fffffffffffffff
sll  x3,x4,x5
li   x6, 0x8000000000000000
bne  x6, x3, TEST_FAIL


#SLLI
SLLI:


li   x4, 0x8000000000000000
slli x3, x4, 0x20
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
slli x3, x4, 0x2a
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
slli x3, x4, 0x0
li   x6, 0x8000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
slli x3, x4, 0x15
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
slli x3, x4, 0x1f
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
slli x3, x4, 0x20
li   x6, 0xaaaaaaaa00000000
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
slli x3, x4, 0x2a
li   x6, 0xaaaaa80000000000
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
slli x3, x4, 0x0
li   x6, 0xaaaaaaaaaaaaaaaa
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
slli x3, x4, 0x15
li   x6, 0x5555555555400000
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
slli x3, x4, 0x1f
li   x6, 0x5555555500000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
slli x3, x4, 0x20
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
slli x3, x4, 0x2a
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
slli x3, x4, 0x0
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
slli x3, x4, 0x15
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
slli x3, x4, 0x1f
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
slli x3, x4, 0x20
li   x6, 0x5555555500000000
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
slli x3, x4, 0x2a
li   x6, 0x5555540000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
slli x3, x4, 0x0
li   x6, 0x5555555555555555
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
slli x3, x4, 0x15
li   x6, 0xaaaaaaaaaaa00000
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
slli x3, x4, 0x1f
li   x6, 0xaaaaaaaa80000000
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
slli x3, x4, 0x20
li   x6, 0xffffffff00000000
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
slli x3, x4, 0x2a
li   x6, 0xfffffc0000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
slli x3, x4, 0x0
li   x6, 0x7fffffffffffffff
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
slli x3, x4, 0x15
li   x6, 0xffffffffffe00000
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
slli x3, x4, 0x1f
li   x6, 0xffffffff80000000
bne  x6, x3, TEST_FAIL


#SRL
SRL:


li   x4, 0x8000000000000000
li   x5, 0x8000000000000000
srl  x3,x4,x5
li   x6, 0x8000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
li   x5, 0xaaaaaaaaaaaaaaaa
srl  x3,x4,x5
li   x6, 0x0000000000200000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
li   x5, 0x0000000000000000
srl  x3,x4,x5
li   x6, 0x8000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
li   x5, 0x5555555555555555
srl  x3,x4,x5
li   x6, 0x0000040000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
li   x5, 0x7fffffffffffffff
srl  x3,x4,x5
li   x6, 0x0000000000000001
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0x8000000000000000
srl  x3,x4,x5
li   x6, 0xaaaaaaaaaaaaaaaa
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0xaaaaaaaaaaaaaaaa
srl  x3,x4,x5
li   x6, 0x00000000002aaaaa
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0x0000000000000000
srl  x3,x4,x5
li   x6, 0xaaaaaaaaaaaaaaaa
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0x5555555555555555
srl  x3,x4,x5
li   x6, 0x0000055555555555
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0x7fffffffffffffff
srl  x3,x4,x5
li   x6, 0x0000000000000001
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0x8000000000000000
srl  x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL


li   x4, 0x0000000000000000
li   x5, 0xaaaaaaaaaaaaaaaa
srl  x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0x0000000000000000
srl  x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0x5555555555555555
srl  x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0x7fffffffffffffff
srl  x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0x8000000000000000
srl  x3,x4,x5
li   x6, 0x5555555555555555
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0xaaaaaaaaaaaaaaaa
srl  x3,x4,x5
li   x6, 0x0000000000155555
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0x0000000000000000
srl  x3,x4,x5
li   x6, 0x5555555555555555
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0x5555555555555555
srl  x3,x4,x5
li   x6, 0x000002aaaaaaaaaa
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0x7fffffffffffffff
srl  x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0x8000000000000000
srl  x3,x4,x5
li   x6, 0x7fffffffffffffff
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0xaaaaaaaaaaaaaaaa
srl  x3,x4,x5
li   x6, 0x00000000001fffff
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0x0000000000000000
srl  x3,x4,x5
li   x6, 0x7fffffffffffffff
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0x5555555555555555
srl  x3,x4,x5
li   x6, 0x000003ffffffffff
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0x7fffffffffffffff
srl  x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL


#SRLI
SRLI:


li   x4, 0x8000000000000000
srli x3, x4, 0x20
li   x6, 0x0000000080000000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
srli x3, x4, 0x2a
li   x6, 0x0000000000200000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
srli x3, x4, 0x0
li   x6, 0x8000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
srli x3, x4, 0x15
li   x6, 0x0000040000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
srli x3, x4, 0x1f
li   x6, 0x0000000100000000
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
srli x3, x4, 0x20
li   x6, 0x00000000aaaaaaaa
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
srli x3, x4, 0x2a
li   x6, 0x00000000002aaaaa
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
srli x3, x4, 0x0
li   x6, 0xaaaaaaaaaaaaaaaa
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
srli x3, x4, 0x15
li   x6, 0x0000055555555555
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
srli x3, x4, 0x1f
li   x6, 0x0000000155555555
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
srli x3, x4, 0x20
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
srli x3, x4, 0x2a
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
srli x3, x4, 0x0
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
srli x3, x4, 0x15
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
srli x3, x4, 0x1f
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
srli x3, x4, 0x20
li   x6, 0x0000000055555555
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
srli x3, x4, 0x2a
li   x6, 0x0000000000155555
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
srli x3, x4, 0x0
li   x6, 0x5555555555555555
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
srli x3, x4, 0x15
li   x6, 0x000002aaaaaaaaaa
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
srli x3, x4, 0x1f
li   x6, 0x00000000aaaaaaaa
bne  x6, x3, TEST_FAIL


li   x4, 0x7fffffffffffffff
srli x3, x4, 0x20
li   x6, 0x000000007fffffff
bne  x6, x3, TEST_FAIL


li   x4, 0x7fffffffffffffff
srli x3, x4, 0x2a
li   x6, 0x00000000001fffff
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
srli x3, x4, 0x0
li   x6, 0x7fffffffffffffff
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
srli x3, x4, 0x15
li   x6, 0x000003ffffffffff
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
srli x3, x4, 0x1f
li   x6, 0x00000000ffffffff
bne  x6, x3, TEST_FAIL


#SRA
SRA:


li   x4, 0x8000000000000000
li   x5, 0x8000000000000000
sra  x3,x4,x5
li   x6, 0x8000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
li   x5, 0xaaaaaaaaaaaaaaaa
sra  x3,x4,x5
li   x6, 0xffffffffffe00000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
li   x5, 0x0000000000000000
sra  x3,x4,x5
li   x6, 0x8000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
li   x5, 0x5555555555555555
sra  x3,x4,x5
li   x6, 0xfffffc0000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
li   x5, 0x7fffffffffffffff
sra  x3,x4,x5
li   x6, 0xffffffffffffffff
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0x8000000000000000
sra  x3,x4,x5
li   x6, 0xaaaaaaaaaaaaaaaa
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0xaaaaaaaaaaaaaaaa
sra  x3,x4,x5
li   x6, 0xffffffffffeaaaaa
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0x0000000000000000
sra  x3,x4,x5
li   x6, 0xaaaaaaaaaaaaaaaa
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0x5555555555555555
sra  x3,x4,x5
li   x6, 0xfffffd5555555555
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0x7fffffffffffffff
sra  x3,x4,x5
li   x6, 0xffffffffffffffff
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0x8000000000000000
sra  x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0xaaaaaaaaaaaaaaaa
sra  x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0x0000000000000000
sra  x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0x5555555555555555
sra  x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0x7fffffffffffffff
sra  x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0x8000000000000000
sra  x3,x4,x5
li   x6, 0x5555555555555555
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0xaaaaaaaaaaaaaaaa
sra  x3,x4,x5
li   x6, 0x0000000000155555
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0x0000000000000000
sra  x3,x4,x5
li   x6, 0x5555555555555555
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0x5555555555555555
sra  x3,x4,x5
li   x6, 0x000002aaaaaaaaaa
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0x7fffffffffffffff
sra  x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0x8000000000000000
sra  x3,x4,x5
li   x6, 0x7fffffffffffffff
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0xaaaaaaaaaaaaaaaa
sra  x3,x4,x5
li   x6, 0x00000000001fffff
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0x0000000000000000
sra  x3,x4,x5
li   x6, 0x7fffffffffffffff
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0x5555555555555555
sra  x3,x4,x5
li   x6, 0x000003ffffffffff
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0x7fffffffffffffff
sra  x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL


#SRAI
SRAI:


li   x4, 0x8000000000000000
srai x3, x4, 0x20
li   x6, 0xffffffff80000000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
srai x3, x4, 0x2a
li   x6, 0xffffffffffe00000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
srai x3, x4, 0x0
li   x6, 0x8000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
srai x3, x4, 0x15
li   x6, 0xfffffc0000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
srai x3, x4, 0x1f
li   x6, 0xffffffff00000000
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
srai x3, x4, 0x20
li   x6, 0xffffffffaaaaaaaa
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
srai x3, x4, 0x2a
li   x6, 0xffffffffffeaaaaa
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
srai x3, x4, 0x0
li   x6, 0xaaaaaaaaaaaaaaaa
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
srai x3, x4, 0x15
li   x6, 0xfffffd5555555555
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
srai x3, x4, 0x1f
li   x6, 0xffffffff55555555
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
srai x3, x4, 0x20
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
srai x3, x4, 0x2a
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
srai x3, x4, 0x0
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
srai x3, x4, 0x15
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
srai x3, x4, 0x1f
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
srai x3, x4, 0x20
li   x6, 0x0000000055555555
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
srai x3, x4, 0x2a
li   x6, 0x0000000000155555
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
srai x3, x4, 0x0
li   x6, 0x5555555555555555
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
srai x3, x4, 0x15
li   x6, 0x000002aaaaaaaaaa
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
srai x3, x4, 0x1f
li   x6, 0x00000000aaaaaaaa
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
srai x3, x4, 0x20
li   x6, 0x000000007fffffff
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
srai x3, x4, 0x2a
li   x6, 0x00000000001fffff
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
srai x3, x4, 0x0
li   x6, 0x7fffffffffffffff
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
srai x3, x4, 0x15
li   x6, 0x000003ffffffffff
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
srai x3, x4, 0x1f
li   x6, 0x00000000ffffffff
bne  x6, x3, TEST_FAIL


#SLLW
SLLW:


li   x4, 0x8000000000000000
li   x5, 0x8000000000000000
sllw x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
li   x5, 0xaaaaaaaaaaaaaaaa
sllw x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
li   x5, 0x0000000000000000
sllw x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
li   x5, 0x5555555555555555
sllw x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
li   x5, 0x7fffffffffffffff
sllw x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0x8000000000000000
sllw x3,x4,x5
li   x6, 0xffffffffaaaaaaaa
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0xaaaaaaaaaaaaaaaa
sllw x3,x4,x5
li   x6, 0xffffffffaaaaa800
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0x0000000000000000
sllw x3,x4,x5
li   x6, 0xffffffffaaaaaaaa
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0x5555555555555555
sllw x3,x4,x5
li   x6, 0x0000000055400000
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0x7fffffffffffffff
sllw x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0x8000000000000000
sllw x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0xaaaaaaaaaaaaaaaa
sllw x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0x0000000000000000
sllw x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0x5555555555555555
sllw x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0x7fffffffffffffff
sllw x3,x4,x5
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0x8000000000000000
sllw x3,x4,x5
li   x6, 0x0000000055555555
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0xaaaaaaaaaaaaaaaa
sllw x3,x4,x5
li   x6, 0x0000000055555400
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0x0000000000000000
sllw x3,x4,x5
li   x6, 0x0000000055555555
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0x5555555555555555
sllw x3,x4,x5
li   x6, 0xffffffffaaa00000
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0x7fffffffffffffff
sllw x3,x4,x5
li   x6, 0xffffffff80000000
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0x8000000000000000
sllw x3,x4,x5
li   x6, 0xffffffffffffffff
bne  x6, x3, TEST_FAIL

#li   x4, 0x7fffffffffffffff
#li   x5, 0xaaaaaaaaaaaaaaaa
#sllw x3,x4,x5
#li   x6, 0xfffffffffffffc00
#bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0x0000000000000000
sllw x3,x4,x5
li   x6, 0xffffffffffffffff
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0x5555555555555555
sllw x3,x4,x5
li   x6, 0xffffffffffe00000
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0x7fffffffffffffff
sllw x3,x4,x5
li   x6, 0xffffffff80000000
bne  x6, x3, TEST_FAIL


#SLLIW
SLLIW:


#li    x4, 0x8000000000000000
#slliw x3, x4, 0x20
#li    x6, 0x0000000000000000
#bne   x6, x3, TEST_FAIL

li    x4, 0x8000000000000000
slliw x3, x4, 0x0
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x8000000000000000
slliw x3, x4, 0x15
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x8000000000000000
slliw x3, x4, 0x1f
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0xaaaaaaaaaaaaaaaa
slliw x3, x4, 0x0
li    x6, 0xffffffffaaaaaaaa
bne   x6, x3, TEST_FAIL

li    x4, 0xaaaaaaaaaaaaaaaa
slliw x3, x4, 0x15
li    x6, 0x0000000055400000
bne   x6, x3, TEST_FAIL

li    x4, 0xaaaaaaaaaaaaaaaa
slliw x3, x4, 0x1f
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x0000000000000000
slliw x3, x4, 0x0
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x0000000000000000
slliw x3, x4, 0x15
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x0000000000000000
slliw x3, x4, 0x1f
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x5555555555555555
slliw x3, x4, 0x0
li    x6, 0x0000000055555555
bne   x6, x3, TEST_FAIL

li    x4, 0x5555555555555555
slliw x3, x4, 0x15
li    x6, 0xffffffffaaa00000
bne   x6, x3, TEST_FAIL

li    x4, 0x5555555555555555
slliw x3, x4, 0x1f
li    x6, 0xffffffff80000000
bne   x6, x3, TEST_FAIL

li    x4, 0x7fffffffffffffff
slliw x3, x4, 0x0
li    x6, 0xffffffffffffffff
bne   x6, x3, TEST_FAIL

li    x4, 0x7fffffffffffffff
slliw x3, x4, 0x15
li    x6, 0xffffffffffe00000
bne   x6, x3, TEST_FAIL


#SRLW
SRLW:


li    x4, 0x8000000000000000
li    x5, 0x8000000000000000
srlw  x3,x4,x5
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x8000000000000000
li    x5, 0xaaaaaaaaaaaaaaaa
srlw  x3,x4,x5
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x8000000000000000
li    x5, 0x0000000000000000
srlw  x3,x4,x5
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x8000000000000000
li    x5, 0x5555555555555555
srlw  x3,x4,x5
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x8000000000000000
li    x5, 0x7fffffffffffffff
srlw  x3,x4,x5
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0xaaaaaaaaaaaaaaaa
li    x5, 0x8000000000000000
srlw  x3,x4,x5
li    x6, 0xffffffffaaaaaaaa
bne   x6, x3, TEST_FAIL

li    x4, 0xaaaaaaaaaaaaaaaa
li    x5, 0xaaaaaaaaaaaaaaaa
srlw  x3,x4,x5
li    x6, 0x00000000002aaaaa
bne   x6, x3, TEST_FAIL

li    x4, 0xaaaaaaaaaaaaaaaa
li    x5, 0x0000000000000000
srlw  x3,x4,x5
li    x6, 0xffffffffaaaaaaaa
bne   x6, x3, TEST_FAIL

li    x4, 0xaaaaaaaaaaaaaaaa
li    x5, 0x5555555555555555
srlw  x3,x4,x5
li    x6, 0x0000000000000555
bne   x6, x3, TEST_FAIL

li    x4, 0xaaaaaaaaaaaaaaaa
li    x5, 0x7fffffffffffffff
srlw  x3,x4,x5
li    x6, 0x0000000000000001
bne   x6, x3, TEST_FAIL

li    x4, 0x0000000000000000
li    x5, 0x8000000000000000
srlw  x3,x4,x5
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x0000000000000000
li    x5, 0xaaaaaaaaaaaaaaaa
srlw  x3,x4,x5
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x0000000000000000
li    x5, 0x0000000000000000
srlw  x3,x4,x5
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x0000000000000000
li    x5, 0x5555555555555555
srlw  x3,x4,x5
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x0000000000000000
li    x5, 0x7fffffffffffffff
srlw  x3,x4,x5
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x5555555555555555
li    x5, 0x8000000000000000
srlw  x3,x4,x5
li    x6, 0x0000000055555555
bne   x6, x3, TEST_FAIL

li    x4, 0x5555555555555555
li    x5, 0xaaaaaaaaaaaaaaaa
srlw  x3,x4,x5
li    x6, 0x0000000000155555
bne   x6, x3, TEST_FAIL

li    x4, 0x5555555555555555
li    x5, 0x0000000000000000
srlw  x3,x4,x5
li    x6, 0x0000000055555555
bne   x6, x3, TEST_FAIL

li    x4, 0x5555555555555555
li    x5, 0x5555555555555555
srlw  x3,x4,x5
li    x6, 0x00000000000002aa
bne   x6, x3, TEST_FAIL

li    x4, 0x5555555555555555
li    x5, 0x7fffffffffffffff
srlw  x3,x4,x5
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x7fffffffffffffff
li    x5, 0x8000000000000000
srlw  x3,x4,x5
li    x6, 0xffffffffffffffff
bne   x6, x3, TEST_FAIL

li    x4, 0x7fffffffffffffff
li    x5, 0xaaaaaaaaaaaaaaaa
srlw  x3,x4,x5
li    x6, 0x00000000003fffff
bne   x6, x3, TEST_FAIL

li    x4, 0x7fffffffffffffff
li    x5, 0x0000000000000000
srlw  x3,x4,x5
li    x6, 0xffffffffffffffff
bne   x6, x3, TEST_FAIL

li    x4, 0x7fffffffffffffff
li    x5, 0x5555555555555555
srlw  x3,x4,x5
li    x6, 0x00000000000007ff
bne   x6, x3, TEST_FAIL

li    x4, 0x7fffffffffffffff
li    x5, 0x7fffffffffffffff
srlw  x3,x4,x5
li    x6, 0x0000000000000001
bne   x6, x3, TEST_FAIL


#SRLIW
SRLIW:


#li    x4, 0x8000000000000000
#srliw x3, x4, 0x20
#li    x6, 0x0000000000000000
#bne   x6, x3, TEST_FAIL

li    x4, 0x8000000000000000
srliw x3, x4, 0x0
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x8000000000000000
srliw x3, x4, 0x15
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x8000000000000000
srliw x3, x4, 0x1f
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0xaaaaaaaaaaaaaaaa
srliw x3, x4, 0x0
li    x6, 0xffffffffaaaaaaaa
bne   x6, x3, TEST_FAIL

li    x4, 0xaaaaaaaaaaaaaaaa
srliw x3, x4, 0x15
li    x6, 0x0000000000000555
bne   x6, x3, TEST_FAIL

li    x4, 0xaaaaaaaaaaaaaaaa
srliw x3, x4, 0x1f
li    x6, 0x0000000000000001
bne   x6, x3, TEST_FAIL

li    x4, 0x0000000000000000
srliw x3, x4, 0x0
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x0000000000000000
srliw x3, x4, 0x15
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x0000000000000000
srliw x3, x4, 0x1f
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x5555555555555555
srliw x3, x4, 0x0
li    x6, 0x0000000055555555
bne   x6, x3, TEST_FAIL

li    x4, 0x5555555555555555
srliw x3, x4, 0x15
li    x6, 0x00000000000002aa
bne   x6, x3, TEST_FAIL

li    x4, 0x5555555555555555
srliw x3, x4, 0x1f
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x7fffffffffffffff
srliw x3, x4, 0x0
li    x6, 0xffffffffffffffff
bne   x6, x3, TEST_FAIL

li    x4, 0x7fffffffffffffff
srliw x3, x4, 0x15
li    x6, 0x00000000000007ff
bne   x6, x3, TEST_FAIL

li    x4, 0x7fffffffffffffff
srliw x3, x4, 0x1f
li    x6, 0x0000000000000001
bne   x6, x3, TEST_FAIL


#SRAW
SRAW:


li    x4, 0x8000000000000000
li    x5, 0x8000000000000000
sraw  x3,x4,x5
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x8000000000000000
li    x5, 0xaaaaaaaaaaaaaaaa
sraw  x3,x4,x5
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x8000000000000000
li    x5, 0x0000000000000000
sraw  x3,x4,x5
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x8000000000000000
li    x5, 0x0000000000000000
sraw  x3,x4,x5
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x8000000000000000
li    x5, 0x5555555555555555
sraw  x3,x4,x5
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x8000000000000000
li    x5, 0x7fffffffffffffff
sraw  x3,x4,x5
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0xaaaaaaaaaaaaaaaa
li    x5, 0x8000000000000000
sraw  x3,x4,x5
li    x6, 0xffffffffaaaaaaaa
bne   x6, x3, TEST_FAIL

li    x4, 0xaaaaaaaaaaaaaaaa
li    x5, 0xaaaaaaaaaaaaaaaa
sraw  x3,x4,x5
li    x6, 0xffffffffffeaaaaa
bne   x6, x3, TEST_FAIL

li    x4, 0xaaaaaaaaaaaaaaaa
li    x5, 0x0000000000000000
sraw  x3,x4,x5
li    x6, 0xffffffffaaaaaaaa
bne   x6, x3, TEST_FAIL

li    x4, 0xaaaaaaaaaaaaaaaa
li    x5, 0x5555555555555555
sraw  x3,x4,x5
li    x6, 0xfffffffffffffd55
bne   x6, x3, TEST_FAIL

li    x4, 0xaaaaaaaaaaaaaaaa
li    x5, 0x7fffffffffffffff
sraw  x3,x4,x5
li    x6, 0xffffffffffffffff
bne   x6, x3, TEST_FAIL

li    x4, 0x0000000000000000
li    x5, 0x8000000000000000
sraw  x3,x4,x5
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x0000000000000000
li    x5, 0xaaaaaaaaaaaaaaaa
sraw  x3,x4,x5
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x0000000000000000
li    x5, 0x0000000000000000
sraw  x3,x4,x5
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x0000000000000000
li    x5, 0x5555555555555555
sraw  x3,x4,x5
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x0000000000000000
li    x5, 0x7fffffffffffffff
sraw  x3,x4,x5
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x5555555555555555
li    x5, 0x8000000000000000
sraw  x3,x4,x5
li    x6, 0x0000000055555555
bne   x6, x3, TEST_FAIL

li    x4, 0x5555555555555555
li    x5, 0xaaaaaaaaaaaaaaaa
sraw  x3,x4,x5
li    x6, 0x0000000000155555
bne   x6, x3, TEST_FAIL

li    x4, 0x5555555555555555
li    x5, 0x0000000000000000
sraw  x3,x4,x5
li    x6, 0x0000000055555555
bne   x6, x3, TEST_FAIL

li    x4, 0x5555555555555555
li    x5, 0x5555555555555555
sraw  x3,x4,x5
li    x6, 0x00000000000002aa
bne   x6, x3, TEST_FAIL

li    x4, 0x5555555555555555
li    x5, 0x7fffffffffffffff
sraw  x3,x4,x5
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x7fffffffffffffff
li    x5, 0x8000000000000000
sraw  x3,x4,x5
li    x6, 0xffffffffffffffff
bne   x6, x3, TEST_FAIL

li    x4, 0x7fffffffffffffff
li    x5, 0xaaaaaaaaaaaaaaaa
sraw  x3,x4,x5
li    x6, 0xffffffffffffffff
bne   x6, x3, TEST_FAIL

li    x4, 0x7fffffffffffffff
li    x5, 0x0000000000000000
sraw  x3,x4,x5
li    x6, 0xffffffffffffffff
bne   x6, x3, TEST_FAIL

li    x4, 0x7fffffffffffffff
li    x5, 0x5555555555555555
sraw  x3,x4,x5
li    x6, 0xffffffffffffffff
bne   x6, x3, TEST_FAIL

li    x4, 0x7fffffffffffffff
li    x5, 0x7fffffffffffffff
sraw  x3,x4,x5
li    x6, 0xffffffffffffffff
bne   x6, x3, TEST_FAIL


#SRAIW
SRAIW:


#li    x4, 0x8000000000000000
#sraiw x3, x4, 0x20
#li    x6, 0x0000000000000000
#bne   x6, x3, TEST_FAIL

li    x4, 0x8000000000000000
sraiw x3, x4, 0x0
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x8000000000000000
sraiw x3, x4, 0x15
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x8000000000000000
sraiw x3, x4, 0x1f
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0xaaaaaaaaaaaaaaaa
sraiw x3, x4, 0x0
li    x6, 0xffffffffaaaaaaaa
bne   x6, x3, TEST_FAIL

li    x4, 0xaaaaaaaaaaaaaaaa
sraiw x3, x4, 0x15
li    x6, 0xfffffffffffffd55
bne   x6, x3, TEST_FAIL

li    x4, 0xaaaaaaaaaaaaaaaa
sraiw x3, x4, 0x1f
li    x6, 0xffffffffffffffff
bne   x6, x3, TEST_FAIL

li    x4, 0x0000000000000000
sraiw x3, x4, 0x0
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x0000000000000000
sraiw x3, x4, 0x15
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x0000000000000000
sraiw x3, x4, 0x1f
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x5555555555555555
sraiw x3, x4, 0x0
li    x6, 0x0000000055555555
bne   x6, x3, TEST_FAIL

li    x4, 0x5555555555555555
sraiw x3, x4, 0x15
li    x6, 0x00000000000002aa
bne   x6, x3, TEST_FAIL

li    x4, 0x5555555555555555
sraiw x3, x4, 0x1f
li    x6, 0x0000000000000000
bne   x6, x3, TEST_FAIL

li    x4, 0x7fffffffffffffff
sraiw x3, x4, 0x0
li    x6, 0xffffffffffffffff
bne   x6, x3, TEST_FAIL

li    x4, 0x7fffffffffffffff
sraiw x3, x4, 0x15
li    x6, 0xffffffffffffffff
bne   x6, x3, TEST_FAIL

li    x4, 0x7fffffffffffffff
sraiw x3, x4, 0x1f
li    x6, 0xffffffffffffffff
bne   x6, x3, TEST_FAIL




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









