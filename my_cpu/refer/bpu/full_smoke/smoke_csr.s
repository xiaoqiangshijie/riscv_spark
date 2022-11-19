.text
.align 2
.global main
main:

#mstatus
#li   x3,0xffffffff
#csrw mstatus,x3
#csrr x4,mstatus
#li   x5,0xffff
#and  x4,x4,x5
#li   x5,0x1888
#bne  x4,x5,FAIL

#li   x3,0x0
#csrw mstatus,x3
#csrr x4,mstatus
#li   x5,0xffffe7ff #mask mpp bit
#and  x4,x4,x5
#li   x5,0x0
#bne  x4,x5,FAIL

#CSRRW
CSRRW:

#li     x5,0xffffff77
#csrw   mstatus,x5
#li     x4,0xffffff88
#csrrw  x3,mstatus,x4
#li     x6,0x1800
#bne    x3,x6,FAIL

#li     x5,0xffffff77
#csrw   mstatus,x5
#li     x4,0xffffff88
#csrrw  x3,mstatus,x4
#li     x6,0x1800
#bne    x3,x6,FAIL








PASS:
la  x1, __exit
jr x1

FAIL:
la  x1, __fail
jr x1
