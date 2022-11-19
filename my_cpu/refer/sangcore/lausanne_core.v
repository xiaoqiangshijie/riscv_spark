//-----------------------------------------------------------------------------
//This confidential and proprietary software may be used only used as
//by a licensing aggrement from Orbbec Inc.
//In the event of publication ,the following notice is applicable:
//(C)COPYRIGHT 2013 ORBBEC INC.ALL RIGHTS RESERVED.
//The entire notice ablove must be reproduced on all authorized copies
//-----------------------------------------------------------------------------
//File          :lausanne_core.v
//Author        :modi
//Date          :08/06/2021
//Version       :0.1
//Description   :This file is top level of Lausanne risc-v project
//-----------------------------------------------------------------------------
//Modification History:
//Date          By          Version         Change Description 
//08/06/2021    modi        0.1             Original
//09/10/2021    jingjing    0.2             add lsu size
//-----------------------------------------------------------------------------
module  lausanne_core
#(
  parameter               INT_BASE           =  0  //TBD
)(  
//=================CLOCK and RESET=============================================
  input                             clk     ,
  input                             rstn    ,
//=================WITH JTAG===================================================
  //transmission with gpr------------------------------------------------------
  input                 jtag_gpr_we     ,//jtag read and write operation to gpr
  input [4:0]           jtag_gpr_addr   ,//write address to gpr
  input [31:0]          jtag_gpr_wdata  ,//write daat to gpr
  output[31:0]          gpr_jtag_rdata  ,//gpr return read data to jtag 
  //transmission with csr------------------------------------------------------
  input                        jtag_csr_ena       ,//operation enable to csr
  input                        jtag_csr_we        ,//jtag write enable to csr 
  input [11:0]                 jtag_csr_idx       ,
  input [31:0]                 jtag_csr_wdata     ,
  output[31:0]                 csr_jtag_rdata     ,
  //transmission with control--------------------------------------------------
  input                        jtag_ctrl_reset_req,
  input                        jtag_ctrl_halt_req ,
  //transmission with biu module ----------------------------------------------
  input                        jtag2icb_cmd_valid,//handshake signal from jtag
  output                        jtag2icb_cmd_ready,//handshake signal to jtag
  input [31:0]                jtag2icb_cmd_addr ,//address from jtag 
  input                       jtag2icb_cmd_read ,//read enable 
  input [31:0]                jtag2icb_cmd_wdata,//data from jtag
  input [3:0]                 jtag2icb_cmd_wmask,
  output                        jtag2icb_rsp_valid,//handshake
  input                       jtag2icb_rsp_ready,//handhaske
  output  [31:0]                jtag2icb_rsp_rdata,
  output                        jtag2icb_rsp_err  ,
//======================WITH BIU===============================================
  //transmission with other
  input                        other_biu_hready   ,
  input                        other_biu_hresp    ,
  input [31:0]                 other_biu_hrdata   ,
  output                       biu_other_hsel     ,
  output[31:0]                 biu_other_haddr    ,
  output                       biu_other_hwrite   ,
  output                       biu_other_hready   ,
  output[31:0]                 biu_other_hwdata   ,
  output[2:0]                  biu_other_hburst   ,
  output[2:0]                  biu_other_hsize    ,
  output[1:0]                  biu_other_htrans   ,
  output[3:0]                  biu_other_hprot    ,
//======================WITH INTERRUPT=========================================
  //transmission with csr------------------------------------------------------
  input [31 :0]           int_csr_ecause      , //update data of mcause csr
  input [31 :0]           int_csr_epc         , //update data of mepc csr
  input                   int_csr_ena         , //updata data enable signal, start interrupt
  input                   int_csr_mret        , //end od interrupt
  input [2  :0]           int_csr_dcause      , //update data of dcsr csr
  input [31 :0]           int_csr_dpc         , //updata data of dpc
  input                   int_csr_dena        , //update data enable signal of debug csr
  input                   int_ctrl_pcen       ,
  input                   excp_pcen           ,
  input                   int_csr_ext         , //uart,gopio intrrupt
  input                   int_csr_tmr         , //timer interrupt
  input                   int_csr_sft         , //software interrupt 
  input [31:0]            int_csr_mtval       ,  
  output                  csr_int_mie         , //value of mie in mstatus csr
  output                  csr_int_meie        , //value of meie in mie csr
  output                  csr_int_mtie        , //value of mtie in mie csr
  output                  csr_int_msie        , //value of msie in mie csr
  output[31 :0]           csr_int_mtvec       , //value of mtvec csr
  output[31 :0]           csr_int_epc         , //value of mepc csr
  output[31 :0]           csr_int_counterstop , //value of counterstop csr
  output                  alu_int_l_misa      ,
  output                  alu_int_s_misa      ,
  output[31:0]            alu_int_ls_addr     ,
  //transmission with biu------------------------------------------------------
  input                   int_biu_hready      ,//the handshake singnal
  input                   int_biu_hresp       ,//transfer status,1'b0 represents the transmission completes without errors, 1'b1 represents return error
  input [31:0]            int_biu_hrdata      ,//data from int
  output                  biu_int_hready      ,//the handshake singnal
  output                  biu_int_hsel        ,//the select singnal
  output[31:0]            biu_int_haddr       ,//address from biu
  output                  biu_int_hwrite      ,//write enable
  output[31:0]            biu_int_hwdata      ,//data from the master that needs to be written
  output[2:0]             biu_int_hburst      ,//burst type
  output[2:0]             biu_int_hsize       ,//tansfer size
  output[1:0]             biu_int_htrans      ,//tansfer type, 2'b00 represents no transmission is taking place, 2'b10 represents transfer one data once
  //transmission with control module-------------------------------------------
  output                  ctrl_int_ready      ,
  output                  ctrl_int_valid      ,
  input [31:0]            int_ctrl_mtvec      ,//interrupt service program pc transferred to control module
  output[31:0]            ctrl_int_epc        ,//pc of the current instruction before interrupt
  output                  ctrl_int_ebreak     ,//ebreak instruction in IFU
  output                  ctrl_int_ecall      ,
  output                  ctrl_int_mret       ,//mret signal flag
  output                  ctrl_int_illegal    ,
  input [31:0]            int_ctrl_epc        ,//pc of the next instruction transfer to IFU
  input                   int_ctrl_flush_req   //flush requir
);

//======================INSTRUCTION FETCH MODULE===============================
  wire                    ctrl_ifu_flush       ;//control
  wire                    ctrl_ifu_stall       ;//control
  wire                    ifu_ctrl_ready       ;
  wire                    ifu_ctrl_valid       ;
  wire  [31:0]            ifu_ctrl_int_epc     ;
  wire  [31:0]            pc_ifu_addr          ;//pc
  wire                    ifu_pc_icb_cmd_ready ;//pc
  wire  [31:0]            ifu_biu_icb_cmd_addr ;
  wire  [31:0]            ifu_alu_current_pc   ;//alu
  wire  [31:0]            ifu_de_ins           ;//de
  wire  [31:0]            if2icb_rsp_rdata     ;
  wire                    ifu_biu_icb_cmd_read ;
  ifu   u0_ifu(
      .clk                 (clk                 ),
      .rstn                (rstn                ),
      .br_ctrl_flush       (br_ctrl_flush       ),
      //with control
      .ctrl_ifu_flush      (ctrl_ifu_flush      ),
      .ctrl_ifu_stall      (ctrl_ifu_stall      ),
      .ifu_ctrl_int_epc    (ifu_ctrl_int_epc    ),  
      .ifu_ctrl_ready      (ifu_ctrl_ready      ),
      .ifu_ctrl_valid      (ifu_ctrl_valid      ),
      //with pc
      .pc_ifu_addr         (pc_ifu_addr         ),
      .ifu_pc_icb_cmd_ready(ifu_pc_icb_cmd_ready),   
      //with biu
      .ifu_biu_icb_cmd_valid   (if2icb_cmd_valid     ),      
      .biu_ifu_icb_cmd_ready   (if2icb_cmd_ready     ),
      .biu_ifu_icb_rsp_valid   (if2icb_rsp_valid     ),
      .ifu_biu_icb_rsp_ready   (if2icb_rsp_ready     ),
      .biu_ifu_icb_rsp_rdata   (if2icb_rsp_rdata     ),
      .ifu_biu_icb_cmd_addr    (ifu_biu_icb_cmd_addr ),
      .ifu_biu_icb_cmd_read    (ifu_biu_icb_cmd_read ), 
       //with alu
      .ifu_alu_current_pc (ifu_alu_current_pc   ), 
      //with de 
      .ifu_de_ins         (ifu_de_ins           ) 
      );
//======================CONTROL MODULE=========================================
  //with alu-------------------------------------------------------------------
  wire                    ctrl_alu_reg2_flag        ;//
  wire                    ctrl_alu_lui_flag         ;
  wire                    ctrl_alu_shift_flag       ;
  wire                    ctrl_alu_shift_right_flag ;
  wire                    ctrl_alu_shift_logic_flag ;
  wire  [1:0]             ctrl_alu_comparator_flag  ;
  wire                    ctrl_alu_and_flag         ;
  wire                    ctrl_alu_or_flag          ;
  wire                    ctrl_alu_xor_flag         ;
  wire                    ctrl_alu_adder_flag       ;
  wire                    ctrl_alu_sub_flag         ;
  wire                    ctrl_alu_auipc_flag       ;
  //with de--------------------------------------------------------------------
  wire  [31:0]            de_ctrl_imm               ;
  wire                    de_ctrl_reg2_flag         ;
  wire                    de_ctrl_lui_flag          ;
  wire                    de_ctrl_shift_flag        ;
  wire                    de_ctrl_shift_right_flag  ;
  wire                    de_ctrl_shift_logic       ;
  wire  [1:0]             de_ctrl_comparator_flag   ;
  wire                    de_ctrl_and_flag          ;
  wire                    de_ctrl_or_flag           ;
  wire                    de_ctrl_xor_flag          ;
  wire                    de_ctrl_adder_flag        ;
  wire                    de_ctrl_sub_flag          ;
  wire                    de_ctrl_auipc_flag        ;
  wire  [1:0]             de_ctrl_lsu_flag          ;
  wire  [1:0]             de_ctrl_lsu_size          ;
  wire                    de_ctrl_lsu_unsign        ; 
  wire  [2:0]             de_ctrl_br_typ            ;
  wire                    de_ctrl_int_ebreak        ;
  wire                    de_ctrl_int_mret          ;
  wire                    de_ctrl_int_ecall         ;
  wire                    de_ctrl_illegal           ;
  //with if--------------------------------------------------------------------
  wire                    ifu_ctrl_minidecode       ;
  //with lsu-------------------------------------------------------------------
  wire  [1:0]             ctrl_lsu_typ              ;
  wire  [1:0]             ctrl_lsu_size             ;
  wire                    ctrl_lsu_unsign           ;
  //with branch----------------------------------------------------------------
  wire  [2:0]             ctrl_br_typ               ;
  wire                    br_ctrl_jump_en           ;
  wire                    br_ctrl_flush             ;
  wire                    ctrl_br_valid             ;
  //with pc--------------------------------------------------------------------
  wire  [1:0]             ctrl_pc_jump_sel          ;
  wire  [31:0]            ctrl_pc                   ;
  wire                    ctrl_stall_pc             ;
  //with int-------------------------------------------------------------------
  //withjtag-------------------------------------------------------------------
  //with biu-------------------------------------------------------------------
  
  control u1_control(
  //to alu  
      .ctrl_alu_reg2_flag         (ctrl_alu_reg2_flag       ),
      .ctrl_alu_lui_flag          (ctrl_alu_lui_flag        ),
      .ctrl_alu_shift_flag        (ctrl_alu_shift_flag      ),
      .ctrl_alu_shift_right_flag  (ctrl_alu_shift_right_flag),
      .ctrl_alu_shift_logic       (ctrl_alu_shift_logic_flag),
      .ctrl_alu_comparator_flag   (ctrl_alu_comparator_flag ),
      .ctrl_alu_and_flag          (ctrl_alu_and_flag        ),
      .ctrl_alu_or_flag           (ctrl_alu_or_flag         ),
      .ctrl_alu_xor_flag          (ctrl_alu_xor_flag        ),
      .ctrl_alu_adder_flag        (ctrl_alu_adder_flag      ),
      .ctrl_alu_sub_flag          (ctrl_alu_sub_flag        ),
      .ctrl_alu_auipc_flag        (ctrl_alu_auipc_flag      ),
      .ctrl_br_valid              (ctrl_br_valid            ),
  //from de  
      .de_ctrl_reg2_flag          (de_ctrl_reg2_flag        ),
      .de_ctrl_lui_flag           (de_ctrl_lui_flag         ),
      .de_ctrl_shift_flag         (de_ctrl_shift_flag       ),
      .de_ctrl_shift_right_flag   (de_ctrl_shift_right_flag ),
      .de_ctrl_shift_logic        (de_ctrl_shift_logic      ),
      .de_ctrl_comparator_flag    (de_ctrl_comparator_flag  ),
      .de_ctrl_and_flag           (de_ctrl_and_flag         ),
      .de_ctrl_or_flag            (de_ctrl_or_flag          ),
      .de_ctrl_xor_flag           (de_ctrl_xor_flag         ),
      .de_ctrl_adder_flag         (de_ctrl_adder_flag       ),
      .de_ctrl_sub_flag           (de_ctrl_sub_flag         ),
      .de_ctrl_auipc_flag         (de_ctrl_auipc_flag       ),
      .de_ctrl_lsu_flag           (de_ctrl_lsu_flag         ),
      .de_ctrl_lsu_size           (de_ctrl_lsu_size         ),
      .de_ctrl_lsu_unsign         (de_ctrl_lsu_unsign       ),
      .de_ctrl_br_typ             (de_ctrl_br_typ           ),      
      .de_ctrl_int_ebreak         (de_ctrl_int_ebreak       ),
      .de_ctrl_int_mret           (de_ctrl_int_mret         ),
      .de_ctrl_int_ecall          (de_ctrl_int_ecall        ),
      .de_ctrl_illegal            (de_ctrl_illegal          ),
  // biu
      .biu_ctrl_stall             (biu_ctrl_stall           ),
  //with if 
      .ctrl_ifu_flush             (ctrl_ifu_flush           ),
      .ctrl_ifu_stall             (ctrl_ifu_stall           ),
      .ifu_ctrl_int_epc           (ifu_ctrl_int_epc         ),  
      .ifu_control_ready          (ifu_ctrl_ready           ),
      .ifu_control_valid          (ifu_ctrl_valid           ),
  //with lsu
      .ctrl_lsu_typ               (ctrl_lsu_typ             ),
      .ctrl_lsu_size              (ctrl_lsu_size            ),
      .ctrl_lsu_unsign            (ctrl_lsu_unsign          ),
  //with branch
      .ctrl_br_typ                (ctrl_br_typ              ),
      .br_ctrl_jump_en            (br_ctrl_jump_en          ),
      .br_ctrl_flush              (br_ctrl_flush            ),
  //with intrrupt
      .int_ctrl_mtvec             (int_ctrl_mtvec           ),
      .ctrl_int_epc               (ctrl_int_epc             ),
      .ctrl_int_ebreak            (ctrl_int_ebreak          ),
      .ctrl_int_mret              (ctrl_int_mret            ),
      .int_ctrl_epc               (int_ctrl_epc             ),
      .int_ctrl_flush_req         (int_ctrl_flush_req       ),
      .ctrl_int_valid             (ctrl_int_valid           ),
      .int_ctrl_pcen              (int_ctrl_pcen            ),
      .excp_pcen                  (excp_pcen                ),
      .ctrl_int_ready             (ctrl_int_ready           ),
      .ctrl_int_ecall             (ctrl_int_ecall           ),
      .ctrl_int_illegal           (ctrl_int_illegal         ),
  //with pc
      .ctrl_pc                    (ctrl_pc                  ),
      .ctrl_pc_jump_sel           (ctrl_pc_jump_sel         ),
      .ctrl_pc_stall              (ctrl_pc_stall            ),
  //with jtag
      .jtag_ctrl_halt_req         (jtag_ctrl_halt_req       ),
      .jtag_ctrl_reset_req        (jtag_ctrl_reset_req      )
  );
//======================DECODE MODULE==========================================
  //with gpr-------------------------------------------------------------------
  wire  [4:0]             de_reg1_read_addr ;
  wire  [4:0]             de_reg2_read_addr ;
  wire  [4:0]             de_reg3_write_addr;
  wire                    de_gpr_we         ;
  //with alu-------------------------------------------------------------------
  wire  [31:0]            de_alu_imm        ;
  wire                    de_alu_l_flag     ;
  wire                    de_alu_s_flag     ;
  wire  [1 :0]            de_alu_ls_size    ;
  wire                    de_lsu_flag       ;
  //with control---------------------------------------------------------------
  //with csr-------------------------------------------------------------------
  wire  [11:0]            de_csr_idx        ;
  wire                    de_csr_wr_ena     ;
  wire                    de_csr_wr_0       ;
  wire                    de_csr_wr_1       ;
  wire                    de_csr_imm_en     ;
  wire  [31:0]            de_csr_zimm       ;
  //minicode 
  wire                    minicode_lsu_flag ;
  wire                    jal,jarl          ;
  de  u2_de(
  //with instruction fetch
      .ifu_de_ins               (ifu_de_ins               ),
      .lsu_wb_valid             (lsu_wb_valid             ),
      .br_ctrl_flush            (br_ctrl_flush            ),
  //with gpr
      .de_reg1_read_addr        (de_reg1_read_addr        ),
      .de_reg2_read_addr        (de_reg2_read_addr        ),
      .de_reg3_write_addr       (de_reg3_write_addr       ),
      .de_gpr_we                (de_gpr_we                ),
  //with alu
      .de_alu_imm               (de_alu_imm               ),
      .de_alu_l_flag            (de_alu_l_flag            ),
      .de_alu_s_flag            (de_alu_s_flag            ),
      .de_alu_ls_size           (de_alu_ls_size           ),
  //with ctrl  
      .de_ctrl_reg2_flag        (de_ctrl_reg2_flag        ),
      .de_ctrl_lui_flag         (de_ctrl_lui_flag         ),
      .de_ctrl_shift_flag       (de_ctrl_shift_flag       ),
      .de_ctrl_shift_right_flag (de_ctrl_shift_right_flag ),
      .de_ctrl_shift_logic      (de_ctrl_shift_logic      ),
      .de_ctrl_comparator_flag  (de_ctrl_comparator_flag  ),
      .de_ctrl_and_flag         (de_ctrl_and_flag         ),
      .de_ctrl_or_flag          (de_ctrl_or_flag          ),
      .de_ctrl_xor_flag         (de_ctrl_xor_flag         ),
      .de_ctrl_adder_flag       (de_ctrl_adder_flag       ),
      .de_ctrl_sub_flag         (de_ctrl_sub_flag         ),
      .de_ctrl_auipc_flag       (de_ctrl_auipc_flag       ),
      .de_ctrl_int_ebreak       (de_ctrl_int_ebreak       ),
      .de_ctrl_int_ecall        (de_ctrl_int_ecall        ),
      .de_ctrl_int_mret         (de_ctrl_int_mret         ),
      .de_ctrl_br_typ           (de_ctrl_br_typ           ),
      .de_ctrl_lsu_flag         (de_ctrl_lsu_flag         ),
      .de_ctrl_lsu_size         (de_ctrl_lsu_size         ),
      .de_ctrl_lsu_unsign       (de_ctrl_lsu_unsign       ),
      .de_ctrl_illegal          (de_ctrl_illegal          ),
  //with csr
      .de_csr_idx               (de_csr_idx               ),
      .de_csr_zimm              (de_csr_zimm              ),
      .de_csr_we                (de_csr_wr_ena            ),
      .de_csr_wr_1              (de_csr_wr_1              ),
      .de_csr_wr_0              (de_csr_wr_0              ),
      .de_csr_imm_en            (de_csr_imm_en            ),
      .jal                      (jal                      ),
      .jalr                     (jalr                     ),
  //
      .de_lsu_flag              (de_lsu_flag              )
      );
//======================GPR MODULE=============================================
  //with csr-------------------------------------------------------------------
  wire  [31:0]   gpr_csr_rdata;
  wire  [31:0]   csr_gpr_write_data;
  wire  [31:0]   csr_gpr_rdata;
  //with wb--------------------------------------------------------------------
  wire  [31:0]   wb_gpr_wdata;
  wire  [31:0]   gpr_rs1_data;
  wire  [31:0]   gpr_rs2_data;
  //with jtag------------------------------------------------------------------
  gpr u3_gpr(
      .clk                  (clk                ),
      //with de 
      .lsu_wb_valid         (lsu_wb_valid       ),
      .ctrl_lsu_typ         (ctrl_lsu_typ       ),
      .ctrl_ifu_stall       (ctrl_ifu_stall     ),
      .de_gpr_rs1_addr      (de_reg1_read_addr  ),
      .de_gpr_rs2_addr      (de_reg2_read_addr  ),
      .de_gpr_rd_write_en   (de_gpr_we          ),
      .wb_gpr_wdata         (wb_gpr_wdata       ),
      .de_gpr_rd_write_addr (de_reg3_write_addr ),
      //with csr
      .de_csr_write_en      (de_csr_wr_ena      ),
      .csr_gpr_wdata        (csr_gpr_rdata      ),
      //
      .gpr_rs1_data         (gpr_rs1_data       ),
      .gpr_rs2_data         (gpr_rs2_data       ),
      //with jtag 
      .jtag_gpr_we          (jtag_gpr_we        ), 
      .jtag_gpr_addr        (jtag_gpr_addr      ),
      .jtag_gpr_wdata       (jtag_gpr_wdata     ),    
      .gpr_jtag_rdata       (gpr_jtag_rdata     )     
  );      
//======================ALU MODULE=============================================
  //with pc
  wire  [31:0]  result_pc;
  wire  [31:0]  jump_pc  ;
  //with lsu
  wire  [31:0]  alu_lsu_addr;
  //with wb
  wire  [31:0]  alu_wb_data;
      alu u4_alu(
        .reg1_data                  (gpr_rs1_data               ),
        .reg2_data                  (gpr_rs2_data               ),        
        .de_alu_imm                 ( de_alu_imm                ),
        .current_pc                 ( ifu_alu_current_pc        ),
        .ctrl_alu_reg2_flag         ( ctrl_alu_reg2_flag        ),        
        .ctrl_alu_lui_flag          ( ctrl_alu_lui_flag         ), 
        .ctrl_alu_shift_flag        (ctrl_alu_shift_flag        ),
        .ctrl_alu_shift_right_flag  (ctrl_alu_shift_right_flag  ),
        .ctrl_alu_shift_logic_flag  ( ctrl_alu_shift_logic_flag ),
        .ctrl_alu_comparator_flag   (ctrl_alu_comparator_flag   ),
        .ctrl_alu_and_flag          (ctrl_alu_and_flag          ),
        .ctrl_alu_or_flag           (ctrl_alu_or_flag           ),
        .ctrl_alu_xor_flag          ( ctrl_alu_xor_flag         ),
        .ctrl_alu_adder_flag        (ctrl_alu_adder_flag        ),
        .jal                        (jal                        ),
        .jalr                       (jalr                       ),
        .ctrl_alu_sub_flag          (ctrl_alu_sub_flag          ),
        .ctrl_alu_auipc_flag        (ctrl_alu_auipc_flag        ),
        .result_pc                  (result_pc                  ),
        .alu_lsu_addr               (alu_lsu_addr               ),
        .alu_wb_data                (alu_wb_data                ),
        .de_alu_l_flag              (de_alu_l_flag              ),
        .de_alu_s_flag              (de_alu_s_flag              ),
        .de_alu_ls_size             (de_alu_ls_size             ),
        .alu_int_l_misa             (alu_int_l_misa             ),
        .alu_int_s_misa             (alu_int_s_misa             ),
        .alu_int_ls_addr            (alu_int_ls_addr            ),
        .de_lsu_flag                (de_lsu_flag                )
);
//======================CSR MODULE============================================= 
    csr u5_csr(
       .clk                (clk                ),
       .rst_n              (rstn               ),
       .de_csr_wr_ena      (de_csr_wr_ena      ),
       .de_csr_wr_1        (de_csr_wr_1        ),
       .de_csr_wr_0        (de_csr_wr_0        ),
       .de_csr_idx         (de_csr_idx         ),
       .de_csr_imm_en      (de_csr_imm_en      ),
       .de_csr_zimm        (de_csr_zimm        ),
       .gpr_csr_wdata      (gpr_rs1_data       ),
       .csr_gpr_rdata      (csr_gpr_rdata      ),
       .jtag_csr_ena       (jtag_csr_ena       ),
       .jtag_csr_we        (jtag_csr_we        ),
       .jtag_csr_idx       (jtag_csr_idx       ),
       .jtag_csr_wdata     (jtag_csr_wdata     ),
       .jtag_csr_reset_req (jtag_ctrl_reset_req),
       .jtag_csr_halt_req  (jtag_ctrl_halt_req ),
       .csr_jtag_rdata     (csr_jtag_rdata     ),
       .int_csr_ecause     (int_csr_ecause     ),
       .int_csr_epc        (int_csr_epc        ),
       .int_csr_ena        (int_csr_ena        ),
       .int_csr_mret       (int_csr_mret       ),
       .int_csr_dcause     (int_csr_dcause     ),
       .int_csr_dpc        (int_csr_dpc        ),
       .int_csr_dena       (int_csr_dena       ),
       .int_csr_ext        (int_csr_ext        ),
       .int_csr_tmr        (int_csr_tmr        ),
       .int_csr_sft        (int_csr_sft        ),
       .csr_int_mie        (csr_int_mie        ),
       .csr_int_meie       (csr_int_meie       ),
       .csr_int_mtie       (csr_int_mtie       ),
       .csr_int_msie       (csr_int_msie       ),
       .csr_int_mtvec      (csr_int_mtvec      ),
       .csr_int_epc        (csr_int_epc        ),
       .csr_int_counterstop(csr_int_counterstop),
       .int_csr_mtval      (int_csr_mtval      )
   );
//======================BRANCH MODULE==========================================
  branch  u6_branch(
    .clk              (clk            ),
    .de_alu_imm       (de_alu_imm     ),
    .jump_pc          (jump_pc        ),
    .rstn             (rstn           ),
    .reg1_data        (gpr_rs1_data   ),
    .reg2_data        (gpr_rs2_data   ),
    .ctrl_br_typ      (ctrl_br_typ    ),
    .ctrl_br_valid    (ctrl_br_valid  ),
    .br_ctrl_flush    (br_ctrl_flush  ),
    .br_ctrl_jump_en  (br_ctrl_jump_en),
    .jal              (jal            ),
    .jalr             (jalr           ),
    .current_pc       (ifu_alu_current_pc)
);
//======================WRITE BACK MODULE======================================
  wire                  lsu_wb_valid  ;
  wire [31:0] lsu_wb_data   ;
  wb  u7_wb(
    .lsu_wb_valid   (lsu_wb_valid ),
    .lsu_wb_data    (lsu_wb_data  ),
    .alu_wb_data    (alu_wb_data  ),
    .wb_gpr_wdata   (wb_gpr_wdata )
  );
//======================LOAD and  STORE MODULE==================================
wire                      lsu2icb_cmd_valid  ;
wire                      lsu2icb_cmd_ready  ;
wire   [31:0]             lsu2icb_cmd_addr   ;
wire                      lsu2icb_cmd_read   ;
wire   [31:0]             lsu2icb_cmd_wdata  ;
wire   [3:0]              lsu2icb_cmd_wmask  ;
wire                      lsu2icb_rsp_valid  ;
wire                      lsu2icb_rsp_ready  ;
wire   [31:0]             lsu2icb_rsp_rdata  ;
wire                      lsu2icb_rsp_err    ;

  lsu u8_lsu (
    .clk                 ( clk                 ) ,
    .rst_n               ( rstn                ) ,
    .ctrl_ifu_flush      ( ctrl_ifu_flush      ) ,
    .store_data          ( gpr_rs2_data        ) ,
    .alu_lsu_addr        ( alu_lsu_addr        ) ,
    .lsu2icb_rsp_rdata   ( lsu2icb_rsp_rdata   ) ,
    .ctrl_lsu_typ        ( ctrl_lsu_typ        ) ,
    .ctrl_lsu_size       ( ctrl_lsu_size       ) ,
    .ctrl_lsu_unsign     ( ctrl_lsu_unsign     ) ,
    .lsu2icb_rsp_valid   ( lsu2icb_rsp_valid   ) ,
    .lsu2icb_cmd_ready   ( lsu2icb_cmd_ready   ) ,
    .lsu2icb_rsp_err     ( lsu2icb_rsp_err     ) ,
    .lsu2icb_cmd_wdata   ( lsu2icb_cmd_wdata   ) ,
    .lsu2icb_cmd_addr    ( lsu2icb_cmd_addr    ) ,
    .lsu_wb_data         ( lsu_wb_data         ) ,
    .lsu_wb_valid        ( lsu_wb_valid        ) ,
    .lsu2icb_cmd_valid   ( lsu2icb_cmd_valid   ) ,
    .lsu2icb_cmd_read    ( lsu2icb_cmd_read    ) ,
    .lsu2icb_cmd_wmask   ( lsu2icb_cmd_wmask   ) ,
    .lsu2icb_rsp_ready   ( lsu2icb_rsp_ready   ) ,
    .lsu_ctrl_ready      ( lsu_ctrl_ready      )
  ) ;
//======================PC MODULE            ==================================
  pc  u9_pc(
    .clk                  (clk                  ),
    .rstn                 (rstn                 ),
    .ctrl_pc_jump_sel     (ctrl_pc_jump_sel     ),
    .ctrl_pc              (ctrl_pc              ),
    .ctrl_pc_stall        (ctrl_pc_stall        ),
    .pc_ifu_addr          (pc_ifu_addr          ),
    .ifu_pc_icb_cmd_ready (ifu_pc_icb_cmd_ready ),
    .jump_pc              (jump_pc              )
);
//======================BIU MODULE            =================================
  biu u10_biu(
    .clk                  (clk                  ),
    .rstn                 (rstn                 ),
    .jtag2icb_cmd_ready   (jtag2icb_cmd_ready   ),
    .jtag2icb_cmd_read    (jtag2icb_cmd_read    ),
    .jtag2icb_rsp_valid   (jtag2icb_rsp_valid   ),
    .jtag2icb_rsp_rdata   (jtag2icb_rsp_rdata   ),
    .jtag2icb_cmd_valid   (jtag2icb_cmd_valid   ),
    .jtag2icb_cmd_wdata   (jtag2icb_cmd_wdata   ),
    .jtag2icb_cmd_wmask   (jtag2icb_cmd_wmask   ),
    .jtag2icb_cmd_addr    (jtag2icb_cmd_addr    ),
    .jtag2icb_rsp_ready   (jtag2icb_rsp_ready   ),
    .jtag2icb_rsp_err     (jtag2icb_rsp_err     ),
    .if2icb_cmd_valid     (if2icb_cmd_valid     ), 
    .if2icb_cmd_ready     (if2icb_cmd_ready     ),
    .if2icb_cmd_addr      (ifu_biu_icb_cmd_addr ),
    .if2icb_cmd_read      (ifu_biu_icb_cmd_read ),
    .if2icb_cmd_wdata     (32'h0 ),
    .if2icb_cmd_wmask     (4'h2 ),
    .if2icb_rsp_valid     (if2icb_rsp_valid     ),
    .if2icb_rsp_ready     (if2icb_rsp_ready     ),
    .if2icb_rsp_rdata     (if2icb_rsp_rdata     ),
    .if2icb_rsp_err       (if2icb_rsp_err       ),
    .int_biu_hready       (int_biu_hready       ),
    .int_biu_hresp        (int_biu_hresp        ),
    .int_biu_hrdata       (int_biu_hrdata       ),
    .biu_ctrl_stall       (biu_ctrl_stall       ),
    .biu_int_hready       (biu_int_hready       ),
    .biu_int_hsel         (biu_int_hsel         ),
    .biu_int_haddr        (biu_int_haddr        ),
    .biu_int_hwrite       (biu_int_hwrite       ),
    .biu_int_hwdata       (biu_int_hwdata       ),
    .biu_int_hburst       (biu_int_hburst       ),
    .biu_int_hsize        (biu_int_hsize        ),
    .biu_int_htrans       (biu_int_htrans       ),
    .other_biu_hready     (other_biu_hready     ),
    .other_biu_hresp      (other_biu_hresp      ),
    .other_biu_hrdata     (other_biu_hrdata     ),
    .biu_other_hready     (biu_other_hready     ),
    .biu_other_hsel       (biu_other_hsel       ),
    .biu_other_haddr      (biu_other_haddr      ),
    .biu_other_hwrite     (biu_other_hwrite     ),
    .biu_other_hwdata     (biu_other_hwdata     ),
    .biu_other_hburst     (biu_other_hburst     ),
    .biu_other_hsize      (biu_other_hsize      ),
    .biu_other_htrans     (biu_other_htrans     ),
    .biu_other_hprot      (biu_other_hprot      ),
    .lsu2icb_cmd_valid    (lsu2icb_cmd_valid    ),  
    .lsu2icb_cmd_read     (lsu2icb_cmd_read     ),
    .lsu2icb_cmd_wmask    (lsu2icb_cmd_wmask    ),
    .lsu2icb_rsp_ready    (lsu2icb_rsp_ready    ),
    .lsu2icb_rsp_valid    (lsu2icb_rsp_valid    ),
    .lsu2icb_cmd_ready    (lsu2icb_cmd_ready    ),
    .lsu2icb_rsp_err      (lsu2icb_rsp_err      ),
    .lsu2icb_cmd_wdata    (lsu2icb_cmd_wdata    ),
    .lsu2icb_cmd_addr     (lsu2icb_cmd_addr     ),
    .lsu2icb_rsp_rdata    (lsu2icb_rsp_rdata    )
);
endmodule 
