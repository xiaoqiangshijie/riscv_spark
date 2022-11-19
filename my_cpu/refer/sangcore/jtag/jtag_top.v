//-----------------------------------------------------------------------------
//This confidential and proprietary software may be used only used as
//by a licensing aggrement from Orbbec Inc.
//In the event of publication ,the following notice is applicable:
//(C)COPYRIGHT 2013 ORBBEC INC.ALL RIGHTS RESERVED.
//The entire notice ablove must be reproduced on all authorized copies
//-----------------------------------------------------------------------------
//File          :jtag_top.v
//Author        :modi
//Date          :08/24/2021
//Version       :0.1
//Description   :This file is a jtag module for risc-v 
//-----------------------------------------------------------------------------
//Modification History:
//Date          By          Version         Change Description 
//08/24/2021    modi        0.1             Original
//-----------------------------------------------------------------------------
module jtag_top(
  input               clk             ,    
  input               rstn            ,
//With Jtag   
  input               jtag_pin_tck    ,
  input               jtag_pin_tms    ,
  input               jtag_pin_tdi    ,
  input               jtag_pin_trst   ,
  output              jtag_pin_tdo    ,
//With GPR
  output              jtag_gpr_we     ,
  output[4:0]         jtag_gpr_addr   ,
  output[31:0]        jtag_gpr_wdata  ,
  input [31:0]        gpr_jtag_rdata  ,
//With CSR
  output[11:0]        jtag_csr_idx    ,
  output[31:0]        jtag_csr_wdata  ,
  output              jtag_csr_ena    ,
  output              jtag_csr_we     ,
  input [31:0]        csr_jtag_rdata  ,
//With System Bus
  input               jtag2icb_cmd_ready,
  input               jtag2icb_rsp_valid,
  input [31:0]        jtag2icb_rsp_rdata,
  input               jtag2icb_rsp_err  ,
  output              jtag2icb_cmd_valid,
  output[31:0]        jtag2icb_cmd_addr ,
  output[31:0]        jtag2icb_cmd_wdata,
  output              jtag2icb_cmd_read ,     //read enable 
  output[3:0 ]        jtag2icb_cmd_wmask,
  output              jtag2icb_rsp_ready,
//With Interrupt
  input               int_jtag_ebreak   ,
  output              jtag_int_irq      ,
//With Control
  output              jtag_ctrl_reset_req,
  output              jtag_ctrl_halt_req 
);
//examplify dtm module
  wire          dm_dtm_req    ; 
  wire[39:0]    dm_dtm_data   ;    
  wire          dm_dtm_ack    ;    
  wire          dtm_dm_req    ;    
  wire[39:0]    dtm_dm_data   ;    
  wire          dtm_dm_ack    ;    
  
  dtm u0_dtm(
     .jtag_pin_tck          (jtag_pin_tck     ),
     .jtag_pin_tms          (jtag_pin_tms     ),
     .jtag_pin_tdi          (jtag_pin_tdi     ),
     .jtag_pin_trst         (jtag_pin_trst    ),
     .jtag_pin_tdo          (jtag_pin_tdo     ),
     .rstn                  (rstn             ),
     .dm_dtm_ack            (dm_dtm_ack       ),
     .dm_dtm_data           (dm_dtm_data      ),
     .dm_dtm_req            (dm_dtm_req       ),
     .dtm_dm_ack            (dtm_dm_ack       ),
     .dtm_dm_data           (dtm_dm_data      ),
     .dtm_dm_req            (dtm_dm_req       )
  );
//examplify dm 
  dm  u1_dm(
     .clk                   (clk                ),
     .rstn                  (rstn               ),
     .dm_dtm_ack            (dm_dtm_ack         ),
     .dm_dtm_data           (dm_dtm_data        ),
     .dm_dtm_req            (dm_dtm_req         ),
     .dtm_dm_ack            (dtm_dm_ack         ),
     .dtm_dm_data           (dtm_dm_data        ),
     .dtm_dm_req            (dtm_dm_req         ),
     .dm_csr_idx            (jtag_csr_idx       ),
     .dm_csr_wdata          (jtag_csr_wdata     ),
     .dm_csr_we             (jtag_csr_we        ),
     .dm_csr_ena            (jtag_csr_ena       ),
     .csr_dm_rdata          (csr_jtag_rdata     ),
     .dm_csr_reset_req      (jtag_ctrl_reset_req),
     .dm_csr_halt_req       (jtag_ctrl_halt_req ),
     .dm_gpr_wdata          (jtag_gpr_wdata     ),
     .dm_gpr_we             (jtag_gpr_we        ),
     .gpr_dm_rdata          (gpr_jtag_rdata     ),
     .dm_gpr_addr           (jtag_gpr_addr      ),
     .jtag2icb_cmd_ready    (jtag2icb_cmd_ready ),
     .jtag2icb_rsp_valid    (jtag2icb_rsp_valid ),
     .jtag2icb_rsp_rdata    (jtag2icb_rsp_rdata ),
     .jtag2icb_rsp_err      (jtag2icb_rsp_err   ),
     .jtag2icb_cmd_valid    (jtag2icb_cmd_valid ),
     .jtag2icb_cmd_addr     (jtag2icb_cmd_addr  ),
     .jtag2icb_cmd_wdata    (jtag2icb_cmd_wdata ),
     .jtag2icb_cmd_read     (jtag2icb_cmd_read  ),
     .jtag2icb_cmd_wmask    (jtag2icb_cmd_wmask ),
     .jtag2icb_rsp_ready    (jtag2icb_rsp_ready ),
     .int_jtag_ebreak       (int_jtag_ebreak    ),
     .jtag_irq              (jtag_int_irq      )
  );   
  endmodule   
