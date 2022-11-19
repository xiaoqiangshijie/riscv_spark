.text
.align 1
.global main
main:


#XOR
 XOR:


li     x4, 0x8000000000000000
li     x5, 0x8000000000000000
xor    x3, x4, x5
li     x6, 0x0000000000000000
bne    x3, x6, TEST_FAIL

li     x4, 0x8000000000000000
li     x5, 0xaaaaaaaaaaaaaaaa
xor    x3, x4, x5
li     x6, 0x2aaaaaaaaaaaaaaa
bne    x3, x6, TEST_FAIL

li     x4, 0x8000000000000000
li     x5, 0x0000000000000000
xor    x3, x4, x5
li     x6, 0x8000000000000000
bne    x3, x6, TEST_FAIL

li     x4, 0x8000000000000000
li     x5, 0x5555555555555555
xor    x3, x4, x5
li     x6, 0xd555555555555555
bne    x3, x6, TEST_FAIL

li     x4, 0x8000000000000000
li     x5, 0x7fffffffffffffff
xor    x3, x4, x5
li     x6, 0xffffffffffffffff
bne    x3, x6, TEST_FAIL

li     x4, 0xaaaaaaaaaaaaaaaa
li     x5, 0x8000000000000000
xor    x3, x4, x5
li     x6, 0x2aaaaaaaaaaaaaaa
bne    x3, x6, TEST_FAIL

li     x4, 0xaaaaaaaaaaaaaaaa
li     x5, 0xaaaaaaaaaaaaaaaa
xor    x3, x4, x5
li     x6, 0x0000000000000000
bne    x3, x6, TEST_FAIL

li     x4, 0xaaaaaaaaaaaaaaaa
li     x5, 0x0000000000000000
xor    x3, x4, x5
li     x6, 0xaaaaaaaaaaaaaaaa
bne    x3, x6, TEST_FAIL

li     x4, 0xaaaaaaaaaaaaaaaa
li     x5, 0x5555555555555555
xor    x3, x4, x5
li     x6, 0xffffffffffffffff
bne    x3, x6, TEST_FAIL

li     x4, 0xaaaaaaaaaaaaaaaa
li     x5, 0x7fffffffffffffff
xor    x3, x4, x5
li     x6, 0xd555555555555555
bne    x3, x6, TEST_FAIL

li     x4, 0x0000000000000000
li     x5, 0x8000000000000000
xor    x3, x4, x5
li     x6, 0x8000000000000000
bne    x3, x6, TEST_FAIL

li     x4, 0x0000000000000000
li     x5, 0xaaaaaaaaaaaaaaaa
xor    x3, x4, x5
li     x6, 0xaaaaaaaaaaaaaaaa
bne    x3, x6, TEST_FAIL

li     x4, 0x0000000000000000
li     x5, 0x0000000000000000
xor    x3, x4, x5
li     x6, 0x0000000000000000
bne    x3, x6, TEST_FAIL

li     x4, 0x0000000000000000
li     x5, 0x5555555555555555
xor    x3, x4, x5
li     x6, 0x5555555555555555
bne    x3, x6, TEST_FAIL

li     x4, 0x0000000000000000
li     x5, 0x7fffffffffffffff
xor    x3, x4, x5
li     x6, 0x7fffffffffffffff
bne    x3, x6, TEST_FAIL

li     x4, 0x5555555555555555
li     x5, 0x8000000000000000
xor    x3, x4, x5
li     x6, 0xd555555555555555
bne    x3, x6, TEST_FAIL

li     x4, 0x5555555555555555
li     x5, 0xaaaaaaaaaaaaaaaa
xor    x3, x4, x5
li     x6, 0xffffffffffffffff
bne    x3, x6, TEST_FAIL

li     x4, 0x5555555555555555
li     x5, 0x0000000000000000
xor    x3, x4, x5
li     x6, 0x5555555555555555
bne    x3, x6, TEST_FAIL

li     x4, 0x5555555555555555
li     x5, 0x5555555555555555
xor    x3, x4, x5
li     x6, 0x0000000000000000
bne    x3, x6, TEST_FAIL

li     x4, 0x5555555555555555
li     x5, 0x7fffffffffffffff
xor    x3, x4, x5
li     x6, 0x2aaaaaaaaaaaaaaa
bne    x3, x6, TEST_FAIL

li     x4, 0x7fffffffffffffff
li     x5, 0x8000000000000000
xor    x3, x4, x5
li     x6, 0xffffffffffffffff
bne    x3, x6, TEST_FAIL

