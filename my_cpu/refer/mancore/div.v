//-------------------------------------------------------------
//This confidential and proprietary software may be used only as 
//authorized by a licensing agreement from Orbbec Inc.
//In the event of publication, the following notice is
//applicable:
//(C)COPYRIGHT 2013 ORBBEC INC. ALL RIGHTS RESERVED.
//The entire notice above must be reproduced on all authorized
//copies.
//-------------------------------------------------------------
//File:        div_4bit.v
//Author:      lihua
//Date:        21-04-06 11:02:46
//Version:     0.1
//Description: A 4bit shift divider based on 2 bit shift division unit
//             cal dividend/divisor = quo 
//          ***only unsigned numbers are supported
//          ***pipeline is not supported    
//
//
//-------------------------------------------------------------
//Modification History:
//Date                  By            Version      Change Description
//21-04-06 11:02:46    lihua          0.1             Original
//21-09-16 17:18:25    yingzheng      0.2            add to automan    
//-------------------------------------------------------------
module   div #(
    parameter DIVIDEND_DW = 64 ,
    parameter DIVISOR_DW  = 64
)( 
    input                           clk   , //clk
    input                           rst_n ,
    input       [3:0]               de_mdu_div_type,
    input                           ctrl_mdu_fake_gen_flag,
    input                           gpr_mdu_div_data_vld,
    input       [DIVIDEND_DW-1:0]   gpr_mdu_div_reg1_data,
    input       [DIVISOR_DW-1:0]    gpr_mdu_div_reg2_data,

    output                          mdu_wb_div_vld,
    output      [DIVIDEND_DW-1:0]   mdu_wb_div_wdata,
    output                          mdu_wb_div_fake_vld
); 

//--------------------LOCAL_PAMETER----------------------------

localparam     DIV   = 4'b0001;
localparam     DIVU  = 4'b0010;
localparam     REM   = 4'b0011;
localparam     REMU  = 4'b0100;
localparam     DIVW  = 4'b0101;
localparam     DIVUW = 4'b0110;
localparam     REMW  = 4'b0111;
localparam     REMUW = 4'b1000;

//-------------------------------------------------------------

//in
wire                     div_vld;
wire  [DIVIDEND_DW-1:0]  dividend;
wire  [DIVISOR_DW -1:0]  divisor;

//out
wire                     quo_vld;
wire  [DIVIDEND_DW-1:0]  quo;
wire  [DIVISOR_DW -1:0]  remainder;

//--------------------  main code       ------------------------

//TEST WIRE 
wire [63:0] quo_test;
wire [63:0] rem_test;

assign quo_test = gpr_mdu_div_reg1_data / gpr_mdu_div_reg2_data ;
assign rem_test = gpr_mdu_div_reg1_data % gpr_mdu_div_reg2_data ;

//generate dividend
assign dividend = gpr_mdu_div_reg1_data ;
assign divisor  = gpr_mdu_div_reg2_data ;

//generate op1_temp,op2_temp
reg [DIVIDEND_DW-1:0] op1_temp ;
reg [DIVISOR_DW -1:0] op2_temp ;
reg                   sign_flag;

// ex_sign
always @(*) begin
  case(de_mdu_div_type)
       REMUW,DIVUW: begin
         op1_temp = {32'b0,dividend[31:0]};
         op2_temp = {32'b0,divisor[31:0]};
       end
       REMW,DIVW:begin
         op1_temp = {{32{dividend[31]}},dividend[31:0]};
         op2_temp = {{32{divisor[31]}},divisor[31:0]};
       end
       DIV,REM,DIVU,REMU:begin
         op1_temp = dividend;
         op2_temp = divisor;
       end
      default:begin
         op1_temp = dividend;
         op2_temp = divisor;
      end
  endcase
end

always @(*) begin
  case(de_mdu_div_type)
      DIV,DIVW,REM,REMW     : sign_flag = 1'b1;
      DIVU,DIVUW,REMU,REMUW : sign_flag = 1'b0;
      default:sign_flag  = 1'b0;
   endcase
end 
//generate ABS
wire  [DIVIDEND_DW-1:0]  dividend_abs;
assign dividend_abs = op1_temp[DIVIDEND_DW-1] ? (~op1_temp + 1'b1 ) : op1_temp ;

wire  [DIVISOR_DW -1:0]  divisor_abs;
assign divisor_abs = op2_temp[DIVIDEND_DW-1] ? (~op2_temp + 1'b1 ) : op2_temp ;


wire word_en_u;
assign word_en_u = de_mdu_div_type == DIVU | de_mdu_div_type == DIVUW | de_mdu_div_type == REMU | de_mdu_div_type == REMUW ;


wire [DIVIDEND_DW-1:0] op1_in;
wire [DIVISOR_DW -1:0] op2_in;
assign op1_in = word_en_u ?  op1_temp : dividend_abs;
assign op2_in = word_en_u ?  op2_temp : divisor_abs;


//generate div_vld
assign div_vld = |de_mdu_div_type & gpr_mdu_div_data_vld & !ctrl_mdu_fake_gen_flag;


//dff de_mdu_div_type
reg   [3:0] div_type   ;


wire word_en;
assign word_en = de_mdu_div_type == DIVW | de_mdu_div_type == DIVUW | de_mdu_div_type == REMW | de_mdu_div_type == REMUW ;

assign op1 = word_en ?  {32'b0,op1_temp[31:0]} : op1_temp;
assign op2 = word_en ?  {32'b0,op2_temp[31:0]} : op2_temp;


//generate div_vld
assign div_vld = |de_mdu_div_type & gpr_mdu_div_data_vld;


//dff de_mdu_div_type
reg   [ 3:0] div_type   ;
always @(posedge clk) begin
  if(div_vld) begin
     div_type <= de_mdu_div_type ;
  end
end


//--------------------Main Code--------------------------------

//instance the div_4bit
div_4bit #(
    .DIVIDEND_DW         (64           ),
    .DIVISOR_DW          (64           )
)
u_div_4bit( 
    .clk                 (clk          ), //clk
    .rst_n               (rst_n        ),

    .div_vld             (div_vld      ),
    .dividend            (op1_in       ),
    .divisor             (op2_in       ),
    .quo_vld             (quo_vld      ),
    .quo                 (quo          ),
    .remainder           (remainder    )
); 


reg sign_ret_div_flag;
//conditions for return of quo symbols
always@(posedge clk) begin
  if(gpr_mdu_div_data_vld) begin
   if(div_type == DIVU | div_type == REMU | div_type == DIVUW | div_type == REMUW)begin
       sign_ret_div_flag = 1'b0;
   end
   else if(op1_temp == 64'b0 || op2_temp == 64'b0)begin
       sign_ret_div_flag = 1'b0;
   end
   else begin
       sign_ret_div_flag = op1_temp[63] ^ op2_temp[63];
   end
  end
end

reg sign_ret_rem_flag;
//conditions for return of rem symbols
always@(posedge clk) begin
  if(gpr_mdu_div_data_vld) begin
   if(div_type == DIVU | div_type == REMU | div_type == DIVUW | div_type == REMUW)begin
       sign_ret_rem_flag = 1'b0;
   end
   else begin
       sign_ret_rem_flag = op1_temp[63];
   end
 end
end

wire [DIVIDEND_DW-1:0]quo_ret;
wire [DIVIDEND_DW-1:0]remainder_ret;

//symbol processing
assign quo_ret = sign_ret_div_flag ? (~quo +1'b1) : quo;
assign remainder_ret = sign_ret_rem_flag ? (~remainder +1'b1) : remainder;

//w type produce
wire word_en_d;
assign word_en_d = div_type == DIVW | div_type == DIVUW | div_type == REMW | div_type == REMUW ;



//div symbol expansion
reg[DIVIDEND_DW-1:0] div_out;
always @(*)begin 
    if(word_en_d) begin
       div_out = {{32{quo_ret[31]}},quo_ret[31:0]};
    end
    else begin
       div_out = quo_ret;
    end
end

//rem symbol expansion
reg[DIVISOR_DW-1:0] rem_out;
always @(*)begin 
    if(word_en_d) begin
       rem_out = {{32{remainder_ret[31]}},remainder_ret[31:0]};
    end
    else begin
       rem_out = remainder_ret;
    end
end

//output data
reg [DIVIDEND_DW-1:0] out;
always @(*) begin
  case(div_type)
      DIV,DIVW,DIVU,DIVUW : out = div_out;
      REM,REMW,REMU,REMUW : out = rem_out;
  default :div_out = {DIVIDEND_DW{1'b0}};
  endcase
end


// output
assign mdu_wb_div_wdata    =  out ;
assign mdu_wb_div_vld      =  quo_vld ;
assign mdu_wb_div_fake_vld =  gpr_mdu_div_data_vld & ctrl_mdu_fake_gen_flag;

endmodule