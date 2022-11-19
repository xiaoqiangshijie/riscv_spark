//-----------------------------------------------------------------------------
//File          :alu.v
//Author        :modi
//Date          :07/21/2021
//Version       :0.1
//Description   :This file is a logic and arithmetic module of risc-v
//-----------------------------------------------------------------------------
//Modification History:
//Date          By          Version         Change Description 
//07/21/2021    modi        0.1             Original
//07/22/2021    modi        0.2             add DW_shifter module to shift
//                                          logic
//07/23/2021    modi        0.3             add dw01_addsub module to add,
//                                          sub and compare operation
//07/29/2021    modi        0.4             deleate signal valid 
//-----------------------------------------------------------------------------            
module alu
#(
  parameter   DATA_WIDTH  = 32,
  parameter   SHIFT_WIDTH = 6
)(
  input    [DATA_WIDTH-1:0]    reg1_data                    ,//data from r1 
  input    [DATA_WIDTH-1:0]    reg2_data                    ,//data from r2
  input    [DATA_WIDTH-1:0]    de_alu_imm                   ,//data from immediately
  input    [DATA_WIDTH-1:0]    current_pc                   ,//program counter
  input                        jal                          ,
  input                        jalr                         ,
  input                        ctrl_alu_reg2_flag           ,//1 is reg2_data,0 is alu_imm
  input                        ctrl_alu_lui_flag            ,//1 represents lui operation is valid 
  input                        ctrl_alu_shift_flag          ,//1 represents shift operation is valid 
  input                        ctrl_alu_shift_right_flag    ,//1 represents shift right,0 represents shift left
  input                        ctrl_alu_shift_logic_flag    ,//1 represents logic shift,0 represents arithmetic shift
  input     [1:0]              ctrl_alu_comparator_flag     ,//1 represents comparison operation is valid,0 represents comparison  is unvalid 
  input                        ctrl_alu_and_flag            ,//1 represents and operation is valid 
  input                        ctrl_alu_or_flag             ,//1 represents or operation is valid 
  input                        ctrl_alu_xor_flag            ,//1 represents xor operation is valid 
  input                        ctrl_alu_adder_flag          ,//1 represents addition operation is valid 
  input                        ctrl_alu_sub_flag            ,//1 represents subtraction 
  input                        ctrl_alu_auipc_flag          ,//1 represents  auipc operation is valid 
  output    [DATA_WIDTH-1:0]   result_pc                    ,//result of auipc operation 
  output    [DATA_WIDTH-1:0]   alu_lsu_addr                 ,//result of other operation 
  output    [DATA_WIDTH-1:0]   alu_wb_data                  ,       //result of other operation,equal alu_lsu_addr
  input                        de_alu_l_flag                ,
  input                        de_alu_s_flag                ,
  input     [1:0]              de_alu_ls_size               ,
  output    reg                alu_int_l_misa               ,
  output    reg                alu_int_s_misa               ,
  output    [DATA_WIDTH-1:0]   alu_int_ls_addr              ,
  input                        de_lsu_flag 
);

//choose operation from reg2_data and de_alu_imm
  wire    [DATA_WIDTH-1:0]     operation2                              ;
  assign  operation2      = ctrl_alu_reg2_flag ? reg2_data : de_alu_imm;
