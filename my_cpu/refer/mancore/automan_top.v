`ifdef FPGA
`define SYSMAP_BASE_ADDR0  20'h3ffff
`define SYSMAP_FLG0        5'b01111

`define SYSMAP_BASE_ADDR1  20'haffff
`define SYSMAP_FLG1        5'b00011

`define SYSMAP_BASE_ADDR2  20'hbffff
`define SYSMAP_FLG2        5'b01111

`define SYSMAP_BASE_ADDR3  20'hdffff
`define SYSMAP_FLG3        5'b00011

`define SYSMAP_BASE_ADDR4  20'heffff
`define SYSMAP_FLG4        5'b10011

`define SYSMAP_BASE_ADDR5  20'hffeff
`define SYSMAP_FLG5        5'b01111

`define SYSMAP_BASE_ADDR6  20'hfff5f
`define SYSMAP_FLG6        5'b01111

`define SYSMAP_BASE_ADDR7  20'hfffff 
`define SYSMAP_FLG7        5'b10011
`else
`define SYSMAP_BASE_ADDR0  20'h1dfff
`define SYSMAP_FLG0        5'b01111

`define SYSMAP_BASE_ADDR1  20'h1ffff
`define SYSMAP_FLG1        5'b00011

`define SYSMAP_BASE_ADDR2  20'hbffff
`define SYSMAP_FLG2        5'b01111

`define SYSMAP_BASE_ADDR3  20'hdffff
`define SYSMAP_FLG3        5'b00011

`define SYSMAP_BASE_ADDR4  20'heffff
`define SYSMAP_FLG4        5'b10011

`define SYSMAP_BASE_ADDR5  20'hffeff
`define SYSMAP_FLG5        5'b01111

`define SYSMAP_BASE_ADDR6  20'hfff5f
`define SYSMAP_FLG6        5'b01111

`define SYSMAP_BASE_ADDR7  20'hfffff 
`define SYSMAP_FLG7        5'b10011
`endif
`define PRODUCT_ID 12'h000
`define RESET_VAL 16'hABCD
`define REVISION    4'd2
`define SUB_VERSION 6'd2
`define PATCH       6'd1
`define FPGA_MEM
`define SMIC
`define PROCESS55LL
`define USER_MODE
`ifdef USER_MODE
  //`define MACHINE_SP
`endif
`define CLIC_MODE
`ifdef CSKY_TEE
  `define USER_MODE
  `define MACHINE_SP
`endif
`define GPR_16
`define VEC_BASE
`define LOAD_FAST_RETIRE
`define MAD_SMALL
`define IAHB_LITE
`ifdef IAHB_LITE
  //`define FLOP_OUT_IBUS
  //`define IBUS_16
  `define IBUS_32
`endif
`ifdef DAHB_LITE
  //`define FLOP_OUT_DBUS
  //`define DBUS_16
  `define DBUS_32
`endif
`define SYS_AHB_LITE
`define BIU_32
`ifdef FLOP_OUT_BIU
`define FLOP_OUT_BUS
`else
  `ifdef FLOP_OUT_IBUS
  `define FLOP_OUT_BUS
  `else
    `ifdef FLOP_OUT_DBUS
    `define FLOP_OUT_BUS
    `else
    `endif
  `endif
`endif
`ifdef IAHB_LITE
  //`define EXTERNAL_BMU
`endif
`define PMP

`ifdef PMP
  //`define PMP_REGION_2
  //`define PMP_REGION_4
  `define PMP_REGION_8
  //`define PMP_REGION_16
`endif
`ifdef PMP_REGION_2
  `define REGION_ENTRY0
  `define REGION_ENTRY1
`endif

`ifdef PMP_REGION_4
  `define REGION_ENTRY0
  `define REGION_ENTRY1
  `define REGION_ENTRY2
  `define REGION_ENTRY3
`endif

`ifdef PMP_REGION_8
  `define REGION_ENTRY0
  `define REGION_ENTRY1
  `define REGION_ENTRY2
  `define REGION_ENTRY3
  `define REGION_ENTRY4
  `define REGION_ENTRY5
  `define REGION_ENTRY6
  `define REGION_ENTRY7
`endif

`ifdef PMP_REGION_16
  `define REGION_ENTRY0
  `define REGION_ENTRY1
  `define REGION_ENTRY2
  `define REGION_ENTRY3
  `define REGION_ENTRY4
  `define REGION_ENTRY5
  `define REGION_ENTRY6
  `define REGION_ENTRY7
  `define REGION_ENTRY8
  `define REGION_ENTRY9
  `define REGION_ENTRY10
  `define REGION_ENTRY11
  `define REGION_ENTRY12
  `define REGION_ENTRY13
  `define REGION_ENTRY14
  `define REGION_ENTRY15
`endif
`define TCIPIF
`ifdef TCIPIF
  //`define CTIM     // Core Timer Hareware Implementation
  `ifdef CLIC_MODE
    `define CLIC      // Interrupt controller Configuration
  `endif
  `define CACHE
`endif

`ifdef CLIC
  // Attention:
  //   1. EXT_INT_NUM *MUST* > 0.
  //   2. If you don't want to use extensional clic int, use //`define EXT_INT_NUM rather than change EXT_INT_NUM to 0.
  //   3. If EXT_INT_NUM > 48, you need define CLIC_2_CYCLES unless the timing is loose.
  //   4. Don't change definition of CLIC_INTNUM.

  `define CLIC_INTCTLBITS      3
  `define EXT_INT_NUM          128

  `ifdef EXT_INT_NUM
    `define CLIC_INTNUM   `EXT_INT_NUM+16
  `else
    `define CLIC_INTNUM   16
    `define INT_NUM_16
  `endif
`endif





`ifdef SEU



  `define SEU_VERIFY_PARITY
  //`define SEU_VERIFY_HAMMING




  `define SEU_FIX_BRANCH
  //`define SEU_FIX_MULT
  //`define SEU_RANDOM_BLANK_INTERVALS
  //`define SEU_RANDOM_GATED_CLOCK_NOISE
  `define SEU_HARDWARE_RANDOM_INSTRUCTION_INSERTION
  `define SEU_GPR_CHECK
  `define SEU_PC_CHECK
  //`define SEU_PIPELINE_CHECK
  //`define SEU_CR_CHECK
  //`define SEU_CR_INDEPENDENT_COMPLEMENTARY_BACKUP
  //`define SEU_DATA_PATH_POLARITY
  //`define SEU_GPR_EXTERNAL_RESET
  `define SEU_BUS_PARITY
  //`define SEU_BUS_ENCRYPTION
  //`define SEU_BUS_SCRAMBLE




  //`define SECURITY_BIST
