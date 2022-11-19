.text
.align 1
.global main
main:


#SB_LB
SB_LB:


li   x1, 0x0123456789abcdef
li   x4, 0x0000000000000000
li   x3, 0x1122334455667788
sd   x1, 0x000(x4)
sb   x3, 0x000(x4)
lb   x5, 0x000(x4)
li   x6, 0xffffffffffffff88
bne  x5, x6, TEST_FAIL
ld   x7, 0x000(x4)
li   x8, 0x0123456789abcd88
bne  x7, x8, TEST_FAIL

li   x1, 0x0123456789abcdef
li   x4, 0x0000000000000000
li   x3, 0x1122334455667788
sd   x1, 0x000(x4)
sb   x3, 0x001(x4)
lb   x5, 0x001(x4)
li   x6, 0xffffffffffffff88
bne  x5, x6, TEST_FAIL
ld   x7, 0x000(x4)
li   x8, 0x0123456789ab88ef
bne  x7, x8, TEST_FAIL

li   x1, 0x0123456789abcdef
li   x4, 0x0000000000000000
li   x3, 0x1122334455667788
sd   x1, 0x000(x4)
sb   x3, 0x002(x4)
lb   x5, 0x002(x4)
li   x6, 0xffffffffffffff88
bne  x5, x6, TEST_FAIL
ld   x7, 0x000(x4)
li   x8, 0x012345678988cdef
bne  x7, x8, TEST_FAIL

li   x1, 0x0123456789abcdef
li   x4, 0x0000000000000000
li   x3, 0x1122334455667788
sd   x1, 0x000(x4)
sb   x3, 0x003(x4)
lb   x5, 0x003(x4)
li   x6, 0xffffffffffffff88
bne  x5, x6, TEST_FAIL
ld   x7, 0x000(x4)
li   x8, 0x0123456788abcdef
bne  x7, x8, TEST_FAIL

li   x1, 0x0123456789abcdef
li   x4, 0x0000000000000000
li   x3, 0x1122334455667788
sd   x1, 0x000(x4)
sb   x3, 0x004(x4)
lb   x5, 0x004(x4)
li   x6, 0xffffffffffffff88
bne  x5, x6, TEST_FAIL
ld   x7, 0x000(x4)
li   x8, 0x0123458889abcdef
bne  x7, x8, TEST_FAIL

li   x1, 0x0123456789abcdef
li   x4, 0x0000000000000000
li   x3, 0x1122334455667788
sd   x1, 0x000(x4)
sb   x3, 0x005(x4)
lb   x5, 0x005(x4)
li   x6, 0xffffffffffffff88
bne  x5, x6, TEST_FAIL
ld   x7, 0x000(x4)
li   x8, 0x0123886789abcdef
bne  x7, x8, TEST_FAIL

li   x1, 0x0123456789abcdef
li   x4, 0x0000000000000000
li   x3, 0x1122334455667788
sd   x1, 0x000(x4)
sb   x3, 0x006(x4)
lb   x5, 0x006(x4)
li   x6, 0xffffffffffffff88
bne  x5, x6, TEST_FAIL
ld   x7, 0x000(x4)
li   x8, 0x0188456789abcdef
bne  x7, x8, TEST_FAIL

li   x1, 0x0123456789abcdef
li   x4, 0x0000000000000000
li   x3, 0x1122334455667788
sd   x1, 0x000(x4)
sb   x3, 0x007(x4)
lb   x5, 0x007(x4)
li   x6, 0xffffffffffffff88
bne  x5, x6, TEST_FAIL
ld   x7, 0x000(x4)
li   x8, 0x8823456789abcdef
bne  x7, x8, TEST_FAIL

#SB_LBU
SB_LBU:


li   x1, 0x0123456789abcdef
li   x4, 0x0000000000000000
li   x3, 0x1122334455667788
sd   x1, 0x000(x4)
sb   x3, 0x000(x4)
lbu   x5, 0x000(x4)
li   x6, 0x0000000000000088
bne  x5, x6, TEST_FAIL
ld   x7, 0x000(x4)
li   x8, 0x0123456789abcd88
bne  x7, x8, TEST_FAIL

li   x1, 0x0123456789abcdef
li   x4, 0x0000000000000000
li   x3, 0x1122334455667788
sd   x1, 0x000(x4)
sb   x3, 0x001(x4)
lbu   x5, 0x001(x4)
li   x6, 0x0000000000000088
bne  x5, x6, TEST_FAIL
ld   x7, 0x000(x4)
li   x8, 0x0123456789ab88ef
bne  x7, x8, TEST_FAIL

li   x1, 0x0123456789abcdef
li   x4, 0x0000000000000000
li   x3, 0x1122334455667788
sd   x1, 0x000(x4)
sb   x3, 0x002(x4)
lbu   x5, 0x002(x4)
li   x6, 0x0000000000000088
bne  x5, x6, TEST_FAIL
ld   x7, 0x000(x4)
li   x8, 0x012345678988cdef
bne  x7, x8, TEST_FAIL

li   x1, 0x0123456789abcdef
li   x4, 0x0000000000000000
li   x3, 0x1122334455667788
sd   x1, 0x000(x4)
sb   x3, 0x003(x4)
lbu   x5, 0x003(x4)
li   x6, 0x0000000000000088
bne  x5, x6, TEST_FAIL
ld   x7, 0x000(x4)
li   x8, 0x0123456788abcdef
bne  x7, x8, TEST_FAIL

li   x1, 0x0123456789abcdef
li   x4, 0x0000000000000000
li   x3, 0x1122334455667788
sd   x1, 0x000(x4)
sb   x3, 0x004(x4)
lbu   x5, 0x004(x4)
li   x6, 0x0000000000000088
bne  x5, x6, TEST_FAIL
ld   x7, 0x000(x4)
li   x8, 0x0123458889abcdef
bne  x7, x8, TEST_FAIL

li   x1, 0x0123456789abcdef
li   x4, 0x0000000000000000
li   x3, 0x1122334455667788
sd   x1, 0x000(x4)
sb   x3, 0x005(x4)
lbu   x5, 0x005(x4)
li   x6, 0x0000000000000088
bne  x5, x6, TEST_FAIL
ld   x7, 0x000(x4)
li   x8, 0x0123886789abcdef
bne  x7, x8, TEST_FAIL

li   x1, 0x0123456789abcdef
li   x4, 0x0000000000000000
li   x3, 0x1122334455667788
sd   x1, 0x000(x4)
sb   x3, 0x006(x4)
lbu   x5, 0x006(x4)
li   x6, 0x0000000000000088
bne  x5, x6, TEST_FAIL
ld   x7, 0x000(x4)
li   x8, 0x0188456789abcdef
bne  x7, x8, TEST_FAIL

li   x1, 0x0123456789abcdef
li   x4, 0x0000000000000000
li   x3, 0x1122334455667788
sd   x1, 0x000(x4)
sb   x3, 0x007(x4)
lbu   x5, 0x007(x4)
li   x6, 0x0000000000000088
bne  x5, x6, TEST_FAIL
ld   x7, 0x000(x4)
li   x8, 0x8823456789abcdef
bne  x7, x8, TEST_FAIL


#SH_LH
SH_LH:


li   x1, 0x0123456789abcdef
li   x4, 0x0000000000000000
li   x3, 0x1122334455667788
sd   x1, 0x000(x4)
sh   x3, 0x000(x4)
lh   x5, 0x000(x4)
li   x6, 0x0000000000007788
bne  x5, x6, TEST_FAIL
ld   x7, 0x000(x4)
li   x8, 0x0123456789ab7788
bne  x7, x8, TEST_FAIL

#li   x1, 0x0123456789abcdef
#li   x4, 0x0000000000000000
#li   x3, 0x1122334455667788
#sd   x1, 0x000(x4)
#sh   x3, 0x001(x4)
#lh   x5, 0x001(x4)
#li   x6, 0x0000000000007788
#bne  x5, x6, TEST_FAIL
#ld   x7, 0x000(x4)
#li   x8, 0x0123456789ab7788
#bne  x7, x8, TEST_FAIL

li   x1, 0x0123456789abcdef
li   x4, 0x0000000000000000
li   x3, 0x1122334455667788
sd   x1, 0x000(x4)
sh   x3, 0x002(x4)
lh   x5, 0x002(x4)
li   x6, 0x0000000000007788
bne  x5, x6, TEST_FAIL
ld   x7, 0x000(x4)
li   x8, 0x012345677788cdef
bne  x7, x8, TEST_FAIL

#li   x1, 0x0123456789abcdef
#li   x4, 0x0000000000000000
#li   x3, 0x1122334455667788
#sd   x1, 0x000(x4)
#sh   x3, 0x003(x4)
#lh   x5, 0x003(x4)
#li   x6, 0x0000000000007788
#bne  x5, x6, TEST_FAIL
#ld   x7, 0x000(x4)
#li   x8, 0x012345677788cdef
#bne  x7, x8, TEST_FAIL

