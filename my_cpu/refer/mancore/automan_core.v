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
  parameter   PC_DW      =  32 ,
  parameter   ADDR_DW    =  32 ,
  parameter   MEM_ADW    =  32 ,
  parameter   ITCM_DW    =  32 ,
  parameter   EXT_IRQ_NUM=  31 ,
  parameter   PRIO_WIDTH =  3  
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
  input [GPR_DW-1:0]            jtag_gpr_wdata  ,//write daat to gpr
  output[GPR_DW-1:0]            gpr_jtag_rdata  ,//gpr return read data to jtag 
  //transmission with csr------------------------------------------------------
  input                         jtag_csr_ena       ,//operation enable to csr
  input                         jtag_csr_we        ,//jtag write enable to csr 
  input [CSR_ADW-1:0]           jtag_csr_idx       ,
  input [     32-1:0]           jtag_csr_wdata     ,
  output[CSR_DW-1:0]            csr_jtag_rdata     ,
  //transmission with control--------------------------------------------------
  input                         jtag_ctrl_reset_req,
  input                         jtag_ctrl_halt_req ,
  //transmission with biu module ----------------------------------------------
  input                         jtag2icb_cmd_valid,//handshake signal from jtag
  output                        jtag2icb_cmd_ready,//handshake signal to jtag
  input [     32-1:0]           jtag2icb_cmd_addr ,//address from jtag 
  input                         jtag2icb_cmd_read ,//read enable 
  input [     32-1:0]           jtag2icb_cmd_wdata,//data from jtag
  input [        3:0]           jtag2icb_cmd_wmask,
  output                        jtag2icb_rsp_valid,//handshake
  input                         jtag2icb_rsp_ready,//handhaske
  output  [PC_DW-1:0]           jtag2icb_rsp_rdata,
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
 
  //r chanel
  input                         axi_r_valid       ,//indicates that the read data channel signals are valid
  output                        axi_r_ready       ,//indicates that a transfer on the read data channel can be accepted
  input        [63:0]           axi_r_data        ,//read data
  input        [7:0]            axi_r_id          ,//identification tag for read data and response
  input                         axi_r_last        ,//indicates whether this is the last data transfer in a read transaction
  input        [1:0]            axi_r_resp        ,//read reaponse, indicates the status of a read transfer
                             
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
 
  //w channel
  output                        axi_w_valid       ,//indicates that the write data channel signals are valid
  input                         axi_w_ready       ,//indicates that a transfer on the read data channel can be accepted
  output       [63:0]           axi_w_data        ,//write data
  output       [7:0]            axi_w_id          ,//identification tag for a write transaction
  output                        axi_w_last        ,//indicates whether this is the last data transfer in a write transaction
  output       [7:0]            axi_w_strb        ,//write strobes,indicate which byte lanes hold valid data
 
  //b channel
  input                         axi_b_valid       ,//indicates that the write response channel signals are valid
  output                        axi_b_ready       ,//indicates that a transfer on the write response channel can be accepted
  input        [7:0]            axi_b_id          ,//identification tag for a write response
  input        [1:0]            axi_b_resp        ,//write reaponse, indicates the status of a write transaction
//======================WITH INTERRUPT=========================================
  input                         trigger           ,
  input   [EXT_IRQ_NUM:0]       ext_plic_irq               
);

//----------------------declare --------------------------------//
wire                    ctrl_pc_stall           ; //Suspend the PC module pipeline
wire                    ctrl_ifu_stall          ; //Suspend the IFU module pipeline
wire                    ctrl_ifu_pc_vld         ;
wire  [PC_DW-1:0]       ctrl_ifu_pc             ;
wire                    ifu_ctrl_pc_state       ;
wire                    ctrl_de_fake_gen_flag   ;
wire                    ctrl_de_stall           ; //Suspend the DE  module pipeline
wire                    ctrl_alu_stall          ; //Suspend the ALU  module pipeline
wire                    ctrl_alu_fake_gen_flag  ; //fake output vld gen_flag
wire                    ctrl_lsu_fake_gen_flag  ; //fake output vld gen_flag
wire                    ctrl_mdu_fake_gen_flag  ; //fake output vld gen_flag
wire                    ctrl_oitf_fake_gen_flag  ; //fake output vld gen_flag
wire  [PC_DW-1:0]       ifu_de_pc               ;
wire                    de_real_valid           ;
wire                    ifu2icache_cmd_valid    ;
wire  [MEM_ADW-1:0]     ifu2icache_cmd_addr     ;
wire                    ifu2icache_cmd_read     ; //1'b1
wire  [MEM_ADW-1:0]     ifu2icache_cmd_wdata    ; //useless
wire  [MEM_ADW/8-1:0]   ifu2icache_cmd_wmask    ; //4'b1111
wire                    ifu2icache_rsp_ready    ; //1'b1
wire  [MEM_ADW-1:0]     ifu_de_inst             ;
wire                    ifu_de_inst_vld         ;
wire                    ifu_de_inst_ori_vld     ;
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
wire                    de_alu_fence_i_flag     ;
wire [PC_DW-1:0]        de_alu_pc               ;
wire [CSR_ADW-1:0]      de_csr_rd_idx           ;         
wire                    de_csr_rd_vld           ;         
wire                    de_oitf_inst_vld_ori    ;
wire                    de_oitf_inst_vld        ;
wire                    de_oitf_alu             ;
wire                    de_oitf_csr             ;
wire                    de_oitf_mul             ;
wire                    de_oitf_div             ;
wire                    de_oitf_ls              ;
wire                    de_oitf_ls_type         ;
wire [4:0]              de_oitf_rs1_idx         ;
wire [4:0]              de_oitf_rs2_idx         ;
wire [4:0]              de_oitf_rd_idx          ;
wire [11:0]             de_oitf_csr_idx         ;
wire                    de_oitf_rs1en           ;
wire                    de_oitf_rs2en           ;
wire                    de_oitf_wen             ;
wire                    de_oitf_store_vld       ;
wire [4:0]              de_gpr_reg1_raddr       ;
wire [4:0]              de_gpr_reg2_raddr       ;
wire                    de_gpr_reg1_rdvld       ;
wire                    de_gpr_reg2_rdvld       ;
wire                    de_gpr_mdu_flag         ;
wire                    de_gpr_div_flag         ;
wire [2:0]              de_mdu_mul_type         ;
wire [3:0]              de_mdu_div_type         ;
wire                    de_int_ebreak           ;
wire                    de_int_ecall            ;
wire                    de_int_mret             ;
wire                    de_int_misa             ;
wire                    de_int_memerr           ;
wire                    de_int_illegal          ;
wire [31:0]             de_int_illegal_inst     ;
wire                    alu_ctrl_jump_en        ;
wire                    alu_ctrl_fence_i_flag   ;
wire                    alu_wb_gpr_vld          ;
wire [GPR_DW-1:0]       alu_wb_gpr_wdata        ;
wire                    alu_wb_gpr_fake_vld     ;
wire                    alu_wb_csr_vld          ;
wire [CSR_DW-1:0]       alu_wb_csr_wdata        ;
wire                    alu_wb_csr_fake_vld     ;
wire                    alu_wb_load_fake_vld    ;
wire                    alu_wb_store_fake_vld ;
wire                    alu_lsu_vld_1p          ;
wire                    alu_lsu_vld             ;
wire [31:0]             alu_lsu_addr            ;
wire [GPR_DW-1:0]       alu_lsu_wdata           ;
wire [3:0]              alu_lsu_ls_type         ;
wire                    alu_lsu_wen             ;
wire [31:0]             alu_ifu_pc              ;
wire                    alu_ifu_pc_vld          ;
wire                    alu_int_vld             ;
wire [PC_DW-1:0]        alu_int_pc              ;
wire                    alu_int_beq             ;
wire                    alu_int_l_misa          ;
wire                    alu_int_s_misa          ;
wire [31:0]             alu_int_ls_addr         ;
wire                    lsu2icb_cmd_valid       ;
wire [MEM_ADW-1:0]      lsu2icb_cmd_addr        ;
wire                    lsu2icb_cmd_read        ;
wire [GPR_DW-1:0]       lsu2icb_cmd_wdata       ;
wire [7:0]              lsu2icb_cmd_wmask       ;
wire                    lsu2icb_rsp_ready       ;
wire                    lsu_wb_store_cmt_vld  ;
wire                    lsu_wb_vld              ;
wire [GPR_DW-1:0]       lsu_wb_wdata            ;
wire                    lsu_wb_wen              ;
wire                    lsu_wb_fake_vld         ;
wire                    wb_gpr_ena              ; // gpr write enable signal
wire [GPR_DW-1:0]       wb_gpr_wdata            ; // gpr write back data
wire                    wb_csr_ena              ; // csr write enable signal
wire [CSR_DW-1:0]       wb_csr_wdata            ; // csr write back data
wire                    wb_oitf_store_cmt_vld;
wire                    wb_oitf_store_fake_vld;
wire                    wb_ctrl_alu_stall       ; // alu inst writing-back is waiting, please hold alu
wire                    wb_oitf_alu_flag        ; // alu inst writed back now
wire                    wb_oitf_csr_flag        ; // csr inst writed back now
wire                    wb_oitf_mul_flag        ; // mul inst writed back now
wire                    wb_oitf_div_flag        ; // div inst writed back now
wire                    wb_oitf_ls_flag         ; // ls  inst writed back now
wire                    wb_oitf_alu_fake        ; // the alu inst writed back is fake
wire                    wb_oitf_csr_fake        ; // the csr inst writed back is fake
wire                    wb_oitf_mul_fake        ; // the mul inst writed back is fake
wire                    wb_oitf_div_fake        ; // the div inst writed back is fake
wire                    wb_oitf_ls_fake         ; // the ls  inst writed back is fake
wire                    oitf_ctrl_empty         ; // oitf entried are all empty
wire                    oitf_ctrl_related       ; // generate data ralated problem
wire [4:0]              oitf_gpr_index          ; //index of writing-back gpr
wire [11:0]             oitf_csr_index          ; //index of writing-back csr
wire                    oitf_checker_empty      ;
wire                    gpr_alu_data_vld        ;
wire [GPR_DW-1:0]       gpr_alu_reg1_data       ;
wire [GPR_DW-1:0]       gpr_alu_reg2_data       ;
wire                    gpr_mdu_mul_data_vld    ;
wire [GPR_DW-1:0]       gpr_mdu_mul_reg1_data   ;
wire [GPR_DW-1:0]       gpr_mdu_mul_reg2_data   ;
wire                    gpr_mdu_div_data_vld    ;
wire [GPR_DW-1:0]       gpr_mdu_div_reg1_data   ;
wire [GPR_DW-1:0]       gpr_mdu_div_reg2_data   ;
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
wire                    csr_alu_data_vld        ;
wire [CSR_DW-1:0]       csr_alu_data            ;
wire                    csr_int_mie             ;
wire                    csr_int_meip            ;
wire                    csr_int_mtip            ;
wire                    csr_int_msip            ;
wire [    32-1:0]       csr_int_mtvec           ;
wire [    32-1:0]       csr_int_epc             ;
wire [      63:0]       int_biu_hrdata          ;
wire                    int_biu_hresp           ;
wire                    int_biu_hreadyout       ;
wire                    jtag_irq                ;
wire                    int_jtag_ebreak         ;
wire                    int_csr_ext             ;
wire                    int_csr_tmr             ;
wire                    int_csr_sft             ;
wire [      31:0]       int_csr_epc             ; // breakpoint when interrrupt claim
wire [      31:0]       int_csr_ecause          ; // interrupt cause when interrupt claim
wire                    int_csr_ena             ; // modify enable signal of mstatus reg when claim
wire [      31:0]       int_csr_dpc             ; // ebreak pc
wire                    int_csr_dena            ; // enable signal to modify dcsr and dcause regs
wire [      31:0]       int_csr_mtval           ; // enable signal to modify dcsr and dcause regs
wire [       2:0]       int_csr_dcause          ; // ebreak cause
wire                    int_csr_mret            ; // mret instruction from ctrl
wire [      31:0]       int_ctrl_mtvec          ; // interrupt service program pc
wire [      31:0]       int_ctrl_epc            ; // pc recover
wire                    int_ctrl_req            ; // interrupt require to cpu
wire                    int_ctrl_mret           ; // interrupt finish signal
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
wire                    lsu2icb_cmd_ready       ;
wire                    lsu2icb_rsp_valid       ;
wire [GPR_DW-1:0]       lsu2icb_rsp_rdata       ;
wire                    lsu2icb_rsp_err         ;
wire                    ifu2icache_cmd_ready    ;
wire                    ifu2icache_rsp_valid    ;
wire [PC_DW -1:0]       ifu2icache_rsp_rdata    ;
wire                    ifu2icache_rsp_err      ;
wire                    biu_int_hready          ;
wire                    biu_int_hsel            ;
wire [MEM_ADW-1:0]      biu_int_haddr           ;
wire                    biu_int_hwrite          ;
wire [     64-1:0]      biu_int_hwdata          ;
wire [2:0]              biu_int_hburst          ;
wire [2:0]              biu_int_hsize           ;
wire [1:0]              biu_int_htrans          ;
wire                    mdu_wb_mul_vld          ;
wire [63:0]             mdu_wb_mul_wdata        ;
wire                    mdu_wb_mul_fake_vld     ;
wire                    mdu_wb_div_vld          ;
wire [GPR_DW-1:0]       mdu_wb_div_wdata        ;
wire                    mdu_wb_div_fake_vld     ;
wire                    icache2icb_cmd_valid    ;       
wire [ADDR_DW-1:0]      icache2icb_cmd_addr     ;       
wire                    icache2icb_cmd_read     ;       
wire [     32-1:0]      icache2icb_cmd_wdata    ;       
wire [3:0]              icache2icb_cmd_wmask    ;       
wire                    icache2icb_rsp_ready    ;       
wire                    icache2icb_cmd_ready    ;
wire                    icache2icb_rsp_valid    ;
wire [63:0]             icache2icb_rsp_rdata    ; 
wire                    icache2icb_rsp_err      ;

