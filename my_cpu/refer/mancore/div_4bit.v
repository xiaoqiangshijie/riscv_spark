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
//Date         By            Version         Change Description
//21-04-06 11:02:46   lihua         0.1             Original
//-------------------------------------------------------------
module   div_4bit #(
    parameter DIVIDEND_DW = 10,
    parameter DIVISOR_DW  = 10 
)( 
    input                           clk   , //clk
    input                           rst_n ,

    input                           div_vld,
    input       [DIVIDEND_DW-1:0]   dividend,
    input       [DIVISOR_DW -1:0]   divisor,

    output                          quo_vld,
    output      [DIVIDEND_DW-1:0]   quo,
    output      [DIVISOR_DW -1:0]   remainder
); 

//--------------------LOCAL_PAMETER----------------------------
localparam     A_DW = ((DIVIDEND_DW+3) >> 2) << 2 ;  //extend to multiples of 4
localparam     B_DW = ((DIVISOR_DW+3)  >> 2) << 2 ;  //extend to multiples of 4 
localparam     DLY  = (A_DW >> 2) + 1; //DLY = ( A_DW/4 ) + 1 , e.g. A_DW=16,LDY=16/4+1 = 5cycle 


//--------------------reg -------------------------------------

reg   [A_DW-1:0]  a_sft;
reg   [3:0]       shift_data;

reg   [B_DW+2:0]  div_b ; //extend 2+1 bit , 
reg   [B_DW+2:0]  div_2b; //extend 2+1 bit , 
reg   [B_DW+2:0]  div_3b; //extend 2+1 bit , 

reg  [A_DW-1:0]  quo_tmp;
reg  [B_DW-1:0]  remainder_tmp;

reg  [B_DW-1:0] u0_q_re;
reg  [1:0]      u0_q;      

reg  [B_DW-1:0] u1_q_re;
reg  [1:0]      u1_q;      



//--------------------wire -- ---------------------------------
wire  [A_DW-1:0]  div_a;
wire  [B_DW-1:0]  div_b_w;

wire  [B_DW  :0]  div_2b_tmp;
wire  [B_DW+1:0]  div_3b_tmp;

wire  [B_DW+2:0]  div_2b_w; //extend 2+1 bit , 
wire  [B_DW+2:0]  div_3b_w; //extend 2+1 bit , 

wire  [3:0]       sft_data;

wire [B_DW+2:0] u0_m;
wire [B_DW+2:0] u0_m_3b;
wire [B_DW+2:0] u0_m_2b;
wire [B_DW+2:0] u0_m_b;

wire [B_DW+2:0] u1_m;
wire [B_DW+2:0] u1_m_3b;
wire [B_DW+2:0] u1_m_2b;
wire [B_DW+2:0] u1_m_b;

wire  [DLY-1:0]div_vld_pipe;


//--------------------Main Code--------------------------------

//--vld pipe
vld_pipe  #(
  .PIPE_NUM ( DLY )

) u0_reg_vld_pipe(
  .clk        (clk                  ),
  .rstn       (rst_n                ),
  .vld_in     (div_vld              ),
  .vld_d      (div_vld_pipe[DLY-1:0])
);


//--------Data initial--------

//--change name 
//--cal div_a / div_b
wire  [DIVISOR_DW-1:0] divisor_t ;
assign   divisor_t = ( |divisor == 1'b0  ) ? { {(DIVISOR_DW-1){1'b0}} , 1'b1} :  divisor;