li     x4, 0x7fffffffffffffff
li     x5, 0xaaaaaaaaaaaaaaaa
xor    x3, x4, x5
li     x6, 0xd555555555555555
bne    x3, x6, TEST_FAIL

li     x4, 0x7fffffffffffffff
li     x5, 0x0000000000000000
xor    x3, x4, x5
li     x6, 0x7fffffffffffffff
bne    x3, x6, TEST_FAIL

li     x4, 0x7fffffffffffffff
li     x5, 0x5555555555555555
xor    x3, x4, x5
li     x6, 0x2aaaaaaaaaaaaaaa
bne    x3, x6, TEST_FAIL

li     x4, 0x7fffffffffffffff
li     x5, 0x7fffffffffffffff
xor    x3, x4, x5
li     x6, 0x0000000000000000
bne    x3, x6, TEST_FAIL


#XORI
 XORI:


li   x4, 0x8000000000000000
xori x3, x4, -2048
li   x6, 0x7ffffffffffff800
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
xori x3, x4, -1366
li   x6, 0x7ffffffffffffaaa
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
xori x3, x4, 0x0
li   x6, 0x8000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
xori x3, x4, 0x555
li   x6, 0x8000000000000555
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
xori x3, x4, 0x7ff
li   x6, 0x80000000000007ff
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
xori x3, x4, -2048
li   x6, 0x55555555555552aa
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
xori x3, x4, -1366
li   x6, 0x5555555555555000
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
xori x3, x4, 0x000
li   x6, 0xaaaaaaaaaaaaaaaa
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
xori x3, x4, 0x555
li   x6, 0xaaaaaaaaaaaaafff
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
xori x3, x4, 0x7ff
li   x6, 0xaaaaaaaaaaaaad55
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
xori x3, x4, -2048
li   x6, 0xfffffffffffff800
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
xori x3, x4, -1366
li   x6, 0xfffffffffffffaaa
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
xori x3, x4, 0x000
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
xori x3, x4, 0x555
li   x6, 0x0000000000000555
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
xori x3, x4, 0x7ff
li   x6, 0x00000000000007ff
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
xori x3, x4, -2048
li   x6, 0xaaaaaaaaaaaaad55
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
xori x3, x4, -1366
li   x6, 0xaaaaaaaaaaaaafff
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
xori x3, x4, 0x000
li   x6, 0x5555555555555555
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
xori x3, x4, 0x555
li   x6, 0x5555555555555000
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
xori x3, x4, 0x7ff
li   x6, 0x55555555555552aa
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
xori x3, x4, -2048
li   x6, 0x80000000000007ff
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
xori x3, x4, -1366
li   x6, 0x8000000000000555
bne  x6, x3, TEST_FAIL


#OR
 OR:


li   x4,0x8000000000000000
li   x5,0x8000000000000000
or   x3,x4,x5
li   x6,0x8000000000000000
bne  x6, x3, TEST_FAIL

li   x4,0x8000000000000000
li   x5,0xaaaaaaaaaaaaaaaa
or   x3,x4,x5
li   x6,0xaaaaaaaaaaaaaaaa
bne  x6, x3, TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x0000000000000000
or   x3,x4,x5
li   x6,0x8000000000000000
bne  x6, x3, TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x5555555555555555
or   x3,x4,x5
li   x6,0xd555555555555555
bne  x6, x3, TEST_FAIL

li   x4,0x8000000000000000
li   x5,0x7fffffffffffffff
or   x3,x4,x5
li   x6,0xffffffffffffffff
bne  x6, x3, TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x8000000000000000
or   x3,x4,x5
li   x6,0xaaaaaaaaaaaaaaaa
bne  x6, x3, TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0xaaaaaaaaaaaaaaaa
or   x3,x4,x5
li   x6,0xaaaaaaaaaaaaaaaa
bne  x6, x3, TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x0000000000000000
or   x3,x4,x5
li   x6,0xaaaaaaaaaaaaaaaa
bne  x6, x3, TEST_FAIL


li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0x5555555555555555
or   x3,x4,x5
li   x6,0xffffffffffffffff
bne  x6, x3, TEST_FAIL

li   x4,0xaaaaaaaaaaaaaaaa
li   x5,0xffffffffffffffff
or   x3,x4,x5
li   x6,0xffffffffffffffff
bne  x6, x3, TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x8000000000000000
or   x3,x4,x5
li   x6,0x8000000000000000
bne  x6, x3, TEST_FAIL

li   x4,0x0000000000000000
li   x5,0xaaaaaaaaaaaaaaaa
or   x3,x4,x5
li   x6,0xaaaaaaaaaaaaaaaa
bne  x6, x3, TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x0000000000000000
or   x3,x4,x5
li   x6,0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x5555555555555555
or   x3,x4,x5
li   x6,0x5555555555555555
bne  x6, x3, TEST_FAIL

li   x4,0x0000000000000000
li   x5,0x7fffffffffffffff
or   x3,x4,x5
li   x6,0x7fffffffffffffff
bne  x6, x3, TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x8000000000000000
or   x3,x4,x5
li   x6,0xd555555555555555
bne  x6, x3, TEST_FAIL

li   x4,0x5555555555555555
li   x5,0xaaaaaaaaaaaaaaaa
or   x3,x4,x5
li   x6,0xffffffffffffffff
bne  x6, x3, TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x0000000000000000
or   x3,x4,x5
li   x6,0x5555555555555555
bne  x6, x3, TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x5555555555555555
or   x3,x4,x5
li   x6,0x5555555555555555
bne  x6, x3, TEST_FAIL

li   x4,0x5555555555555555
li   x5,0x7fffffffffffffff
or   x3,x4,x5
li   x6,0x7fffffffffffffff
bne  x6, x3, TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x8000000000000000
or   x3,x4,x5
li   x6,0xffffffffffffffff
bne  x6, x3, TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0xaaaaaaaaaaaaaaaa
or   x3,x4,x5
li   x6,0xffffffffffffffff
bne  x6, x3, TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x0000000000000000
or   x3,x4,x5
li   x6,0x7fffffffffffffff
bne  x6, x3, TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x5555555555555555
or   x3,x4,x5
li   x6,0x7fffffffffffffff
bne  x6, x3, TEST_FAIL

li   x4,0x7fffffffffffffff
li   x5,0x7fffffffffffffff
or   x3,x4,x5
li   x6,0x7fffffffffffffff
bne  x6, x3, TEST_FAIL


#ORI
ORI:


li   x4, 0x8000000000000000
ori  x3, x4, -2048
li   x6, 0xfffffffffffff800
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
ori  x3, x4, -1366
li   x6, 0xfffffffffffffaaa
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
ori  x3, x4, 0x000
li   x6, 0x8000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
ori  x3, x4, 0x555
li   x6, 0x8000000000000555
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
ori  x3, x4, 0x7ff
li   x6, 0x80000000000007ff
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
ori  x3, x4, -2048
li   x6, 0xfffffffffffffaaa
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
ori  x3, x4, -1366
li   x6, 0xfffffffffffffaaa
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
ori  x3, x4, 0x000
li   x6, 0xaaaaaaaaaaaaaaaa
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
ori  x3, x4, 0x555
li   x6, 0xaaaaaaaaaaaaafff
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
ori  x3, x4, 0x7ff
li   x6, 0xaaaaaaaaaaaaafff
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
ori  x3, x4, -2048
li   x6, 0xfffffffffffff800
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
ori  x3, x4, -1366
li   x6, 0xfffffffffffffaaa
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
ori  x3, x4, 0x000
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
ori  x3, x4, 0x555
li   x6, 0x0000000000000555
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
ori  x3, x4, 0x7ff
li   x6, 0x00000000000007ff
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
ori  x3, x4, -2048
li   x6, 0xfffffffffffffd55
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
ori  x3, x4, -1366
li   x6, 0xffffffffffffffff
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
ori  x3, x4, 0x000
li   x6, 0x5555555555555555
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
ori  x3, x4, 0x555
li   x6, 0x5555555555555555
bne  x6, x3, TEST_FAIL

li   x4, 0x5555555555555555
ori  x3, x4, 0x7ff
li   x6, 0x55555555555557ff
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
ori  x3, x4, -2048
li   x6, 0xffffffffffffffff
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
ori  x3, x4, -1366
li   x6, 0xffffffffffffffff
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
ori  x3, x4, 0x000
li   x6, 0x7fffffffffffffff
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
ori  x3, x4, 0x555
li   x6, 0x7fffffffffffffff
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
ori  x3, x4, 0x7ff
li   x6, 0x7fffffffffffffff
bne  x6, x3, TEST_FAIL


#AND
 AND:


li   x4, 0x8000000000000000
li   x5, 0x8000000000000000
and  x3, x4, x5
li   x6, 0x8000000000000000
bne  x3, x6, TEST_FAIL

li   x4, 0x8000000000000000
li   x5, 0xaaaaaaaaaaaaaaaa
and  x3, x4, x5
li   x6, 0x8000000000000000
bne  x3, x6, TEST_FAIL

li   x4, 0x8000000000000000
li   x5, 0x0000000000000000
and  x3, x4, x5
li   x6, 0x0000000000000000
bne  x3, x6, TEST_FAIL