`endif




`ifdef SEU_VERIFY_PARITY



  //define the verify bits width
  `define SEU_VB_WIDTH 1
  //define the reset value
  `define SEU_VB_RESET_00000000 1'b0
  `define SEU_VB_RESET_80000000 1'b1

`endif

`ifdef SEU_VERIFY_HAMMING



  //define the verify bits width
  `define SEU_VB_WIDTH 6
  //define the reset value
  `define SEU_VB_RESET_00000000 6'b0
  `define SEU_VB_RESET_80000000 6'b100110

`endif















`ifdef CACHE
  //`define CACHE_2K
  `define CACHE_4K
  //`define CACHE_8K
`endif

`ifdef CACHE
  `define CACHE_2WAY
  //`define CACHE_4WAY
`endif

`ifdef CACHE
  `define CACHE_LINE_16B
  //`define CACHE_LINE_32B
`endif

`ifdef CACHE
  //`define CACHE_REGION_1
  `define CACHE_REGION_2
  //`define CACHE_REGION_3
  //`define CACHE_REGION_4
`endif

`ifdef CACHE_REGION_4
  `define REGION_REG3
  `define REGION_REG2
  `define REGION_REG1
  `define REGION_REG0
`endif

`ifdef CACHE_REGION_3
  `define REGION_REG2
  `define REGION_REG1
  `define REGION_REG0
`endif

`ifdef CACHE_REGION_2
  `define REGION_REG1
  `define REGION_REG0
`endif

`ifdef CACHE_REGION_1
  `define REGION_REG0
`endif

`ifdef CACHE
  //`define CACHE_USER_DEFINED
`endif

`ifdef CACHE
  //`define CACHE_MBIST
`endif

`ifdef CACHE
  //`define CACHE_LFIDLE_REQ
`endif















`define HAD_IM

`ifdef HAD_IM
  //`define PCFIFO_FOR_DBG
  `define HAD_JTAG_2
  `define HAD_MBKPTB //now, MBKPTB indicates five breakpoints: A, B, C, D, E
  `ifdef HAD_MBKPTB
    //`define HAD_MBKPT_7 //indicates other four breakpoints: F, G
    //`define HAD_MBKPT_9 //indicates other four breakpoints: F, G, H, I
  `endif
  //`define HAD_INST_DEBUG_DISABLE
  //`define HAD_PROF_CNT
  //`define DDMA //debug direct memory access
  `ifdef TCIPIF
    //`define DBG_EXP // debug exception
    `define CSKY_DCC
  `endif
`endif


`define NO_PRE_DECODE

/**********************************************************************************

 This Module infers Generic Dual Port RAMs in Xilinx or Altera or Actel

	 All RESETs are made Synchronous

********************************************************************************/


`define SYN_MULTI_PORT_RAM 1 

`ifdef SYN_MULTI_PORT_RAM 
   `define RAM_STYLE /* synthesis syn_ramstyle = "no_rw_check" */ 
 `else
   `define RAM_STYLE /* synthesis syn_ramstyle = "block_ram" */ 
 `endif
    


module Syncore_ram(
	 PortClk
	,PortReset
	,PortWriteEnable
	,PortReadEnable 
	,PortDataIn
	,PortAddr
	,PortDataOut   
	);


parameter	 DATAWIDTH = 8;
parameter	 ADDRWIDTH = 8; 
parameter	 MEMDEPTH = 2**(ADDRWIDTH);

parameter 	 SPRAM	= 1;
parameter 	 READ_MODE_A			= 1;
parameter	 READ_WRITE_A			= 1;
parameter	 ENABLE_WR_PORTA	 	= 1; 

parameter	 REGISTER_RD_ADDR_PORTA 	= 1; 

parameter	 REGISTER_OUTPUT_PORTA 		= 1; 
parameter	 ENABLE_OUTPUT_REG_PORTA 	= 1; 
parameter	 RESET_OUTPUT_REG_PORTA 	= 1; 


parameter 	 READ_MODE_B			= 1;
parameter	 READ_WRITE_B			= 1;
parameter	 ENABLE_WR_PORTB	 	= 1; 

parameter	 REGISTER_RD_ADDR_PORTB 	= 1; 

parameter	 REGISTER_OUTPUT_PORTB 		= 1; 
parameter	 ENABLE_OUTPUT_REG_PORTB 	= 1; 
parameter	 RESET_OUTPUT_REG_PORTB 	= 1; 


parameter 	 TWO				= 2;


input  [TWO -1:0]				PortClk; 
input  [TWO -1:0]				PortReset;
input  [TWO -1:0]				PortWriteEnable;
input  [TWO -1:0]				PortReadEnable;
input  [ADDRWIDTH*TWO-1:0] 		PortAddr;
input  [DATAWIDTH*TWO-1:0] 			PortDataIn; 
output [DATAWIDTH*TWO-1:0]	 		PortDataOut;




reg [DATAWIDTH*TWO-1:0] DataOutRegPort;
reg [ADDRWIDTH*TWO-1:0] AddrRegPort;



