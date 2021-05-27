
    .section .init;
    .globl start;
    .type start,@function


start:
# .option push
# .option norelax
# 	la gp, __global_pointer$
# .option pop
	la sp, sp_
#ifdef SIMULATION
    li x26, 0x00
    li x27, 0x00
#endif

	/* Load data section */
	la a0, data_lma_start    #加载数据段在flash的起始地址到a0，对应反汇编文件的pc=14
	la a1, data_vma_start	 #加载数据段在ram的起始地址到ram，对应反汇编文件的pc=1c、20
	la a2, data_vma_end      #这里将数据段vma加载到a2里，其实就是bss段的起始vma
	bgeu a1, a2, 2f          #这里a1如果大于a2，则跳转到标签2，这里不成立，继续向下执行
1:
	lw t0, (a0)              #等同于把a0里的值加载到t0里面
	sw t0, (a1)              #等同于把t0里的值放入a1中
	addi a0, a0, 4
	addi a1, a1, 4
	bltu a1, a2, 1b
2:
	/* Clear bss section */
	la a0, bss_start         
	la a1, bss_end
	bgeu a0, a1, 2f
1:
	sw zero, (a0)
	addi a0, a0, 4
	bltu a0, a1, 1b
2:
    call main

#ifdef SIMULATION
    li x26, 0x01
#endif

loop:
    j loop