li   x1, 0x0123456789abcdef
li   x4, 0x0000000000000000
li   x3, 0x1122334455667788
sd   x1, 0x000(x4)
sh   x3, 0x004(x4)
lh   x5, 0x004(x4)
li   x6, 0x0000000000007788
bne  x5, x6, TEST_FAIL
ld   x7, 0x000(x4)
li   x8, 0x0123778889abcdef
bne  x7, x8, TEST_FAIL

#li   x1, 0x0123456789abcdef
#li   x4, 0x0000000000000000
#li   x3, 0x1122334455667788
#sd   x1, 0x000(x4)
#sh   x3, 0x005(x4)
#lh   x5, 0x005(x4)
#li   x6, 0x0000000000007788
#bne  x5, x6, TEST_FAIL
#ld   x7, 0x000(x4)
#li   x8, 0x0123778889abcdef
#bne  x7, x8, TEST_FAIL

li   x1, 0x0123456789abcdef
li   x4, 0x0000000000000000
li   x3, 0x1122334455668877
sd   x1, 0x000(x4)
sh   x3, 0x006(x4)
lh   x5, 0x006(x4)
li   x6, 0xffffffffffff8877
bne  x5, x6, TEST_FAIL
ld   x7, 0x000(x4)
li   x8, 0x8877456789abcdef
bne  x7, x8, TEST_FAIL

#li   x1, 0x0123456789abcdef
#li   x4, 0x0000000000000000
#li   x3, 0x1122334455667788
#sd   x1, 0x000(x4)
#sh   x3, 0x007(x4)
#lh   x5, 0x007(x4)
#li   x6, 0x0000000000007788
#bne  x5, x6, TEST_FAIL
#ld   x7, 0x000(x4)
#li   x8, 0x7788456789abcdef
#bne  x7, x8, TEST_FAIL


##SH_LHU
#SH_LHU:

li   x1, 0x0123456789abcdef
li   x4, 0x0000000000000000
li   x3, 0x1122334455667788
sd   x1, 0x000(x4)
sh   x3, 0x000(x4)
lhu   x5, 0x000(x4)
li   x6, 0x0000000000007788
bne  x5, x6, TEST_FAIL
ld   x7, 0x000(x4)
li   x8, 0x0123456789ab7788
bne  x7, x8, TEST_FAIL

#li   x1, 0x0123456789abcdef
#li   x4, 0x0000000000000000
#li   x3, 0x1122334455667788
#sd   x1, 0x000(x4)
#sh   x3, 0x001(x4)
#lhu   x5, 0x001(x4)
#li   x6, 0x0000000000007788
#bne  x5, x6, TEST_FAIL
#ld   x7, 0x000(x4)
#li   x8, 0x0123456789ab7788
#bne  x7, x8, TEST_FAIL

li   x1, 0x0123456789abcdef
li   x4, 0x0000000000000000
li   x3, 0x1122334455667788
sd   x1, 0x000(x4)
sh   x3, 0x002(x4)
lhu   x5, 0x002(x4)
li   x6, 0x0000000000007788
bne  x5, x6, TEST_FAIL
ld   x7, 0x000(x4)
li   x8, 0x012345677788cdef
bne  x7, x8, TEST_FAIL

#li   x1, 0x0123456789abcdef
#li   x4, 0x0000000000000000
#li   x3, 0x1122334455667788
#sd   x1, 0x000(x4)
#sh   x3, 0x003(x4)
#lhu   x5, 0x003(x4)
#li   x6, 0x0000000000007788
#bne  x5, x6, TEST_FAIL
#ld   x7, 0x000(x4)
#li   x8, 0x012345677788cdef
#bne  x7, x8, TEST_FAIL

li   x1, 0x0123456789abcdef
li   x4, 0x0000000000000000
li   x3, 0x1122334455667788
sd   x1, 0x000(x4)
sh   x3, 0x004(x4)
lhu   x5, 0x004(x4)
li   x6, 0x0000000000007788
bne  x5, x6, TEST_FAIL
ld   x7, 0x000(x4)
li   x8, 0x0123778889abcdef
bne  x7, x8, TEST_FAIL

#li   x1, 0x0123456789abcdef
#li   x4, 0x0000000000000000
#li   x3, 0x1122334455667788
#sd   x1, 0x000(x4)
#sh   x3, 0x005(x4)
#lhu   x5, 0x005(x4)
#li   x6, 0x0000000000007788
#bne  x5, x6, TEST_FAIL
#ld   x7, 0x000(x4)
#li   x8, 0x0123778889abcdef
#bne  x7, x8, TEST_FAIL

li   x1, 0x0123456789abcdef
li   x4, 0x0000000000000000
li   x3, 0x1122334455668877
sd   x1, 0x000(x4)
sh   x3, 0x006(x4)
lhu   x5, 0x006(x4)
li   x6, 0x0000000000008877
bne  x5, x6, TEST_FAIL
ld   x7, 0x000(x4)
li   x8, 0x8877456789abcdef
bne  x7, x8, TEST_FAIL

#li   x1, 0x0123456789abcdef
#li   x4, 0x0000000000000000
#li   x3, 0x1122334455667788
#sd   x1, 0x000(x4)
#sh   x3, 0x007(x4)
#lhu   x5, 0x007(x4)
#li   x6, 0x0000000000007788
#bne  x5, x6, TEST_FAIL
#ld   x7, 0x000(x4)
#li   x8, 0x7788456789abcdef
#bne  x7, x8, TEST_FAIL


#SW_LW
SW_LW:


li   x1, 0x0123456789abcdef
li   x4, 0x0000000000000000
li   x3, 0x1122334455667788
sd   x1, 0x000(x4)
sw   x3, 0x000(x4)
lw   x5, 0x000(x4)
li   x6, 0x0000000055667788
bne  x5, x6, TEST_FAIL
ld   x7, 0x000(x4)
li   x8, 0x0123456755667788
bne  x7, x8, TEST_FAIL

#li   x1, 0x0123456789abcdef
#li   x4, 0x0000000000000000
#li   x3, 0x1122334455667788
#sd   x1, 0x000(x4)
#sw   x3, 0x001(x4)
#lw   x5, 0x001(x4)
#li   x6, 0x0000000055667788
#bne  x5, x6, TEST_FAIL
#ld   x7, 0x000(x4)
#li   x8, 0x0123456755667788
#bne  x7, x8, TEST_FAIL

#li   x1, 0x0123456789abcdef
#li   x4, 0x0000000000000000
#li   x3, 0x1122334455667788
#sd   x1, 0x000(x4)
#sw   x3, 0x002(x4)
#lw   x5, 0x002(x4)
#li   x6, 0x0000000055667788
#bne  x5, x6, TEST_FAIL
#ld   x7, 0x000(x4)
#li   x8, 0x0123456755667788
#bne  x7, x8, TEST_FAIL

#li   x1, 0x0123456789abcdef
#li   x4, 0x0000000000000000
#li   x3, 0x1122334455667788
#sd   x1, 0x000(x4)
#sw   x3, 0x003(x4)
#lw   x5, 0x003(x4)
#li   x6, 0x0000000055667788
#bne  x5, x6, TEST_FAIL
#ld   x7, 0x000(x4)
#li   x8, 0x0123456755667788
#bne  x7, x8, TEST_FAIL

li   x1, 0x0123456789abcdef
li   x4, 0x0000000000000000
li   x3, 0x1122334488776655
sd   x1, 0x000(x4)
sw   x3, 0x004(x4)
lw   x5, 0x004(x4)
li   x6, 0xffffffff88776655
bne  x5, x6, TEST_FAIL
ld   x7, 0x000(x4)
li   x8, 0x8877665589abcdef
bne  x7, x8, TEST_FAIL

#li   x1, 0x0123456789abcdef
#li   x4, 0x0000000000000000
#li   x3, 0x1122334455667788
#sd   x1, 0x000(x4)
#sw   x3, 0x005(x4)
#lw   x5, 0x005(x4)
#li   x6, 0x0000000055667788
#bne  x5, x6, TEST_FAIL
#ld   x7, 0x000(x4)
#li   x8, 0x5566778889abcdef
#bne  x7, x8, TEST_FAIL

#li   x1, 0x0123456789abcdef
#li   x4, 0x0000000000000000
#li   x3, 0x1122334455667788
#sd   x1, 0x000(x4)
#sw   x3, 0x006(x4)
#lw   x5, 0x006(x4)
#li   x6, 0x0000000055667788
#bne  x5, x6, TEST_FAIL
#ld   x7, 0x000(x4)
#li   x8, 0x5566778889abcdef
#bne  x7, x8, TEST_FAIL

#li   x1, 0x0123456789abcdef
#li   x4, 0x0000000000000000
#li   x3, 0x1122334455667788
#sd   x1, 0x000(x4)
#sw   x3, 0x007(x4)
#lw   x5, 0x006(x4)
#li   x6, 0x0000000055667788
#bne  x5, x6, TEST_FAIL
#ld   x7, 0x000(x4)
#li   x8, 0x5566778889abcdef
#bne  x7, x8, TEST_FAIL


##SW_LWU
#SW_LWU:


li   x1, 0x0123456789abcdef
li   x4, 0x0000000000000000
li   x3, 0x1122334455667788
sd   x1, 0x000(x4)
sw   x3, 0x000(x4)
lwu   x5, 0x000(x4)
li   x6, 0x0000000055667788
bne  x5, x6, TEST_FAIL
ld   x7, 0x000(x4)
li   x8, 0x0123456755667788
bne  x7, x8, TEST_FAIL

#li   x1, 0x0123456789abcdef
#li   x4, 0x0000000000000000
#li   x3, 0x1122334455667788
#sd   x1, 0x000(x4)
#sw   x3, 0x001(x4)
#lwu   x5, 0x001(x4)
#li   x6, 0x0000000055667788
#bne  x5, x6, TEST_FAIL
#ld   x7, 0x000(x4)
#li   x8, 0x0123456755667788
#bne  x7, x8, TEST_FAIL

#li   x1, 0x0123456789abcdef
#li   x4, 0x0000000000000000
#li   x3, 0x1122334455667788
#sd   x1, 0x000(x4)
#sw   x3, 0x002(x4)
#lwu   x5, 0x002(x4)
#li   x6, 0x0000000055667788
#bne  x5, x6, TEST_FAIL
#ld   x7, 0x000(x4)
#li   x8, 0x0123456755667788
#bne  x7, x8, TEST_FAIL

#li   x1, 0x0123456789abcdef
#li   x4, 0x0000000000000000
#li   x3, 0x1122334455667788
#sd   x1, 0x000(x4)
#sw   x3, 0x003(x4)
#lwu   x5, 0x003(x4)
#li   x6, 0x0000000055667788
#bne  x5, x6, TEST_FAIL
#ld   x7, 0x000(x4)
#li   x8, 0x0123456755667788
#bne  x7, x8, TEST_FAIL

li   x1, 0x0123456789abcdef
li   x4, 0x0000000000000000
li   x3, 0x1122334455667788
sd   x1, 0x000(x4)
sw   x3, 0x004(x4)
lwu   x5, 0x004(x4)
li   x6, 0x0000000055667788
bne  x5, x6, TEST_FAIL
ld   x7, 0x000(x4)
li   x8, 0x5566778889abcdef
bne  x7, x8, TEST_FAIL

#li   x1, 0x0123456789abcdef
#li   x4, 0x0000000000000000
#li   x3, 0x1122334455667788
#sd   x1, 0x000(x4)
#sw   x3, 0x005(x4)
#lwu   x5, 0x005(x4)
#li   x6, 0x0000000055667788
#bne  x5, x6, TEST_FAIL
#ld   x7, 0x000(x4)
#li   x8, 0x5566778889abcdef
#bne  x7, x8, TEST_FAIL

#li   x1, 0x0123456789abcdef
#li   x4, 0x0000000000000000
#li   x3, 0x1122334455667788
#sd   x1, 0x000(x4)
#sw   x3, 0x006(x4)
#lwu   x5, 0x006(x4)
#li   x6, 0x0000000055667788
#bne  x5, x6, TEST_FAIL
#ld   x7, 0x000(x4)
#li   x8, 0x5566778889abcdef
#bne  x7, x8, TEST_FAIL

#li   x1, 0x0123456789abcdef
#li   x4, 0x0000000000000000
#li   x3, 0x1122334455667788
#sd   x1, 0x000(x4)
#sw   x3, 0x007(x4)
#lwu   x5, 0x006(x4)
#li   x6, 0x0000000055667788
#bne  x5, x6, TEST_FAIL
#ld   x7, 0x000(x4)
#li   x8, 0x5566778889abcdef
#bne  x7, x8, TEST_FAIL


#-------------------------------------#
# test for dcache write back
#-------------------------------------#
li     x1, 0x1111111111111111
li     x2, 0x2222222222222222
li     x3, 0x3333333333333333
li     x4, 0x4444444444444444
li     x5, 0x5555555555555555

li     x6,  0x1000
li     x7,  0x2000
li     x8,  0x3000
li     x9,  0x4000
li     x10, 0x5000

sd     x1,  0x0(x6)
sd     x2,  0x0(x7)
sd     x3,  0x0(x8)
sd     x4,  0x0(x9)
sd     x5,  0x0(x10)

ld     x11, 0x0(x6)
bne    x1, x11, TEST_FAIL

ld     x12, 0x0(x7)
bne    x2, x12, TEST_FAIL

ld     x13, 0x0(x8)
bne    x3, x13, TEST_FAIL

ld     x14, 0x0(x9)
bne    x4, x14, TEST_FAIL

ld     x15, 0x0(x10)
bne    x5, x15, TEST_FAIL




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