reg [DATAWIDTH*TWO-1:0] mem [MEMDEPTH-1:0] `RAM_STYLE;


wire [TWO -1:0] ResetOutputRegPort; 
wire [TWO -1:0] EnableOutputRegPort;


wire [ADDRWIDTH*TWO-1:0] MemAddrPort;


wire [TWO -1:0] 	 		NOCHANGE;
wire [TWO -1:0] 			WriteEnablePort;
wire [DATAWIDTH*TWO-1:0] 		StoreDout;


wire [TWO -1:0]  Prm_NOCHANGE			= {(READ_MODE_B == 3), (READ_MODE_A == 3)};
wire [TWO -1:0]	 Prm_WRITE_FIRST		= {(READ_MODE_B == 2), (READ_MODE_A == 2)};
wire [TWO -1:0]	 Prm_READ_FIRST			= {(READ_MODE_B == 1), (READ_MODE_A == 1)};

wire [TWO -1:0]  Prm_ENABLE_WR_PORT 		= {(ENABLE_WR_PORTB > 0), (ENABLE_WR_PORTA > 0)}; 

wire [TWO -1:0]	 Prm_REGISTER_RD_ADDR_PORT 	= {(REGISTER_RD_ADDR_PORTB > 0), (REGISTER_RD_ADDR_PORTA > 0)}; 
wire [TWO -1:0]	 Prm_REGISTER_OUTPUT_PORT 	= {(REGISTER_OUTPUT_PORTB > 0), (REGISTER_OUTPUT_PORTA > 0)}; 
wire [TWO -1:0]	 Prm_ENABLE_OUTPUT_REG_PORT 	= {(ENABLE_OUTPUT_REG_PORTB > 0), (ENABLE_OUTPUT_REG_PORTA > 0)}; 
wire [TWO -1:0]	 Prm_RESET_OUTPUT_REG_PORT  	= {(RESET_OUTPUT_REG_PORTB > 0), (RESET_OUTPUT_REG_PORTA > 0)}; 


parameter Rd_Iterations	 = 	SPRAM ? 1 : 
				((((READ_WRITE_A == 1) & (READ_WRITE_B == 1)) | 
				((READ_WRITE_A == 1) & (READ_WRITE_B == 2))   |
				((READ_WRITE_A == 2) & (READ_WRITE_B == 1)) ) ? 2 : 1);

parameter Wr_Iterations = 	SPRAM ? 1 : 
				((((READ_WRITE_A == 1) & (READ_WRITE_B == 1)) | 
			   	((READ_WRITE_A == 1) & (READ_WRITE_B == 3))   |
			   	((READ_WRITE_A == 3) & (READ_WRITE_B == 1)) ) ? 2 : 1);

parameter rd_inc 		=  SPRAM ? 0 : 
				  ((((READ_WRITE_A == 3) & (READ_WRITE_B == 1)) | 						
				  ((READ_WRITE_A == 3) & (READ_WRITE_B == 2)) ) ? 1 : 0);

parameter wr_inc 		=  SPRAM ? 0 : 
				   ((((READ_WRITE_A == 2) & (READ_WRITE_B == 1)) | 						
				   ((READ_WRITE_A == 2) & (READ_WRITE_B == 3)) ) ? 1 : 0);







generate 
begin : GenBlock1

genvar i ;

for (i=0 ; i < Rd_Iterations; i=i+1)
begin : RAM_READ


assign ResetOutputRegPort[(i+rd_inc)]  	=  (Prm_RESET_OUTPUT_REG_PORT[(i+rd_inc)] > 0) ? PortReset[(i+rd_inc)] : 1'b0 ; 
assign EnableOutputRegPort[(i+rd_inc)] 	=  (Prm_ENABLE_OUTPUT_REG_PORT[(i+rd_inc)] > 0) ? PortReadEnable[(i+rd_inc)] : 1'b1;

assign NOCHANGE[(i+rd_inc)]		 		= (Prm_NOCHANGE[(i+rd_inc)]) ? !WriteEnablePort[(i+rd_inc)] : 1'b1;

/*
 Indexed vector part selects
In the Verilog-1995 standard, variable bit selects of a vector are permitted, but part-selects must be constant.
Thus, it is illegal to use a variable to select a specific byte out of a word. The Verilog-2001 standard adds a new
syntax, called indexed part selects. With an indexed part select, a base expression, a width expression, and an offset
direction are provided, in the form of: 

[base_expr +: width_expr] //positive offset
[base_expr -: width_expr] //negative offset

The base expression can vary during simulation run-time.The width expression must be constant. The offset
direction indicates if the width expression is added to or subtracted from the base expression. For example,:

reg [63:0] word;
reg [3:0] byte_num; //a value from 0 to 7
wire [7:0] byteN = word[byte_num*8 +: 8];

In the preceding example, if byte_num has a value of 4,
then the value of word[39:32] is assigned to byteN. Bit 32
of the part select is derived from the base expression, and
bit 39 from the positive offset and width expression.

*/
assign MemAddrPort[(i+rd_inc)*ADDRWIDTH +: ADDRWIDTH]	=  (Prm_REGISTER_RD_ADDR_PORT[(i+rd_inc)] > 0) ? AddrRegPort[(i+rd_inc)*ADDRWIDTH +: ADDRWIDTH]
												   			: PortAddr[(i+rd_inc)*ADDRWIDTH +: ADDRWIDTH];
									   
assign StoreDout[(i+rd_inc)*DATAWIDTH +: DATAWIDTH] 	= (Prm_WRITE_FIRST[(i+rd_inc)]) ? ( WriteEnablePort[(i+rd_inc)] ? PortDataIn[(i+rd_inc)*DATAWIDTH +: DATAWIDTH] : mem[MemAddrPort[(i+rd_inc)*ADDRWIDTH +: ADDRWIDTH]])
															  	   :  mem[MemAddrPort[(i+rd_inc)*ADDRWIDTH +: ADDRWIDTH]];

assign PortDataOut[(i+rd_inc)*DATAWIDTH +: DATAWIDTH] 	=  (Prm_REGISTER_OUTPUT_PORT[(i+rd_inc)] > 0) ? DataOutRegPort[(i+rd_inc)*DATAWIDTH +: DATAWIDTH] 
															  : StoreDout[(i+rd_inc)*DATAWIDTH +: DATAWIDTH] ;




always @(posedge PortClk[(i+rd_inc)])
begin  
     AddrRegPort[(i+rd_inc)*ADDRWIDTH +: ADDRWIDTH] <= PortAddr[(i+rd_inc)*ADDRWIDTH +: ADDRWIDTH];	
end


always @(posedge PortClk[(i+rd_inc)])
begin
  if(ResetOutputRegPort[(i+rd_inc)])
    DataOutRegPort[(i+rd_inc)*DATAWIDTH +: DATAWIDTH] ='d0;
  else
    if (EnableOutputRegPort[(i+rd_inc)])
      if (NOCHANGE[(i+rd_inc)])
        DataOutRegPort[(i+rd_inc)*DATAWIDTH +: DATAWIDTH] = StoreDout[(i+rd_inc)*DATAWIDTH +: DATAWIDTH];	
end

end
end
endgenerate 



generate 
begin : GenBlock2

genvar j ;

for (j=0 ; j < Wr_Iterations; j=j+1)
begin : RAM_WRITE

assign WriteEnablePort[(j+wr_inc)]		=  (Prm_ENABLE_WR_PORT[(j+wr_inc)] > 0) ? PortWriteEnable[(j+wr_inc)] : 1'b1; 

always @(posedge PortClk[(j+wr_inc)])
begin
   if(WriteEnablePort[(j+wr_inc)]) 
     mem[PortAddr[(j+wr_inc)*ADDRWIDTH +: ADDRWIDTH]] <= PortDataIn[(j+wr_inc)*DATAWIDTH +: DATAWIDTH];		
end

end
end
endgenerate 


endmodule// &Depend("cpu_cfig.h") @1






module cr_clk_top(
  forever_cpuclk,
  forever_cpuclk_nogated,
  forever_jtgclk,
  pad_had_jtg_tclk,
  pad_yy_test_mode,
  pll_core_cpuclk
);


input        pad_had_jtg_tclk;      
input        pad_yy_test_mode;      
input        pll_core_cpuclk;       
output       forever_cpuclk;        
output       forever_cpuclk_nogated; 
output       forever_jtgclk;        




wire         forever_cpuclk;        
wire         forever_cpuclk_nogated; 
wire         forever_jtgclk;        
wire         pad_had_jtg_tclk;      
wire         pad_yy_test_mode;      
wire         pll_core_cpuclk;       


assign forever_jtgclk = pad_had_jtg_tclk;
assign forever_cpuclk = pad_yy_test_mode ? pad_had_jtg_tclk : pll_core_cpuclk;
assign forever_cpuclk_nogated = pad_yy_test_mode ? pad_had_jtg_tclk : pll_core_cpuclk;


endmodule
























module cr_clkrst_top(
  cpurst_b,
  forever_cpuclk,
  forever_cpuclk_nogated,
  forever_jtgclk,
  hadrst_b,
  pad_cpu_rst_b,
  pad_had_jtg_tclk,
  pad_had_jtg_trst_b,
  pad_had_rst_b,
  pad_yy_test_mode,
  pll_core_cpuclk,
  trst_b
);


input        pad_cpu_rst_b;         
input        pad_had_jtg_tclk;      
input        pad_had_jtg_trst_b;    
input        pad_had_rst_b;         
input        pad_yy_test_mode;      
input        pll_core_cpuclk;       
output       cpurst_b;              
output       forever_cpuclk;        
output       forever_cpuclk_nogated; 
output       forever_jtgclk;        
output       hadrst_b;              
output       trst_b;                




wire         cpurst_b;              
wire         forever_cpuclk;        
wire         forever_cpuclk_nogated; 
wire         forever_jtgclk;        
wire         hadrst_b;              
wire         pad_cpu_rst_b;         
wire         pad_had_jtg_tclk;      
wire         pad_had_jtg_trst_b;    
wire         pad_had_rst_b;         
wire         pad_yy_test_mode;      
wire         pll_core_cpuclk;       
wire         trst_b;                









cr_clk_top  x_cr_clk_top (
  .forever_cpuclk         (forever_cpuclk        ),
  .forever_cpuclk_nogated (forever_cpuclk_nogated),
  .forever_jtgclk         (forever_jtgclk        ),
  .pad_had_jtg_tclk       (pad_had_jtg_tclk      ),
  .pad_yy_test_mode       (pad_yy_test_mode      ),
  .pll_core_cpuclk        (pll_core_cpuclk       )
);






cr_rst_top  x_cr_rst_top (
  .cpurst_b           (cpurst_b          ),
  .hadrst_b           (hadrst_b          ),
  .pad_cpu_rst_b      (pad_cpu_rst_b     ),
  .pad_had_jtg_trst_b (pad_had_jtg_trst_b),
  .pad_had_rst_b      (pad_had_rst_b     ),
  .pad_yy_test_mode   (pad_yy_test_mode  ),
  .trst_b             (trst_b            )
);


endmodule







module automan_top (

  input           jtag_pin_tck,
  input           jtag_pin_tdi,
  input           jtag_pin_tms,
  input           jtag_pin_trst,
  output          jtag_pin_tdo,
  input[31:0]     ext_plic_irq,
  input           trigger     ,
  
  input   [31 :0]  pad_biu_hrdata,                      
  input            pad_biu_hready,                      
  input            pad_biu_hresp,                       
  input   [11 :0]  pad_bmu_iahbl_base,                  
  input   [11 :0]  pad_bmu_iahbl_mask,                  
  input   [127:0]  pad_clic_int_vld,                    
  input            pad_cpu_dfs_req,                     
  input            pad_cpu_ext_int_b,                   
  input            pad_cpu_nmi,                         
  input   [31 :0]  pad_cpu_rst_addr,                    
  input            pad_cpu_rst_b,                       
  input   [63 :0]  pad_cpu_sys_cnt,                     
  input            pad_cpu_wakeup_event,                
  input            pad_had_jtg_tclk,                    
  input            pad_had_jtg_tms_i,                   
  input            pad_had_jtg_trst_b,                  
  input            pad_had_rst_b,                       
  input            pad_sysio_dbgrq_b,                   
  input            pad_yy_gate_clk_en_b,                
  input            pad_yy_test_mode,                    
  input            pll_core_cpuclk,                     
  output  [31 :0]  biu_pad_haddr,                       
  output  [2  :0]  biu_pad_hburst,                      
  output  [3  :0]  biu_pad_hprot,                       
  output  [2  :0]  biu_pad_hsize,                       
  output  [1  :0]  biu_pad_htrans,                      
  output  [31 :0]  biu_pad_hwdata,                      
  output           biu_pad_hwrite,                      
  output  [31 :0]  cp0_pad_mcause,                      
  output  [31 :0]  cp0_pad_mintstatus,                  
  output  [31 :0]  cp0_pad_mstatus,                     
  output           cpu_pad_dfs_ack,                     
  output           cpu_pad_lockup,                      
  output  [1  :0]  cpu_pad_soft_rst,                    
  output  [1  :0]  had_pad_jdb_pm,                      
  output           had_pad_jtg_tms_o,                   
  output           had_pad_jtg_tms_oe,                  

  //ar channel
  output                             axi_ar_valid            ,//indicates that the read address channel signals are valid
  input                              axi_ar_ready            ,//indicates that a transfer on the read address channel can be accepted
  output       [63:0]                axi_ar_addr             ,//the address of the first transfer in a read transaction
  output       [1:0]                 axi_ar_burst            ,//burst type, indicates how address changes between each transfer in a read transaction
  output       [3:0]                 axi_ar_cache            ,//indicates how a read tansaction is required to progress through a system
  output       [7:0]                 axi_ar_id               ,//identification tag for a read transaction
  output       [7:0]                 axi_ar_len              ,//length, the exact number of data transfers in a read transaction 
  output                             axi_ar_lock             ,//provides information about the atomic characteristics of a read transaction
  output       [2:0]                 axi_ar_prot             ,//protection attributes of a read transaction
  output       [2:0]                 axi_ar_size             ,//size, the number of bytes in each data transfer in a read transaction
 
  //r chanel
  input                              axi_r_valid             ,//indicates that the read data channel signals are valid
  output                             axi_r_ready             ,//indicates that a transfer on the read data channel can be accepted
  input        [63:0]                axi_r_data              ,//read data
  input        [7:0]                 axi_r_id                ,//identification tag for read data and response
  input                              axi_r_last              ,//indicates whether this is the last data transfer in a read transaction
  input        [1:0]                 axi_r_resp              ,//read reaponse, indicates the status of a read transfer
                             
  //aw channel                 
  output                             axi_aw_valid            ,//indicates that the write address channel signals are valid
  input                              axi_aw_ready            ,//indicates that a transfer on the write address channel can be accepted
  output       [63:0]                axi_aw_addr             ,//the address of the first transfer in a write transaction
  output       [1:0]                 axi_aw_burst            ,//burst type, indicates how address changes between each transfer in a write transaction
  output       [3:0]                 axi_aw_cache            ,//indicates how a write tansaction is required to progress through a system
  output       [7:0]                 axi_aw_id               ,//identification tag for a write transaction
  output       [7:0]                 axi_aw_len              ,//length, the exact number of data transfers in a write transaction 
  output                             axi_aw_lock             ,//provides information about the atomic characteristics of a write transaction
  output       [2:0]                 axi_aw_prot             ,//protection attributes of a write transaction
  output       [2:0]                 axi_aw_size             ,//size, the number of bytes in each data transfer in a write transaction
 
  //w channel
  output                             axi_w_valid             ,//indicates that the write data channel signals are valid
  input                              axi_w_ready             ,//indicates that a transfer on the read data channel can be accepted
  output       [63:0]                axi_w_data              ,//write data
  output       [7:0]                 axi_w_id                ,//identification tag for a write transaction
  output                             axi_w_last              ,//indicates whether this is the last data transfer in a write transaction
  output       [7:0]                 axi_w_strb              ,//write strobes,indicate which byte lanes hold valid data
 
  //b channel
  input                              axi_b_valid             ,//indicates that the write response channel signals are valid
  output                             axi_b_ready             ,//indicates that a transfer on the write response channel can be accepted
  input        [7:0]                 axi_b_id                ,//identification tag for a write response
  input        [1:0]                 axi_b_resp              ,//write reaponse, indicates the status of a write transaction

  output  [31 :0]  iu_pad_gpr_data,                     
  output  [4  :0]  iu_pad_gpr_index,                    
  output           iu_pad_gpr_we,                       
  output           iu_pad_inst_retire,                  
  output           iu_pad_inst_split,                   
  output  [31 :0]  iu_pad_retire_pc,                    
  output  [1  :0]  sysio_pad_lpmd_b                    

);







wire    [31 :0]  biu_pad_haddr;                       
wire    [2  :0]  biu_pad_hburst;                      
wire    [3  :0]  biu_pad_hprot;                       
wire    [2  :0]  biu_pad_hsize;                       
wire    [1  :0]  biu_pad_htrans;    
wire             biu_pad_hwrite;                      
wire    [31 :0]  biu_pad_hwdata; 
//assign           biu_pad_htrans = iahbl_pad_htrans;
//assign           biu_pad_hwrite = iahbl_pad_hwrite;
//assign           biu_pad_haddr = iahbl_pad_haddr  ;
//assign           biu_pad_hwdata = iahbl_pad_hwdata ;
wire             bmu_tcipif_dbus_acc_deny;            
wire    [31 :0]  bmu_tcipif_dbus_addr;                
wire             bmu_tcipif_dbus_chk_fail;            
wire             bmu_tcipif_dbus_req;                 
wire    [1  :0]  bmu_tcipif_dbus_size;                
wire             bmu_tcipif_dbus_supv_mode;           
wire    [31 :0]  bmu_tcipif_dbus_wdata;               
wire             bmu_tcipif_dbus_write;               
wire             bmu_tcipif_ibus_acc_deny;            
wire    [31 :0]  bmu_tcipif_ibus_addr;                
wire             bmu_tcipif_ibus_req;                 
wire             bmu_tcipif_ibus_write;               
wire             clic_cpu_int_hv;                     
wire    [11 :0]  clic_cpu_int_id;                     
wire    [7  :0]  clic_cpu_int_il;                     
wire    [1  :0]  clic_cpu_int_priv;                   
wire             clint_cpu_me_int;                    
wire             clk_en;                              
wire    [31 :0]  cp0_had_cpuid_idx0;                  
wire             cp0_had_int_exit;                    
wire    [1  :0]  cp0_had_lpmd_b;                      
wire    [31 :0]  cp0_had_mcause_data;                 
wire    [31 :0]  cp0_pad_mcause;                      
wire    [31 :0]  cp0_pad_mintstatus;                  
wire    [31 :0]  cp0_pad_mstatus;                     
wire             cp0_yy_be_v2;                        
wire    [1  :0]  cp0_yy_priv_mode;                    
wire    [11 :0]  cpu_clic_curid;                      
wire             cpu_clic_int_exit;                   
wire             cpu_pad_dfs_ack;                     
wire             cpu_pad_lockup;                      
wire    [1  :0]  cpu_pad_soft_rst;                    
wire             cpurst_b;                            
wire             forever_cpuclk;                      
wire             forever_cpuclk_nogated;              
wire             forever_jtgclk;                      
wire             had_core_dbg_mode_req;               
wire             had_core_exit_dbg;                   
wire    [31 :0]  had_idu_wbbr_data;                   
wire             had_idu_wbbr_vld;                    
wire             had_ifu_inst_bkpt_dbq_req;           
wire             had_ifu_inst_bkpt_dbqexp_req;        
wire    [31 :0]  had_ifu_ir;                          
wire             had_ifu_ir_vld;                      
wire             had_iu_bkpt_trace_en;                
wire             had_iu_dr_set_req;                   
wire             had_iu_force_dbg_en;                 
wire             had_iu_int_vld;                      
wire             had_iu_mbkpt_fsm_index_mbee;         
wire             had_iu_mem_bkpt_exp_req;             
wire             had_iu_mem_bkpt_mask;                
wire             had_iu_mem_bkpt_req;                 
wire    [30 :0]  had_iu_pc;                           
wire             had_iu_rte_pc_sel;                   
wire             had_iu_trace_req;                    
wire             had_iu_trace_req_for_dbg_disable;    
wire             had_iu_xx_fdb;                       
wire             had_iu_xx_jdbreq;                    
wire    [1  :0]  had_pad_jdb_pm;                      
wire             had_pad_jtg_tms_o;                   
wire             had_pad_jtg_tms_oe;                  
wire             had_tcipif_cmplt;                    
wire    [31 :0]  had_tcipif_rdata;                    
wire             had_yy_xx_dbg;                       
wire             had_yy_xx_dp_index_mbee;             
wire             hadrst_b;                            
wire    [31 :0]  iahbl_pad_haddr;                     
wire    [2  :0]  iahbl_pad_hburst;                    
wire    [3  :0]  iahbl_pad_hprot;                     
wire    [2  :0]  iahbl_pad_hsize;                     
wire    [1  :0]  iahbl_pad_htrans;                    
wire    [31 :0]  iahbl_pad_hwdata;                    
wire             iahbl_pad_hwrite;                    
wire             ifu_had_chg_flw_inst;                
wire             ifu_had_fetch_expt_vld;              
wire             ifu_had_inst_dbg_disable;            
wire    [31 :0]  ifu_had_match_pc;                    
wire             ifu_had_split_first;                 
wire             iu_had_adr_dbg_ack;                  
wire    [31 :0]  iu_had_chgflw_dst_pc;                
wire             iu_had_chgflw_vld;                   
wire             iu_had_data_bkpt_occur_vld;          
wire             iu_had_dbg_disable_for_tee;          
wire             iu_had_dr_dbg_ack;                   
wire             iu_had_expt_vld;                     
wire             iu_had_fast_retire_acc_err_pc_update; 
wire    [30 :0]  iu_had_fast_retire_acc_err_pc_val;   
wire             iu_had_flush;                        
wire             iu_had_inst_bkpt_occur_vld;          
wire             iu_had_int_ack;                      
wire             iu_had_retire_with_had_int;          
wire             iu_had_trace_occur_vld;              
wire             iu_had_xx_bkpt_inst;                 
wire    [31 :0]  iu_had_xx_data;                      
wire             iu_had_xx_data_vld;                  
wire             iu_had_xx_dbg_ack;                   
wire             iu_had_xx_mldst;                     
wire             iu_had_xx_retire;                    
wire             iu_had_xx_retire_normal;             
wire    [31 :0]  iu_had_xx_retire_pc;                 
wire    [31 :0]  iu_pad_gpr_data;                     
wire    [4  :0]  iu_pad_gpr_index;                    
wire             iu_pad_gpr_we;                       
wire             iu_pad_inst_retire;                  
wire             iu_pad_inst_split;                   
wire    [31 :0]  iu_pad_retire_pc;                    
wire             iu_yy_xx_dbgon;                      
wire    [31 :0]  lsu_had_addr;                        
wire             lsu_had_addr_vld;                    
wire             lsu_had_ex_cmplt;                    
wire             lsu_had_st;                          
wire    [31 :0]  pad_biu_hrdata;                      
wire             pad_biu_hready;                      
wire             pad_biu_hresp;                       
wire    [11 :0]  pad_bmu_iahbl_base;                  
wire    [11 :0]  pad_bmu_iahbl_mask;                  
wire    [127:0]  pad_clic_int_vld;                    
wire             pad_cpu_dfs_req;                     
wire             pad_cpu_ext_int_b;                   
wire             pad_cpu_nmi;                         
wire    [31 :0]  pad_cpu_rst_addr;                    
wire             pad_cpu_rst_b;                       
wire    [63 :0]  pad_cpu_sys_cnt;                     
wire             pad_cpu_wakeup_event;                
wire             pad_had_jtg_tclk;                    
wire             pad_had_jtg_tms_i;                   
wire             pad_had_jtg_trst_b;                  
wire             pad_had_rst_b;                       
wire    [31 :0]  pad_iahbl_hrdata;                    
wire             pad_iahbl_hready;                    
wire             pad_iahbl_hresp;                     
wire             pad_sysio_dbgrq_b;                   
wire             pad_yy_gate_clk_en_b;                
wire             pad_yy_test_mode;                    
wire             pll_core_cpuclk;                     
wire             pwrm_cpu_bus_peak_power_limit_en;    
wire             sysio_clint_me_int;                  
wire    [63 :0]  sysio_clint_mtime;                   
wire             sysio_had_sdb_req_b;                 
wire    [1  :0]  sysio_pad_lpmd_b;                    
wire    [31 :0]  tcip_cp0_clic_base;                  
wire             tcipif_bmu_dbus_acc_err;             
wire    [31 :0]  tcipif_bmu_dbus_data;                
wire             tcipif_bmu_dbus_data_vld;            
wire             tcipif_bmu_dbus_grnt;                
wire             tcipif_bmu_dbus_trans_cmplt;         
wire             tcipif_bmu_ibus_acc_err;             
wire    [31 :0]  tcipif_bmu_ibus_data;                
wire             tcipif_bmu_ibus_data_vld;            
wire             tcipif_bmu_ibus_grnt;                
wire             tcipif_bmu_ibus_trans_cmplt;         
wire    [15 :0]  tcipif_had_addr;                     
wire             tcipif_had_sel;                      
wire    [31 :0]  tcipif_had_wdata;                    
wire             tcipif_had_write;                    
wire             trst_b;                              



//add signals in lausanne_core
//gpr
wire              jtag_gpr_we;
wire  [4:0]       jtag_gpr_addr;
wire  [31:0]      jtag_gpr_wdata;
wire  [31:0]      gpr_jtag_rdata;
//control 
wire              jtag_ctrl_halt_req;
wire              jtag_ctrl_reset_req;
//csr
wire              jtag_csr_ena;
wire              jtag_csr_we;
wire  [11:0]      jtag_csr_idx;
wire  [31:0]      jtag_csr_wdata;
wire  [31:0]      csr_jtag_rdata;
//biu
wire              jtag2icb_cmd_valid;
wire              jtag2icb_cmd_ready;
wire  [31:0]      jtag2icb_cmd_addr ;
wire              jtag2icb_cmd_read ;
wire  [31:0]      jtag2icb_cmd_wdata;
wire  [3:0]       jtag2icb_cmd_wmask;
wire              jtag2icb_rsp_valid;
wire              jtag2icb_rsp_ready;
wire  [31:0]      jtag2icb_rsp_rdata;
wire              jtag2icb_rsp_err  ;
//interrupt
wire              jtag_int_irq;
wire              int_jtag_ebreak;
/*
//jtag module 
  jtag_top  u0_jtag(
  .clk      (forever_cpuclk),
  .rstn     (cpurst_b ),
  .jtag_pin_tck (jtag_pin_tck),
  .jtag_pin_tms (jtag_pin_tms),
  .jtag_pin_tdo (jtag_pin_tdo),
  .jtag_pin_tdi (jtag_pin_tdi),
  .jtag_pin_trst (jtag_pin_trst),
  .jtag2icb_cmd_valid (jtag2icb_cmd_valid),
  .jtag2icb_cmd_ready (jtag2icb_cmd_ready),
  .jtag2icb_cmd_addr  (jtag2icb_cmd_addr),
  .jtag2icb_cmd_read  (jtag2icb_cmd_read),
  .jtag2icb_cmd_wdata (jtag2icb_cmd_wdata),
  .jtag2icb_cmd_wmask (jtag2icb_cmd_wmask),
  .jtag2icb_rsp_valid (jtag2icb_rsp_valid),
  .jtag2icb_rsp_ready (jtag2icb_rsp_ready),
  .jtag2icb_rsp_rdata (jtag2icb_rsp_rdata),
  .jtag2icb_rsp_err   (jtag2icb_rsp_err),
  .jtag_int_irq       (jtag_int_irq),
  .int_jtag_ebreak    (int_jtag_ebreak),
  .jtag_gpr_we        (jtag_gpr_we  ),
  .jtag_gpr_addr      (jtag_gpr_addr),
  .jtag_gpr_wdata     (jtag_gpr_wdata),
  .gpr_jtag_rdata     (gpr_jtag_rdata),
  .jtag_ctrl_halt_req  ( jtag_ctrl_halt_req),
  .jtag_ctrl_reset_req ( jtag_ctrl_reset_req),
  .jtag_csr_ena        (jtag_csr_ena  ),
  .jtag_csr_we         (jtag_csr_we   ),
  .jtag_csr_idx        (jtag_csr_idx  ),
  .jtag_csr_wdata      (jtag_csr_wdata),
  .csr_jtag_rdata      (csr_jtag_rdata)
  );
*/
  wire [31 :0]           int_csr_ecause     ; //update data of mcause csr
  wire [31 :0]           int_csr_epc        ; //update data of mepc csr
  wire                   int_csr_ena        ; //updata data enable signal, start interrupt
  wire                   int_csr_mret       ; //end od interrupt
  wire [2 :0]            int_csr_dcause     ; //update data of dcsr csr
  wire [31 :0]           int_csr_dpc        ; //updata data of dpc
  wire                   int_csr_dena       ; //update data enable signal of debug csr
  wire                   external_int       ; //uart,gopio intrrupt
  wire                   timer_int          ; //timer interrupt
  wire                   soft_int           ; //software interrupt  
  wire                   csr_int_mie        ; //value of mie in mstatus csr
  wire                   csr_int_meie       ; //value of meie in mie csr
  wire                   csr_int_mtie       ; //value of mtie in mie csr
  wire                   csr_int_msie       ; //value of msie in mie csr
  wire[31 :0]            csr_int_mtvec      ; //value of mtvec csr
  wire[31 :0]            csr_int_epc        ; //value of mepc csr
  wire[31 :0]            csr_int_counterstop;

  wire                   ctrl_int_ready    ;   
  wire                   ctrl_int_valid    ;
  wire                   ctrl_lsu_ls       ;
  wire                   int_ctrl_pcen     ;
  wire[31:0]             int_ctrl_mtvec    ;
  wire[31:0]             ctrl_int_epc      ;
  wire                   ctrl_int_ebreak   ;
  wire                   ctrl_int_mret     ;
  wire[31:0]             int_ctrl_epc      ;
  wire                   int_ctrl_flush_req;
  wire                   int_biu_hready    ;
  wire                   ctrl_int_ecall    ;
//
/*interrupt
  int_top     u2_int_top(
  .clk                 ( forever_cpuclk            ),
  .rstn                ( cpurst_b        ),
  .biu_int_haddr       ( biu_int_haddr   ),
  .biu_int_hwdata      ( biu_int_hwdata  ),
  .biu_int_hwrite      ( biu_int_hwrite  ),
  .biu_int_htrans      ( biu_int_htrans  ),
  .biu_int_hsize       ( biu_int_hsize   ),
  .biu_int_hburst      ( biu_int_hburst  ),
  .biu_int_hsel        ( biu_int_hsel    ), 
  .biu_int_hready      ( biu_int_hready  ),
  .int_biu_hrdata      ( int_biu_hrdata  ),
  .int_biu_hresp       ( int_biu_hresp   ),
  .int_biu_hreadyout   ( int_biu_hready  ),           
  .int_ctrl_flush_req  (int_ctrl_flush_req),
  .jtag_irq            ( jtag_int_irq         ),
  .int_jtag_ebreak     ( int_jtag_ebreak ),
  .counterstop         ( csr_int_counterstop   ),
  .int_csr_ext         ( external_int   ),
  .int_csr_tmr         ( timer_int    ),
  .int_csr_sft         ( soft_int   ),
  .csr_int_meip        ( csr_int_meie  ),
  .csr_int_msip        ( csr_int_msie  ),
  .csr_int_mtip        ( csr_int_mtie  ),
  .csr_int_mie         ( csr_int_mie   ),
  .csr_int_epc         ( csr_int_epc   ),
  .csr_int_mtvec       ( csr_int_mtvec ),
  .int_csr_epc         ( int_csr_epc   ),
  .int_csr_ecause      ( int_csr_ecause),
  .int_csr_ena         ( int_csr_ena   ),
  .int_csr_dpc         ( int_csr_dpc   ),
  .int_csr_dena        ( int_csr_dena  ),
  .int_csr_dcause      ( int_csr_dcause),
  .int_csr_mret        ( int_csr_mret  ),
  .ctrl_int_ready      ( ctrl_int_ready   ),
  .ctrl_int_valid      ( ctrl_int_valid   ),
  .ctrl_int_ebreak     ( ctrl_int_ebreak  ),
  .ctrl_int_mret       ( ctrl_int_mret    ),
  .ctrl_int_epc        ( ctrl_int_epc     ),
  .trigger             ( trigger          ),
  .int_ctrl_pcen       ( int_ctrl_pcen    ),
  .int_ctrl_epc        ( int_ctrl_epc     ),
  .int_ctrl_mtvec      ( int_ctrl_mtvec   ),
  .int_ctrl_epc        ( int_ctrl_epc     ),
  .ext_plic_irq        ( ext_plic_irq     ),
  .ctrl_int_ecall      ( ctrl_int_ecall   )
  );
*/

automan_core u_automan_core_1(
//=================CLOCK and RESET=============================================
  .clk                                  (pll_core_cpuclk           ),
  .rstn                                 (pad_cpu_rst_b             ),
//=================WITH JTAG===================================================
  //transmission with gpr------------------------------------------------------
  .jtag_gpr_we                          (jtag_gpr_we                    ),//jtag read and write operation to gpr   i
  .jtag_gpr_addr                        (jtag_gpr_addr                  ),//write address to gpr                   i
  .jtag_gpr_wdata                       (jtag_gpr_wdata                 ),//write data to gpr                      i
  .gpr_jtag_rdata                       (gpr_jtag_rdata                 ),//gpr return read data to jtag           o
  //transmission with csr------------------------------------------------------
  .jtag_csr_ena                         (1'b0                           ),//operation enable to csr                i
  .jtag_csr_we                          (jtag_csr_we                    ),//jtag write enable to csr               i
  .jtag_csr_idx                         (jtag_csr_idx                   ),//                                       i  
  .jtag_csr_wdata                       (jtag_csr_wdata                 ),//                                       i
  .csr_jtag_rdata                       (csr_jtag_rdata                 ),//                                       o
  //transmission with control--------------------------------------------------
  .jtag_ctrl_reset_req                  (jtag_ctrl_reset_req            ),//                                       i
  .jtag_ctrl_halt_req                   (jtag_ctrl_halt_req             ),//                                       i 
  //transmission with biu module ----------------------------------------------
  .jtag2icb_cmd_valid                   (1'b0                           ),//handshake signal from jtag             o
  .jtag2icb_cmd_ready                   (jtag2icb_cmd_ready             ),//handshake signal to jtag               i
  .jtag2icb_cmd_addr                    (jtag2icb_cmd_addr              ),//address from jtag                      o
  .jtag2icb_cmd_read                    (jtag2icb_cmd_read              ),//read enable                            o
  .jtag2icb_cmd_wdata                   (jtag2icb_cmd_wdata             ),//data from jtag                         o
  .jtag2icb_cmd_wmask                   (jtag2icb_cmd_wmask             ),//                                       o
  .jtag2icb_rsp_valid                   (jtag2icb_rsp_valid             ),//handshake                              i
  .jtag2icb_rsp_ready                   (jtag2icb_rsp_ready             ),//handhaske                              o
  .jtag2icb_rsp_rdata                   (jtag2icb_rsp_rdata             ),//                                       o
  .jtag2icb_rsp_err                     (jtag2icb_rsp_err               ),//                                       o 
//======================WITH BIU===============================================
  //ar channel
  .axi_ar_valid                    ( axi_ar_valid              ),//indicates that the read address channel signals are valid
  .axi_ar_ready                    ( axi_ar_ready              ),//indicates that a transfer on the read address channel can be accepted
  .axi_ar_addr                     ( axi_ar_addr               ),//the address of the first transfer in a read transaction
  .axi_ar_burst                    ( axi_ar_burst              ),//burst type, indicates how address changes between each transfer in a read transaction
  .axi_ar_cache                    ( axi_ar_cache              ),//indicates how a read tansaction is required to progress through a system
  .axi_ar_id                       ( axi_ar_id                 ),//identification tag for a read transaction
  .axi_ar_len                      ( axi_ar_len                ),//length, the exact number of data transfers in a read transaction 
  .axi_ar_lock                     ( axi_ar_lock               ),//provides information about the atomic characteristics of a read transaction
  .axi_ar_prot                     ( axi_ar_prot               ),//protection attributes of a read transaction
  .axi_ar_size                     ( axi_ar_size               ),//size, the number of bytes in each data transfer in a read transaction
  //r chanel
  .axi_r_valid                     ( axi_r_valid               ),//indicates that the read data channel signals are valid
  .axi_r_ready                     ( axi_r_ready               ),//indicates that a transfer on the read data channel can be accepted
  .axi_r_data                      ( axi_r_data                ),//read data
  .axi_r_id                        ( axi_r_id                  ),//identification tag for read data and response
  .axi_r_last                      ( axi_r_last                ),//indicates whether this is the last data transfer in a read transaction
  .axi_r_resp                      ( axi_r_resp                ),//read reaponse, indicates the status of a read transfer
  //aw channel                                         
  .axi_aw_valid                    ( axi_aw_valid              ),//indicates that the write address channel signals are valid
  .axi_aw_ready                    ( axi_aw_ready              ),//indicates that a transfer on the write address channel can be accepted
  .axi_aw_addr                     ( axi_aw_addr               ),//the address of the first transfer in a write transactionad_awburst            ,//burst type, indicates how address changes between each transfer in a write transaction
  .axi_aw_burst                    ( axi_aw_burst              ),
  .axi_aw_cache                    ( axi_aw_cache              ),//indicates how a write tansaction is required to progress through a system
  .axi_aw_id                       ( axi_aw_id                 ),//identification tag for a write transaction
  .axi_aw_len                      ( axi_aw_len                ),//length, the exact number of data transfers in a write transaction 
  .axi_aw_lock                     ( axi_aw_lock               ),//provides information about the atomic characteristics of a write transaction
  .axi_aw_prot                     ( axi_aw_prot               ),//protection attributes of a write transaction
  .axi_aw_size                     ( axi_aw_size               ),//size, the number of bytes in each data transfer in a write transaction
  //w channel                                          
  .axi_w_valid                     ( axi_w_valid               ),//indicates that the write data channel signals are valid
  .axi_w_ready     		            ( axi_w_ready               ),//indicates that a transfer on the read data channel can be accepted
  .axi_w_data                      ( axi_w_data                ),//write data
  .axi_w_id                        ( axi_w_id                  ),//identification tag for a write transaction
  .axi_w_last                      ( axi_w_last                ),//indicates whether this is the last data transfer in a write transaction
  .axi_w_strb                      ( axi_w_strb                ),//write strobes,indicate which byte lanes hold valid data
  //b channel                                          
  .axi_b_valid                     ( axi_b_valid               ),//indicates that the write response channel signals are valid
  .axi_b_ready                     ( axi_b_ready               ),//indicates that a transfer on the write response channel can be accepted
  .axi_b_id                        ( axi_b_id                  ),//identification tag for a write response
  .axi_b_resp		                  ( axi_b_resp                ),//write reaponse, indicates the status of a write transaction
//======================WITH INTERRUPT=========================================
  .trigger    			                  ( trigger                      ),
  .ext_plic_irq         	            (32'b0                         ) 
);








cr_clkrst_top  x_cr_clkrst_top (
  .cpurst_b               (cpurst_b              ),
  .forever_cpuclk         (forever_cpuclk        ),
  .forever_cpuclk_nogated (forever_cpuclk_nogated),
  .forever_jtgclk         (forever_jtgclk        ),
  .hadrst_b               (hadrst_b              ),
  .pad_cpu_rst_b          (pad_cpu_rst_b         ),
  .pad_had_jtg_tclk       (pad_had_jtg_tclk      ),
  .pad_had_jtg_trst_b     (pad_had_jtg_trst_b    ),
  .pad_had_rst_b          (pad_had_rst_b         ),
  .pad_yy_test_mode       (pad_yy_test_mode      ),
  .pll_core_cpuclk        (pll_core_cpuclk       ),
  .trst_b                 (trst_b                )
);




endmodule



module cr_rst_top(
  cpurst_b,
  hadrst_b,
  pad_cpu_rst_b,
  pad_had_jtg_trst_b,
  pad_had_rst_b,
  pad_yy_test_mode,
  trst_b
);


input        pad_cpu_rst_b;     
input        pad_had_jtg_trst_b; 
input        pad_had_rst_b;     
input        pad_yy_test_mode;  
output       cpurst_b;          
output       hadrst_b;          
output       trst_b;            




wire         cpurst_b;          
wire         hadrst_b;          
wire         pad_cpu_rst_b;     
wire         pad_had_jtg_trst_b; 
wire         pad_had_rst_b;     
wire         pad_yy_test_mode;  
wire         trst_b;            



assign cpurst_b = pad_yy_test_mode ? pad_had_jtg_trst_b : pad_cpu_rst_b;



assign hadrst_b = pad_yy_test_mode ? pad_had_jtg_trst_b : pad_had_rst_b;

assign trst_b = pad_had_jtg_trst_b;


endmodule