//and,or,xor operation========================================================
  wire    [DATA_WIDTH-1:0]    and_result          ;//and
  wire    [DATA_WIDTH-1:0]    or_result           ;//or
  wire    [DATA_WIDTH-1:0]    xor_result          ;//xor
  reg     [DATA_WIDTH-1:0]    logic_result        ;//three of one result
  assign  and_result = reg1_data & operation2     ;
  assign  or_result  = reg1_data | operation2     ;
  assign  xor_result = reg1_data ^ operation2     ;
  always@(*)begin:CHOOSE_LOGIC_RESULT              //only one flag is valid at the same time 
    if(ctrl_alu_and_flag == 1'b1)
      logic_result = and_result                   ;
    else if(ctrl_alu_or_flag == 1'b1)
      logic_result = or_result                    ;
    else if(ctrl_alu_xor_flag == 1'b1)
      logic_result = xor_result                   ;
    else 
      logic_result = {DATA_WIDTH{1'b0}}           ;
  end 

//comparator,addition and subtraction operation ==============================
  reg     [DATA_WIDTH-1:0]    arith_operation1                         ;    //operation1
  wire    [DATA_WIDTH-1:0]    arith_operation2                         ;    //operation2
  reg     [DATA_WIDTH-1:0]    arith_result                             ;    //result of arithmetic
  wire    [DATA_WIDTH-1:0]    sum                                      ;    //result of instance module 
  reg                         add_sub                                  ;    //0 represents addition,1 represents subtraction
  reg                         co                                       ;    //carry-out
  //choose two data for dw01_addsub module from three control signal
  //arith_operation 1
  always@(*)begin 
    if(ctrl_alu_auipc_flag == 1'b1)
      arith_operation1    = current_pc       ;
    else 
      arith_operation1    = reg1_data        ;
  end 
  //arith_operation2
  assign arith_operation2 = operation2       ;
  //make sure weather addition or subtrantion 
  always@(*)begin 
    if(ctrl_alu_auipc_flag == 1'b1 || ctrl_alu_adder_flag == 1'b1)        //addition 
      add_sub = 1'b0;
    else if(ctrl_alu_sub_flag == 1'b1 || |ctrl_alu_comparator_flag == 1'b1)//subtraction and compare
      add_sub = 1'b1;
    else 
      add_sub = 1'b0;
  end 

//`ifdef CHIP_FPGA

  wire [DATA_WIDTH:0] tmp_sum;

  assign tmp_sum = add_sub ? (arith_operation1 - arith_operation2 ): 
                             (arith_operation1 + arith_operation2 );
  always@(*) begin
    if(ctrl_alu_comparator_flag == 2'b01)begin
      if((tmp_sum[DATA_WIDTH] && (arith_operation1[DATA_WIDTH-1] ~^ arith_operation2[DATA_WIDTH-1]))|
         (arith_operation1[DATA_WIDTH-1] && !arith_operation2[DATA_WIDTH-1]) )
        co = 1'b1 ;
      else 
        co = 1'b0 ;
    end
    else if (ctrl_alu_comparator_flag == 2'b10)begin
      co = tmp_sum[DATA_WIDTH];
    end
    else 
      co = !tmp_sum[DATA_WIDTH];
  end

//  assign co      = tmp_sum[DATA_WIDTH];
  assign sum     = tmp_sum[DATA_WIDTH-1 : 0];

//`else //CHIP_FPGA
//
//  DW01_addsub 
//  #(      
//             .width    (DATA_WIDTH      )
//  )
//  U0_dw01_addsub
//  (
//             .A        (arith_operation1),
//             .B        (arith_operation2),
//             .CI       (1'b0            ),
//             .ADD_SUB  (add_sub         ),
//             .SUM      (sum             ),
//             .CO       (co              )
//  );
//
//`endif //CHIP_FPGA

  //output arithmetic result
  always@(*)begin:ARITH_RESULT
    if(|ctrl_alu_comparator_flag == 1'b1)begin
      if(co == 1'b1)
        arith_result = 32'h0000_0001              ;
      else 
        arith_result = {DATA_WIDTH{1'b0}}         ;
    end 
    else 
      arith_result   = sum                        ;
  end 

//shift operation============================================================= 
  wire signed [DATA_WIDTH-1:0]    shifter_op1         ;
  wire signed [4:0]    shifter_op2         ;
  reg         [SHIFT_WIDTH-1:0]   sh                  ;
  reg                             sh_tc               ;     //0 represents shifter_op2 is signed,1 represents shifter_op2 is unsigned
  wire        [DATA_WIDTH-1:0]    shifter_result      ;
  reg                             data_tc             ;     //0 represents logic 0 padding,1 represents sign-extened padding 
  

assign  shifter_op1 = reg1_data;
assign  shifter_op2 = operation2[4:0];

//`ifdef CHIP_FPGA
  assign shifter_result = (~ctrl_alu_shift_right_flag & ~ctrl_alu_shift_logic_flag) ? (shifter_op1 <<  shifter_op2) :
                          (~ctrl_alu_shift_right_flag &  ctrl_alu_shift_logic_flag) ? (shifter_op1 <<  shifter_op2) :
                          ( ctrl_alu_shift_right_flag & ~ctrl_alu_shift_logic_flag) ? (shifter_op1 >>> shifter_op2) :
                                                                                      (shifter_op1 >>  shifter_op2) ;

//`else //CHIP_FPGA
//
//  always@(*)begin:SH                                    //sh:numbers of shift
//    if(ctrl_alu_shift_right_flag == 1'b1)
//      sh = {1'b1,shifter_op2[SHIFT_WIDTH-2:0]}    ;     //shift right,sh_dc = 1,sh is a signed numbers
//    else 
//      sh = {1'b0,shifter_op2[SHIFT_WIDTH-2:0]}    ;     //shift left,sh_dc  = 0,sh is a unsigned numbers
//  end 
//  
//  always@(*)begin:SHI_TC                                //sh_tc:1 represents signed,0 represents unsigned
//    if(ctrl_alu_shift_right_flag == 1'b1)
//      sh_tc = 1'b1    ;
//    else 
//      sh_tc = 1'b0    ;
//  end 
//  
//  always@(*)begin:DATA_TC                              //data_tc:1 represents signed,0 represents unsigned
//    if(ctrl_alu_shift_logic_flag == 1'b1)
//      data_tc = 1'b0  ;
//    else 
//      data_tc = 1'b1  ;
//  end     
//
//  DW_shifter 
//  #(    .data_width (DATA_WIDTH      ),
//        .sh_width   (SHIFT_WIDTH     ),
//        .inv_mode   (0               )
//  )U0_DW_shifter
//  (
//        .data_in    (shifter_op1     ),
//        .data_tc    (data_tc         ),
//        .sh         (sh              ),
//        .sh_tc      (sh_tc           ),
//        .sh_mode    (1'b1            ),
//        .data_out   (shifter_result)
//  );
//
//`endif //CHIP_FPGA

  //MUX to alu_wb_data
  reg     [DATA_WIDTH-1:0]    alu_wb_data_r     ;
  always@(*)begin 
    if(ctrl_alu_and_flag ==1'b1 || ctrl_alu_or_flag == 1'b1 || ctrl_alu_xor_flag == 1'b1)
      alu_wb_data_r = logic_result              ;
    else if(ctrl_alu_shift_flag == 1'b1)
      alu_wb_data_r = shifter_result            ;
    else if(ctrl_alu_adder_flag == 1'b1 || ctrl_alu_sub_flag == 1'b1 || |ctrl_alu_comparator_flag == 1'b1 ||
            ctrl_alu_auipc_flag == 1'b1)
      alu_wb_data_r = arith_result              ;
    else 
      alu_wb_data_r = {DATA_WIDTH{1'b0}}        ;
  end 
  assign alu_wb_data  = (jalr || jal)?(current_pc+4):(ctrl_alu_lui_flag)?de_alu_imm:alu_wb_data_r           ;

  reg  [1:0] lsu_mask         ;
  wire [1:0] alu_lsu_addr_low ;
  always@(*) begin
    case (de_alu_ls_size) 
      2'b00   : lsu_mask = 2'b11;
      2'b01   : lsu_mask = 2'b10;
      2'b10   : lsu_mask = 2'b00;
      default : lsu_mask = 2'b11;
    endcase
  end

  assign alu_lsu_addr_low = alu_wb_data[1:0] & lsu_mask     ;
  assign alu_lsu_addr = {alu_wb_data[31:2],alu_lsu_addr_low};                              //same value to alu_lsu_addr outputs
  //assign result_pc    = ctrl_alu_lui_flag ? arith_result : {DATA_WIDTH{1'b0}}; //result_pc is valid when ctrl_alu_lui_flag is valid 

  wire   ls_misa ;

  assign ls_misa = (alu_wb_data[0] && de_alu_ls_size == 2'b01 && de_lsu_flag) || 
                   (alu_wb_data[0] && de_alu_ls_size == 2'b10 && de_lsu_flag) ||
                   (alu_wb_data[1] && de_alu_ls_size == 2'b10 && de_lsu_flag) ;

  always@(*) begin
      if(ls_misa && de_alu_l_flag) begin
          alu_int_l_misa = 1'b1;
      end
      else begin
          alu_int_l_misa = 1'b0;
      end
  end
 
  always@(*) begin
      if(ls_misa && de_alu_s_flag) begin
          alu_int_s_misa = 1'b1;
      end
      else begin
          alu_int_s_misa = 1'b0;
      end
  end

  assign alu_int_ls_addr = alu_lsu_addr;

endmodule 
