//-----------------------------------------------------------------------------
//This confidential and proprietary software may be used only used as
//by a licensing aggrement from Orbbec Inc.
//In the event of publication ,the following notice is applicable:
//(C)COPYRIGHT 2013 ORBBEC INC.ALL RIGHTS RESERVED.
//The entire notice ablove must be reproduced on all authorized copies
//-----------------------------------------------------------------------------
//File          :gpr.v
//Author        :lihua
//Date          :08/25/2021
//Version       :0.1
//Description   :This file is a gpr module for risc-v 
//-----------------------------------------------------------------------------
//Modification History:
//Date          By          Version         Change Description 
//08/25/2021    lihua        0.1             Original
//-----------------------------------------------------------------------------
module gpr #(
    parameter  DW      = 64 ,
    parameter  IDX_DW  = 5  
)(
    input                          clk                   ,       //system clock 
    input                          rstn                  ,       //system rstn

//WITH DE
    input                          de_gpr_rs1_rvld       ,       //read  rs1 vld
    input          [IDX_DW-1:0]    de_gpr_rs1_addr       ,       //register1 address
    input                          de_gpr_rs2_rvld       ,       //read  rs2 vld
    input          [IDX_DW-1:0]    de_gpr_rs2_addr       ,       //register2 address    
    input                          de_gpr_mdu_flag       ,       //indicate mdu or alu
    input                          de_gpr_div_flag       ,       //indicate div or mul
//WITH WB
    input                          wb_gpr_ena            ,
    input          [DW-1:0]        wb_gpr_wdata          ,       //write rd register data
//WITH OITF
    input          [IDX_DW-1:0]    oitf_gpr_index        ,       //write rd register address
    
//WITH ALU
    output  reg                    gpr_alu_data_vld      ,
    output  reg    [DW-1:0]        gpr_alu_reg1_data     ,
    output  reg    [DW-1:0]        gpr_alu_reg2_data     ,
//WITH MDU
    output  reg                    gpr_mdu_mul_data_vld  ,
    output  reg    [DW-1:0]        gpr_mdu_mul_reg1_data ,
    output  reg    [DW-1:0]        gpr_mdu_mul_reg2_data ,
    output  reg                    gpr_mdu_div_data_vld  ,
    output  reg    [DW-1:0]        gpr_mdu_div_reg1_data ,
    output  reg    [DW-1:0]        gpr_mdu_div_reg2_data ,
//WITH ROB/CHECKER
    output         [DW-1:0]        x0                    ,  
    output         [DW-1:0]        x1                    ,  
    output         [DW-1:0]        x2                    ,  
    output         [DW-1:0]        x3                    ,  
    output         [DW-1:0]        x4                    ,  
    output         [DW-1:0]        x5                    ,  
    output         [DW-1:0]        x6                    ,  
    output         [DW-1:0]        x7                    ,  
    output         [DW-1:0]        x8                    ,  
    output         [DW-1:0]        x9                    ,  
    output         [DW-1:0]        x10                   ,  
    output         [DW-1:0]        x11                   ,  
    output         [DW-1:0]        x12                   ,  
    output         [DW-1:0]        x13                   ,  
    output         [DW-1:0]        x14                   ,  
    output         [DW-1:0]        x15                   ,  
    output         [DW-1:0]        x16                   ,  
    output         [DW-1:0]        x17                   ,  
    output         [DW-1:0]        x18                   ,  
    output         [DW-1:0]        x19                   ,  
    output         [DW-1:0]        x20                   ,  
    output         [DW-1:0]        x21                   ,  
    output         [DW-1:0]        x22                   ,  
    output         [DW-1:0]        x23                   ,  
    output         [DW-1:0]        x24                   ,  
    output         [DW-1:0]        x25                   ,  
    output         [DW-1:0]        x26                   ,  
    output         [DW-1:0]        x27                   ,  
    output         [DW-1:0]        x28                   ,  
    output         [DW-1:0]        x29                   ,  
    output         [DW-1:0]        x30                   ,  
    output         [DW-1:0]        x31                     

);

