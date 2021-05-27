OUTPUT_ARCH( "riscv" )
ENTRY(start)


MEMORY
{
  flash (wxa!ri) : ORIGIN = 0x00000000, LENGTH = 16K
  ram (wxa!ri) :   ORIGIN = 0x10000000, LENGTH = 16K
}


SECTIONS
{
  
  .init           :
  {
    KEEP (*(SORT_NONE(.init)))
  } >flash AT>flash 
/*
  .text           :
  {
    *(.text.unlikely .text.unlikely.*)
    *(.text.startup .text.startup.*)
    *(.text .text.*)
    *(.gnu.linkonce.t.*)
  } >flash AT>flash 

  . = ALIGN(4);

  PROVIDE (__etext = .);
  PROVIDE (_etext = .);
  PROVIDE (etext = .);
*/

  .ctors          :
  {
    /* gcc uses crtbegin.o to find the start of
       the constructors, so we make sure it is
       first.  Because this is a wildcard, it
       doesn't matter if the user does not
       actually link against crtbegin.o; the
       linker won't look for a file to match a
       wildcard.  The wildcard also means that it
       doesn't matter which directory crtbegin.o
       is in.  */
    KEEP (*crtbegin.o(.ctors))
    KEEP (*crtbegin?.o(.ctors))
    /* We don't want to include the .ctor section from
       the crtend.o file until after the sorted ctors.
       The .ctor section from the crtend file contains the
       end of ctors marker and it must be last */
    KEEP (*(EXCLUDE_FILE (*crtend.o *crtend?.o ) .ctors))
    KEEP (*(SORT(.ctors.*)))
    KEEP (*(.ctors))
  } >flash AT>flash 

  .lalign         :
  {
    . = ALIGN(4);
    PROVIDE( data_lma_start = . );
  } >flash AT>flash 

  .dalign         :
  {
    . = ALIGN(4);
    PROVIDE( data_vma_start = . );
  } >ram AT>ram 

  .data          :
  {
    *(.rdata)
    *(.rodata .rodata.*)
    *(.gnu.linkonce.r.*)
    *(.data .data.*)
    *(.gnu.linkonce.d.*)
    . = ALIGN(8);
    PROVIDE( __global_pointer$ = . + 0x800 );
    *(.sdata .sdata.*)
    *(.gnu.linkonce.s.*)
    . = ALIGN(8);
    *(.srodata.cst16)
    *(.srodata.cst8)
    *(.srodata.cst4)
    *(.srodata.cst2)
    *(.srodata .srodata.*)
  } >ram AT>flash 

  . = ALIGN(4);
  PROVIDE( data_vma_end = . );

 
  PROVIDE( bss_start = . );


  .bss            :
  {
    *(.sbss*)
    *(.gnu.linkonce.sb.*)
    *(.bss .bss.*)
    *(.gnu.linkonce.b.*)
    *(COMMON)
    . = ALIGN(4);
  } >ram AT>ram 

  . = ALIGN(8);
  PROVIDE( bss_end = . );

  stack_size = DEFINED(stack_size) ? stack_size : 8K;

  .stack ORIGIN(ram) + LENGTH(ram) - stack_size : /*stack开始地址*/
  {
    PROVIDE( stack_end = . );
    . = stack_size;
    PROVIDE( sp_ = . );
    sp_top = .;
  } >ram AT>ram

}