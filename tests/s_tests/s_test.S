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
 addi  x3,x4,0x001   
 li    x6,0x00000005
 bne   x3,x6,fail

 //slti
 li    x4,0x00000004
 slti  x3,x4,-0x1
 li    x6,0x0
 bne   x3,x6,fail

 //slti
 li    x4,0x00000004
 slti  x3,x4,0x5
 li    x6,0x1
 bne   x3,x6,fail

 //sltiu
 li    x4,0x00000004
 slti  x3,x4,0x1
 li    x6,0x0
 bne   x3,x6,fail

 //sltiu
 li    x4,0x00000004
 slti  x3,x4,0x5
 li    x6,0x1
 bne   x3,x6,fail

 //xori
 li    x4,0x00000004
 xori  x3,x4,0x1
 li    x6,0x5
 bne   x3,x6,fail

 //xori 
 li    x4,0x00000004
 xori  x3,x4,0x5
 li    x6,0x1
 bne   x3,x6,fail

 //ori
 li    x4,0x00000004
 ori   x3,x4,0x1
 li    x6,0x5
 bne   x3,x6,fail

 //ori 
 li    x4,0x00000004
 ori   x3,x4,0x5
 li    x6,0x5
 bne   x3,x6,fail

 //andi
 li    x4,0x00000004
 andi  x3,x4,0x1
 li    x6,0x0
 bne   x3,x6,fail

 //andi 
 li    x4,0x00000004
 andi  x3,x4,0x5
 li    x6,0x4
 bne   x3,x6,fail

 //slli
 li    x4,0x00000004
 slli  x3,x4,0x1
 li    x6,0x8
 bne   x3,x6,fail

 //slli 
 li    x4,0x00000004
 slli  x3,x4,0x2
 li    x6,0x10
 bne   x3,x6,fail

 //srli
 li    x4,0x00000004
 srli  x3,x4,0x1
 li    x6,0x2
 bne   x3,x6,fail

 //srli 
 li    x4,0x00000004
 srli  x3,x4,0x2
 li    x6,0x1
 bne   x3,x6,fail

 //srai
 li    x4,0x00000004
 srai  x3,x4,0x1
 li    x6,0x2
 bne   x3,x6,fail

 //srai
 li    x4,0x10000004
 srai  x3,x4,0x11
 li    x6,0x00000800
 bne   x3,x6,fail

/////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////// R type ////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

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


/////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////// LS type ///////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////


//load funtion
li x1,0x12345678
li x4,0x00000000
li x3,0x88888888
sw x1,0x0(x4)       // add0=12345678
lw x7,0x0(x4)       // add0=12345678
li x8,0x12345678
bne x7,x8,fail

sb x3,0x0(x4)       // add0=12345688
lb x5,0x0(x4)       // x5  =ffffff88
li x6,0xffffff88
bne x5,x6,fail

//load related
li x4,0x0
lw x1,0x0(x4)
addi x3,x1,0x0
li x5,0x12345688
bne x3,x5,fail

/////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////// BIU test //////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////



pass:
li x26,0x1
jal x0,run_end

fail:
li x27,0x1

run_end: