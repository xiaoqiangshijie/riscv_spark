
    .section .init;
    .globl start;
    .type start,@function


start:

//B type
li x5,0x5
li x4,0x4
beq x4,x5,fail

li x4,0x4
bne x4,x4,fail

/////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////// I type ////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

//addi
li    x4,0x00000004
addi  x3,x4,0x001   //x1 = 1
li    x6,0x00000005
bne   x3,x6,fail

//slti
li    x4,0x00000004
slti  x3,x4,-0x1
li    x6,0x0
bne   x3,x6,fail

sltiu x3,x0,0x003   //x3 = 1
xori  x4,x0,0x004   //x4 = 4
ori   x5,x0,0x005   //x5 = 5
andi  x6,x0,0x006   //x6 = 0
slli  x7,x0,0x007   //x7 = 0
srli  x8,x0,0x008   //x8 = 0
srai  x9,x0,0x009   //x9 = 0

//R type
add   x3,x2,x1      //x3 = 2
sub   x3,x2,x1      //x3 = 0
sll   x3,x2,x1      //x3 = 1 << 1 = 2
slt   x3,x2,x5      //x2 = 1,x5 = 5,x2 < x5 x3 = 1
sltu  x3,x5,x2      //x5 = 5,x2 = 1,x5 > x2,x3 = 0          addr = 34
xor   x3,x5,x2      //x3 = x5 ^ x2 = 101 ^ 001 = 100 = 4
sra   x3,x5,x2      //x3 = x5 >> x2 = 5 >> 1 = 2
srl   x3,x2,x5      //x3 = x2 >> x5 = 1 >> 5 = 0
or    x3,x2,x5      //x3 = 001 | 101 = 101 = 5
and   x3,x2,x5      //x3 = 001 & 101 = 001 = 1

//M type
li    x4,0xffffffff
li    x5,0xffffffff
mul   x3,x4,x5           //x3 = 1

li    x4,0xffffffff
li    x5,0xffffffff
mulhu   x3,x4,x5         //x3 = fffffffe

li    x4,0xffffffff
li    x5,0xffffffff
mulh   x3,x4,x5          //x3 = 0

li    x4,0xffffffff
li    x5,0xffffffff
mulhsu   x3,x4,x5        //x3 = -1

//DIV type









pass:
li x26,0x1
jal x0,run_end

fail:
li x27,0x1

run_end: