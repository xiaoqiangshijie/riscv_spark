    .section .init;
    .globl start;
    .type start,@function


 start:

li  x2,80000000;
li  x3,80000000;
add x1,x2,x3;