wire                    ctrl_rob_flush_start      ;
wire  [31:0]            alu_rob_flush_pc          ;
wire  [31:0]            ifu_rob_jump_pc           ;
wire  [31:0]            de_rob_inst               ;//instruction 
wire                    de_rob_inst_vld           ;//instruction valid
wire  [31:0]            de_rob_pc                 ;//pc
wire                    de_rob_pc_vld             ;//pc_valid
wire  [4:0]             de_rob_gpr_idx            ;
wire  [11:0]            de_rob_csr_idx            ;
wire                    de_rob_alu                ;// alu instruction
wire                    de_rob_csr                ;// csr instruction
wire                    de_rob_mul                ;// mul instruction 
wire                    de_rob_div                ;// div instruction
wire                    de_rob_load               ;// L&S instruction
wire                    wb_rob_alu_gpr_vld        ; // alu instruction need write to gpr
wire  [63:0]            wb_rob_alu_gpr_wdata      ; // writed back data from alu inst
wire                    wb_rob_alu_gpr_fake_vld   ; // alu's fake wb, just commit, not write back
wire                    wb_rob_alu_csr_vld        ; // csr instruction need write to gpr
wire  [63:0]            wb_rob_alu_csr_wdata      ; // writed back data from csr inst
wire                    wb_rob_alu_csr_fake_vld   ; // alu's fake wb, just commit, not write back
wire                    wb_rob_load_fake_vld      ;
wire                    wb_rob_store_fake_vld     ; //
wire                    wb_rob_mul_vld            ; // mul instruction need write to gpr
wire  [63:0]            wb_rob_mul_wdata          ; // writed back data from mul inst
wire                    wb_rob_mul_fake_vld       ; // mul's fake wb, just commit, not write back
wire                    wb_rob_div_vld            ; // div instruction need write to gpr
wire  [63:0]            wb_rob_div_wdata          ; // writed back data from div inst
wire                    wb_rob_div_fake_vld       ; // div's fake wb, just commit, not write back
wire                    wb_rob_lsu_store_cmt_vld; // store ins, oitf store case
wire                    wb_rob_lsu_vld            ; // ls instruction need write to gpr
wire    [63:0]          wb_rob_lsu_wdata          ; // writed back data from ls inst
wire                    wb_rob_lsu_wen            ; // ls instruction need write back
wire                    rob_csr_pc_vld         ;
wire [GPR_DW-1:0]       rob_checker_x0         ;
wire [GPR_DW-1:0]       rob_checker_x1         ;
wire [GPR_DW-1:0]       rob_checker_x2         ;
wire [GPR_DW-1:0]       rob_checker_x3         ;
wire [GPR_DW-1:0]       rob_checker_x4         ;
wire [GPR_DW-1:0]       rob_checker_x5         ;
wire [GPR_DW-1:0]       rob_checker_x6         ;
wire [GPR_DW-1:0]       rob_checker_x7         ;
wire [GPR_DW-1:0]       rob_checker_x8         ;
wire [GPR_DW-1:0]       rob_checker_x9         ;
wire [GPR_DW-1:0]       rob_checker_x10        ;
wire [GPR_DW-1:0]       rob_checker_x11        ;
wire [GPR_DW-1:0]       rob_checker_x12        ;
wire [GPR_DW-1:0]       rob_checker_x13        ;
wire [GPR_DW-1:0]       rob_checker_x14        ;
wire [GPR_DW-1:0]       rob_checker_x15        ;
wire [GPR_DW-1:0]       rob_checker_x16        ;
wire [GPR_DW-1:0]       rob_checker_x17        ;
wire [GPR_DW-1:0]       rob_checker_x18        ;
wire [GPR_DW-1:0]       rob_checker_x19        ;
wire [GPR_DW-1:0]       rob_checker_x20        ;
wire [GPR_DW-1:0]       rob_checker_x21        ;
wire [GPR_DW-1:0]       rob_checker_x22        ;
wire [GPR_DW-1:0]       rob_checker_x23        ;
wire [GPR_DW-1:0]       rob_checker_x24        ;
wire [GPR_DW-1:0]       rob_checker_x25        ;
wire [GPR_DW-1:0]       rob_checker_x26        ;
wire [GPR_DW-1:0]       rob_checker_x27        ;
wire [GPR_DW-1:0]       rob_checker_x28        ;
wire [GPR_DW-1:0]       rob_checker_x29        ;
wire [GPR_DW-1:0]       rob_checker_x30        ;
wire [GPR_DW-1:0]       rob_checker_x31        ;

//WITH ROB_CSR
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

//------JTAG begin --------------TBD
assign  gpr_jtag_rdata = 0;

wire  jtag_csr_reset_req; 
wire  jtag_csr_halt_req;


assign  jtag_csr_reset_req  = 1'b0;
assign  jtag_csr_halt_req   = 1'b0; 
//assign  jtag2icb_rsp_rdata=32'b0 ;
//------JTAG end --------------TBD





control u0_control (
    .clk                    ( clk                       ), //clk
    .rstn                   ( rstn                      ),
//WITH OITF
    .ctrl_oitf_fake_gen_flag(ctrl_oitf_fake_gen_flag    ),
    .oitf_ctrl_related      ( oitf_ctrl_related         ), //Indicating data related
    .oitf_ctrl_empty        ( oitf_ctrl_empty           ), //Indicating OITF empty.All instructions are executed
//WITH WB
    .wb_ctrl_alu_stall      ( wb_ctrl_alu_stall         ), //The ALU datapath requests to suspend the pipeline
//WITH IFU
    .ctrl_pc_stall          ( ctrl_pc_stall             ), //Suspend the PC module pipeline
    .ctrl_ifu_stall         ( ctrl_ifu_stall            ), //Suspend the IFU module pipeline
    .ctrl_ifu_pc_vld        ( ctrl_ifu_pc_vld           ),
    .ctrl_ifu_pc            ( ctrl_ifu_pc               ),
    .ifu_ctrl_pc_state      ( ifu_ctrl_pc_state         ),    
//WITH DE 
    .ctrl_de_stall          ( ctrl_de_stall             ), //Suspend the DE  module pipeline   
    .ctrl_de_fake_gen_flag  ( ctrl_de_fake_gen_flag     ),    
//WITH ALU 
    .alu_ctrl_jump_en       ( alu_ctrl_jump_en          ), //BEQ ins jump_en
    .alu_ctrl_fence_i_flag  ( alu_ctrl_fence_i_flag     ), //BEQ ins jump_en
    .ctrl_alu_stall         ( ctrl_alu_stall            ), //Suspend the ALU  module pipeline
    .ctrl_alu_fake_gen_flag ( ctrl_alu_fake_gen_flag    ), //fake output vld gen_flag 
//WITH LSU 
    .ctrl_lsu_fake_gen_flag ( ctrl_lsu_fake_gen_flag    ), //fake output vld gen_flag
//WITH MDU
    .ctrl_mdu_fake_gen_flag ( ctrl_mdu_fake_gen_flag    ), //fake output vld gen_flag
//WITH ROB
    .ctrl_rob_flush_start   ( ctrl_rob_flush_start      ),

//WITH INT 
    .int_ctrl_mtvec         ( int_ctrl_mtvec            ),
    .int_ctrl_epc           ( int_ctrl_epc              ),
    .int_ctrl_req           ( int_ctrl_req              ),
    .int_ctrl_mret          ( int_ctrl_mret             )  
);


ifu  u1_ifu(  
  .clk                   ( clk        ), //clock
  .rstn                  ( rstn       ),
//WITH CTRL
  .ctrl_ifu_stall        ( ctrl_ifu_stall        ),//stop the pipeline
  .ctrl_pc_stall         ( ctrl_pc_stall         ),
  .ctrl_ifu_pc           ( ctrl_ifu_pc           ),
  .ctrl_ifu_pc_vld       ( ctrl_ifu_pc_vld       ),
  .ifu_ctrl_pc_state     ( ifu_ctrl_pc_state     ),  
//WITH ALU
  .alu_ifu_pc            ( alu_ifu_pc          ),
  .alu_ifu_pc_vld        ( alu_ifu_pc_vld      ),
// WITH ICACHE
  .ifu2icache_cmd_valid  ( ifu2icache_cmd_valid    ),
  .ifu2icache_cmd_ready  ( ifu2icache_cmd_ready    ),
  .ifu2icache_cmd_addr   ( ifu2icache_cmd_addr     ),
  .ifu2icache_cmd_read   ( ifu2icache_cmd_read     ),//1'b1
  .ifu2icache_cmd_wdata  ( ifu2icache_cmd_wdata    ),//useless 
  .ifu2icache_cmd_wmask  ( ifu2icache_cmd_wmask    ),//4'b1111
  .ifu2icache_rsp_valid  ( ifu2icache_rsp_valid    ),
  .ifu2icache_rsp_ready  ( ifu2icache_rsp_ready    ),//1'b1
  .ifu2icache_rsp_rdata  ( ifu2icache_rsp_rdata    ),
  .ifu2icache_rsp_err    ( ifu2icache_rsp_err      ),
//WITH DE
  .ifu_de_inst           ( ifu_de_inst             ),
  .ifu_de_inst_vld       ( ifu_de_inst_vld         ),   
  .ifu_de_pc             ( ifu_de_pc               ),
//  .ifu_de_inst_ori_vld   ( ifu_de_inst_ori_vld     ),   
  .de_real_valid         ( de_real_valid           ),
//WITH ROB
  .ifu_rob_jump_pc       ( ifu_rob_jump_pc         )

);