localparam ADR_REG_0      = 5'd0 ;
localparam ADR_REG_1      = 5'd1 ;
localparam ADR_REG_2      = 5'd2 ;
localparam ADR_REG_3      = 5'd3 ;
localparam ADR_REG_4      = 5'd4 ;
localparam ADR_REG_5      = 5'd5 ;
localparam ADR_REG_6      = 5'd6 ;
localparam ADR_REG_7      = 5'd7 ;
localparam ADR_REG_8      = 5'd8 ;
localparam ADR_REG_9      = 5'd9 ;
localparam ADR_REG_10     = 5'd10;
localparam ADR_REG_11     = 5'd11;
localparam ADR_REG_12     = 5'd12;
localparam ADR_REG_13     = 5'd13;
localparam ADR_REG_14     = 5'd14;
localparam ADR_REG_15     = 5'd15;
localparam ADR_REG_16     = 5'd16;
localparam ADR_REG_17     = 5'd17;
localparam ADR_REG_18     = 5'd18;
localparam ADR_REG_19     = 5'd19;
localparam ADR_REG_20     = 5'd20;
localparam ADR_REG_21     = 5'd21;
localparam ADR_REG_22     = 5'd22;
localparam ADR_REG_23     = 5'd23;
localparam ADR_REG_24     = 5'd24;
localparam ADR_REG_25     = 5'd25;
localparam ADR_REG_26     = 5'd26;
localparam ADR_REG_27     = 5'd27;
localparam ADR_REG_28     = 5'd28;
localparam ADR_REG_29     = 5'd29;
localparam ADR_REG_30     = 5'd30;
localparam ADR_REG_31     = 5'd31;

wire [DW-1:0]  gpr_x0_reg  ;
reg  [DW-1:0]  gpr_x1_reg  ;
reg  [DW-1:0]  gpr_x2_reg  ;
reg  [DW-1:0]  gpr_x3_reg  ;
reg  [DW-1:0]  gpr_x4_reg  ;
reg  [DW-1:0]  gpr_x5_reg  ;
reg  [DW-1:0]  gpr_x6_reg  ;
reg  [DW-1:0]  gpr_x7_reg  ;
reg  [DW-1:0]  gpr_x8_reg  ;
reg  [DW-1:0]  gpr_x9_reg  ;
reg  [DW-1:0]  gpr_x10_reg ;
reg  [DW-1:0]  gpr_x11_reg ;
reg  [DW-1:0]  gpr_x12_reg ;
reg  [DW-1:0]  gpr_x13_reg ;
reg  [DW-1:0]  gpr_x14_reg ;
reg  [DW-1:0]  gpr_x15_reg ;
reg  [DW-1:0]  gpr_x16_reg ;
reg  [DW-1:0]  gpr_x17_reg ;
reg  [DW-1:0]  gpr_x18_reg ;
reg  [DW-1:0]  gpr_x19_reg ;
reg  [DW-1:0]  gpr_x20_reg ;
reg  [DW-1:0]  gpr_x21_reg ;
reg  [DW-1:0]  gpr_x22_reg ;
reg  [DW-1:0]  gpr_x23_reg ;
reg  [DW-1:0]  gpr_x24_reg ;
reg  [DW-1:0]  gpr_x25_reg ;
reg  [DW-1:0]  gpr_x26_reg ;
reg  [DW-1:0]  gpr_x27_reg ;
reg  [DW-1:0]  gpr_x28_reg ;
reg  [DW-1:0]  gpr_x29_reg ;
reg  [DW-1:0]  gpr_x30_reg ;
reg  [DW-1:0]  gpr_x31_reg ;

reg  [DW-1:0]  rs1_data    ;
reg  [DW-1:0]  rs2_data    ;



///////////////////////////////////////////
// CHECKER
assign x0  =  gpr_x0_reg ;
assign x1  =  gpr_x1_reg ;
assign x2  =  gpr_x2_reg ;
assign x3  =  gpr_x3_reg ;
assign x4  =  gpr_x4_reg ;
assign x5  =  gpr_x5_reg ;
assign x6  =  gpr_x6_reg ;
assign x7  =  gpr_x7_reg ;
assign x8  =  gpr_x8_reg ;
assign x9  =  gpr_x9_reg ;
assign x10 =  gpr_x10_reg ;
assign x11 =  gpr_x11_reg ;
assign x12 =  gpr_x12_reg ;
assign x13 =  gpr_x13_reg ;
assign x14 =  gpr_x14_reg ;
assign x15 =  gpr_x15_reg ;
assign x16 =  gpr_x16_reg ;
assign x17 =  gpr_x17_reg ;
assign x18 =  gpr_x18_reg ;
assign x19 =  gpr_x19_reg ;
assign x20 =  gpr_x20_reg ;
assign x21 =  gpr_x21_reg ;
assign x22 =  gpr_x22_reg ;
assign x23 =  gpr_x23_reg ;
assign x24 =  gpr_x24_reg ;
assign x25 =  gpr_x25_reg ;
assign x26 =  gpr_x26_reg ;
assign x27 =  gpr_x27_reg ;
assign x28 =  gpr_x28_reg ;
assign x29 =  gpr_x29_reg ;
assign x30 =  gpr_x30_reg ;
assign x31 =  gpr_x31_reg ;


//write
assign  gpr_x0_reg = {DW{1'b0}};


always @ (posedge clk ) begin
    if (wb_gpr_ena == 1'b1) begin
        case (oitf_gpr_index)
            ADR_REG_1     :    gpr_x1_reg  <= wb_gpr_wdata;
            ADR_REG_2     :    gpr_x2_reg  <= wb_gpr_wdata;
            ADR_REG_3     :    gpr_x3_reg  <= wb_gpr_wdata;
            ADR_REG_4     :    gpr_x4_reg  <= wb_gpr_wdata;
            ADR_REG_5     :    gpr_x5_reg  <= wb_gpr_wdata;
            ADR_REG_6     :    gpr_x6_reg  <= wb_gpr_wdata;
            ADR_REG_7     :    gpr_x7_reg  <= wb_gpr_wdata;
            ADR_REG_8     :    gpr_x8_reg  <= wb_gpr_wdata;
            ADR_REG_9     :    gpr_x9_reg  <= wb_gpr_wdata;
            ADR_REG_10    :    gpr_x10_reg <= wb_gpr_wdata;
            ADR_REG_11    :    gpr_x11_reg <= wb_gpr_wdata;
            ADR_REG_12    :    gpr_x12_reg <= wb_gpr_wdata;
            ADR_REG_13    :    gpr_x13_reg <= wb_gpr_wdata;
            ADR_REG_14    :    gpr_x14_reg <= wb_gpr_wdata;
            ADR_REG_15    :    gpr_x15_reg <= wb_gpr_wdata;
            ADR_REG_16    :    gpr_x16_reg <= wb_gpr_wdata;
            ADR_REG_17    :    gpr_x17_reg <= wb_gpr_wdata;
            ADR_REG_18    :    gpr_x18_reg <= wb_gpr_wdata;
            ADR_REG_19    :    gpr_x19_reg <= wb_gpr_wdata;
            ADR_REG_20    :    gpr_x20_reg <= wb_gpr_wdata;
            ADR_REG_21    :    gpr_x21_reg <= wb_gpr_wdata;
            ADR_REG_22    :    gpr_x22_reg <= wb_gpr_wdata;
            ADR_REG_23    :    gpr_x23_reg <= wb_gpr_wdata;
            ADR_REG_24    :    gpr_x24_reg <= wb_gpr_wdata;
            ADR_REG_25    :    gpr_x25_reg <= wb_gpr_wdata;
            ADR_REG_26    :    gpr_x26_reg <= wb_gpr_wdata;
            ADR_REG_27    :    gpr_x27_reg <= wb_gpr_wdata;
            ADR_REG_28    :    gpr_x28_reg <= wb_gpr_wdata;
            ADR_REG_29    :    gpr_x29_reg <= wb_gpr_wdata;
            ADR_REG_30    :    gpr_x30_reg <= wb_gpr_wdata;
            ADR_REG_31    :    gpr_x31_reg <= wb_gpr_wdata;
            default       : ;
        endcase
    end
end

// read rs1 data
always @ (posedge clk) begin
    if (de_gpr_rs1_rvld == 1'b1) begin
        case (de_gpr_rs1_addr)
            ADR_REG_0     :  rs1_data   <= gpr_x0_reg ;
            ADR_REG_1     :  rs1_data   <= gpr_x1_reg ;
            ADR_REG_2     :  rs1_data   <= gpr_x2_reg ;
            ADR_REG_3     :  rs1_data   <= gpr_x3_reg ;
            ADR_REG_4     :  rs1_data   <= gpr_x4_reg ;
            ADR_REG_5     :  rs1_data   <= gpr_x5_reg ;
            ADR_REG_6     :  rs1_data   <= gpr_x6_reg ;
            ADR_REG_7     :  rs1_data   <= gpr_x7_reg ;
            ADR_REG_8     :  rs1_data   <= gpr_x8_reg ;
            ADR_REG_9     :  rs1_data   <= gpr_x9_reg ;
            ADR_REG_10    :  rs1_data   <= gpr_x10_reg;
            ADR_REG_11    :  rs1_data   <= gpr_x11_reg;
            ADR_REG_12    :  rs1_data   <= gpr_x12_reg;
            ADR_REG_13    :  rs1_data   <= gpr_x13_reg;
            ADR_REG_14    :  rs1_data   <= gpr_x14_reg;
            ADR_REG_15    :  rs1_data   <= gpr_x15_reg;
            ADR_REG_16    :  rs1_data   <= gpr_x16_reg;
            ADR_REG_17    :  rs1_data   <= gpr_x17_reg;
            ADR_REG_18    :  rs1_data   <= gpr_x18_reg;
            ADR_REG_19    :  rs1_data   <= gpr_x19_reg;
            ADR_REG_20    :  rs1_data   <= gpr_x20_reg;
            ADR_REG_21    :  rs1_data   <= gpr_x21_reg;
            ADR_REG_22    :  rs1_data   <= gpr_x22_reg;
            ADR_REG_23    :  rs1_data   <= gpr_x23_reg;
            ADR_REG_24    :  rs1_data   <= gpr_x24_reg;
            ADR_REG_25    :  rs1_data   <= gpr_x25_reg;
            ADR_REG_26    :  rs1_data   <= gpr_x26_reg;
            ADR_REG_27    :  rs1_data   <= gpr_x27_reg;
            ADR_REG_28    :  rs1_data   <= gpr_x28_reg;
            ADR_REG_29    :  rs1_data   <= gpr_x29_reg;
            ADR_REG_30    :  rs1_data   <= gpr_x30_reg;
            ADR_REG_31    :  rs1_data   <= gpr_x31_reg;
            default       : ;
        endcase
    end
end

//read rs2_data
always @ (posedge clk) begin
    if (de_gpr_rs2_rvld == 1'b1) begin
        case (de_gpr_rs2_addr)
            ADR_REG_0     :  rs2_data   <= gpr_x0_reg ;
            ADR_REG_1     :  rs2_data   <= gpr_x1_reg ;
            ADR_REG_2     :  rs2_data   <= gpr_x2_reg ;
            ADR_REG_3     :  rs2_data   <= gpr_x3_reg ;
            ADR_REG_4     :  rs2_data   <= gpr_x4_reg ;
            ADR_REG_5     :  rs2_data   <= gpr_x5_reg ;
            ADR_REG_6     :  rs2_data   <= gpr_x6_reg ;
            ADR_REG_7     :  rs2_data   <= gpr_x7_reg ;
            ADR_REG_8     :  rs2_data   <= gpr_x8_reg ;
            ADR_REG_9     :  rs2_data   <= gpr_x9_reg ;
            ADR_REG_10    :  rs2_data   <= gpr_x10_reg;
            ADR_REG_11    :  rs2_data   <= gpr_x11_reg;
            ADR_REG_12    :  rs2_data   <= gpr_x12_reg;
            ADR_REG_13    :  rs2_data   <= gpr_x13_reg;
            ADR_REG_14    :  rs2_data   <= gpr_x14_reg;
            ADR_REG_15    :  rs2_data   <= gpr_x15_reg;
            ADR_REG_16    :  rs2_data   <= gpr_x16_reg;
            ADR_REG_17    :  rs2_data   <= gpr_x17_reg;
            ADR_REG_18    :  rs2_data   <= gpr_x18_reg;
            ADR_REG_19    :  rs2_data   <= gpr_x19_reg;
            ADR_REG_20    :  rs2_data   <= gpr_x20_reg;
            ADR_REG_21    :  rs2_data   <= gpr_x21_reg;
            ADR_REG_22    :  rs2_data   <= gpr_x22_reg;
            ADR_REG_23    :  rs2_data   <= gpr_x23_reg;
            ADR_REG_24    :  rs2_data   <= gpr_x24_reg;
            ADR_REG_25    :  rs2_data   <= gpr_x25_reg;
            ADR_REG_26    :  rs2_data   <= gpr_x26_reg;
            ADR_REG_27    :  rs2_data   <= gpr_x27_reg;
            ADR_REG_28    :  rs2_data   <= gpr_x28_reg;
            ADR_REG_29    :  rs2_data   <= gpr_x29_reg;
            ADR_REG_30    :  rs2_data   <= gpr_x30_reg;
            ADR_REG_31    :  rs2_data   <= gpr_x31_reg;
            default       : ;
        endcase
    end
end


//to ALU
always@(posedge clk or negedge rstn)begin                           
    if(rstn == 1'b0)begin                                           
        gpr_alu_data_vld <= 1'b0;                                         
    end                                                  
    else begin                                          
        gpr_alu_data_vld <= (~de_gpr_mdu_flag) & de_gpr_rs1_rvld ;                                         
    end
end
  
always@(*)begin
    gpr_alu_reg1_data  = rs1_data;
    gpr_alu_reg2_data  = rs2_data;
end

//to MUL
always@(posedge clk or negedge rstn)begin                       
    if(rstn == 1'b0)begin                                      
        gpr_mdu_mul_data_vld <= 1'b0;                                         
    end                                                       
    else begin                                                
        gpr_mdu_mul_data_vld <= de_gpr_mdu_flag & (~de_gpr_div_flag) & de_gpr_rs1_rvld ;                                         
    end
end

always@(*)begin
    if(gpr_mdu_mul_data_vld == 1'b1)begin
        gpr_mdu_mul_reg1_data = rs1_data;
        gpr_mdu_mul_reg2_data = rs2_data;
    end
    else begin
        gpr_mdu_mul_reg1_data = {DW{1'b0}};
        gpr_mdu_mul_reg2_data = {DW{1'b0}};
    end
end

//TO DIV
always@(posedge clk or negedge rstn)begin                       
    if(rstn == 1'b0)begin                                      
        gpr_mdu_div_data_vld <= 1'b0;                                         
    end                                                       
    else begin                                                
        gpr_mdu_div_data_vld <= de_gpr_mdu_flag & de_gpr_div_flag & de_gpr_rs1_rvld ;                                         
    end
end

always@(*)begin
    if(gpr_mdu_div_data_vld == 1'b1)begin
        gpr_mdu_div_reg1_data = rs1_data;
        gpr_mdu_div_reg2_data = rs2_data;
    end
    else begin
        gpr_mdu_div_reg1_data = {DW{1'b0}};
        gpr_mdu_div_reg2_data = {DW{1'b0}};
    end
end






endmodule   
