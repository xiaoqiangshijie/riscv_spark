//-------------------------------------------------------------
//This confidential and proprietary software may be used only as //authorized by a licensing agreement from Orbbec Inc.
//In the event of publication, the following notice is //applicable:
//(C)COPYRIGHT 2013 ORBBEC INC. ALL RIGHTS RESERVED.
//The entire notice above must be reproduced on all authorized //copies.
//-------------------------------------------------------------
//File       		: mul.v
//Author    		: jingjing
//Date     	 		: 08/25/2021
//Version 	   	: 0.1
//Description   : This file is the module for biu, which acts as a bridge
//between inner core and outer slaves.
//attachments.
//-------------------------------------------------------------
//Modification History:
//Date          By  	     Version	  change Description
//08/25/2021    jingjing      0.1      Original   
//------------------------------------------------------------

module mul(
//WITH TOP
    input           clk,
    input           rstn,
//WITH CTRL
    input           ctrl_mdu_fake_gen_flag,
//WITH GRP
    input           gpr_mdu_mul_data_vld,
    input [63:0]    gpr_mdu_mul_reg1_data,
    input [63:0]    gpr_mdu_mul_reg2_data,
//WITH DE
    input [ 2:0]    de_mdu_mul_type,
//WITH WB
    output          mdu_wb_mul_vld,
    output[63:0]    mdu_wb_mul_wdata,
    output reg      mdu_wb_mul_fake_vld
);

//-------------------------------local parameter----------------
localparam MUL    = 3'b001;
localparam MULH   = 3'b010;
localparam MULHU  = 3'b011;
localparam MULHSU = 3'b100;
localparam MULW   = 3'b101;
//--------------------------------reg----------------------------
//vld
reg vld;
reg vld_1d;
reg vld_2d;
reg vld_3d;
reg vld_4d;

//op
reg [2:0]op;
reg [2:0]op_1d;
reg [2:0]op_2d;
reg [2:0]op_3d;
reg [2:0]op_4d;
//complement--true form
reg [63:0]a;
reg [63:0]b;
//sig
reg sig;
reg sig_1d;
reg sig_2d;
reg sig_3d;
reg sig_4d;
//1st level dff
reg [15:0]dff1_0a;
reg [15:0]dff1_1a;
reg [15:0]dff1_2a;
reg [15:0]dff1_3a;
reg [15:0]dff1_0b;
reg [15:0]dff1_1b;
reg [15:0]dff1_2b;
reg [15:0]dff1_3b;
//mul 16*16
reg [31:0]mul_0a0b;
reg [31:0]mul_1a1b;
reg [31:0]mul_0a1b;
reg [31:0]mul_1a0b;
reg [31:0]mul_0a2b;
reg [31:0]mul_2a0b;
reg [31:0]mul_1a2b;
reg [31:0]mul_2a1b;
reg [31:0]mul_0a3b;
reg [31:0]mul_3a0b;
reg [31:0]mul_1a3b;
reg [31:0]mul_3a1b;
reg [31:0]mul_2a3b;
reg [31:0]mul_3a2b;
reg [31:0]mul_2a2b;
reg [31:0]mul_3a3b;
//2st level dff
reg [15:0]dff2_0a0b;
reg [15:0]dff2_2a2b;
reg [47:0]dff2_ab;
reg [47:0]dff2_op;
reg [31:0]dff2_0a1b; 
reg [31:0]dff2_1a0b;
reg [31:0]dff2_0a2b;
reg [31:0]dff2_2a0b;
reg [31:0]dff2_1a2b;
reg [31:0]dff2_2a1b;
reg [31:0]dff2_0a3b;
reg [31:0]dff2_3a0b;
reg [31:0]dff2_1a3b;
reg [31:0]dff2_3a1b;
reg [31:0]dff2_2a3b;
reg [31:0]dff2_3a2b;
//1st level add
reg [32:0]add1_0a1b_1a0b;
reg [32:0]add1_0a2b_2a0b;
reg [32:0]add1_1a2b_2a1b;
reg [32:0]add1_0a3b_3a0b;
reg [32:0]add1_1a3b_3a1b;
reg [32:0]add1_2a3b_3a2b;
//2nd level add
reg [47:0]add2_ab_cd;
reg [47:0]add2_mn_op;
reg [32:0]add2_ef_gh;
reg [32:0]add2_ij_kl;
//3rd level dff
reg [31:0]dff3_32_final;
reg [31:0]dff3_ab_cd;
reg [48:0]dff3_ef_gh;
reg [15:0]dff3_ij_16_low;
reg [32:0]dff3_ij_kl;
reg [63:0]dff3_mn_op;
//3rd level add
reg [48:0]add3_x;
reg [63:0]add3_y;
//4th level add
reg [79:0]add4_final;
//4th level dff
reg [127:0]dff_final; 
//true form-complement
reg [63:0]wdata;