i_cache u1_i_cache(
    .clk                      ( clk                      ), //clk 
    .rstn                     ( rstn                     ),
//WITH IFU                           
    .ifu2icache_cmd_valid     ( ifu2icache_cmd_valid     ),//the handshake signal
    .ifu2icache_cmd_ready     ( ifu2icache_cmd_ready     ),//the handshake signal
    .ifu2icache_cmd_addr      ( ifu2icache_cmd_addr      ),//address from ifu
    .ifu2icache_cmd_read      ( ifu2icache_cmd_read      ),//read enable
    .ifu2icache_cmd_wdata     ( ifu2icache_cmd_wdata     ),//data from the ifu that needs to be written
    .ifu2icache_cmd_wmask     ( ifu2icache_cmd_wmask     ),//mask from the ifu
    .ifu2icache_rsp_valid     ( ifu2icache_rsp_valid     ),//the handshake signal
    .ifu2icache_rsp_ready     ( ifu2icache_rsp_ready     ),//the handshake signal
    .ifu2icache_rsp_rdata     ( ifu2icache_rsp_rdata     ),//data returned by the slave
    .ifu2icache_rsp_err       ( ifu2icache_rsp_err       ),
//WITH BIU                      
    .icache2icb_cmd_valid     ( icache2icb_cmd_valid     ),//the handshake signal  1
    .icache2icb_cmd_ready     ( icache2icb_cmd_ready     ),//the handshake signal  0
    .icache2icb_cmd_addr      ( icache2icb_cmd_addr      ),//address from ifu      1
    .icache2icb_cmd_read      ( icache2icb_cmd_read      ),//read enable           1
    .icache2icb_cmd_wdata     ( icache2icb_cmd_wdata     ),//data from the ifu that needs to be written
    .icache2icb_cmd_wmask     ( icache2icb_cmd_wmask     ),//mask from the ifu
    .icache2icb_rsp_valid     ( icache2icb_rsp_valid     ),//the handshake signal  0
    .icache2icb_rsp_ready     ( icache2icb_rsp_ready     ),//the handshake signal
    .icache2icb_rsp_rdata     ( icache2icb_rsp_rdata     ),//data returned by the slave 0
    .icache2icb_rsp_err       ( icache2icb_rsp_err       )                         //0
);


de u2_de (
  .clk                       ( clk                         ),
  .rstn                      ( rstn                        ),
  //WITH CONTROL  
  .ctrl_de_stall             ( ctrl_de_stall               ),
  .ctrl_de_fake_gen_flag     ( ctrl_de_fake_gen_flag       ),  
  //WITH IFU
  .ifu_de_inst               ( ifu_de_inst                 ),//instruct 
  .ifu_de_inst_vld           ( ifu_de_inst_vld             ),
  .ifu_de_pc                 ( ifu_de_pc                   ),//instruct 
  .de_real_valid             ( de_real_valid               ),
//  .ifu_de_inst_ori_vld       ( ifu_de_inst_ori_vld         ),   
  //WITH ALU
  .de_alu_pc                 ( de_alu_pc                   ),
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
  .de_alu_fence_i_flag       ( de_alu_fence_i_flag         ),
  //WITH CSR
  .de_csr_rd_idx             ( de_csr_rd_idx               ),
  .de_csr_rd_vld             ( de_csr_rd_vld               ),

  //WITH OITF
  .de_oitf_inst_vld_ori      ( de_oitf_inst_vld_ori        ),
  .de_oitf_inst_vld          ( de_oitf_inst_vld            ),
  .de_oitf_alu               ( de_oitf_alu                 ),
  .de_oitf_csr               ( de_oitf_csr          ),
  .de_oitf_mul               ( de_oitf_mul          ),
  .de_oitf_div               ( de_oitf_div          ),
  .de_oitf_ls                ( de_oitf_ls           ),
  .de_oitf_ls_type           ( de_oitf_ls_type      ),
  .de_oitf_rs1_idx           ( de_oitf_rs1_idx      ),
  .de_oitf_rs2_idx           ( de_oitf_rs2_idx      ),
  .de_oitf_rd_idx            ( de_oitf_rd_idx       ),
  .de_oitf_csr_idx           ( de_oitf_csr_idx      ),
  .de_oitf_rs1en             ( de_oitf_rs1en        ),
  .de_oitf_rs2en             ( de_oitf_rs2en        ),
  .de_oitf_wen               ( de_oitf_wen          ),
  .de_oitf_store_vld         ( de_oitf_store_vld    ),

  //WITH GPR 
  .de_gpr_reg1_raddr         ( de_gpr_reg1_raddr     ),
  .de_gpr_reg2_raddr         ( de_gpr_reg2_raddr     ),
  .de_gpr_reg1_rdvld         ( de_gpr_reg1_rdvld     ),
  .de_gpr_reg2_rdvld         ( de_gpr_reg2_rdvld     ),
  .de_gpr_mdu_flag           ( de_gpr_mdu_flag       ),
  .de_gpr_div_flag           ( de_gpr_div_flag       ),

   //WITH MDU
  .de_mdu_mul_type           ( de_mdu_mul_type       ),
  .de_mdu_div_type           ( de_mdu_div_type       ),

  //WITH ROB
  .de_rob_inst               ( de_rob_inst           ),//instruction 
  .de_rob_inst_vld           ( de_rob_inst_vld       ),//instruction valid
  .de_rob_pc                 ( de_rob_pc             ),//pc
  .de_rob_pc_vld             ( de_rob_pc_vld         ),//pc_valid
  .de_rob_gpr_idx            ( de_rob_gpr_idx        ),
  .de_rob_csr_idx            ( de_rob_csr_idx        ),
  .de_rob_alu                ( de_rob_alu            ),// alu instruction
  .de_rob_csr                ( de_rob_csr            ),// csr instruction
  .de_rob_mul                ( de_rob_mul            ),// mul instruction 
  .de_rob_div                ( de_rob_div            ),// div instruction
  .de_rob_load               ( de_rob_load           ),// L&S instruction


   //WITH INT               
  .de_int_ebreak             ( de_int_ebreak         ),
  .de_int_ecall              ( de_int_ecall          ),
  .de_int_mret               ( de_int_mret           ),
  .de_int_misa               ( de_int_misa           ),
  .de_int_memerr             ( de_int_memerr         ),
  .de_int_illegal            ( de_int_illegal        ),
  .de_int_illegal_inst       ( de_int_illegal_inst   ) 
);


