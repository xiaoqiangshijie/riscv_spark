//-----------------------------------------------------------------------------
//This confidential and proprietary software may be used only used as
//by a licensing aggrement from Orbbec Inc.
//In the event of publication ,the following notice is applicable:
//(C)COPYRIGHT 2013 ORBBEC INC.ALL RIGHTS RESERVED.
//The entire notice ablove must be reproduced on all authorized copies
//-----------------------------------------------------------------------------
//File          :automan_core.v
//Author        :lihua
//Date          :08/29/2021
//Version       :0.1
//Description   :This file is top level of AutoMan risc-v project
//SRAM:0X8000_0000
//ITCM:0Xa000_0000
//DTCM:0Xb000_0000
//INT :0X9000_0000
//-----------------------------------------------------------------------------
//Modification History:
//Date          By          Version         Change Description 
//08/29/2021    lihua        0.1             Original
//-----------------------------------------------------------------------------

module  automan_core
#(
  parameter   GPR_ADW    =  5  ,  
  parameter   GPR_DW     =  64 , 
  parameter   CSR_DW     =  64 ,  
  parameter   CSR_ADW    =  12 ,  
  parameter   MASK_DW    =  8  , 
  parameter   PC_DW      =  64 ,
  parameter   ADDR_DW    =  64 ,
  parameter   MEM_ADW    =  64 ,
  parameter   ITCM_DW    =  32 ,
  parameter   EXT_IRQ_NUM=  31 ,
  parameter   PRIO_WIDTH =  3  ,
  parameter   INS_DW     =  32 
//  parameter   LSU_DW    
//  parameter   LSU_ADW    =  32
)(  
//=================CLOCK and RESET=============================================
  input                             clk     ,
  input                             rstn    ,

//=================WITH JTAG===================================================
  //transmission with gpr------------------------------------------------------
  input                         jtag_gpr_we     ,//jtag read and write operation to gpr
  input [GPR_ADW-1:0]           jtag_gpr_addr   ,//write address to gpr
  input [GPR_DW -1:0]           jtag_gpr_wdata  ,//write daat to gpr
  output[GPR_DW -1:0]           gpr_jtag_rdata  ,//gpr return read data to jtag 
  //transmission with csr------------------------------------------------------
  input                         jtag_csr_ena       ,//operation enable to csr
  input                         jtag_csr_we        ,//jtag write enable to csr 
  input [CSR_ADW-1:0]           jtag_csr_idx       ,
  input [CSR_DW -1:0]           jtag_csr_wdata     ,
  output[CSR_DW -1:0]           csr_jtag_rdata     ,
  //transmission with control--------------------------------------------------
  input                         jtag_ctrl_reset_req,
  input                         jtag_ctrl_halt_req ,
  //transmission with biu module ----------------------------------------------
  input                         jtag2icb_cmd_valid,//handshake signal from jtag
  output                        jtag2icb_cmd_ready,//handshake signal to jtag
  input [ADDR_DW-1:0]           jtag2icb_cmd_addr ,//address from jtag 
  input                         jtag2icb_cmd_read ,//read enable 
  input [CSR_DW -1:0]           jtag2icb_cmd_wdata,//data from jtag
  input [        3:0]           jtag2icb_cmd_wmask,
  output                        jtag2icb_rsp_valid,//handshake
  input                         jtag2icb_rsp_ready,//handhaske
  output[GPR_DW- 1:0]           jtag2icb_rsp_rdata,
  output                        jtag2icb_rsp_err  ,
//======================WITH BIU===============================================
  //ar channel
  output                        axi_ar_valid      ,//indicates that the read address channel signals are valid
  input                         axi_ar_ready      ,//indicates that a transfer on the read address channel can be accepted
  output       [ADDR_DW-1:0]    axi_ar_addr       ,//the address of the first transfer in a read transaction
  output       [1:0]            axi_ar_burst      ,//burst type, indicates how address changes between each transfer in a read transaction
  output       [3:0]            axi_ar_cache      ,//indicates how a read tansaction is required to progress through a system
  output       [7:0]            axi_ar_id         ,//identification tag for a read transaction
  output       [7:0]            axi_ar_len        ,//length, the exact number of data transfers in a read transaction 
  output                        axi_ar_lock       ,//provides information about the atomic characteristics of a read transaction
  output       [2:0]            axi_ar_prot       ,//protection attributes of a read transaction
  output       [2:0]            axi_ar_size       ,//size, the number of bytes in each data transfer in a read transaction
  
  output       [3:0]            axi_ar_qos        ,
  output       [3:0]            axi_ar_region     ,
  output                        axi_ar_user       ,  
  //r chanel
  input                         axi_r_valid       ,//indicates that the read data channel signals are valid
  output                        axi_r_ready       ,//indicates that a transfer on the read data channel can be accepted
  input        [63:0]           axi_r_data        ,//read data
  input        [7:0]            axi_r_id          ,//identification tag for read data and response
  input                         axi_r_last        ,//indicates whether this is the last data transfer in a read transaction
  input        [1:0]            axi_r_resp        ,//read reaponse, indicates the status of a read transfer
  input                         axi_r_user        , 
                                
  //aw channel                 
  output                        axi_aw_valid      ,//indicates that the write address channel signals are valid
  input                         axi_aw_ready      ,//indicates that a transfer on the write address channel can be accepted
  output       [ADDR_DW-1  :0]  axi_aw_addr       ,//the address of the first transfer in a write transaction
  output       [1:0]            axi_aw_burst      ,//burst type, indicates how address changes between each transfer in a write transaction
  output       [3:0]            axi_aw_cache      ,//indicates how a write tansaction is required to progress through a system
  output       [7:0]            axi_aw_id         ,//identification tag for a write transaction
  output       [7:0]            axi_aw_len        ,//length, the exact number of data transfers in a write transaction 
  output                        axi_aw_lock       ,//provides information about the atomic characteristics of a write transaction
  output       [2:0]            axi_aw_prot       ,//protection attributes of a write transaction
  output       [2:0]            axi_aw_size       ,//size, the number of bytes in each data transfer in a write transaction
  output       [3:0]            axi_aw_qos        ,
  output       [3:0]            axi_aw_region     ,
  output                        axi_aw_user       ,
  //w channel
  output                        axi_w_valid       ,//indicates that the write data channel signals are valid
  input                         axi_w_ready       ,//indicates that a transfer on the read data channel can be accepted
  output       [63:0]           axi_w_data        ,//write data
  output                        axi_w_last        ,//indicates whether this is the last data transfer in a write transaction
  output       [7:0]            axi_w_strb        ,//write strobes,indicate which byte lanes hold valid data
  output                        axi_w_user        , 

  //b channel
  input                         axi_b_valid       ,//indicates that the write response channel signals are valid
  output                        axi_b_ready       ,//indicates that a transfer on the write response channel can be accepted
  input        [7:0]            axi_b_id          ,//identification tag for a write response
  input        [1:0]            axi_b_resp        ,//write reaponse, indicates the status of a write transaction
  input                         axi_b_user        ,
  //======================WITH INTERRUPT=========================================
  input                         trigger           ,
  input   [EXT_IRQ_NUM:0]       ext_plic_irq               
);

//----------------------declare --------------------------------//

//CTRL
wire                    ctrl_pc_stall           ; //Suspend the PC module pipeline
wire                    ctrl_ifu_stall          ; //Suspend the IFU module pipeline
wire                    ctrl_ifu_flush          ;
wire  [PC_DW-1:0]       ctrl_ifu_pc             ;
wire                    ctrl_ifu_pc_vld         ;
wire                    ctrl_de_stall           ; //Suspend the DE  module pipeline
wire                    ctrl_de_flush           ;
wire                    ctrl_alu_stall          ;
wire                    ctrl_alu_flush          ;
wire                    ctrl_mul_flush          ;
wire                    ctrl_div_flush          ;

//BPU
wire [PC_DW-1:0]        bpu_ifu_next_pc         ;
wire                    ifu_bpu_hit_vld         ;

//IFU
wire                    ifu2icache_cmd_valid    ;
wire                    ifu2icache_cmd_ready    ;
wire  [MEM_ADW-1:0]     ifu2icache_cmd_addr     ;
wire                    ifu2icache_cmd_read     ; //1'b1
wire  [INS_DW  -1:0]    ifu2icache_cmd_wdata    ; //useless
wire  [        3:0]     ifu2icache_cmd_wmask    ; //4'b1111
wire                    ifu2icache_rsp_valid    ;
wire                    ifu2icache_rsp_ready    ; //1'b1
wire  [INS_DW -1:0]     ifu2icache_rsp_rdata    ;
wire                    ifu2icache_rsp_err      ;
wire  [INS_DW-1:0]      ifu_de_inst             ;
wire                    ifu_de_inst_vld         ;
wire  [PC_DW-1:0]       ifu_de_pc               ;
wire                    ifu_ctrl_cmd_valid      ;
wire                    ifu_ctrl_cmd_ready      ;
wire  [PC_DW-1:0]       ifu_ctrl_cmd_addr       ;
wire  [PC_DW-1:0]       ifu_ctrl_jump_pc        ;
wire  [PC_DW-1:0]       ifu_de_npc              ;
wire  [PC_DW-1:0]       ifu_bpu_addr            ;
wire                    ifu_bpu_vaild           ;

//ICACHE
wire                    icache2icb_cmd_valid    ;       
wire [ADDR_DW-1:0]      icache2icb_cmd_addr     ;       
wire                    icache2icb_cmd_read     ;       
wire [     64-1:0]      icache2icb_cmd_wdata    ;       
wire [3:0]              icache2icb_cmd_wmask    ;       
wire                    icache2icb_rsp_ready    ;       
wire                    icache2icb_cmd_ready    ;
wire                    icache2icb_rsp_valid    ;
wire [63:0]             icache2icb_rsp_rdata    ; 
wire                    icache2icb_rsp_err      ;


//DE
wire [PC_DW-1:0]        de_alu_npc              ;
wire                    de_alu_inst_vld         ;
wire                    de_alu_wb_vld           ;
wire                    de_alu_reg2_flag        ; //1 represetns operation is x[rs2]
wire                    de_alu_lui_flag         ; //lui operation valid
wire                    de_alu_shift_flag       ; //shift operation valid
wire                    de_alu_shift_right_flag ; //1:shift right,0:shift left
wire                    de_alu_shift_logic_flag ; //1 is logic shift,0 is        
wire                    de_alu_iw_en_flag       ;
wire [1:0]              de_alu_comp_flag        ; //1 represents comparator operation is valid
wire                    de_alu_and_flag         ; //1 represents and operation is valid
wire                    de_alu_or_flag          ; //
wire                    de_alu_xor_flag         ; //
wire                    de_alu_adder_flag       ; //1 represents adder operation is valid
wire                    de_alu_sub_flag         ; //1 represents substraction operation is valid
wire                    de_alu_auipc_flag       ; //1 represents auipc operation is valid
wire [3:0]              de_alu_ls_type          ; //beq001,bne010,blt011,bge100,bltu101,bgeu110
wire [GPR_DW-1:0]       de_alu_imm              ;
wire [2:0]              de_alu_con_jmp_type     ;
wire [1:0]              de_alu_ucon_jmp_type    ;
wire [2:0]              de_alu_csr_type         ;
wire [PC_DW-1:0]        de_alu_pc               ;
wire [1:0]              de_alu_fence_type       ;
wire [GPR_ADW-1:0]      de_alu_rd_idx           ;
wire [CSR_ADW-1:0]      de_alu_csr_idx          ;          
wire [CSR_ADW-1:0]      de_csr_rd_idx           ;         
wire                    de_csr_rd_vld           ;         
wire                    de_oitf_inst_vld_ori    ;
wire                    de_oitf_inst_vld        ;
wire                    de_oitf_csr             ;
wire                    de_oitf_special         ;
wire                    de_oitf_mul             ;
wire                    de_oitf_div             ;
wire                    de_oitf_load            ;
wire [4:0]              de_oitf_rs1_idx         ;
wire [4:0]              de_oitf_rs2_idx         ;
wire [4:0]              de_oitf_rd_idx          ;
wire                    de_oitf_rs1en           ;
wire                    de_oitf_rs2en           ;
wire                    de_oitf_wen             ;
wire [CSR_ADW-1:0]      de_oitf_csr_idx         ;
wire [4:0]              de_gpr_reg1_raddr       ;
wire [4:0]              de_gpr_reg2_raddr       ;
wire                    de_gpr_reg1_rdvld       ;
wire                    de_gpr_reg2_rdvld       ;
wire                    de_mul_inst_vld         ; 
wire [2:0]              de_mul_type             ; 
wire [4:0]              de_mul_rd_idx           ; 
wire                    de_div_inst_vld         ;
wire [3:0]              de_div_type             ;
wire [4:0]              de_div_rd_idx           ;
wire                    de_div_b2b              ;
wire [4:0]              de_bypass_rs1_idx       ;
wire [4:0]              de_bypass_rs2_idx       ;
wire                    de_int_ebreak           ;
wire                    de_int_ecall            ;
wire                    de_int_mret             ;
wire                    de_int_misa             ;
wire                    de_int_memerr           ;
wire                    de_int_illegal          ;
wire [INS_DW-1:0]       de_int_illegal_inst     ;
wire [INS_DW-1:0]       de_rob_inst             ; 
wire                    de_rob_inst_vld         ; 
wire [PC_DW-1:0]        de_rob_pc               ; 
wire [4:0]              de_rob_gpr_idx          ; 
wire [11:0]             de_rob_csr_idx          ; 
wire                    de_rob_alu              ; 
wire                    de_rob_csr              ; 
wire                    de_rob_mul              ; 
wire                    de_rob_div              ; 
wire                    de_rob_mret_alu_specail_cmt;//only for difftest
wire                    de_rob_load             ; 
wire [2:0]              de_alu_predict_jmp_type ;