assign  div_a[A_DW-1:0] = {{(A_DW-DIVIDEND_DW){1'b0}}, dividend[DIVIDEND_DW-1:0]};
assign  div_b_w[B_DW-1:0] = {{(A_DW-DIVIDEND_DW){1'b0}}, divisor_t[DIVISOR_DW-1:0]};

assign  div_2b_tmp[B_DW  :0] =  {     div_b_w[B_DW-1:0],1'b0};
assign  div_3b_tmp[B_DW+1:0] =  {1'b0,div_b_w[B_DW-1:0],1'b0} + {2'b0,div_b_w[B_DW-1:0]};  //div_3b = 2b + b 


assign  div_2b_w[B_DW+2:0] = {2'b0,div_2b_tmp[B_DW  :0]};
assign  div_3b_w[B_DW+2:0] = {1'b0,div_3b_tmp[B_DW+1:0]};

//-----------------------------------------------------------------------------------
//                  0xXXXXXX / 0x0
// ----------------------------------------------------------------------------------


reg [DIVISOR_DW-1:0] divisor_reg ;

always@ (posedge clk or negedge rst_n) begin
    if(rst_n == 1'b0)begin
        divisor_reg <= {DIVISOR_DW{1'b0}} ;
    end
    else if(div_vld == 1'b1 )begin
        divisor_reg  <= divisor;
    end
end

reg [DIVIDEND_DW-1:0] dividend_reg ;

always@ (posedge clk or negedge rst_n) begin
    if(rst_n == 1'b0)begin
        dividend_reg <= {DIVISOR_DW{1'b0}} ;
    end
    else if(div_vld == 1'b1 )begin
        dividend_reg  <= dividend;
    end
end









//---------------------------------------
always@ (posedge clk or negedge rst_n) begin
    if(rst_n == 1'b0)begin
        div_b  <= {(B_DW+3){1'b0}};
        div_2b <= {(B_DW+3){1'b0}};
        div_3b <= {(B_DW+3){1'b0}};      
    end
    else if(div_vld == 1'b1)begin
        div_b  <= {3'b0, div_b_w};
        div_2b <=        div_2b_w;
        div_3b <=        div_3b_w;
    end
end

//--shft_data[3:0]
generate 
if(A_DW > 4)begin:ADW_GT_4BIT

    always@ (posedge clk or negedge rst_n) begin
        if(rst_n == 1'b0)begin
            a_sft <= {A_DW{1'b0}};
        end
        else if(div_vld == 1'b1)begin
            a_sft <= div_a[A_DW-1:0];
        end
        else if( |div_vld_pipe[DLY-3:0])begin // when A_DW > 4, DLY >= 4
            a_sft <= {a_sft[A_DW-5:0],4'b0};
        end
    end
    
    assign sft_data[3:0] = a_sft[A_DW-1:A_DW-4];

end
else begin:DLY_EQ_4BIT // lookup table is recommended

    always@ (posedge clk or negedge rst_n) begin
        if(rst_n == 1'b0)begin
            a_sft <= {A_DW{1'b0}};
        end
        else if(div_vld == 1'b1)begin
            a_sft <= div_a[A_DW-1:0];
        end
    end

    assign sft_data[3:0] = a_sft[A_DW-1:0]; //A_DW = 4

end

endgenerate

//--------U0_DIV_2BIT_UNIT---------



assign u0_m[B_DW+2:0] = {1'b0,remainder_tmp[B_DW-1:0],sft_data[3:2]}; 

assign u0_m_3b[B_DW+2:0] = u0_m - div_3b;
assign u0_m_2b[B_DW+2:0] = u0_m - div_2b;
assign u0_m_b[B_DW+2:0]  = u0_m - div_b ;

always@ (*) begin
    if(u0_m_3b[B_DW+2] == 1'b0 )begin
        u0_q_re[B_DW-1:0] = u0_m_3b[B_DW-1:0];
        u0_q[1:0]         = 2'b11;
    end
    else if(u0_m_2b[B_DW+2] == 1'b0)begin
        u0_q_re[B_DW-1:0] = u0_m_2b[B_DW-1:0];
        u0_q[1:0]         = 2'b10;
    end
    else if(u0_m_b[B_DW+2] == 1'b0)begin
        u0_q_re[B_DW-1:0] = u0_m_b[B_DW-1:0];
        u0_q[1:0]         = 2'b01;
    end
    else begin
        u0_q_re[B_DW-1:0] = u0_m[B_DW-1:0];
        u0_q[1:0]         = 2'b00;
    end
end

//--------U1_DIV_2BIT_UNIT---------



assign u1_m[B_DW+2:0] = {1'b0,u0_q_re[B_DW-1:0],sft_data[1:0]}; 

assign u1_m_3b[B_DW+2:0] = u1_m - div_3b;
assign u1_m_2b[B_DW+2:0] = u1_m - div_2b;
assign u1_m_b[B_DW+2:0]  = u1_m - div_b ;

always@ (*) begin
    if(u1_m_3b[B_DW+2] == 1'b0 )begin
        u1_q_re[B_DW-1:0] = u1_m_3b[B_DW-1:0];
        u1_q[1:0]         = 2'b11;
    end
    else if(u1_m_2b[B_DW+2] == 1'b0)begin
        u1_q_re[B_DW-1:0] = u1_m_2b[B_DW-1:0];
        u1_q[1:0]         = 2'b10;
    end
    else if(u1_m_b[B_DW+2] == 1'b0)begin
        u1_q_re[B_DW-1:0] = u1_m_b[B_DW-1:0];
        u1_q[1:0]         = 2'b01;
    end
    else begin
        u1_q_re[B_DW-1:0] = u1_m[B_DW-1:0];
        u1_q[1:0]         = 2'b00;
    end
end



//--------output --------

always@ (posedge clk or negedge rst_n) begin
    if(rst_n == 1'b0)begin
        quo_tmp      [A_DW-1:0] <= {A_DW{1'b0}};
        remainder_tmp[B_DW-1:0] <= {B_DW{1'b0}};
    end
    else if(div_vld == 1'b1)begin
        quo_tmp      [A_DW-1:0] <= {A_DW{1'b0}};
        remainder_tmp[B_DW-1:0] <= {B_DW{1'b0}};
    end
    else if( |div_vld_pipe[DLY-2:0])begin  //TBD DLY-2
        quo_tmp      [A_DW-1:0] <= {quo_tmp[A_DW-5:0],u0_q[1:0],u1_q[1:0]};
        remainder_tmp[B_DW-1:0] <= u1_q_re;
    end
end

assign quo_vld                    = div_vld_pipe[DLY-1];
assign quo      [DIVIDEND_DW-1:0] = (divisor_reg == {DIVISOR_DW{1'b0}}) ? {DIVIDEND_DW{1'b1}} : quo_tmp[DIVIDEND_DW-1:0];
assign remainder[DIVISOR_DW -1:0] = (divisor_reg == {DIVISOR_DW{1'b0}}) ? dividend_reg : remainder_tmp[DIVISOR_DW-1:0];




endmodule
