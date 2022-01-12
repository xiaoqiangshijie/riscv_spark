
    .section .init;
    .globl start;
    .type start,@function


start:

li  x2,00000001;
li  x3,00000001;
add x1,x2,x3;

loop:
    j loop