//-----------------------------wire---------------------------
wire[63:0] multiplier;
wire[63:0] multiplicator;
wire[127:0]comp;







//-----------------------------------------------------------------
//          TEST CODE
// ----------------------------------------------------------------

reg [127:0] mul_result ;

always@(posedge clk) begin
    if(gpr_mdu_mul_data_vld)
      mul_result <= gpr_mdu_mul_reg1_data * gpr_mdu_mul_reg2_data ;
end











//-----------------------------main code----------------------
assign multiplier   = gpr_mdu_mul_reg1_data;
assign multiplicator = gpr_mdu_mul_reg2_data;

//mdu_wb_div_fake_vld
always@(posedge clk or negedge rstn)begin
    if(rstn == 1'b0)begin
        mdu_wb_mul_fake_vld <= 1'b0;
    end
    else begin
        mdu_wb_mul_fake_vld <= gpr_mdu_mul_data_vld & ctrl_mdu_fake_gen_flag;
    end
end

//vld
always@(*)begin
    vld = gpr_mdu_mul_data_vld & ~ctrl_mdu_fake_gen_flag;
end

always@(posedge clk or negedge rstn)begin
    if(rstn == 1'b0)begin
        vld_1d <= 1'b0;
        vld_2d <= 1'b0;
        vld_3d <= 1'b0;
        vld_4d <= 1'b0;
    end
    else begin
        vld_1d <= vld;
        vld_2d <= vld_1d;
        vld_3d <= vld_2d;
        vld_4d <= vld_3d;
    end
end


assign mdu_wb_mul_vld = vld_4d;



//op
//instruction type
always@(*)begin
    op = de_mdu_mul_type;
end

always@(posedge clk)begin
    op_1d <= op;
end

always@(posedge clk)begin
    op_2d <= op_1d;
end

always@(posedge clk)begin
    op_3d <= op_2d;
end

always@(posedge clk)begin
    op_4d <= op_3d;
end


//complement--true form
   //a
always@(*)begin
    if(!multiplier[63] | op == MULHU)begin
        a = multiplier;
    end
    else begin
        a = ~(multiplier - 1'b1);
    end 
end
   //b
always@(*)begin
    if(!multiplicator[63] | op == MULHU | op == MULHSU)begin  
        b = multiplicator;
    end
    else begin
        b = ~(multiplicator - 1'b1);
    end
end

//sig
always@(*)begin
    if(op == MUL | op == MULH)begin
        if(multiplier[63]^multiplicator[63])begin
            sig = 1;
        end
        else begin
            sig = 0;
        end
    end
    else if(op == MULW)begin
        if(multiplier[63]^multiplicator[63])begin
            sig = 1;
        end
        else begin
            sig = 0;
        end
    end
    else if(op == MULHSU)begin
        sig = multiplier[63];
    end        
    else begin
        sig = 0;
    end
end

always@(posedge clk)begin
    sig_1d <= sig;
end

always@(posedge clk)begin
    sig_2d <= sig_1d;
end

always@(posedge clk)begin
    sig_3d <= sig_2d;
end

always@(posedge clk)begin
    sig_4d <= sig_3d;
end

//1st level dff
//split a,b
always@(posedge clk)begin
     if(vld)begin
        dff1_0a <= a[15:0];
        dff1_1a <= a[31:16];
        dff1_2a <= a[47:32];
        dff1_3a <= a[63:48];
        dff1_0b <= b[15:0];
        dff1_1b <= b[31:16];
        dff1_2b <= b[47:32];
        dff1_3b <= b[63:48];
    end
end

//mul 16*16
always@(*)begin     
    mul_0a0b = dff1_0a * dff1_0b;
    mul_1a1b = dff1_1a * dff1_1b;
    mul_0a1b = dff1_0a * dff1_1b;
    mul_1a0b = dff1_1a * dff1_0b;
    mul_0a2b = dff1_0a * dff1_2b;
    mul_2a0b = dff1_2a * dff1_0b;
    mul_1a2b = dff1_1a * dff1_2b;
    mul_2a1b = dff1_2a * dff1_1b;
    mul_0a3b = dff1_0a * dff1_3b;
    mul_3a0b = dff1_3a * dff1_0b;
    mul_1a3b = dff1_1a * dff1_3b;
    mul_3a1b = dff1_3a * dff1_1b;
    mul_2a3b = dff1_2a * dff1_3b;
    mul_3a2b = dff1_3a * dff1_2b;
    mul_2a2b = dff1_2a * dff1_2b;
    mul_3a3b = dff1_3a * dff1_3b;
end

//2st level dff
always@(posedge clk)begin
    if(vld_1d)begin
        dff2_0a0b <= mul_0a0b[15:0];
        dff2_2a2b <= mul_2a2b[15:0];
        dff2_ab <= {mul_1a1b,mul_0a0b[31:16]};
        dff2_op <= {mul_3a3b,mul_2a2b[31:16]};
        dff2_0a1b <= mul_0a1b;
        dff2_1a0b <= mul_1a0b;
        dff2_0a2b <= mul_0a2b;
        dff2_2a0b <= mul_2a0b;
        dff2_1a2b <= mul_1a2b;
        dff2_2a1b <= mul_2a1b;
        dff2_0a3b <= mul_0a3b;
        dff2_3a0b <= mul_3a0b;
        dff2_1a3b <= mul_1a3b;
        dff2_3a1b <= mul_3a1b;
        dff2_2a3b <= mul_2a3b;
        dff2_3a2b <= mul_3a2b;
    end
end

//1st level add
always@(*)begin
    add1_0a1b_1a0b = {1'b0,dff2_0a1b} + {1'b0,dff2_1a0b};
    add1_0a2b_2a0b = {1'b0,dff2_0a2b} + {1'b0,dff2_2a0b};
    add1_1a2b_2a1b = {1'b0,dff2_1a2b} + {1'b0,dff2_2a1b};
    add1_0a3b_3a0b = {1'b0,dff2_0a3b} + {1'b0,dff2_3a0b};
    add1_1a3b_3a1b = {1'b0,dff2_1a3b} + {1'b0,dff2_3a1b};
    add1_2a3b_3a2b = {1'b0,dff2_2a3b} + {1'b0,dff2_3a2b};
end

//2nd level add
always@(*)begin
    add2_ab_cd = {15'b0,add1_0a1b_1a0b} + dff2_ab;
    add2_ef_gh = {16'b0,add1_0a2b_2a0b[32:16]} + add1_1a2b_2a1b;
    add2_ij_kl = {16'b0,add1_0a3b_3a0b[32:16]} + add1_1a3b_3a1b;
    add2_mn_op = {15'b0,add1_2a3b_3a2b} + dff2_op;
end

//3rd level dff
always@(posedge clk)begin
    if(vld_2d)begin
        dff3_32_final <= {add2_ab_cd[15:0],dff2_0a0b};
        dff3_ab_cd  <= add2_ab_cd[47:16];
        dff3_ef_gh  <= {add2_ef_gh,add1_0a2b_2a0b[15:0]};
        dff3_ij_16_low <= add1_0a3b_3a0b[15:0];
        dff3_ij_kl  <= add2_ij_kl;
        dff3_mn_op  <= {add2_mn_op,dff2_2a2b};
    end
end

//3rd level add
always@(*)begin
    add3_x = dff3_ef_gh + {16'b0,dff3_ab_cd};
    add3_y = dff3_mn_op + {15'b0,dff3_ij_kl};
end


//4th level add
always@(*)begin
    add4_final = {add3_y,dff3_ij_16_low} + {47'b0,add3_x[48:16]};
end

//4th level dff
always@(posedge clk)begin
    if(vld_3d)begin
        dff_final <= {add4_final,add3_x[15:0],dff3_32_final};
    end
end

//true form-complement
assign comp = ~dff_final + 1'b1; //consider the result a negative number and make it a complement 

always@(*)begin
    if(op_4d == MUL)begin
        if(sig_4d)begin
            wdata = comp[63:0];
        end
        else begin
            wdata = dff_final[63:0];
        end
    end
    else if(op_4d == MULH)begin
        if(sig_4d)begin
            wdata = comp[127:64];
        end
        else begin
            wdata = dff_final[127:64];
        end
    end
    else if(op_4d == MULHU)begin
        wdata = dff_final[127:64];
    end
    else if(op_4d == MULHSU)begin
        if(sig_4d)begin
            wdata = comp[127:64];
        end
        else begin
            wdata = dff_final[127:64];
        end
    end
    else if(op_4d == MULW)begin
        if(sig_4d)begin
            wdata = {{32{comp[31]}},comp[31:0]};
        end
        else begin
            wdata = {{32{dff_final[31]}},dff_final[31:0]};
        end
    end
    else begin
        if(sig_4d)begin
            wdata = {32'b1,comp[31:0]};
        end
        else begin
            wdata = {32'b0,dff_final[31:0]};
        end
    end
end







assign mdu_wb_mul_wdata = wdata;

endmodule