//ALU
wire                    alu_bpu_wr_req          ;
wire [PC_DW-1:0]        alu_bpu_wr_pc           ;
wire [2:0]              alu_bpu_wr_type         ;
wire [PC_DW-1:0]        alu_bpu_wr_predict_pc   ;
wire                    alu_bpu_wr_predict_taken;
wire                    alu_bpu_jump_en         ;
wire                    alu_ctrl_jump_en        ;
wire                    alu_ctrl_fence_i        ;
wire                    alu_bypass_vld          ;     
wire  [GPR_DW-1:0]      alu_bypass_data         ;     
wire  [4:0]             alu_bypass_rd_idx       ;     
wire                    alu_bypass_vld_1d       ;     
wire  [GPR_DW-1:0]      alu_bypass_data_1d      ;     
wire  [4:0]             alu_bypass_rd_idx_1d    ;     
wire                    alu_wb_gpr_vld          ;
wire [GPR_DW-1:0]       alu_wb_gpr_wdata        ;
wire [4:0]              alu_wb_gpr_rd_idx       ;
wire                    alu_wb_csr_vld          ;
wire [CSR_DW-1:0]       alu_wb_csr_wdata        ;
wire [11:0]             alu_wb_csr_rd_idx       ;
wire                    alu_lsu_vld             ;
wire [ADDR_DW-1:0]      alu_lsu_addr            ;
wire [GPR_DW-1:0]       alu_lsu_wdata           ;
wire [3:0]              alu_lsu_ls_type         ;
wire                    alu_lsu_wen             ;
wire [4:0]              alu_lsu_rd_idx          ;
wire [PC_DW-1:0]        alu_ifu_pc              ;
wire                    alu_ifu_pc_vld          ;
wire [PC_DW-1:0]        alu_rob_flush_pc        ;
wire                    alu_int_vld             ;
wire [PC_DW-1:0]        alu_int_pc              ;
wire                    alu_int_beq             ;
wire                    alu_int_l_misa          ;
wire                    alu_int_s_misa          ;
wire [ADDR_DW-1:0]      alu_int_ls_addr         ;
wire                    alu_oitf_csr_cmt_flag   ;
wire                    alu_oitf_csr_flush_flag ;
wire                    alu_oitf_load_flush_flag;
wire                    alu_rob_alu_flush       ;     
wire                    alu_rob_load_flush      ;     
wire                    alu_rob_csr_flush       ;     
wire                    alu_rob_special_cmt     ;

//MUL
wire                    mul_bypass_vld          ;
wire [63:0]             mul_bypass_data         ;
wire [ 4:0]             mul_bypass_rd_idx       ;
wire                    mul_bypass_vld_1d       ;
wire [63:0]             mul_bypass_data_1d      ;
wire [ 4:0]             mul_bypass_rd_idx_1d    ;
wire                    mul_wb_vld              ;
wire [63:0]             mul_wb_data             ;
wire [ 4:0]             mul_wb_rd_idx           ;
wire                    mul_oitf_cmt_flag       ;
wire                    mul_oitf_flush_flag     ;
wire                    mul_rob_flush           ;

//DIV
wire                    div_bypass_vld          ;
wire [63:0]             div_bypass_data         ;
wire [ 4:0]             div_bypass_rd_idx       ;
wire                    div_bypass_vld_1d       ;
wire [63:0]             div_bypass_data_1d      ;
wire [ 4:0]             div_bypass_rd_idx_1d    ;
wire                    div_wb_vld              ;
wire [63:0]             div_wb_data             ;
wire [ 4:0]             div_wb_rd_idx           ;
wire                    div_oitf_cmt_flag       ;
wire                    div_oitf_flush_flag     ;
wire                    div_rob_flush           ;

//LSU
wire                    lsu2dcache_cmd_valid    ;
wire [MEM_ADW-1:0]      lsu2dcache_cmd_addr     ;
wire                    lsu2dcache_cmd_read     ;
wire [GPR_DW-1:0]       lsu2dcache_cmd_wdata    ;
wire [7:0]              lsu2dcache_cmd_wmask    ;
wire                    lsu2dcache_rsp_ready    ;
wire                    lsu2dcache_cmd_ready    ;
wire                    lsu2dcache_rsp_valid    ;
wire [63 :0]            lsu2dcache_rsp_rdata    ;
wire                    lsu2dcache_rsp_err      ;
wire                    lsu_bypass_vld          ;
wire [63:0]             lsu_bypass_data         ;
wire [ 4:0]             lsu_bypass_rd_idx       ;
wire                    lsu_bypass_vld_1d       ;
wire [63:0]             lsu_bypass_data_1d      ;
wire [ 4:0]             lsu_bypass_rd_idx_1d    ;
wire                    lsu_oitf_load_cmt_flag  ;
wire                    lsu_oitf_load_flush_flag;
wire                    lsu_rob_skip            ;
wire                    lsu_rob_vld             ;
wire                    lsu_rob_wen             ;
wire [63:0]             lsu_rob_wdata           ;
wire                    lsu_wb_vld              ;
wire [GPR_DW-1:0]       lsu_wb_wdata            ;
wire [4:0]              lsu_wb_rd_idx           ;
wire                    lsu_ctrl_full           ;
wire                    lsu_ctrl_empty          ;


//D-CACHE
wire                    dcache2icb_cmd_valid    ;       
wire [ADDR_DW-1:0]      dcache2icb_cmd_addr     ;       
wire                    dcache2icb_cmd_read     ;       
wire [63:0]             dcache2icb_cmd_wdata    ;       
wire [7:0]              dcache2icb_cmd_wmask    ;       
wire                    dcache2icb_rsp_ready    ;       
wire                    dcache2icb_cmd_ready    ;
wire                    dcache2icb_rsp_valid    ;
wire [63:0]             dcache2icb_rsp_rdata    ; 
wire                    dcache2icb_rsp_err      ;


//WB
wire                    wb_gpr_alu_ena          ;   // gpr write enable signal
wire [63:0]             wb_gpr_alu_wdata        ;   // gpr write back data
wire [ 4:0]             wb_gpr_alu_rd_idx       ;  
wire                    wb_gpr_mul_ena          ;   // gpr write enable signal
wire [63:0]             wb_gpr_mul_wdata        ;   // gpr write back data
wire [ 4:0]             wb_gpr_mul_rd_idx       ;  
wire                    wb_gpr_div_ena          ;   // gpr write enable signal
wire [63:0]             wb_gpr_div_wdata        ;   // gpr write back data
wire [ 4:0]             wb_gpr_div_rd_idx       ;  
wire                    wb_gpr_lsu_ena          ;   // gpr write enable signal
wire [63:0]             wb_gpr_lsu_wdata        ;   // gpr write back data
wire [ 4:0]             wb_gpr_lsu_rd_idx       ;  
wire                    wb_csr_ena              ; // csr write enable signal
wire [CSR_DW-1:0]       wb_csr_wdata            ; // csr write back data
wire [11:0]             wb_csr_rd_idx           ;

//OITF
wire                    oitf_ctrl_related       ;

//GPR
wire [GPR_DW-1:0]       gpr_bypass_reg1_data    ;
wire [GPR_DW-1:0]       gpr_bypass_reg2_data    ;
wire [GPR_DW-1:0]       x0                      ;  
wire [GPR_DW-1:0]       x1                      ;  
wire [GPR_DW-1:0]       x2                      ;  
wire [GPR_DW-1:0]       x3                      ;  
wire [GPR_DW-1:0]       x4                      ;  
wire [GPR_DW-1:0]       x5                      ;  
wire [GPR_DW-1:0]       x6                      ;  
wire [GPR_DW-1:0]       x7                      ;  
wire [GPR_DW-1:0]       x8                      ;  
wire [GPR_DW-1:0]       x9                      ;  
wire [GPR_DW-1:0]       x10                     ;  
wire [GPR_DW-1:0]       x11                     ;  
wire [GPR_DW-1:0]       x12                     ;  
wire [GPR_DW-1:0]       x13                     ;  
wire [GPR_DW-1:0]       x14                     ;  
wire [GPR_DW-1:0]       x15                     ;  
wire [GPR_DW-1:0]       x16                     ;  
wire [GPR_DW-1:0]       x17                     ;  
wire [GPR_DW-1:0]       x18                     ;  
wire [GPR_DW-1:0]       x19                     ;  
wire [GPR_DW-1:0]       x20                     ;  
wire [GPR_DW-1:0]       x21                     ;  
wire [GPR_DW-1:0]       x22                     ;  
wire [GPR_DW-1:0]       x23                     ;  
wire [GPR_DW-1:0]       x24                     ;  
wire [GPR_DW-1:0]       x25                     ;
wire [GPR_DW-1:0]       x26                     ;  
wire [GPR_DW-1:0]       x27                     ;  
wire [GPR_DW-1:0]       x28                     ;  
wire [GPR_DW-1:0]       x29                     ;  
wire [GPR_DW-1:0]       x30                     ;  
wire [GPR_DW-1:0]       x31                     ;  

//CSR
wire [63:0]             csr_bypass_data         ;
wire                    csr_int_mie             ;
wire                    csr_int_meip            ;
wire                    csr_int_mtip            ;
wire                    csr_int_msip            ;
wire [CSR_DW-1:0]       csr_int_mtvec           ;
wire [CSR_DW-1:0]       csr_int_epc             ;
wire [CSR_DW-1:0]       csr_mstatus             ;
wire [CSR_DW-1:0]       csr_mie                 ;
wire [CSR_DW-1:0]       csr_mip                 ;
wire [CSR_DW-1:0]       csr_mtvec               ;
wire [CSR_DW-1:0]       csr_mscratch            ;
wire [CSR_DW-1:0]       csr_mcycle              ;
wire [CSR_DW-1:0]       csr_minstret            ;
wire [CSR_DW-1:0]       csr_mepc                ;
wire [CSR_DW-1:0]       csr_mcause              ;
wire [CSR_DW-1:0]       csr_mtval               ;
wire [CSR_DW-1:0]       csr_misa                ;
wire [CSR_DW-1:0]       csr_mvendorid           ;
wire [CSR_DW-1:0]       csr_marchid             ;
wire [CSR_DW-1:0]       csr_mimpid              ;
wire [CSR_DW-1:0]       csr_mhartid             ;
wire [CSR_DW-1:0]       csr_dcsr                ;
wire [CSR_DW-1:0]       csr_dpc                 ;
wire [CSR_DW-1:0]       csr_dscratch            ;


//INT
wire [      63:0]       int_biu_hrdata          ;
wire                    int_biu_hresp           ;
wire                    int_biu_hreadyout       ;
wire                    jtag_irq                ;
wire                    int_jtag_ebreak         ;
wire                    int_csr_ext             ;
wire                    int_csr_tmr             ;
wire                    int_csr_sft             ;
wire [CSR_DW-1:0]       int_csr_epc             ; // breakpoint when interrrupt claim
wire [CSR_DW-1:0]       int_csr_ecause          ; // interrupt cause when interrupt claim
wire                    int_csr_ena             ; // modify enable signal of mstatus reg when claim
wire [CSR_DW-1:0]       int_csr_dpc             ; // ebreak pc
wire                    int_csr_dena            ; // enable signal to modify dcsr and dcause regs
wire [CSR_DW-1:0]       int_csr_mtval           ; // enable signal to modify dcsr and dcause regs
wire [       2:0]       int_csr_dcause          ; // ebreak cause
wire                    int_csr_mret            ; // mret instruction from ctrl
wire [CSR_DW-1:0]       int_ctrl_mtvec          ; // interrupt service program pc
wire [CSR_DW-1:0]       int_ctrl_epc            ; // pc recover
wire                    int_ctrl_req            ; // interrupt require to cpu
wire                    int_ctrl_mret           ; // interrupt finish signal