alu u3_alu(
  .clk                          ( clk                             ),
  .rstn                         ( rstn                            ),
//WITH CONTROL
  .ctrl_alu_stall               ( ctrl_alu_stall                  ),
  .ctrl_alu_fake_gen_flag       ( ctrl_alu_fake_gen_flag          ),
  .alu_ctrl_jump_en             ( alu_ctrl_jump_en                ),
  .alu_ctrl_fence_i_flag        ( alu_ctrl_fence_i_flag           ), //BEQ ins jump_en
//WITH GPR
  .gpr_alu_reg1_data            ( gpr_alu_reg1_data               ),
  .gpr_alu_reg2_data            ( gpr_alu_reg2_data               ),
  .gpr_alu_data_vld             ( gpr_alu_data_vld                ),
//WITH CSR
  .csr_alu_data                 ( csr_alu_data                    ),
  .csr_alu_data_vld             ( csr_alu_data_vld                ),
//WITH DE             
  .de_alu_pc                    ( de_alu_pc                       ),
  .de_alu_inst_vld              ( de_alu_inst_vld                 ),
  .de_alu_wb_vld                ( de_alu_wb_vld                   ),
  .de_alu_reg2_flag             ( de_alu_reg2_flag                ),//1 is reg2_data,0 is alu_imm
  .de_alu_lui_flag              ( de_alu_lui_flag                 ),//1 represents lui operation is valid 
  .de_alu_shift_flag            ( de_alu_shift_flag               ),//1 represents shift operation is valid 
  .de_alu_shift_right_flag      ( de_alu_shift_right_flag         ),//1 represents shift right,0 represents shift left
  .de_alu_shift_logic_flag      ( de_alu_shift_logic_flag         ),//1 represents logic shift,0 represents arithmetic shift
  .de_alu_iw_en_flag            ( de_alu_iw_en_flag               ),//1 represents add and sub truncation operation is valid
  .de_alu_comp_flag             ( de_alu_comp_flag                ),//1 represents unsigned comparison operation is valid
  .de_alu_and_flag              ( de_alu_and_flag                 ),//1 represents and operation is valid 
  .de_alu_or_flag               ( de_alu_or_flag                  ),//1 represents or operation is valid 
  .de_alu_xor_flag              ( de_alu_xor_flag                 ),//1 represents xor operation is valid 
  .de_alu_adder_flag            ( de_alu_adder_flag               ),//1 represents addition operation is valid 
  .de_alu_sub_flag              ( de_alu_sub_flag                 ),//1 represents subtraction 
  .de_alu_auipc_flag            ( de_alu_auipc_flag               ),//1 represents  auipc operation is valid 
  .de_alu_ls_type               ( de_alu_ls_type                  ),//0001~1011 is valid
  .de_alu_imm                   ( de_alu_imm                      ),//immediate data
  .de_alu_con_jmp_type          ( de_alu_con_jmp_type             ),        
  .de_alu_ucon_jmp_type         ( de_alu_ucon_jmp_type            ),// 00 is invalid ,jal 01 ,jalr 10;
  .de_alu_csr_type              ( de_alu_csr_type                 ),// 000 is invalid
  .de_alu_fence_i_flag          ( de_alu_fence_i_flag             ),
//WITH WB              
  .alu_wb_gpr_vld               ( alu_wb_gpr_vld                  ),
  .alu_wb_gpr_wdata             ( alu_wb_gpr_wdata                ),
  .alu_wb_gpr_fake_vld          ( alu_wb_gpr_fake_vld             ),
  .alu_wb_csr_vld               ( alu_wb_csr_vld                  ),
  .alu_wb_csr_wdata             ( alu_wb_csr_wdata                ),
  .alu_wb_csr_fake_vld          ( alu_wb_csr_fake_vld             ),
  .alu_wb_load_fake_vld         ( alu_wb_load_fake_vld            ),
  .alu_wb_store_fake_vld      ( alu_wb_store_fake_vld         ),

//WITH LSU            
  .alu_lsu_vld_1p               ( alu_lsu_vld_1p                  ),
  .alu_lsu_vld                  ( alu_lsu_vld                     ),
  .alu_lsu_addr                 ( alu_lsu_addr                    ),
  .alu_lsu_wdata                ( alu_lsu_wdata                   ),
  .alu_lsu_ls_type              ( alu_lsu_ls_type                 ),
  .alu_lsu_wen                  ( alu_lsu_wen                     ),
//WITH IFU
  .alu_ifu_pc                   ( alu_ifu_pc                      ),
  .alu_ifu_pc_vld               ( alu_ifu_pc_vld                  ),

//with ROB
  .alu_rob_flush_pc             ( alu_rob_flush_pc                ),

//WITH INT
  .alu_int_vld                  ( alu_int_vld                     ),
  .alu_int_pc                   ( alu_int_pc                      ),
  .alu_int_beq                  ( alu_int_beq                     ),
  .alu_int_l_misa               ( alu_int_l_misa                  ),
  .alu_int_s_misa               ( alu_int_s_misa                  ),
  .alu_int_ls_addr              ( alu_int_ls_addr                 ) 
);

mul u3_mul(
    .clk                    ( clk                    ),
    .rstn                   ( rstn                   ),
    .gpr_mdu_mul_data_vld   ( gpr_mdu_mul_data_vld   ),
    .ctrl_mdu_fake_gen_flag ( ctrl_mdu_fake_gen_flag ),
    .gpr_mdu_mul_reg1_data  ( gpr_mdu_mul_reg1_data  ),
    .gpr_mdu_mul_reg2_data  ( gpr_mdu_mul_reg2_data  ),
    .de_mdu_mul_type        ( de_mdu_mul_type        ),
    .mdu_wb_mul_vld         ( mdu_wb_mul_vld         ),
    .mdu_wb_mul_wdata       ( mdu_wb_mul_wdata       ),
    .mdu_wb_mul_fake_vld    ( mdu_wb_mul_fake_vld    )    
);


div  u3_div(
    .clk                    (clk                    ), //clk
    .rst_n                  (rstn                   ),
    .de_mdu_div_type        (de_mdu_div_type        ),
    .ctrl_mdu_fake_gen_flag (ctrl_mdu_fake_gen_flag ),
    .gpr_mdu_div_data_vld   (gpr_mdu_div_data_vld   ),
    .gpr_mdu_div_reg1_data  (gpr_mdu_div_reg1_data  ),
    .gpr_mdu_div_reg2_data  (gpr_mdu_div_reg2_data  ),
    .mdu_wb_div_vld         (mdu_wb_div_vld         ),
    .mdu_wb_div_wdata       (mdu_wb_div_wdata       ),
    .mdu_wb_div_fake_vld    (mdu_wb_div_fake_vld    )  
);


lsu u4_lsu(
      .clk                    ( clk                    ),
      .rstn                   ( rstn                   ),
//      With CTRL       
      .ctrl_lsu_fake_gen_flag ( ctrl_lsu_fake_gen_flag ),
//      With ALU 
      .alu_lsu_vld_1p         ( alu_lsu_vld_1p         ),
      .alu_lsu_vld            ( alu_lsu_vld            ),
      .alu_lsu_addr           ( alu_lsu_addr           ),
      .alu_lsu_wdata          ( alu_lsu_wdata          ),
      .alu_lsu_wen            ( alu_lsu_wen            ),
      .alu_lsu_ls_type        ( alu_lsu_ls_type        ),
//      With BIU     
      .lsu2icb_cmd_valid      ( lsu2icb_cmd_valid      ),
      .lsu2icb_cmd_ready      ( lsu2icb_cmd_ready      ),
      .lsu2icb_cmd_addr       ( lsu2icb_cmd_addr       ),
      .lsu2icb_cmd_read       ( lsu2icb_cmd_read       ),
      .lsu2icb_cmd_wdata      ( lsu2icb_cmd_wdata      ),
      .lsu2icb_cmd_wmask      ( lsu2icb_cmd_wmask      ),
      .lsu2icb_rsp_valid      ( lsu2icb_rsp_valid      ),
      .lsu2icb_rsp_ready      ( lsu2icb_rsp_ready      ),
      .lsu2icb_rsp_rdata      ( lsu2icb_rsp_rdata      ),
      .lsu2icb_rsp_err        ( lsu2icb_rsp_err        ),
//      With WB   
      .lsu_wb_store_cmt_vld ( lsu_wb_store_cmt_vld ),
      .lsu_wb_vld             ( lsu_wb_vld             ),
      .lsu_wb_wdata           ( lsu_wb_wdata           ),
      .lsu_wb_wen             ( lsu_wb_wen             ),
      .lsu_wb_fake_vld        ( lsu_wb_fake_vld        )        
);



wb  u5_wb(
    .clk                 (clk                 ),
    .rstn                (rstn                ),
//with alu         
    .alu_wb_gpr_vld      (alu_wb_gpr_vld      ), // alu instruction need write to gpr
    .alu_wb_gpr_wdata    (alu_wb_gpr_wdata    ), // writed back data from alu inst
    .alu_wb_gpr_fake_vld (alu_wb_gpr_fake_vld ), // alu's fake wb, just commit, not write back
    .alu_wb_csr_vld      (alu_wb_csr_vld      ), // csr instruction need write to gpr
    .alu_wb_csr_wdata    (alu_wb_csr_wdata    ), // writed back data from csr inst
    .alu_wb_csr_fake_vld (alu_wb_csr_fake_vld ), // alu's fake wb, just commit, not write back
    .alu_wb_load_fake_vld(alu_wb_load_fake_vld),
    .alu_wb_store_fake_vld( alu_wb_store_fake_vld         ),

//with mdu        
    .mdu_wb_mul_vld      (mdu_wb_mul_vld      ), // mul instruction need write to gpr
    .mdu_wb_mul_wdata    (mdu_wb_mul_wdata    ), // writed back data from mul inst
    .mdu_wb_mul_fake_vld (mdu_wb_mul_fake_vld ), // mul's fake wb, just commit, not write back
    .mdu_wb_div_vld      (mdu_wb_div_vld      ), // div instruction need write to gpr
    .mdu_wb_div_wdata    (mdu_wb_div_wdata    ), // writed back data from div inst
    .mdu_wb_div_fake_vld (mdu_wb_div_fake_vld ), // div's fake wb, just commit, not write back
//with lsu    
    .lsu_wb_store_cmt_vld( lsu_wb_store_cmt_vld),
    .lsu_wb_vld          (lsu_wb_vld          ), // ls instruction need write to gpr
    .lsu_wb_wdata        (lsu_wb_wdata        ), // writed back data from ls inst
    .lsu_wb_wen          (lsu_wb_wen          ), // ls instruction need write back
    .lsu_wb_fake_vld     (lsu_wb_fake_vld     ), // ls's fake wb, just commit, not write back
//with gpr      
    .wb_gpr_ena          (wb_gpr_ena          ), // gpr write enable signal
    .wb_gpr_wdata        (wb_gpr_wdata        ), // gpr write back data
//with csr     
    .wb_csr_ena          (wb_csr_ena          ), // csr write enable signal
    .wb_csr_wdata        (wb_csr_wdata        ), // csr write back data
//with control      
    .wb_ctrl_alu_stall   (wb_ctrl_alu_stall   ), // alu inst writing-back is waiting, please hold alu

//WITH ROB    
    .wb_rob_alu_gpr_vld        ( wb_rob_alu_gpr_vld        ), // alu instruction need write to gpr
    .wb_rob_alu_gpr_wdata      ( wb_rob_alu_gpr_wdata      ), // writed back data from alu inst
    .wb_rob_alu_gpr_fake_vld   ( wb_rob_alu_gpr_fake_vld   ), // alu's fake wb, just commit, not write back
    .wb_rob_alu_csr_vld        ( wb_rob_alu_csr_vld        ), // csr instruction need write to gpr
    .wb_rob_alu_csr_wdata      ( wb_rob_alu_csr_wdata      ), // writed back data from csr inst
    .wb_rob_alu_csr_fake_vld   ( wb_rob_alu_csr_fake_vld   ), // alu's fake wb, just commit, not write back
    .wb_rob_load_fake_vld      ( wb_rob_load_fake_vld      ),
    .wb_rob_store_fake_vld     ( wb_rob_store_fake_vld     ), //
    .wb_rob_mul_vld            ( wb_rob_mul_vld            ), // mul instruction need write to gpr
    .wb_rob_mul_wdata          ( wb_rob_mul_wdata          ), // writed back data from mul inst
    .wb_rob_mul_fake_vld       ( wb_rob_mul_fake_vld       ), // mul's fake wb, just commit, not write back
    .wb_rob_div_vld            ( wb_rob_div_vld            ), // div instruction need write to gpr
    .wb_rob_div_wdata          ( wb_rob_div_wdata          ), // writed back data from div inst
    .wb_rob_div_fake_vld       ( wb_rob_div_fake_vld       ), // div's fake wb, just commit, not write back
    .wb_rob_lsu_store_cmt_vld  ( wb_rob_lsu_store_cmt_vld  ), // store ins, oitf store case
    .wb_rob_lsu_vld            ( wb_rob_lsu_vld            ), // ls instruction need write to gpr
    .wb_rob_lsu_wdata          ( wb_rob_lsu_wdata          ), // writed back data from ls inst
    .wb_rob_lsu_wen            ( wb_rob_lsu_wen            ),     // ls instruction need write back

//with oitf  
    .wb_oitf_store_cmt_vld (wb_oitf_store_cmt_vld),
    .wb_oitf_store_fake_vld(wb_oitf_store_fake_vld),
    .wb_oitf_alu_flag    (wb_oitf_alu_flag    ), // alu inst writed back now
    .wb_oitf_csr_flag    (wb_oitf_csr_flag    ), // csr inst writed back now
    .wb_oitf_mul_flag    (wb_oitf_mul_flag    ), // mul inst writed back now
    .wb_oitf_div_flag    (wb_oitf_div_flag    ), // div inst writed back now 
    .wb_oitf_ls_flag     (wb_oitf_ls_flag     ), // ls  inst writed back now
    .wb_oitf_alu_fake    (wb_oitf_alu_fake    ), // the alu inst writed back is fake
    .wb_oitf_csr_fake    (wb_oitf_csr_fake    ), // the csr inst writed back is fake
    .wb_oitf_mul_fake    (wb_oitf_mul_fake    ), // the mul inst writed back is fake
    .wb_oitf_div_fake    (wb_oitf_div_fake    ), // the div inst writed back is fake
    .wb_oitf_ls_fake     (wb_oitf_ls_fake     ) // the ls  inst writed back is fake
);



oitf u6_oitf(
    .clk              ( clk               ),
    .rstn             ( rstn              ),
//with decode      
    .de_oitf_inst_vld ( de_oitf_inst_vld  ), // the instruction decoded is valid
    .de_oitf_inst_vld_ori( de_oitf_inst_vld_ori),
    .de_oitf_alu      ( de_oitf_alu       ), // the instruction decoded is an alu (not csr) inst
    .de_oitf_csr      ( de_oitf_csr       ), // the instruction decoded is an csr inst
    .de_oitf_mul      ( de_oitf_mul       ), // the instruction decoded is a mul inst
    .de_oitf_div      ( de_oitf_div       ), // the instruction decoded is a div inst
    .de_oitf_ls       ( de_oitf_ls        ), // the instruction decoded is a ls  inst
    .de_oitf_ls_type  ( de_oitf_ls_type   ), // the instruction decoded is a ls  inst
    .de_oitf_rs1_idx  ( de_oitf_rs1_idx   ), // the index of rs1 of instruction
    .de_oitf_rs2_idx  ( de_oitf_rs2_idx   ), // the index of rs2 of instruction
    .de_oitf_rd_idx   ( de_oitf_rd_idx    ), // the index of rd  of instruction
    .de_oitf_csr_idx  ( de_oitf_csr_idx   ), // the index of csr of instruction
    .de_oitf_rs1en    ( de_oitf_rs1en     ), // the instruction decoded need to read rs1
    .de_oitf_rs2en    ( de_oitf_rs2en     ), // the instruction decoded need to read rs1
    .de_oitf_wen      ( de_oitf_wen       ), // the instruction decoded need to write back to rd
    .de_oitf_store_vld(de_oitf_store_vld  ),    
//with wb 
    .wb_oitf_store_cmt_vld(wb_oitf_store_cmt_vld),
    .wb_oitf_store_fake_vld(wb_oitf_store_fake_vld),
    .wb_oitf_alu_flag ( wb_oitf_alu_flag  ), // alu write back flag
    .wb_oitf_csr_flag ( wb_oitf_csr_flag  ), // csr write back flag
    .wb_oitf_mul_flag ( wb_oitf_mul_flag  ), // mul write back flag
    .wb_oitf_div_flag ( wb_oitf_div_flag  ), // div write back flag
    .wb_oitf_ls_flag  ( wb_oitf_ls_flag   ), // ls  write back flag
    .wb_oitf_alu_fake ( wb_oitf_alu_fake  ), // current alu write-back is a fake signal
    .wb_oitf_csr_fake ( wb_oitf_csr_fake  ), // current csr write-back is a fake signal
    .wb_oitf_mul_fake ( wb_oitf_mul_fake  ), // current mul write-back is a fake signal
    .wb_oitf_div_fake ( wb_oitf_div_fake  ), // current div write-back is a fake signal
    .wb_oitf_ls_fake  ( wb_oitf_ls_fake   ), // current ls  write-back is a fake signal
//with control   
    .oitf_ctrl_empty  ( oitf_ctrl_empty   ), // oitf entried are all empty
    .oitf_ctrl_related( oitf_ctrl_related ), // generate data ralated problem\
    .ctrl_oitf_fake_gen_flag(ctrl_oitf_fake_gen_flag),
//with gpr      
    .oitf_gpr_index   ( oitf_gpr_index    ), //index of writing-back gpr
//with csr     
    .oitf_csr_index   ( oitf_csr_index    ),//index of writing-back csr
//with checker
    .oitf_checker_empty( oitf_checker_empty)
);




gpr u7_gpr(
    .clk                   ( clk                  ),       //system clock 
    .rstn                  ( rstn                 ),       //system rstn
//WITH DE            
    .de_gpr_rs1_rvld       ( de_gpr_reg1_rdvld    ),       //read  rs1 vld
    .de_gpr_rs1_addr       ( de_gpr_reg1_raddr    ),       //register1 address
    .de_gpr_rs2_rvld       ( de_gpr_reg2_rdvld    ),       //read  rs2 vld
    .de_gpr_rs2_addr       ( de_gpr_reg2_raddr    ),       //register2 address    
    .de_gpr_mdu_flag       ( de_gpr_mdu_flag      ),       //indicate mdu or alu
    .de_gpr_div_flag       ( de_gpr_div_flag      ),       //indicate div or mul
//WITH WB           
    .wb_gpr_ena            ( wb_gpr_ena           ),
    .wb_gpr_wdata          ( wb_gpr_wdata         ),       //write rd register data
//WITH OITF        
    .oitf_gpr_index        ( oitf_gpr_index       ),       //write rd register address
//WITH ALU        
    .gpr_alu_data_vld      ( gpr_alu_data_vld     ),
    .gpr_alu_reg1_data     ( gpr_alu_reg1_data    ),
    .gpr_alu_reg2_data     ( gpr_alu_reg2_data    ),
//WITH MDU       
    .gpr_mdu_mul_data_vld  ( gpr_mdu_mul_data_vld ),
    .gpr_mdu_mul_reg1_data ( gpr_mdu_mul_reg1_data),
    .gpr_mdu_mul_reg2_data ( gpr_mdu_mul_reg2_data),
    .gpr_mdu_div_data_vld  ( gpr_mdu_div_data_vld ),
    .gpr_mdu_div_reg1_data ( gpr_mdu_div_reg1_data),
    .gpr_mdu_div_reg2_data ( gpr_mdu_div_reg2_data),
    .x0                    ( x0                   ),  
    .x1                    ( x1                   ),  
    .x2                    ( x2                   ),  
    .x3                    ( x3                   ),  
    .x4                    ( x4                   ),  
    .x5                    ( x5                   ),  
    .x6                    ( x6                   ),  
    .x7                    ( x7                   ),  
    .x8                    ( x8                   ),  
    .x9                    ( x9                   ),  
    .x10                   ( x10                  ),  
    .x11                   ( x11                  ),  
    .x12                   ( x12                  ),  
    .x13                   ( x13                  ),  
    .x14                   ( x14                  ),  
    .x15                   ( x15                  ),  
    .x16                   ( x16                  ),  
    .x17                   ( x17                  ),  
    .x18                   ( x18                  ),  
    .x19                   ( x19                  ),  
    .x20                   ( x20                  ),  
    .x21                   ( x21                  ),  
    .x22                   ( x22                  ),  
    .x23                   ( x23                  ),  
    .x24                   ( x24                  ),  
    .x25                   ( x25                  ),  
    .x26                   ( x26                  ),  
    .x27                   ( x27                  ),  
    .x28                   ( x28                  ),  
    .x29                   ( x29                  ),  
    .x30                   ( x30                  ),  
    .x31                   ( x31                  )  
);


csr u7_csr(
    .clk                 (clk                   ),       //system clock 
    .rstn                (rstn                  ),       //system rstn
//WITH ROB
    .rob_csr_pc_vld      (rob_csr_pc_vld        ),
//WITH GPR
    .x8                  (x8                    ),
//WITH JTAG         
    .jtag_csr_ena        (jtag_csr_ena          ), //the enable signal that                            j tag operation to csr
    .jtag_csr_we         (jtag_csr_we           ), //write enable, 1 is write , 0 is read operation
    .jtag_csr_idx        (jtag_csr_idx          ), //index of csr
    .jtag_csr_wdata      (jtag_csr_wdata        ), //write data from                                   j tag to csr
    .jtag_csr_reset_req  (jtag_csr_reset_req    ), //reset dcsr[8:6],cause when reset active,[8:6]=000
    .jtag_csr_halt_req   (jtag_csr_halt_req     ), //halt dcr[8:6]
    .csr_jtag_rdata      (csr_jtag_rdata        ), //read data from cs
//WITH DE          
    .de_csr_rd_idx       (de_csr_rd_idx         ),
    .de_csr_rd_vld       (de_csr_rd_vld         ),
//WITH ALU        
    .csr_alu_data_vld    (csr_alu_data_vld      ),
    .csr_alu_data        (csr_alu_data          ),
//WITH INT       
    .int_csr_ext         (int_csr_ext           ),
    .int_csr_tmr         (int_csr_tmr           ),
    .int_csr_sft         (int_csr_sft           ),
    .csr_int_mie         (csr_int_mie           ),
    .csr_int_meip        (csr_int_meip          ),
    .csr_int_mtip        (csr_int_mtip          ),
    .csr_int_msip        (csr_int_msip          ),
    .csr_int_mtvec       (csr_int_mtvec         ),
    .csr_int_epc         (csr_int_epc           ),
    .int_csr_ecause      (int_csr_ecause        ),
    .int_csr_epc         (int_csr_epc           ),
    .int_csr_ena         (int_csr_ena           ),
    .int_csr_mret        (int_csr_mret          ),
    .int_csr_dcause      (int_csr_dcause        ),
    .int_csr_dpc         (int_csr_dpc           ),
    .int_csr_dena        (int_csr_dena          ),
    .int_csr_mtval       (int_csr_mtval         ),
//WITH WB       
    .wb_csr_ena          (wb_csr_ena            ),
    .wb_csr_wdata        (wb_csr_wdata          ),
//WITH OITF    
    .oitf_csr_index      (oitf_csr_index        ),
//WITH CHECKER
    .csr_mstatus         (csr_mstatus           ),
    .csr_mie             (csr_mie               ),
    .csr_mip             (csr_mip               ),
    .csr_mtvec           (csr_mtvec             ),
    .csr_mscratch        (csr_mscratch          ),
    .csr_mcycle          (csr_mcycle            ),
    .csr_minstret        (csr_minstret          ),
    .csr_mepc            (csr_mepc              ),
    .csr_mcause          (csr_mcause            ),
    .csr_mtval           (csr_mtval             ),
    .csr_misa            (csr_misa              ),
    .csr_mvendorid       (csr_mvendorid         ),
    .csr_marchid         (csr_marchid           ),
    .csr_mimpid          (csr_mimpid            ),
    .csr_mhartid         (csr_mhartid           ),
    .csr_dcsr            (csr_dcsr              ),
    .csr_dpc             (csr_dpc               ),
    .csr_dscratch        (csr_dscratch          )
);



int_top u8_int_top(
  .clk               (clk                 ),
  .rstn              (rstn                ),
//external interrupt require
  .ext_plic_irq      (ext_plic_irq        ),
//with biu          
  .biu_int_haddr     (biu_int_haddr       ),
  .biu_int_hwdata    (biu_int_hwdata      ),
  .biu_int_hwrite    (biu_int_hwrite      ),
  .biu_int_htrans    (biu_int_htrans      ),
  .biu_int_hsize     (biu_int_hsize       ),
  .biu_int_hburst    (biu_int_hburst      ),
  .biu_int_hsel      (biu_int_hsel        ),
  .biu_int_hready    (biu_int_hready      ),
  .int_biu_hrdata    (int_biu_hrdata      ),
  .int_biu_hresp     (int_biu_hresp       ),
  .int_biu_hreadyout (int_biu_hreadyout   ),
//with jtag        
  .jtag_irq          (0                   ),
  .int_jtag_ebreak   (int_jtag_ebreak     ),
//with csr        
  .int_csr_ext       (int_csr_ext         ),
  .int_csr_tmr       (int_csr_tmr         ),
  .int_csr_sft       (int_csr_sft         ),
  .csr_int_meip      (csr_int_meip        ), // external irq mask
  .csr_int_msip      (csr_int_msip        ), // software irq mask
  .csr_int_mtip      (csr_int_mtip        ), // timer    irq mask
  .csr_int_mie       (csr_int_mie         ), // global interrupt 1: irq acceptable  in mstatus register
  .csr_int_epc       (csr_int_epc         ), // pc back when interrupt complete
  .csr_int_mtvec     (csr_int_mtvec       ), // interrupt service program pc
  .int_csr_epc       (int_csr_epc         ), // breakpoint when interrrupt claim
  .int_csr_ecause    (int_csr_ecause      ), // interrupt cause when interrupt claim
  .int_csr_ena       (int_csr_ena         ), // modify enable signal of mstatus reg when claim
  .int_csr_dpc       (int_csr_dpc         ), // ebreak pc
  .int_csr_dena      (int_csr_dena        ), // enable signal to modify dcsr and dcause regs
  .int_csr_dcause    (int_csr_dcause      ), // ebreak cause
  .int_csr_mret      (int_csr_mret        ), // mret instruction from ctrl
  .int_csr_mtval     (int_csr_mtval       ), // mret instruction from ctrl
//with ctrl      
  .int_ctrl_mtvec    (int_ctrl_mtvec      ),       // interrupt service program pc
  .int_ctrl_epc      (int_ctrl_epc        ),       // pc recover
  .int_ctrl_req      (int_ctrl_req        ),       // interrupt require to cpu
  .int_ctrl_mret     (int_ctrl_mret       ),       // interrupt finish signal
//with alu      
  .alu_int_vld       (alu_int_vld         ),
  .alu_int_pc        (alu_int_pc          ),
  .alu_int_beq       (alu_int_beq         ),
  .alu_int_l_misa    (alu_int_l_misa      ),
  .alu_int_s_misa    (alu_int_s_misa      ),
  .alu_int_ls_addr   (alu_int_ls_addr     ),
//with de      
  .de_int_ebreak     (de_int_ebreak       ),
  .de_int_ecall      (de_int_ecall        ),
  .de_int_mret       (de_int_mret         ), 
  .de_int_misa       (de_int_misa         ), 
  .de_int_memerr     (de_int_memerr       ), 
  .de_int_illegal    (de_int_illegal      ), 
  .de_int_illegal_inst(de_int_illegal_inst), 
  
//with timer   
  .trigger           (trigger             )  //always on clk sync bose edge signal
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
  .lsu2icb_cmd_valid          ( lsu2icb_cmd_valid     ),
  .lsu2icb_cmd_ready          ( lsu2icb_cmd_ready     ),
  .lsu2icb_cmd_addr           ( lsu2icb_cmd_addr      ),
  .lsu2icb_cmd_read           ( lsu2icb_cmd_read      ),
  .lsu2icb_cmd_wdata          ( lsu2icb_cmd_wdata     ),
  .lsu2icb_cmd_wmask          ( lsu2icb_cmd_wmask     ),
  .lsu2icb_rsp_valid          ( lsu2icb_rsp_valid     ),
  .lsu2icb_rsp_ready          ( lsu2icb_rsp_ready     ),
  .lsu2icb_rsp_rdata          ( lsu2icb_rsp_rdata     ),
  .lsu2icb_rsp_err            ( lsu2icb_rsp_err       ),
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
  .axi_ar_valid            ( axi_ar_valid       ),
  .axi_ar_ready            ( axi_ar_ready       ),
  .axi_ar_addr             ( axi_ar_addr        ),
  .axi_ar_burst            ( axi_ar_burst       ),
  .axi_ar_cache            ( axi_ar_cache       ),
  .axi_ar_id               ( axi_ar_id          ),
  .axi_ar_len              ( axi_ar_len         ),
  .axi_ar_lock             ( axi_ar_lock        ),
  .axi_ar_prot             ( axi_ar_prot        ),
  .axi_ar_size             ( axi_ar_size        ), 
//r chanel        
  .axi_r_valid             ( axi_r_valid        ),
  .axi_r_ready             ( axi_r_ready        ),
  .axi_r_data              ( axi_r_data         ),
  .axi_r_id                ( axi_r_id           ),
  .axi_r_last              ( axi_r_last         ),
  .axi_r_resp              ( axi_r_resp         ), 
//aw channel     
  .axi_aw_valid            ( axi_aw_valid       ),
  .axi_aw_ready            ( axi_aw_ready       ),
  .axi_aw_addr             ( axi_aw_addr        ),
  .axi_aw_burst            ( axi_aw_burst       ),
  .axi_aw_cache            ( axi_aw_cache       ),
  .axi_aw_id               ( axi_aw_id          ),
  .axi_aw_len              ( axi_aw_len         ),
  .axi_aw_lock             ( axi_aw_lock        ),
  .axi_aw_prot             ( axi_aw_prot        ),
  .axi_aw_size             ( axi_aw_size        ), 
//w channel     
  .axi_w_valid             ( axi_w_valid        ),
  .axi_w_ready             ( axi_w_ready        ),
  .axi_w_data              ( axi_w_data         ),
  .axi_w_id                ( axi_w_id           ),
  .axi_w_last              ( axi_w_last         ),
  .axi_w_strb              ( axi_w_strb         ), 
//b channel    
  .axi_b_valid             ( axi_b_valid        ),
  .axi_b_ready             ( axi_b_ready        ),
  .axi_b_id                ( axi_b_id           ),
  .axi_b_resp              ( axi_b_resp         )  //write reaponse, indicates the status of a write transaction
);


rob u10_rob(
    .rstn                      ( rstn                      ),//active low 
    .clk                       ( clk                       ),//clock
//with ctrl
    .ctrl_rob_flush_start      ( ctrl_rob_flush_start      ),
//with ALU
    .alu_rob_flush_pc          ( alu_rob_flush_pc          ),
//with IFU
    .ifu_rob_jump_pc           ( ifu_rob_jump_pc           ),
//with DE
    .de_rob_inst               ( de_rob_inst               ),//instruction 
    .de_rob_inst_vld           ( de_rob_inst_vld           ),//instruction valid
    .de_rob_pc                 ( de_rob_pc                 ),//pc
    .de_rob_pc_vld             ( de_rob_pc_vld             ),//pc_valid
    .de_rob_gpr_idx            ( de_rob_gpr_idx            ),
    .de_rob_csr_idx            ( de_rob_csr_idx            ),
    .de_rob_alu                ( de_rob_alu                ),// alu instruction
    .de_rob_csr                ( de_rob_csr                ),// csr instruction
    .de_rob_mul                ( de_rob_mul                ),// mul instruction 
    .de_rob_div                ( de_rob_div                ),// div instruction
    .de_rob_load               ( de_rob_load               ),// L&S instruction
//with WB    
    .wb_rob_alu_gpr_vld        ( wb_rob_alu_gpr_vld        ), // alu instruction need write to gpr
    .wb_rob_alu_gpr_wdata      ( wb_rob_alu_gpr_wdata      ), // writed back data from alu inst
    .wb_rob_alu_gpr_fake_vld   ( wb_rob_alu_gpr_fake_vld   ), // alu's fake wb, just commit, not write back
    .wb_rob_alu_csr_vld        ( wb_rob_alu_csr_vld        ), // csr instruction need write to gpr
    .wb_rob_alu_csr_wdata      ( wb_rob_alu_csr_wdata      ), // writed back data from csr inst
    .wb_rob_alu_csr_fake_vld   ( wb_rob_alu_csr_fake_vld   ), // alu's fake wb, just commit, not write back
    .wb_rob_load_fake_vld      ( wb_rob_load_fake_vld      ),
    .wb_rob_store_fake_vld     ( wb_rob_store_fake_vld     ), //
//with mdu    
    .wb_rob_mul_vld            ( wb_rob_mul_vld            ), // mul instruction need write to gpr
    .wb_rob_mul_wdata          ( wb_rob_mul_wdata          ), // writed back data from mul inst
    .wb_rob_mul_fake_vld       ( wb_rob_mul_fake_vld       ), // mul's fake wb, just commit, not write back
    .wb_rob_div_vld            ( wb_rob_div_vld            ), // div instruction need write to gpr
    .wb_rob_div_wdata          ( wb_rob_div_wdata          ), // writed back data from div inst
    .wb_rob_div_fake_vld       ( wb_rob_div_fake_vld       ), // div's fake wb, just commit, not write back
//with lsu
    .wb_rob_lsu_store_cmt_vld( wb_rob_lsu_store_cmt_vld), // store ins, oitf store case
    .wb_rob_lsu_vld            ( wb_rob_lsu_vld            ), // ls instruction need write to gpr
    .wb_rob_lsu_wdata          ( wb_rob_lsu_wdata          ), // writed back data from ls inst
    .wb_rob_lsu_wen            ( wb_rob_lsu_wen            ),    // ls instruction need write back
//--CSR
    .rob_csr_pc_vld            ( rob_csr_pc_vld            ),
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
);

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

endmodule