li   x4, 0x8000000000000000
li   x5, 0x5555555555555555
and  x3, x4, x5
li   x6, 0x0000000000000000
bne  x3, x6, TEST_FAIL

li   x4, 0x8000000000000000
li   x5, 0x7fffffffffffffff
and  x3, x4, x5
li   x6, 0x0000000000000000
bne  x3, x6, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0x8000000000000000
and  x3, x4, x5
li   x6, 0x8000000000000000
bne  x3, x6, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0xaaaaaaaaaaaaaaaa
and  x3, x4, x5
li   x6, 0xaaaaaaaaaaaaaaaa
bne  x3, x6, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0x0000000000000000
and  x3, x4, x5
li   x6, 0x0000000000000000
bne  x3, x6, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0x5555555555555555
and  x3, x4, x5
li   x6, 0x0000000000000000
bne  x3, x6, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
li   x5, 0x7fffffffffffffff
and  x3, x4, x5
li   x6, 0x2aaaaaaaaaaaaaaa
bne  x3, x6, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0x8000000000000000
and  x3, x4, x5
li   x6, 0x0000000000000000
bne  x3, x6, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0xaaaaaaaaaaaaaaaa
and  x3, x4, x5
li   x6, 0x0000000000000000
bne  x3, x6, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0x0000000000000000
and  x3, x4, x5
li   x6, 0x0000000000000000
bne  x3, x6, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0x5555555555555555
and  x3, x4, x5
li   x6, 0x0000000000000000
bne  x3, x6, TEST_FAIL

li   x4, 0x0000000000000000
li   x5, 0x7fffffffffffffff
and  x3, x4, x5
li   x6, 0x0000000000000000
bne  x3, x6, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0x8000000000000000
and  x3, x4, x5
li   x6, 0x0000000000000000
bne  x3, x6, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0xaaaaaaaaaaaaaaaa
and  x3, x4, x5
li   x6, 0x0000000000000000
bne  x3, x6, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0x0000000000000000
and  x3, x4, x5
li   x6, 0x0000000000000000
bne  x3, x6, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0x5555555555555555
and  x3, x4, x5
li   x6, 0x5555555555555555
bne  x3, x6, TEST_FAIL

li   x4, 0x5555555555555555
li   x5, 0x7fffffffffffffff
and  x3, x4, x5
li   x6, 0x5555555555555555
bne  x3, x6, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0x8000000000000000
and  x3, x4, x5
li   x6, 0x0000000000000000
bne  x3, x6, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0xaaaaaaaaaaaaaaaa
and  x3, x4, x5
li   x6, 0x2aaaaaaaaaaaaaaa
bne  x3, x6, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0x0000000000000000
and  x3, x4, x5
li   x6, 0x0000000000000000
bne  x3, x6, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0x5555555555555555
and  x3, x4, x5
li   x6, 0x5555555555555555
bne  x3, x6, TEST_FAIL

li   x4, 0x7fffffffffffffff
li   x5, 0x7fffffffffffffff
and  x3, x4, x5
li   x6, 0x7fffffffffffffff
bne  x3, x6, TEST_FAIL


#ANDI
ANDI:


li   x4, 0x8000000000000000
andi x3, x4, -2048
li   x6, 0x8000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
andi x3, x4, -1366
li   x6, 0x8000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
andi x3, x4, 0x000
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
andi x3, x4, 0x555
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x8000000000000000
andi x3, x4, 0x7ff
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
andi x3, x4, -2048
li   x6, 0xaaaaaaaaaaaaa800
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
andi x3, x4, -1366
li   x6, 0xaaaaaaaaaaaaaaaa
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
andi x3, x4, 0x000
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
andi x3, x4, 0x555
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
andi x3, x4, 0x000
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
andi x3, x4, 0x555
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0xaaaaaaaaaaaaaaaa
andi x3, x4, 0x7ff
li   x6, 0x00000000000002aa
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
andi x3, x4, -2048
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
andi x3, x4, -1366
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
andi x3, x4, 0x000
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
andi x3, x4, 0x555
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x0000000000000000
andi x3, x4, 0x7ff
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
andi x3, x4, -2048
li   x6, 0x7ffffffffffff800
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
andi x3, x4, -1366
li   x6, 0x7ffffffffffffaaa
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
andi x3, x4, 0x000
li   x6, 0x0000000000000000
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
andi x3, x4, 0x555
li   x6, 0x0000000000000555
bne  x6, x3, TEST_FAIL

li   x4, 0x7fffffffffffffff
andi x3, x4, 0x7ff
li   x6, 0x00000000000007ff
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