//BIU
wire                    biu_int_hready          ;
wire                    biu_int_hsel            ;
wire [MEM_ADW-1:0]      biu_int_haddr           ;
wire                    biu_int_hwrite          ;
wire [     64-1:0]      biu_int_hwdata          ;
wire [2:0]              biu_int_hburst          ;
wire [2:0]              biu_int_hsize           ;
wire [1:0]              biu_int_htrans          ;

//ROB
wire                    rob_csr_pc_vld          ;
wire [GPR_DW-1:0]       rob_checker_x0          ;
wire [GPR_DW-1:0]       rob_checker_x1          ;
wire [GPR_DW-1:0]       rob_checker_x2          ;
wire [GPR_DW-1:0]       rob_checker_x3          ;
wire [GPR_DW-1:0]       rob_checker_x4          ;
wire [GPR_DW-1:0]       rob_checker_x5          ;
wire [GPR_DW-1:0]       rob_checker_x6          ;
wire [GPR_DW-1:0]       rob_checker_x7          ;
wire [GPR_DW-1:0]       rob_checker_x8          ;
wire [GPR_DW-1:0]       rob_checker_x9          ;
wire [GPR_DW-1:0]       rob_checker_x10         ;
wire [GPR_DW-1:0]       rob_checker_x11         ;
wire [GPR_DW-1:0]       rob_checker_x12         ;
wire [GPR_DW-1:0]       rob_checker_x13         ;
wire [GPR_DW-1:0]       rob_checker_x14         ;
wire [GPR_DW-1:0]       rob_checker_x15         ;
wire [GPR_DW-1:0]       rob_checker_x16         ;
wire [GPR_DW-1:0]       rob_checker_x17         ;
wire [GPR_DW-1:0]       rob_checker_x18         ;
wire [GPR_DW-1:0]       rob_checker_x19         ;
wire [GPR_DW-1:0]       rob_checker_x20         ;
wire [GPR_DW-1:0]       rob_checker_x21         ;
wire [GPR_DW-1:0]       rob_checker_x22         ;
wire [GPR_DW-1:0]       rob_checker_x23         ;
wire [GPR_DW-1:0]       rob_checker_x24         ;
wire [GPR_DW-1:0]       rob_checker_x25         ;
wire [GPR_DW-1:0]       rob_checker_x26         ;
wire [GPR_DW-1:0]       rob_checker_x27         ;
wire [GPR_DW-1:0]       rob_checker_x28         ;
wire [GPR_DW-1:0]       rob_checker_x29         ;
wire [GPR_DW-1:0]       rob_checker_x30         ;
wire [GPR_DW-1:0]       rob_checker_x31         ;
wire [CSR_DW-1:0]       rob_checker_mstatus     ;
wire [CSR_DW-1:0]       rob_checker_mie         ;
wire [CSR_DW-1:0]       rob_checker_mip         ;
wire [CSR_DW-1:0]       rob_checker_mtvec       ;
wire [CSR_DW-1:0]       rob_checker_mscratch    ;
wire [CSR_DW-1:0]       rob_checker_mcycle      ;
wire [CSR_DW-1:0]       rob_checker_minstret    ;
wire [CSR_DW-1:0]       rob_checker_mepc        ;
wire [CSR_DW-1:0]       rob_checker_mcause      ;
wire [CSR_DW-1:0]       rob_checker_mtval       ;
wire [CSR_DW-1:0]       rob_checker_misa        ;
wire [CSR_DW-1:0]       rob_checker_mvendorid   ;
wire [CSR_DW-1:0]       rob_checker_marchid     ;
wire [CSR_DW-1:0]       rob_checker_mimpid      ;
wire [CSR_DW-1:0]       rob_checker_mhartid     ;
wire [CSR_DW-1:0]       rob_checker_dcsr        ;
wire [CSR_DW-1:0]       rob_checker_dpc         ;
wire [CSR_DW-1:0]       rob_checker_dscratch    ;
wire                    jump_pc_hit             ;

//BYPASS
wire [63:0]             bypass_alu_rs1_data     ;
wire [63:0]             bypass_alu_rs2_data     ;
wire [63:0]             bypass_alu_csr_data     ; 
wire [63:0]             bypass_mul_rs1_data     ;
wire [63:0]             bypass_mul_rs2_data     ;
wire [63:0]             bypass_div_rs1_data     ;
wire [63:0]             bypass_div_rs2_data     ;

//------JTAG begin --------------TBD
assign  gpr_jtag_rdata = 0;

wire  jtag_csr_reset_req; 
wire  jtag_csr_halt_req;


assign  jtag_csr_reset_req  = 1'b0;
assign  jtag_csr_halt_req   = 1'b0; 
//assign  jtag2icb_rsp_rdata=32'b0 ;
//------JTAG end --------------TBD



control u0_control (
    .clk                    ( clk                       ),
    .rstn                   ( rstn                      ),
//WITH OITF
    .oitf_ctrl_related      ( oitf_ctrl_related         ),
//WITH IFU
    .ifu_ctrl_cmd_valid     ( ifu_ctrl_cmd_valid        ),
    .ifu_ctrl_cmd_ready     ( ifu_ctrl_cmd_ready        ),
    .ifu_ctrl_cmd_addr      ( ifu_ctrl_cmd_addr         ),
    .ifu_ctrl_jump_pc       ( ifu_ctrl_jump_pc          ), 
    .ctrl_pc_stall          ( ctrl_pc_stall             ),
    .ctrl_ifu_stall         ( ctrl_ifu_stall            ),
    .ctrl_ifu_flush         ( ctrl_ifu_flush            ),
    .ctrl_ifu_pc_vld        ( ctrl_ifu_pc_vld           ),
    .ctrl_ifu_pc            ( ctrl_ifu_pc               ),
//WITH DE 
    .ctrl_de_stall          ( ctrl_de_stall             ), 
    .ctrl_de_flush          ( ctrl_de_flush             ), 
//WITH ALU 
    .alu_ctrl_jump_en       ( alu_ctrl_jump_en          ),
    .alu_ctrl_fence_i       ( alu_ctrl_fence_i          ),
    .ctrl_alu_flush         ( ctrl_alu_flush            ),
    .ctrl_alu_stall         ( ctrl_alu_stall            ),
//WITH LSU
    .lsu_ctrl_full          ( lsu_ctrl_full             ),
    .lsu_ctrl_empty         ( lsu_ctrl_empty            ),
//WITH MUL
    .ctrl_mul_flush         ( ctrl_mul_flush            ),
//WITH DIV
    .ctrl_div_flush         ( ctrl_div_flush            ), 
//WITH INT 
    .int_ctrl_mtvec         ( int_ctrl_mtvec            ),
    .int_ctrl_epc           ( int_ctrl_epc              ),
    .int_ctrl_req           ( int_ctrl_req              ),
    .int_ctrl_mret          ( int_ctrl_mret             )  
);



bpu u1_bpu(
    .clk                     ( clk                       ),
    .rstn                    ( rstn                      ),
    .ifu_bpu_pc_valid        ( ifu_bpu_vaild             ),
    .ifu_bpu_pc              ( ifu_bpu_addr              ),
    .ifu_bpu_hit_vld         ( ifu_bpu_hit_vld           ),
    .alu_bpu_wr_req          ( alu_bpu_wr_req            ),
    .alu_bpu_wr_pc           ( alu_bpu_wr_pc             ),
    .alu_bpu_wr_type         ( alu_bpu_wr_type           ),
    .alu_bpu_wr_predict_pc   ( alu_bpu_wr_predict_pc     ),
    .alu_bpu_wr_predict_taken( alu_bpu_wr_predict_taken  ),
    .alu_bpu_jump_en         ( alu_bpu_jump_en           ),

    .bpu_ifu_next_pc         ( bpu_ifu_next_pc           ),
    .bpu_ifu_predict_hit     (                           ),
    .bpu_ifu_predict_pc      (                           ),
    .bpu_ifu_predict_taken   (                           )
);


ifu  u1_ifu(  
  .clk                      ( clk                       ), //clock
  .rstn                     ( rstn                      ),
//WITH CTRL
  .ctrl_ifu_stall           ( ctrl_ifu_stall            ),//stop the pipeline
  .ctrl_ifu_flush           ( ctrl_ifu_flush            ),
  .ctrl_pc_stall            ( ctrl_pc_stall             ),
  .ctrl_ifu_pc              ( ctrl_ifu_pc               ),
  .ctrl_ifu_pc_vld          ( ctrl_ifu_pc_vld           ),
  .ifu_ctrl_cmd_valid       ( ifu_ctrl_cmd_valid        ),
  .ifu_ctrl_cmd_ready       ( ifu_ctrl_cmd_ready        ),
  .ifu_ctrl_cmd_addr        ( ifu_ctrl_cmd_addr         ),
  .ifu_ctrl_jump_pc         ( ifu_ctrl_jump_pc          ), 
//WITH ALU
  .alu_ifu_pc               ( alu_ifu_pc                ),
  .alu_ifu_pc_vld           ( alu_ifu_pc_vld            ),
// WITH ICACHE
  .ifu2icache_cmd_valid     ( ifu2icache_cmd_valid      ),
  .ifu2icache_cmd_ready     ( ifu2icache_cmd_ready      ),
  .ifu2icache_cmd_addr      ( ifu2icache_cmd_addr       ),
  .ifu2icache_cmd_read      ( ifu2icache_cmd_read       ),//1'b1
  .ifu2icache_cmd_wdata     ( ifu2icache_cmd_wdata      ),//useless 
  .ifu2icache_cmd_wmask     ( ifu2icache_cmd_wmask      ),//4'b1111
  .ifu2icache_rsp_valid     ( ifu2icache_rsp_valid      ),
  .ifu2icache_rsp_ready     ( ifu2icache_rsp_ready      ),//1'b1
  .ifu2icache_rsp_rdata     ( ifu2icache_rsp_rdata      ),
  .ifu2icache_rsp_err       ( ifu2icache_rsp_err        ),
//WITH DE
  .ifu_de_inst              ( ifu_de_inst               ),
  .ifu_de_inst_vld          ( ifu_de_inst_vld           ),   
  .ifu_de_pc                ( ifu_de_pc                 ),
  .ifu_de_npc               ( ifu_de_npc                ),
//WITH BPU
  .ifu_bpu_addr             ( ifu_bpu_addr              ),
  .ifu_bpu_vaild            ( ifu_bpu_vaild             ),
  .ifu_bpu_hit_vld          ( ifu_bpu_hit_vld           ),
  .bpu_ifu_npc              ( bpu_ifu_next_pc           )
//WITH ROB
);

//i_cache u1_i_cache(
//    .clk                    ( clk                       ), //clk 
//    .rstn                   ( rstn                      ),
////WITH IFU                         
//    .ifu2icache_cmd_valid   ( ifu2icache_cmd_valid      ),//the handshake signal
//    .ifu2icache_cmd_ready   ( ifu2icache_cmd_ready      ),//the handshake signal
//    .ifu2icache_cmd_addr    ( ifu2icache_cmd_addr       ),//address from ifu
//    .ifu2icache_cmd_read    ( ifu2icache_cmd_read       ),//read enable
//    .ifu2icache_cmd_wdata   ( ifu2icache_cmd_wdata      ),//data from the ifu that needs to be written
//    .ifu2icache_cmd_wmask   ( ifu2icache_cmd_wmask      ),//mask from the ifu
//    .ifu2icache_rsp_valid   ( ifu2icache_rsp_valid      ),//the handshake signal
//    .ifu2icache_rsp_ready   ( ifu2icache_rsp_ready      ),//the handshake signal
//    .ifu2icache_rsp_rdata   ( ifu2icache_rsp_rdata      ),//data returned by the slave
//    .ifu2icache_rsp_err     ( ifu2icache_rsp_err        ),
////WITH BIU                    
//    .icache2icb_cmd_valid   ( icache2icb_cmd_valid      ),//the handshake signal  1
//    .icache2icb_cmd_ready   ( icache2icb_cmd_ready      ),//the handshake signal  0
//    .icache2icb_cmd_addr    ( icache2icb_cmd_addr       ),//address from ifu      1
//    .icache2icb_cmd_read    ( icache2icb_cmd_read       ),//read enable           1
//    .icache2icb_cmd_wdata   ( icache2icb_cmd_wdata      ),//data from the ifu that needs to be written
//    .icache2icb_cmd_wmask   ( icache2icb_cmd_wmask      ),//mask from the ifu
//    .icache2icb_rsp_valid   ( icache2icb_rsp_valid      ),//the handshake signal  0
//    .icache2icb_rsp_ready   ( icache2icb_rsp_ready      ),//the handshake signal
//    .icache2icb_rsp_rdata   ( icache2icb_rsp_rdata      ),//data returned by the slave 0
//    .icache2icb_rsp_err     ( icache2icb_rsp_err        )                         //0
//);
cache_top #(
    .DTYPE                    ( 0                       ),
    .UNCACHE_B                ( 64'h0000_0000           ),
    .UNCACHE_B_DT             ( 64'h0000_0000           ),
    .UNCACHE_E                ( 64'h0000_0014           ),
    .UNCACHE_E_DT             ( 64'h7fff_ffff           )
) u1_i_cache (
    .clk                      ( clk                     ), //clk 
    .rstn                     ( rstn                    ),
//WITH ifu                           
    .core2cache_cmd_valid     ( ifu2icache_cmd_valid     ),//the handshake signal
    .core2cache_cmd_ready     ( ifu2icache_cmd_ready     ),//the handshake signal        //OUT
    .core2cache_cmd_addr      ( ifu2icache_cmd_addr      ),//address from ifu
    .core2cache_cmd_read      ( ifu2icache_cmd_read      ),//read enable
    .core2cache_cmd_wdata     ( ifu2icache_cmd_wdata     ),//data from the ifu that needs to be written
    .core2cache_cmd_wmask     ( ifu2icache_cmd_wmask     ),//mask from the ifu
    .core2cache_rsp_valid     ( ifu2icache_rsp_valid     ),//the handshake signal        //OUT 
    .core2cache_rsp_ready     ( ifu2icache_rsp_ready     ),//the handshake signal  
    .core2cache_rsp_rdata     ( ifu2icache_rsp_rdata     ),//data returned by the slave  //OUT
    .core2cache_rsp_err       ( ifu2icache_rsp_err       ),                              //OUT
//WITH BIU                      
    .cache2mem_cmd_valid     ( icache2icb_cmd_valid     ),//the handshake signal        
    .cache2mem_cmd_ready     ( icache2icb_cmd_ready     ),//the handshake signal        //IN
    .cache2mem_cmd_addr      ( icache2icb_cmd_addr      ),//address from ifu      
    .cache2mem_cmd_read      ( icache2icb_cmd_read      ),//read enable           
    .cache2mem_cmd_wdata     ( icache2icb_cmd_wdata     ),//data from the ifu that needs to be written
    .cache2mem_cmd_wmask     ( icache2icb_cmd_wmask     ),//mask from the ifu
    .cache2mem_rsp_valid     ( icache2icb_rsp_valid     ),//the handshake signal        //in
    .cache2mem_rsp_ready     ( icache2icb_rsp_ready     ),//the handshake signal     
    .cache2mem_rsp_rdata     ( icache2icb_rsp_rdata     ),//data returned by the slave  //in
    .cache2mem_rsp_err       ( icache2icb_rsp_err       )                               //in
);

de u2_de (
  .clk                       ( clk                         ),
  .rstn                      ( rstn                        ),
  //WITH CONTROL  
  .ctrl_de_stall             ( ctrl_de_stall               ),
  .ctrl_de_flush             ( ctrl_de_flush               ),
  //WITH IFU
  .ifu_de_inst               ( ifu_de_inst                 ),//instruct 
  .ifu_de_inst_vld           ( ifu_de_inst_vld             ),
  .ifu_de_pc                 ( ifu_de_pc                   ),//instruct 
  .ifu_de_npc                ( ifu_de_npc                  ),//instruct 
  //WITH ALU
  .de_alu_inst_vld           ( de_alu_inst_vld             ),
  .de_alu_wb_vld             ( de_alu_wb_vld               ),
  .de_alu_reg2_flag          ( de_alu_reg2_flag            ),//1 represetns operation is x[rs2]
  .de_alu_lui_flag           ( de_alu_lui_flag             ),//lui operation valid
  .de_alu_shift_flag         ( de_alu_shift_flag           ),//shift operation valid
  .de_alu_shift_right_flag   ( de_alu_shift_right_flag     ),//1:shift right,0:shift left
  .de_alu_shift_logic_flag   ( de_alu_shift_logic_flag     ),//1 is logic shift,0 is arithemetic shift
  .de_alu_iw_en_flag         ( de_alu_iw_en_flag           ),
  .de_alu_comp_flag          ( de_alu_comp_flag            ),//1 represents comparator operation is valid 
  .de_alu_and_flag           ( de_alu_and_flag             ),//1 represents and operation is valid 
  .de_alu_or_flag            ( de_alu_or_flag              ),//
  .de_alu_xor_flag           ( de_alu_xor_flag             ),//
  .de_alu_adder_flag         ( de_alu_adder_flag           ),//1 represents adder operation is valid 
  .de_alu_sub_flag           ( de_alu_sub_flag             ),//1 represents substraction operation is valid
  .de_alu_auipc_flag         ( de_alu_auipc_flag           ),//1 represents auipc operation is valid
  .de_alu_ls_type            ( de_alu_ls_type              ),//beq001,bne010,blt011,bge100,bltu101,bgeu110
  .de_alu_imm                ( de_alu_imm                  ),
  .de_alu_con_jmp_type       ( de_alu_con_jmp_type         ),
  .de_alu_ucon_jmp_type      ( de_alu_ucon_jmp_type        ),
  .de_alu_csr_type           ( de_alu_csr_type             ),
  .de_alu_pc                 ( de_alu_pc                   ),
  .de_alu_npc                ( de_alu_npc                  ),
  .de_alu_fence_type         ( de_alu_fence_type           ),
  .de_alu_rd_idx             ( de_alu_rd_idx               ),
  .de_alu_csr_idx            ( de_alu_csr_idx              ),
  .de_alu_predict_jmp_type   ( de_alu_predict_jmp_type     ),
  //WITH CSR
  .de_csr_rd_idx             ( de_csr_rd_idx               ),
  .de_csr_rd_vld             ( de_csr_rd_vld               ),
  //WITH OITF
  .de_oitf_inst_vld_ori      ( de_oitf_inst_vld_ori        ),
  .de_oitf_inst_vld          ( de_oitf_inst_vld            ),
  .de_oitf_csr               ( de_oitf_csr                 ),
  .de_oitf_special           ( de_oitf_special             ),
  .de_oitf_mul               ( de_oitf_mul                 ),
  .de_oitf_div               ( de_oitf_div                 ),
  .de_oitf_load              ( de_oitf_load                ),
  .de_oitf_rs1_idx           ( de_oitf_rs1_idx             ),
  .de_oitf_rs2_idx           ( de_oitf_rs2_idx             ),
  .de_oitf_rd_idx            ( de_oitf_rd_idx              ),
  .de_oitf_rs1en             ( de_oitf_rs1en               ),
  .de_oitf_rs2en             ( de_oitf_rs2en               ),
  .de_oitf_wen               ( de_oitf_wen                 ),
  .de_oitf_csr_idx           ( de_oitf_csr_idx             ), // the instruction decoded need to write back to rd
  //WITH GPR 
  .de_gpr_reg1_raddr         ( de_gpr_reg1_raddr           ),
  .de_gpr_reg2_raddr         ( de_gpr_reg2_raddr           ),
  .de_gpr_reg1_rdvld         ( de_gpr_reg1_rdvld           ),
  .de_gpr_reg2_rdvld         ( de_gpr_reg2_rdvld           ),
  //WITH MUL
  .de_mul_inst_vld           ( de_mul_inst_vld             ),
  .de_mul_type               ( de_mul_type                 ),
  .de_mul_rd_idx             ( de_mul_rd_idx               ),
  // WITH DIV
  .de_div_inst_vld           ( de_div_inst_vld             ),
  .de_div_type               ( de_div_type                 ),
  .de_div_rd_idx             ( de_div_rd_idx               ),
  .de_div_b2b                ( de_div_b2b                  ),
  // WITH BYPASS
  .de_bypass_rs1_idx         ( de_bypass_rs1_idx           ), 
  .de_bypass_rs2_idx         ( de_bypass_rs2_idx           ), 
  //WITH ROB
  .de_rob_inst               ( de_rob_inst                 ),//instruction 
  .de_rob_inst_vld           ( de_rob_inst_vld             ),//instruction valid
  .de_rob_pc                 ( de_rob_pc                   ),//pc
  .de_rob_gpr_idx            ( de_rob_gpr_idx              ),
  .de_rob_csr_idx            ( de_rob_csr_idx              ),
  .de_rob_alu                ( de_rob_alu                  ),// alu instruction
  .de_rob_csr                ( de_rob_csr                  ),// csr instruction
  .de_rob_mul                ( de_rob_mul                  ),// mul instruction 
  .de_rob_div                ( de_rob_div                  ),// div instruction
  .de_rob_load               ( de_rob_load                 ),// L   instruction
  .de_rob_mret_alu_specail_cmt(de_rob_mret_alu_specail_cmt ),//only for difftest
   //WITH INT               
  .de_int_ebreak             ( de_int_ebreak               ),
  .de_int_ecall              ( de_int_ecall                ),
  .de_int_mret               ( de_int_mret                 ),
  .de_int_misa               ( de_int_misa                 ),
  .de_int_memerr             ( de_int_memerr               ),
  .de_int_illegal            ( de_int_illegal              ),
  .de_int_illegal_inst       ( de_int_illegal_inst         ) 
);


alu u3_alu(
  .clk                          ( clk                       ),
  .rstn                         ( rstn                      ),
//WITH CONTROL
  .ctrl_alu_flush               ( ctrl_alu_flush            ),
  .alu_ctrl_jump_en             ( alu_ctrl_jump_en          ),
  .alu_ctrl_fence_i             ( alu_ctrl_fence_i          ),
  .ctrl_alu_stall               ( ctrl_alu_stall            ),
//WITH BYPASS
  .bypass_alu_rs1_data          ( bypass_alu_rs1_data       ),
  .bypass_alu_rs2_data          ( bypass_alu_rs2_data       ),
  .bypass_alu_csr_data          ( bypass_alu_csr_data       ),
  .alu_bypass_vld               ( alu_bypass_vld            ),
  .alu_bypass_data              ( alu_bypass_data           ),
  .alu_bypass_rd_idx            ( alu_bypass_rd_idx         ),
  .alu_bypass_vld_1d            ( alu_bypass_vld_1d         ),
  .alu_bypass_data_1d           ( alu_bypass_data_1d        ),
  .alu_bypass_rd_idx_1d         ( alu_bypass_rd_idx_1d      ),
//WITH DE             
  .de_alu_pc                    ( de_alu_pc                 ),
  .de_alu_npc                   ( de_alu_npc                ),
  .de_alu_inst_vld              ( de_alu_inst_vld           ),
  .de_alu_wb_vld                ( de_alu_wb_vld             ),
  .de_alu_reg2_flag             ( de_alu_reg2_flag          ),//1 is reg2_data,0 is alu_imm
  .de_alu_lui_flag              ( de_alu_lui_flag           ),//1 represents lui operation is valid 
  .de_alu_shift_flag            ( de_alu_shift_flag         ),//1 represents shift operation is valid 
  .de_alu_shift_right_flag      ( de_alu_shift_right_flag   ),//1 represents shift right,0 represents shift left
  .de_alu_shift_logic_flag      ( de_alu_shift_logic_flag   ),//1 represents logic shift,0 represents arithmetic shift
  .de_alu_iw_en_flag            ( de_alu_iw_en_flag         ),//1 represents add and sub truncation operation is valid
  .de_alu_comp_flag             ( de_alu_comp_flag          ),//1 represents unsigned comparison operation is valid
  .de_alu_and_flag              ( de_alu_and_flag           ),//1 represents and operation is valid 
  .de_alu_or_flag               ( de_alu_or_flag            ),//1 represents or operation is valid 
  .de_alu_xor_flag              ( de_alu_xor_flag           ),//1 represents xor operation is valid 
  .de_alu_adder_flag            ( de_alu_adder_flag         ),//1 represents addition operation is valid 
  .de_alu_sub_flag              ( de_alu_sub_flag           ),//1 represents subtraction 
  .de_alu_auipc_flag            ( de_alu_auipc_flag         ),//1 represents  auipc operation is valid 
  .de_alu_ls_type               ( de_alu_ls_type            ),//0001~1011 is valid
  .de_alu_imm                   ( de_alu_imm                ),//immediate data
  .de_alu_con_jmp_type          ( de_alu_con_jmp_type       ),        
  .de_alu_ucon_jmp_type         ( de_alu_ucon_jmp_type      ),// 00 is invalid ,jal 01 ,jalr 10;
  .de_alu_csr_type              ( de_alu_csr_type           ),// 000 is invalid
  .de_alu_fence_type            ( de_alu_fence_type         ),
  .de_alu_rd_idx                ( de_alu_rd_idx             ),
  .de_alu_csr_idx               ( de_alu_csr_idx            ),
  .de_alu_predict_jmp_type      ( de_alu_predict_jmp_type   ),
//WITH WB              
  .alu_wb_gpr_vld               ( alu_wb_gpr_vld            ),
  .alu_wb_gpr_wdata             ( alu_wb_gpr_wdata          ),
  .alu_wb_gpr_rd_idx            ( alu_wb_gpr_rd_idx         ),
  .alu_wb_csr_vld               ( alu_wb_csr_vld            ),
  .alu_wb_csr_wdata             ( alu_wb_csr_wdata          ),
  .alu_wb_csr_rd_idx            ( alu_wb_csr_rd_idx         ),
//WITH LSU            
  .alu_lsu_vld                  ( alu_lsu_vld               ),
  .alu_lsu_addr                 ( alu_lsu_addr              ),
  .alu_lsu_wdata                ( alu_lsu_wdata             ),
  .alu_lsu_ls_type              ( alu_lsu_ls_type           ),
  .alu_lsu_wen                  ( alu_lsu_wen               ),
  .alu_lsu_rd_idx               ( alu_lsu_rd_idx            ),
//WITH IFU
  .alu_ifu_pc                   ( alu_ifu_pc                ),
  .alu_ifu_pc_vld               ( alu_ifu_pc_vld            ),
//WITH BPU
  .alu_bpu_wr_req               ( alu_bpu_wr_req            ),
  .alu_bpu_wr_pc                ( alu_bpu_wr_pc             ),
  .alu_bpu_wr_type              ( alu_bpu_wr_type           ),
  .alu_bpu_wr_predict_pc        ( alu_bpu_wr_predict_pc     ),
  .alu_bpu_wr_predict_taken     ( alu_bpu_wr_predict_taken  ),
  .alu_bpu_jump_en              ( alu_bpu_jump_en           ),
//with ROB
  .alu_rob_alu_flush            ( alu_rob_alu_flush         ),
  .alu_rob_load_flush           ( alu_rob_load_flush        ),
  .alu_rob_csr_flush            ( alu_rob_csr_flush         ),
  .alu_rob_special_cmt          ( alu_rob_special_cmt       ),
//WITH OITF
  .alu_oitf_csr_cmt_flag        ( alu_oitf_csr_cmt_flag     ),
  .alu_oitf_csr_flush_flag      ( alu_oitf_csr_flush_flag   ),
  .alu_oitf_load_flush_flag     ( alu_oitf_load_flush_flag  ),
//WITH INT
  .alu_int_vld                  ( alu_int_vld               ),
  .alu_int_pc                   ( alu_int_pc                ),
  .alu_int_beq                  ( alu_int_beq               ),
  .alu_int_l_misa               ( alu_int_l_misa            ),
  .alu_int_s_misa               ( alu_int_s_misa            ),
  .alu_int_ls_addr              ( alu_int_ls_addr           ) 
);

mul u3_mul(
  .clk                          ( clk                       ),
  .rstn                         ( rstn                      ),
  .ctrl_mul_flush               ( ctrl_mul_flush            ),
  .bypass_mul_rs1_data          ( bypass_mul_rs1_data       ),
  .bypass_mul_rs2_data          ( bypass_mul_rs2_data       ),
  .mul_bypass_vld               ( mul_bypass_vld            ),
  .mul_bypass_data              ( mul_bypass_data           ),
  .mul_bypass_rd_idx            ( mul_bypass_rd_idx         ),
  .mul_bypass_vld_1d            ( mul_bypass_vld_1d         ),
  .mul_bypass_data_1d           ( mul_bypass_data_1d        ),
  .mul_bypass_rd_idx_1d         ( mul_bypass_rd_idx_1d      ),
  .de_mul_type                  ( de_mul_type               ),
  .de_mul_inst_vld              ( de_mul_inst_vld           ),
  .de_mul_rd_idx                ( de_mul_rd_idx             ),
  .mul_wb_vld                   ( mul_wb_vld                ),
  .mul_wb_data                  ( mul_wb_data               ),
  .mul_wb_rd_idx                ( mul_wb_rd_idx             ),
  .mul_rob_flush                ( mul_rob_flush             ),
  .mul_oitf_cmt_flag            ( mul_oitf_cmt_flag         ),
  .mul_oitf_flush_flag          ( mul_oitf_flush_flag       )
);


div  u3_div(
  .clk                          ( clk                       ),
  .rstn                         ( rstn                      ),
  .ctrl_div_flush               ( ctrl_div_flush            ),
  .bypass_div_rs1_data          ( bypass_div_rs1_data       ),
  .bypass_div_rs2_data          ( bypass_div_rs2_data       ),
  .div_bypass_vld               ( div_bypass_vld            ),
  .div_bypass_data              ( div_bypass_data           ),
  .div_bypass_rd_idx            ( div_bypass_rd_idx         ),
  .div_bypass_vld_1d            ( div_bypass_vld_1d         ),
  .div_bypass_data_1d           ( div_bypass_data_1d        ),
  .div_bypass_rd_idx_1d         ( div_bypass_rd_idx_1d      ),
  .de_div_type                  ( de_div_type               ),
  .de_div_inst_vld              ( de_div_inst_vld           ),
  .de_div_rd_idx                ( de_div_rd_idx             ),
  .de_div_b2b                   ( de_div_b2b                ),
  .div_wb_vld                   ( div_wb_vld                ),
  .div_wb_data                  ( div_wb_data               ),
  .div_wb_rd_idx                ( div_wb_rd_idx             ),
  .div_oitf_cmt_flag            ( div_oitf_cmt_flag         ),
  .div_oitf_flush_flag          ( div_oitf_flush_flag       ),
  .div_rob_flush                ( div_rob_flush             )

);


lsu u4_lsu(
  .clk                         ( clk                        ),
  .rstn                        ( rstn                       ),
//      WITH CTRL
  .lsu_ctrl_full               ( lsu_ctrl_full              ),
  .lsu_ctrl_empty              ( lsu_ctrl_empty             ),
//      With ALU 
  .alu_lsu_vld                 ( alu_lsu_vld                ),
  .alu_lsu_addr                ( alu_lsu_addr               ),
  .alu_lsu_wdata               ( alu_lsu_wdata              ),
  .alu_lsu_wen                 ( alu_lsu_wen                ),
  .alu_lsu_ls_type             ( alu_lsu_ls_type            ),
  .alu_lsu_rd_idx              ( alu_lsu_rd_idx             ),
//      With DCACHE    
  .lsu2dcache_cmd_valid        ( lsu2dcache_cmd_valid       ),
  .lsu2dcache_cmd_ready        ( lsu2dcache_cmd_ready       ),
  .lsu2dcache_cmd_addr         ( lsu2dcache_cmd_addr        ),
  .lsu2dcache_cmd_read         ( lsu2dcache_cmd_read        ),
  .lsu2dcache_cmd_wdata        ( lsu2dcache_cmd_wdata       ),
  .lsu2dcache_cmd_wmask        ( lsu2dcache_cmd_wmask       ),
  .lsu2dcache_rsp_valid        ( lsu2dcache_rsp_valid       ),
  .lsu2dcache_rsp_ready        ( lsu2dcache_rsp_ready       ),
  .lsu2dcache_rsp_rdata        ( lsu2dcache_rsp_rdata       ),
  .lsu2dcache_rsp_err          ( lsu2dcache_rsp_err         ),                                                              
//      With BYPASS  
  .lsu_bypass_vld              ( lsu_bypass_vld             ),
  .lsu_bypass_data             ( lsu_bypass_data            ),
  .lsu_bypass_rd_idx           ( lsu_bypass_rd_idx          ),
  .lsu_bypass_vld_1d           ( lsu_bypass_vld_1d          ),
  .lsu_bypass_data_1d          ( lsu_bypass_data_1d         ),
  .lsu_bypass_rd_idx_1d        ( lsu_bypass_rd_idx_1d       ),
//      WITH OITF
  .lsu_oitf_load_cmt_flag      ( lsu_oitf_load_cmt_flag     ),
//      WITH ROB
  .lsu_rob_skip                ( lsu_rob_skip               ),
  .lsu_rob_vld                 ( lsu_rob_vld                ),
  .lsu_rob_wen                 ( lsu_rob_wen                ), 
  .lsu_rob_wdata               ( lsu_rob_wdata              ),
//      WITH WB  
  .lsu_wb_vld                  ( lsu_wb_vld                 ),
  .lsu_wb_wdata                ( lsu_wb_wdata               ),
  .lsu_wb_rd_idx               ( lsu_wb_rd_idx              )
);

//d_cache u1_d_cache(
//    .clk                      ( clk                      ), //clk 
//    .rstn                     ( rstn                     ),
////WITH IFU                           
//    .lsu2dcache_cmd_valid     ( lsu2dcache_cmd_valid     ),//the handshake signal
//    .lsu2dcache_cmd_ready     ( lsu2dcache_cmd_ready     ),//the handshake signal
//    .lsu2dcache_cmd_addr      ( lsu2dcache_cmd_addr      ),//address from ifu
//    .lsu2dcache_cmd_read      ( lsu2dcache_cmd_read      ),//read enable
//    .lsu2dcache_cmd_wdata     ( lsu2dcache_cmd_wdata     ),//data from the ifu that needs to be written
//    .lsu2dcache_cmd_wmask     ( lsu2dcache_cmd_wmask     ),//mask from the ifu
//    .lsu2dcache_rsp_valid     ( lsu2dcache_rsp_valid     ),//the handshake signal
//    .lsu2dcache_rsp_ready     ( lsu2dcache_rsp_ready     ),//the handshake signal
//    .lsu2dcache_rsp_rdata     ( lsu2dcache_rsp_rdata     ),//data returned by the slave
//    .lsu2dcache_rsp_err       ( lsu2dcache_rsp_err       ),
////WITH BIU                      
//    .dcache2icb_cmd_valid     ( dcache2icb_cmd_valid     ),//the handshake signal  1
//    .dcache2icb_cmd_ready     ( dcache2icb_cmd_ready     ),//the handshake signal  0
//    .dcache2icb_cmd_addr      ( dcache2icb_cmd_addr      ),//address from ifu      1
//    .dcache2icb_cmd_read      ( dcache2icb_cmd_read      ),//read enable           1
//    .dcache2icb_cmd_wdata     ( dcache2icb_cmd_wdata     ),//data from the ifu that needs to be written
//    .dcache2icb_cmd_wmask     ( dcache2icb_cmd_wmask     ),//mask from the ifu
//    .dcache2icb_rsp_valid     ( dcache2icb_rsp_valid     ),//the handshake signal  0
//    .dcache2icb_rsp_ready     ( dcache2icb_rsp_ready     ),//the handshake signal
//    .dcache2icb_rsp_rdata     ( dcache2icb_rsp_rdata     ),//data returned by the slave 0
//    .dcache2icb_rsp_err       ( dcache2icb_rsp_err       )                         //0
//);
cache_top #(
    .DTYPE                    ( 1                       ),
    .UNCACHE_B                ( 64'h9000_0000           ),
    .UNCACHE_B_DT             ( 64'h0000_0000           ),
    .UNCACHE_E                ( 64'hffff_ffff           ),
    .UNCACHE_E_DT             ( 64'h7fff_ffff           )
) u1_d_cache (
    .clk                      ( clk                     ), //clk 
    .rstn                     ( rstn                    ),
//WITH LSU                           
    .core2cache_cmd_valid     ( lsu2dcache_cmd_valid     ),//the handshake signal
    .core2cache_cmd_ready     ( lsu2dcache_cmd_ready     ),//the handshake signal        //OUT
    .core2cache_cmd_addr      ( lsu2dcache_cmd_addr      ),//address from ifu
    .core2cache_cmd_read      ( lsu2dcache_cmd_read      ),//read enable
    .core2cache_cmd_wdata     ( lsu2dcache_cmd_wdata     ),//data from the ifu that needs to be written
    .core2cache_cmd_wmask     ( lsu2dcache_cmd_wmask     ),//mask from the ifu
    .core2cache_rsp_valid     ( lsu2dcache_rsp_valid     ),//the handshake signal        //OUT 
    .core2cache_rsp_ready     ( lsu2dcache_rsp_ready     ),//the handshake signal  
    .core2cache_rsp_rdata     ( lsu2dcache_rsp_rdata     ),//data returned by the slave  //OUT
    .core2cache_rsp_err       ( lsu2dcache_rsp_err       ),                              //OUT
//WITH BIU                      
    .cache2mem_cmd_valid     ( dcache2icb_cmd_valid     ),//the handshake signal        
    .cache2mem_cmd_ready     ( dcache2icb_cmd_ready     ),//the handshake signal        //IN
    .cache2mem_cmd_addr      ( dcache2icb_cmd_addr      ),//address from ifu      
    .cache2mem_cmd_read      ( dcache2icb_cmd_read      ),//read enable           
    .cache2mem_cmd_wdata     ( dcache2icb_cmd_wdata     ),//data from the ifu that needs to be written
    .cache2mem_cmd_wmask     ( dcache2icb_cmd_wmask     ),//mask from the ifu
    .cache2mem_rsp_valid     ( dcache2icb_rsp_valid     ),//the handshake signal        //in
    .cache2mem_rsp_ready     ( dcache2icb_rsp_ready     ),//the handshake signal     
    .cache2mem_rsp_rdata     ( dcache2icb_rsp_rdata     ),//data returned by the slave  //in
    .cache2mem_rsp_err       ( dcache2icb_rsp_err       )                               //in
);

wb  u5_wb(
//with alu         
  .alu_wb_gpr_vld             ( alu_wb_gpr_vld            ),
  .alu_wb_gpr_wdata           ( alu_wb_gpr_wdata          ),
  .alu_wb_gpr_rd_idx          ( alu_wb_gpr_rd_idx         ),
  .alu_wb_csr_vld             ( alu_wb_csr_vld            ),
  .alu_wb_csr_wdata           ( alu_wb_csr_wdata          ),
  .alu_wb_csr_rd_idx          ( alu_wb_csr_rd_idx         ),
//with mul      
  .mul_wb_vld                 ( mul_wb_vld                ),
  .mul_wb_data                ( mul_wb_data               ),
  .mul_wb_rd_idx              ( mul_wb_rd_idx             ),
//with div
  .div_wb_vld                 ( div_wb_vld                ),
  .div_wb_data                ( div_wb_data               ),
  .div_wb_rd_idx              ( div_wb_rd_idx             ),
//with lsu
  .lsu_wb_vld                 ( lsu_wb_vld                ),
  .lsu_wb_wdata               ( lsu_wb_wdata              ),
  .lsu_wb_rd_idx              ( lsu_wb_rd_idx             ),
//with gpr      
   .wb_gpr_alu_ena            ( wb_gpr_alu_ena            ), // gpr write enable signal
   .wb_gpr_alu_wdata          ( wb_gpr_alu_wdata          ), // gpr write back data
   .wb_gpr_alu_rd_idx         ( wb_gpr_alu_rd_idx         ),
   .wb_gpr_mul_ena            ( wb_gpr_mul_ena            ), // gpr write enable signal
   .wb_gpr_mul_wdata          ( wb_gpr_mul_wdata          ), // gpr write back data
   .wb_gpr_mul_rd_idx         ( wb_gpr_mul_rd_idx         ),
   .wb_gpr_div_ena            ( wb_gpr_div_ena            ), // gpr write enable signal
   .wb_gpr_div_wdata          ( wb_gpr_div_wdata          ), // gpr write back data
   .wb_gpr_div_rd_idx         ( wb_gpr_div_rd_idx         ),
   .wb_gpr_lsu_ena            ( wb_gpr_lsu_ena            ), // gpr write enable signal
   .wb_gpr_lsu_wdata          ( wb_gpr_lsu_wdata          ), // gpr write back data
   .wb_gpr_lsu_rd_idx         ( wb_gpr_lsu_rd_idx         ),
//with csr     
   .wb_csr_ena                ( wb_csr_ena                ), // csr write enable signal
   .wb_csr_wdata              ( wb_csr_wdata              ), // csr write back data
   .wb_csr_rd_idx             ( wb_csr_rd_idx             )
);



oitf u6_oitf(
   .clk                       ( clk                     ),
   .rstn                      ( rstn                    ),
//with decode      
   .de_oitf_inst_vld_ori      ( de_oitf_inst_vld_ori    ),
   .de_oitf_inst_vld          ( de_oitf_inst_vld        ),
   .de_oitf_csr               ( de_oitf_csr             ),
   .de_oitf_mul               ( de_oitf_mul             ), // the instruction decoded is a mul inst
   .de_oitf_div               ( de_oitf_div             ), // the instruction decoded is a div inst
   .de_oitf_load              ( de_oitf_load            ), // the instruction decoded is a ls  inst
   .de_oitf_rs1_idx           ( de_oitf_rs1_idx         ), // the index of rs1 of instruction
   .de_oitf_special           ( de_oitf_special         ),
   .de_oitf_rs2_idx           ( de_oitf_rs2_idx         ), // the index of rs2 of instruction
   .de_oitf_rd_idx            ( de_oitf_rd_idx          ), // the index of rd  of instruction
   .de_oitf_rs1en             ( de_oitf_rs1en           ), // the instruction decoded need to read rs1
   .de_oitf_rs2en             ( de_oitf_rs2en           ), // the instruction decoded need to read rs1
   .de_oitf_wen               ( de_oitf_wen             ), // the instruction decoded need to write back to rd
   .de_oitf_csr_idx           ( de_oitf_csr_idx         ), // the instruction decoded need to write back to rd
//with exu
   .alu_oitf_csr_cmt_flag     ( alu_oitf_csr_cmt_flag   ),
   .alu_oitf_csr_flush_flag   ( alu_oitf_csr_flush_flag ),
   .mul_oitf_cmt_flag         ( mul_oitf_cmt_flag       ),  
   .mul_oitf_flush_flag       ( mul_oitf_flush_flag     ),  
   .div_oitf_cmt_flag         ( div_oitf_cmt_flag       ),
   .div_oitf_flush_flag       ( div_oitf_flush_flag     ),
   .lsu_oitf_load_cmt_flag    ( lsu_oitf_load_cmt_flag  ),
   .alu_oitf_load_flush_flag  ( alu_oitf_load_flush_flag),
//with control   
   .oitf_ctrl_related         ( oitf_ctrl_related       )

);


gpr u7_gpr(
    .clk                      ( clk                  ),       //system clock 
    .rstn                     ( rstn                 ),       //system rstn
//WITH DE            
    .de_gpr_rs1_rvld          ( de_gpr_reg1_rdvld    ),       //read  rs1 vld
    .de_gpr_rs1_addr          ( de_gpr_reg1_raddr    ),       //register1 address
    .de_gpr_rs2_rvld          ( de_gpr_reg2_rdvld    ),       //read  rs2 vld
    .de_gpr_rs2_addr          ( de_gpr_reg2_raddr    ),       //register2 address    
//WITH WB           
   .wb_gpr_alu_ena            ( wb_gpr_alu_ena       ), // gpr write enable signal
   .wb_gpr_alu_wdata          ( wb_gpr_alu_wdata     ), // gpr write back data
   .wb_gpr_alu_rd_idx         ( wb_gpr_alu_rd_idx    ),
   .wb_gpr_mul_ena            ( wb_gpr_mul_ena       ), // gpr write enable signal
   .wb_gpr_mul_wdata          ( wb_gpr_mul_wdata     ), // gpr write back data
   .wb_gpr_mul_rd_idx         ( wb_gpr_mul_rd_idx    ),
   .wb_gpr_div_ena            ( wb_gpr_div_ena       ), // gpr write enable signal
   .wb_gpr_div_wdata          ( wb_gpr_div_wdata     ), // gpr write back data
   .wb_gpr_div_rd_idx         ( wb_gpr_div_rd_idx    ),
   .wb_gpr_lsu_ena            ( wb_gpr_lsu_ena       ), // gpr write enable signal
   .wb_gpr_lsu_wdata          ( wb_gpr_lsu_wdata     ), // gpr write back data
   .wb_gpr_lsu_rd_idx         ( wb_gpr_lsu_rd_idx    ),
//WITH OITF        
    .gpr_bypass_reg1_data     ( gpr_bypass_reg1_data ),
    .gpr_bypass_reg2_data     ( gpr_bypass_reg2_data ),
//WITH ALU        
//    .x0                       ( x0                   ),  
//    .x1                       ( x1                   ),  
//    .x2                       ( x2                   ),  
//    .x3                       ( x3                   ),  
//    .x4                       ( x4                   ),  
//    .x5                       ( x5                   ),  
//    .x6                       ( x6                   ),  
//    .x7                       ( x7                   ),  
    .x8                       ( x8                   ) 
//    .x9                       ( x9                   ),  
//    .x10                      ( x10                  ),  
//    .x11                      ( x11                  ),  
//    .x12                      ( x12                  ),  
//    .x13                      ( x13                  ),  
//    .x14                      ( x14                  ),  
//    .x15                      ( x15                  ),  
//    .x16                      ( x16                  ),  
//    .x17                      ( x17                  ),  
//    .x18                      ( x18                  ),  
//    .x19                      ( x19                  ),  
//    .x20                      ( x20                  ),  
//    .x21                      ( x21                  ),  
//    .x22                      ( x22                  ),  
//    .x23                      ( x23                  ),  
//    .x24                      ( x24                  ),  
//    .x25                      ( x25                  ),  
//    .x26                      ( x26                  ),  
//    .x27                      ( x27                  ),  
//    .x28                      ( x28                  ),  
//    .x29                      ( x29                  ),  
//    .x30                      ( x30                  ),  
//    .x31                      ( x31                  )  
);


csr u7_csr(
    .clk                        (clk                   ),       //system clock 
    .rstn                       (rstn                  ),       //system rstn
//WITH ROB
    .rob_csr_pc_vld             (rob_csr_pc_vld        ),
//WITH GPR
    .x8                         (x8                    ),
//WITH JTAG         
    .jtag_csr_ena               (jtag_csr_ena          ), //the enable signal that                            j tag operation to csr
    .jtag_csr_we                (jtag_csr_we           ), //write enable, 1 is write , 0 is read operation
    .jtag_csr_idx               (jtag_csr_idx          ), //index of csr
    .jtag_csr_wdata             (jtag_csr_wdata        ), //write data from                                   j tag to csr
    .jtag_csr_reset_req         (jtag_csr_reset_req    ), //reset dcsr[8:6],cause when reset active,[8:6]=000
    .jtag_csr_halt_req          (jtag_csr_halt_req     ), //halt dcr[8:6]
    .csr_jtag_rdata             (csr_jtag_rdata        ), //read data from cs
//WITH DE          
    .de_csr_rd_idx              (de_csr_rd_idx         ),
    .de_csr_rd_vld              (de_csr_rd_vld         ),
//WITH ALU        
    .csr_bypass_data            (csr_bypass_data       ),
//WITH INT       
    .int_csr_ext                (int_csr_ext           ),
    .int_csr_tmr                (int_csr_tmr           ),
    .int_csr_sft                (int_csr_sft           ),
    .csr_int_mie                (csr_int_mie           ),
    .csr_int_meip               (csr_int_meip          ),
    .csr_int_mtip               (csr_int_mtip          ),
    .csr_int_msip               (csr_int_msip          ),
    .csr_int_mtvec              (csr_int_mtvec         ),
    .csr_int_epc                (csr_int_epc           ),
    .int_csr_ecause             (int_csr_ecause        ),
    .int_csr_epc                (int_csr_epc           ),
    .int_csr_ena                (int_csr_ena           ),
    .int_csr_mret               (int_csr_mret          ),
    .int_csr_dcause             (int_csr_dcause        ),
    .int_csr_dpc                (int_csr_dpc           ),
    .int_csr_dena               (int_csr_dena          ),
    .int_csr_mtval              (int_csr_mtval         ),
//WITH WB       
    .wb_csr_ena                 (wb_csr_ena            ),
    .wb_csr_wdata               (wb_csr_wdata          ),
    .wb_csr_rd_idx              (wb_csr_rd_idx         )
//WITH CHECKER
/*
    .csr_mstatus                (csr_mstatus           ),
    .csr_mie                    (csr_mie               ),
    .csr_mip                    (csr_mip               ),
    .csr_mtvec                  (csr_mtvec             ),
    .csr_mscratch               (csr_mscratch          ),
    .csr_mcycle                 (csr_mcycle            ),
    .csr_minstret               (csr_minstret          ),
    .csr_mepc                   (csr_mepc              ),
    .csr_mcause                 (csr_mcause            ),
    .csr_mtval                  (csr_mtval             ),
    .csr_misa                   (csr_misa              ),
    .csr_mvendorid              (csr_mvendorid         ),
    .csr_marchid                (csr_marchid           ),
    .csr_mimpid                 (csr_mimpid            ),
    .csr_mhartid                (csr_mhartid           ),
    .csr_dcsr                   (csr_dcsr              ),
    .csr_dpc                    (csr_dpc               ),
    .csr_dscratch               (csr_dscratch          )
*/
);



int_top u8_int_top(
  .clk                          (clk                   ),
  .rstn                         (rstn                  ),
//external interrupt            require
  .ext_plic_irq                 (ext_plic_irq          ),
//with biu                     
  .biu_int_haddr                (biu_int_haddr         ),
  .biu_int_hwdata               (biu_int_hwdata        ),
  .biu_int_hwrite               (biu_int_hwrite        ),
  .biu_int_htrans               (biu_int_htrans        ),
  .biu_int_hsize                (biu_int_hsize         ),
  .biu_int_hburst               (biu_int_hburst        ),
  .biu_int_hsel                 (biu_int_hsel          ),
  .biu_int_hready               (biu_int_hready        ),
  .int_biu_hrdata               (int_biu_hrdata        ),
  .int_biu_hresp                (int_biu_hresp         ),
  .int_biu_hreadyout            (int_biu_hreadyout     ),
//with jtag        
  .jtag_irq                     (0                     ),
  .int_jtag_ebreak              (int_jtag_ebreak       ),
//with csr        
  .int_csr_ext                  (int_csr_ext           ),
  .int_csr_tmr                  (int_csr_tmr           ),
  .int_csr_sft                  (int_csr_sft           ),
  .csr_int_meip                 (csr_int_meip          ), // external irq mask
  .csr_int_msip                 (csr_int_msip          ), // software irq mask
  .csr_int_mtip                 (csr_int_mtip          ), // timer    irq mask
  .csr_int_mie                  (csr_int_mie           ), // global interrupt 1: irq acceptable  in mstatus register
  .csr_int_epc                  (csr_int_epc           ), // pc back when interrupt complete
  .csr_int_mtvec                (csr_int_mtvec         ), // interrupt service program pc
  .int_csr_epc                  (int_csr_epc           ), // breakpoint when interrrupt claim
  .int_csr_ecause               (int_csr_ecause        ), // interrupt cause when interrupt claim
  .int_csr_ena                  (int_csr_ena           ), // modify enable signal of mstatus reg when claim
  .int_csr_dpc                  (int_csr_dpc           ), // ebreak pc
  .int_csr_dena                 (int_csr_dena          ), // enable signal to modify dcsr and dcause regs
  .int_csr_dcause               (int_csr_dcause        ), // ebreak cause
  .int_csr_mret                 (int_csr_mret          ), // mret instruction from ctrl
  .int_csr_mtval                (int_csr_mtval         ), // mret instruction from ctrl
//with ctrl      
  .int_ctrl_mtvec               (int_ctrl_mtvec        ),       // interrupt service program pc
  .int_ctrl_epc                 (int_ctrl_epc          ),       // pc recover
  .int_ctrl_req                 (int_ctrl_req          ),       // interrupt require to cpu
  .int_ctrl_mret                (int_ctrl_mret         ),       // interrupt finish signal
//with alu      
  .alu_int_vld                  (alu_int_vld           ),
  .alu_int_pc                   (alu_int_pc            ),
  .alu_int_beq                  (alu_int_beq           ),
  .alu_int_l_misa               (alu_int_l_misa        ),
  .alu_int_s_misa               (alu_int_s_misa        ),
  .alu_int_ls_addr              (alu_int_ls_addr       ),
//with de      
  .de_int_ebreak                (de_int_ebreak         ),
  .de_int_ecall                 (de_int_ecall          ),
  .de_int_mret                  (de_int_mret           ), 
  .de_int_misa                  (de_int_misa           ), 
  .de_int_memerr                (de_int_memerr         ), 
  .de_int_illegal               (de_int_illegal        ), 
  .de_int_illegal_inst          (de_int_illegal_inst   ),  
//with timer   
  .trigger                      (trigger               )  //always on clk sync bose edge signal
);



biu u9_biu(
  .rstn                       ( rstn                  ),
  .clk                        ( clk                   ),
//with jtag            
  .jtag2icb_cmd_valid         ( jtag2icb_cmd_valid    ),
  .jtag2icb_cmd_ready         ( jtag2icb_cmd_ready    ),
  .jtag2icb_cmd_addr          ( jtag2icb_cmd_addr     ),
  .jtag2icb_cmd_read          ( jtag2icb_cmd_read     ),
  .jtag2icb_cmd_wdata         ( jtag2icb_cmd_wdata    ),
  .jtag2icb_cmd_wmask         ( jtag2icb_cmd_wmask    ),
  .jtag2icb_rsp_valid         ( jtag2icb_rsp_valid    ),
  .jtag2icb_rsp_ready         ( jtag2icb_rsp_ready    ),
  .jtag2icb_rsp_rdata         ( jtag2icb_rsp_rdata    ),
  .jtag2icb_rsp_err           ( jtag2icb_rsp_err      ),
//with lsu            
  .lsu2icb_cmd_valid          ( dcache2icb_cmd_valid     ),
  .lsu2icb_cmd_ready          ( dcache2icb_cmd_ready     ),
  .lsu2icb_cmd_addr           ( dcache2icb_cmd_addr      ),
  .lsu2icb_cmd_read           ( dcache2icb_cmd_read      ),
  .lsu2icb_cmd_wdata          ( dcache2icb_cmd_wdata     ),
  .lsu2icb_cmd_wmask          ( dcache2icb_cmd_wmask     ),
  .lsu2icb_rsp_valid          ( dcache2icb_rsp_valid     ),
  .lsu2icb_rsp_ready          ( dcache2icb_rsp_ready     ),
  .lsu2icb_rsp_rdata          ( dcache2icb_rsp_rdata     ),
  .lsu2icb_rsp_err            ( dcache2icb_rsp_err       ),
//with ifu           
  .icache2icb_cmd_valid       ( icache2icb_cmd_valid  ),
  .icache2icb_cmd_ready       ( icache2icb_cmd_ready  ),
  .icache2icb_cmd_addr        ( icache2icb_cmd_addr   ),
  .icache2icb_cmd_read        ( icache2icb_cmd_read   ),
  .icache2icb_cmd_wdata       ( icache2icb_cmd_wdata  ),
  .icache2icb_cmd_wmask       ( icache2icb_cmd_wmask  ),
  .icache2icb_rsp_valid       ( icache2icb_rsp_valid  ),
  .icache2icb_rsp_ready       ( icache2icb_rsp_ready  ),
  .icache2icb_rsp_rdata       ( icache2icb_rsp_rdata  ),
  .icache2icb_rsp_err         ( icache2icb_rsp_err    ),
//with int          
  .int_biu_hreadyout          ( int_biu_hreadyout     ),
  .int_biu_hresp              ( int_biu_hresp         ),
  .int_biu_hrdata             ( int_biu_hrdata        ),
  .biu_int_hready             ( biu_int_hready        ),
  .biu_int_hsel               ( biu_int_hsel          ),
  .biu_int_haddr              ( biu_int_haddr         ),
  .biu_int_hwrite             ( biu_int_hwrite        ),
  .biu_int_hwdata             ( biu_int_hwdata        ),
  .biu_int_hburst             ( biu_int_hburst        ),
  .biu_int_hsize              ( biu_int_hsize         ),
  .biu_int_htrans             ( biu_int_htrans        ),
//with pad   
  .axi_ar_valid               ( axi_ar_valid          ),
  .axi_ar_ready               ( axi_ar_ready          ),
  .axi_ar_addr                ( axi_ar_addr           ),
  .axi_ar_burst               ( axi_ar_burst          ),
  .axi_ar_cache               ( axi_ar_cache          ),
  .axi_ar_id                  ( axi_ar_id             ),
  .axi_ar_len                 ( axi_ar_len            ),
  .axi_ar_lock                ( axi_ar_lock           ),
  .axi_ar_prot                ( axi_ar_prot           ),
  .axi_ar_size                ( axi_ar_size           ), 
  .axi_ar_qos                 ( axi_ar_qos            ),
  .axi_ar_region              ( axi_ar_region         ),
  .axi_ar_user                ( axi_ar_user           ),
//r chanel        
  .axi_r_valid                ( axi_r_valid           ),
  .axi_r_ready                ( axi_r_ready           ),
  .axi_r_data                 ( axi_r_data            ),
  .axi_r_id                   ( axi_r_id              ),
  .axi_r_last                 ( axi_r_last            ),
  .axi_r_resp                 ( axi_r_resp            ), 
  .axi_r_user                 ( axi_r_user            ),
//aw channel     
  .axi_aw_valid               ( axi_aw_valid          ),
  .axi_aw_ready               ( axi_aw_ready          ),
  .axi_aw_addr                ( axi_aw_addr           ),
  .axi_aw_burst               ( axi_aw_burst          ),
  .axi_aw_cache               ( axi_aw_cache          ),
  .axi_aw_id                  ( axi_aw_id             ),
  .axi_aw_len                 ( axi_aw_len            ),
  .axi_aw_lock                ( axi_aw_lock           ),
  .axi_aw_prot                ( axi_aw_prot           ),
  .axi_aw_size                ( axi_aw_size           ), 
  .axi_aw_qos                 ( axi_aw_qos            ),
  .axi_aw_region              ( axi_aw_region         ),
  .axi_aw_user                ( axi_aw_user           ),
//w channel     
  .axi_w_valid                ( axi_w_valid           ),
  .axi_w_ready                ( axi_w_ready           ),
  .axi_w_data                 ( axi_w_data            ),
  .axi_w_last                 ( axi_w_last            ),
  .axi_w_strb                 ( axi_w_strb            ), 
  .axi_w_user                 ( axi_w_user            ),
//b channel    
  .axi_b_valid                ( axi_b_valid           ),
  .axi_b_ready                ( axi_b_ready           ),
  .axi_b_id                   ( axi_b_id              ),
  .axi_b_resp                 ( axi_b_resp            ),  //write reaponse, indicates the status of a write transaction
  .axi_b_user                 ( axi_b_user            )
);


rob u10_rob(
    .rstn                      ( rstn                      ),//active low 
    .clk                       ( clk                       ),//clock
//with DE
    .de_rob_inst               ( de_rob_inst               ),//instruction 
    .de_rob_inst_vld           ( de_rob_inst_vld           ),//instruction valid
    .de_rob_pc                 ( de_rob_pc                 ),//pc
    .de_rob_gpr_idx            ( de_rob_gpr_idx            ),
    .de_rob_csr_idx            ( de_rob_csr_idx            ),
    .de_rob_alu                ( de_rob_alu                ),// alu instruction
    .de_rob_csr                ( de_rob_csr                ),// csr instruction
    .de_rob_mul                ( de_rob_mul                ),// mul instruction 
    .de_rob_div                ( de_rob_div                ),// div instruction
    .de_rob_load               ( de_rob_load               ),// L&S instruction
    .de_rob_mret_alu_specail_cmt(de_rob_mret_alu_specail_cmt ),//only for difftest
//with ALU
    .alu_rob_alu_flush         ( alu_rob_alu_flush         ),
    .alu_rob_load_flush        ( alu_rob_load_flush        ),
    .alu_rob_csr_flush         ( alu_rob_csr_flush         ),
    .alu_rob_special_cmt       ( alu_rob_special_cmt       ),
//with MUL
    .mul_rob_flush             ( mul_rob_flush             ),
//with DIV
    .div_rob_flush             ( div_rob_flush             ),
//with WB
    .alu_wb_gpr_vld            ( alu_wb_gpr_vld            ),
    .alu_wb_gpr_wdata          ( alu_wb_gpr_wdata          ),
    .alu_wb_csr_vld            ( alu_wb_csr_vld            ),
    .alu_wb_csr_wdata          ( alu_wb_csr_wdata          ),
    .mul_wb_vld                ( mul_wb_vld                ),
    .mul_wb_data               ( mul_wb_data               ),
    .div_wb_vld                ( div_wb_vld                ),
    .div_wb_data               ( div_wb_data               ),
//with lsu
    .lsu_rob_skip              ( lsu_rob_skip              ),
    .lsu_rob_vld               ( lsu_rob_vld               ),
    .lsu_rob_wen               ( lsu_rob_wen               ), 
    .lsu_rob_wdata             ( lsu_rob_wdata             ),
//--CSR
    .rob_csr_pc_vld            ( rob_csr_pc_vld            )

/*    
//witc checker
    .jump_pc_hit               ( jump_pc_hit               ),
    .rob_checker_x0            ( rob_checker_x0            ),   
    .rob_checker_x1            ( rob_checker_x1            ), 
    .rob_checker_x2            ( rob_checker_x2            ),
    .rob_checker_x3            ( rob_checker_x3            ),
    .rob_checker_x4            ( rob_checker_x4            ),
    .rob_checker_x5            ( rob_checker_x5            ),
    .rob_checker_x6            ( rob_checker_x6            ),
    .rob_checker_x7            ( rob_checker_x7            ),
    .rob_checker_x8            ( rob_checker_x8            ),
    .rob_checker_x9            ( rob_checker_x9            ),
    .rob_checker_x10           ( rob_checker_x10           ),
    .rob_checker_x11           ( rob_checker_x11           ),
    .rob_checker_x12           ( rob_checker_x12           ),
    .rob_checker_x13           ( rob_checker_x13           ),
    .rob_checker_x14           ( rob_checker_x14           ),
    .rob_checker_x15           ( rob_checker_x15           ),
    .rob_checker_x16           ( rob_checker_x16           ),
    .rob_checker_x17           ( rob_checker_x17           ),
    .rob_checker_x18           ( rob_checker_x18           ),
    .rob_checker_x19           ( rob_checker_x19           ),
    .rob_checker_x20           ( rob_checker_x20           ),
    .rob_checker_x21           ( rob_checker_x21           ),
    .rob_checker_x22           ( rob_checker_x22           ), 
    .rob_checker_x23           ( rob_checker_x23           ), 
    .rob_checker_x24           ( rob_checker_x24           ), 
    .rob_checker_x25           ( rob_checker_x25           ), 
    .rob_checker_x26           ( rob_checker_x26           ),
    .rob_checker_x27           ( rob_checker_x27           ), 
    .rob_checker_x28           ( rob_checker_x28           ), 
    .rob_checker_x29           ( rob_checker_x29           ), 
    .rob_checker_x30           ( rob_checker_x30           ),
    .rob_checker_x31           ( rob_checker_x31           ),
    .rob_checker_mstatus       ( rob_checker_mstatus       ), 
    .rob_checker_mie           ( rob_checker_mie           ),
    .rob_checker_mip           ( rob_checker_mip           ),
    .rob_checker_mtvec         ( rob_checker_mtvec         ),
    .rob_checker_mscratch      ( rob_checker_mscratch      ),
    .rob_checker_mcycle        ( rob_checker_mcycle        ),
    .rob_checker_minstret      ( rob_checker_minstret      ),
    .rob_checker_mepc          ( rob_checker_mepc          ),
    .rob_checker_mcause        ( rob_checker_mcause        ),
    .rob_checker_mtval         ( rob_checker_mtval         ),
    .rob_checker_misa          ( rob_checker_misa          ),
    .rob_checker_mvendorid     ( rob_checker_mvendorid     ),
    .rob_checker_marchid       ( rob_checker_marchid       ),
    .rob_checker_mimpid        ( rob_checker_mimpid        ),
    .rob_checker_mhartid       ( rob_checker_mhartid       ),
    .rob_checker_dcsr          ( rob_checker_dcsr          ),
    .rob_checker_dpc           ( rob_checker_dpc           ),
    .rob_checker_dscratch      ( rob_checker_dscratch      )
*/
);
/*
rob_checker u11_rob_checker(
    .rstn                      ( rstn                      ),//active low 
    .clk                       ( clk                       ),//clock
    .jump_pc_hit               ( jump_pc_hit               ),
// GPR
    .x0                        ( x0                        ),  
    .x1                        ( x1                        ),  
    .x2                        ( x2                        ),  
    .x3                        ( x3                        ),  
    .x4                        ( x4                        ),  
    .x5                        ( x5                        ),  
    .x6                        ( x6                        ),  
    .x7                        ( x7                        ),  
    .x8                        ( x8                        ),  
    .x9                        ( x9                        ),  
    .x10                       ( x10                       ),  
    .x11                       ( x11                       ),  
    .x12                       ( x12                       ),  
    .x13                       ( x13                       ),  
    .x14                       ( x14                       ),  
    .x15                       ( x15                       ),  
    .x16                       ( x16                       ),  
    .x17                       ( x17                       ),  
    .x18                       ( x18                       ),  
    .x19                       ( x19                       ),  
    .x20                       ( x20                       ),  
    .x21                       ( x21                       ),  
    .x22                       ( x22                       ),  
    .x23                       ( x23                       ),  
    .x24                       ( x24                       ),  
    .x25                       ( x25                       ),  
    .x26                       ( x26                       ),  
    .x27                       ( x27                       ),  
    .x28                       ( x28                       ),  
    .x29                       ( x29                       ),  
    .x30                       ( x30                       ),  
    .x31                       ( x31                       ),  
// CSR
    .csr_mstatus               ( csr_mstatus               ),                                
    .csr_mie                   ( csr_mie                   ),                                        
    .csr_mip                   ( csr_mip                   ),
    .csr_mtvec                 ( csr_mtvec                 ),
    .csr_mscratch              ( csr_mscratch              ),
    .csr_mcycle                ( csr_mcycle                ),
    .csr_minstret              ( csr_minstret              ),
    .csr_mepc                  ( csr_mepc                  ),
    .csr_mcause                ( csr_mcause                ),
    .csr_mtval                 ( csr_mtval                 ),
    .csr_misa                  ( csr_misa                  ),
    .csr_mvendorid             ( csr_mvendorid             ),
    .csr_marchid               ( csr_marchid               ),
    .csr_mimpid                ( csr_mimpid                ),
    .csr_mhartid               ( csr_mhartid               ),
    .csr_dcsr                  ( csr_dcsr                  ),
    .csr_dpc                   ( csr_dpc                   ),
    .csr_dscratch              ( csr_dscratch              ),
//ROB_GPR
    .rob_checker_x0            ( rob_checker_x0            ),   
    .rob_checker_x1            ( rob_checker_x1            ), 
    .rob_checker_x2            ( rob_checker_x2            ),
    .rob_checker_x3            ( rob_checker_x3            ),
    .rob_checker_x4            ( rob_checker_x4            ),
    .rob_checker_x5            ( rob_checker_x5            ),
    .rob_checker_x6            ( rob_checker_x6            ),
    .rob_checker_x7            ( rob_checker_x7            ),
    .rob_checker_x8            ( rob_checker_x8            ),
    .rob_checker_x9            ( rob_checker_x9            ),
    .rob_checker_x10           ( rob_checker_x10           ),
    .rob_checker_x11           ( rob_checker_x11           ),
    .rob_checker_x12           ( rob_checker_x12           ),
    .rob_checker_x13           ( rob_checker_x13           ),
    .rob_checker_x14           ( rob_checker_x14           ),
    .rob_checker_x15           ( rob_checker_x15           ),
    .rob_checker_x16           ( rob_checker_x16           ),
    .rob_checker_x17           ( rob_checker_x17           ),
    .rob_checker_x18           ( rob_checker_x18           ),
    .rob_checker_x19           ( rob_checker_x19           ),
    .rob_checker_x20           ( rob_checker_x20           ),
    .rob_checker_x21           ( rob_checker_x21           ),
    .rob_checker_x22           ( rob_checker_x22           ), 
    .rob_checker_x23           ( rob_checker_x23           ), 
    .rob_checker_x24           ( rob_checker_x24           ), 
    .rob_checker_x25           ( rob_checker_x25           ), 
    .rob_checker_x26           ( rob_checker_x26           ),
    .rob_checker_x27           ( rob_checker_x27           ), 
    .rob_checker_x28           ( rob_checker_x28           ), 
    .rob_checker_x29           ( rob_checker_x29           ), 
    .rob_checker_x30           ( rob_checker_x30           ),
    .rob_checker_x31           ( rob_checker_x31           ),
//ROB_CSR
    .rob_checker_mstatus       ( rob_checker_mstatus       ),                                         
    .rob_checker_mie           ( rob_checker_mie           ),                                          
    .rob_checker_mip           ( rob_checker_mip           ),
    .rob_checker_mtvec         ( rob_checker_mtvec         ),
    .rob_checker_mscratch      ( rob_checker_mscratch      ),
    .rob_checker_mcycle        ( rob_checker_mcycle        ),
    .rob_checker_minstret      ( rob_checker_minstret      ),
    .rob_checker_mepc          ( rob_checker_mepc          ),
    .rob_checker_mcause        ( rob_checker_mcause        ),
    .rob_checker_mtval         ( rob_checker_mtval         ),
    .rob_checker_misa          ( rob_checker_misa          ),
    .rob_checker_mvendorid     ( rob_checker_mvendorid     ),
    .rob_checker_marchid       ( rob_checker_marchid       ),
    .rob_checker_mimpid        ( rob_checker_mimpid        ),
    .rob_checker_mhartid       ( rob_checker_mhartid       ),
    .rob_checker_dcsr          ( rob_checker_dcsr          ),
    .rob_checker_dpc           ( rob_checker_dpc           ),
    .rob_checker_dscratch      ( rob_checker_dscratch      ),
//OITF
    .oitf_checker_empty        ( oitf_checker_empty        )
);
*/
bypass u12_bypass(
//with gpr
.gpr_bypass_reg1_data          (  gpr_bypass_reg1_data     ), 
.gpr_bypass_reg2_data          (  gpr_bypass_reg2_data     ), 
//with csr              
.csr_bypass_data               (  csr_bypass_data          ), 
//with de               
.de_bypass_rs1_idx             (  de_bypass_rs1_idx        ), 
.de_bypass_rs2_idx             (  de_bypass_rs2_idx        ), 
//with alu             
.alu_bypass_vld                (  alu_bypass_vld           ), 
.alu_bypass_data               (  alu_bypass_data          ), 
.alu_bypass_rd_idx             (  alu_bypass_rd_idx        ), 
.alu_bypass_vld_1d             (  alu_bypass_vld_1d        ), 
.alu_bypass_data_1d            (  alu_bypass_data_1d       ), 
.alu_bypass_rd_idx_1d          (  alu_bypass_rd_idx_1d     ), 
.bypass_alu_rs1_data           (  bypass_alu_rs1_data      ), 
.bypass_alu_rs2_data           (  bypass_alu_rs2_data      ),                         
.bypass_alu_csr_data           (  bypass_alu_csr_data      ),
//with mul            
.mul_bypass_vld                (  mul_bypass_vld           ), 
.mul_bypass_data               (  mul_bypass_data          ), 
.mul_bypass_rd_idx             (  mul_bypass_rd_idx        ), 
.mul_bypass_vld_1d             (  mul_bypass_vld_1d        ), 
.mul_bypass_data_1d            (  mul_bypass_data_1d       ), 
.mul_bypass_rd_idx_1d          (  mul_bypass_rd_idx_1d     ), 
.bypass_mul_rs1_data           (  bypass_mul_rs1_data      ), 
.bypass_mul_rs2_data           (  bypass_mul_rs2_data      ), 
//with div            
.div_bypass_vld                (  div_bypass_vld           ), 
.div_bypass_data               (  div_bypass_data          ), 
.div_bypass_rd_idx             (  div_bypass_rd_idx        ), 
.div_bypass_vld_1d             (  div_bypass_vld_1d        ), 
.div_bypass_data_1d            (  div_bypass_data_1d       ), 
.div_bypass_rd_idx_1d          (  div_bypass_rd_idx_1d     ), 
.bypass_div_rs1_data           (  bypass_div_rs1_data      ), 
.bypass_div_rs2_data           (  bypass_div_rs2_data      ), 
//with lsu           
.lsu_bypass_vld                (  lsu_bypass_vld           ), 
.lsu_bypass_data               (  lsu_bypass_data          ), 
.lsu_bypass_rd_idx             (  lsu_bypass_rd_idx        ), 
.lsu_bypass_vld_1d             (  lsu_bypass_vld_1d        ), 
.lsu_bypass_data_1d            (  lsu_bypass_data_1d       ), 
.lsu_bypass_rd_idx_1d          (  lsu_bypass_rd_idx_1d     )
);

endmodule