//-----------------------------------------------------------------------------------
//
//-----------------------------------------------------------------------------------
//File          : wb.v
//Author        : fengyi
//Date          : 8/25/2021
//Version       : 0.1
//Description   : this file is write back module.
//-----------------------------------------------------------------------------------
//Modiication history:
//Date           By            Version           Change Description
//08/25/2021     fengyi        0.1               initial, real write back and
//                                               fake write back can be
//                                               claimed at the same time
//                                               
//                                               
//                                              
//-----------------------------------------------------------------------------------

module wb (
    input clk ,
    input rstn,

//with alu
    input           alu_wb_gpr_vld      , // alu instruction need write to gpr
    input    [63:0] alu_wb_gpr_wdata    , // writed back data from alu inst
    input           alu_wb_gpr_fake_vld , // alu's fake wb, just commit, not write back
    input           alu_wb_csr_vld      , // csr instruction need write to gpr
    input    [63:0] alu_wb_csr_wdata    , // writed back data from csr inst
    input           alu_wb_csr_fake_vld , // alu's fake wb, just commit, not write back
    input           alu_wb_load_fake_vld ,
    input           alu_wb_store_fake_vld,//

//with mdu   
    input           mdu_wb_mul_vld      , // mul instruction need write to gpr
    input    [63:0] mdu_wb_mul_wdata    , // writed back data from mul inst
    input           mdu_wb_mul_fake_vld , // mul's fake wb, just commit, not write back
    input           mdu_wb_div_vld      , // div instruction need write to gpr
    input    [63:0] mdu_wb_div_wdata    , // writed back data from div inst
    input           mdu_wb_div_fake_vld , // div's fake wb, just commit, not write back
//with lsu   
    input           lsu_wb_store_cmt_vld, // store ins, oitf store case
    input           lsu_wb_vld          , // ls instruction need write to gpr
    input    [63:0] lsu_wb_wdata        , // writed back data from ls inst
    input           lsu_wb_wen          , // ls instruction need write back
    input           lsu_wb_fake_vld     , // ls's fake wb, just commit, not write back
                                     
//with gpr                          
    output           wb_gpr_ena         , // gpr write enable signal
    output reg[63:0] wb_gpr_wdata       , // gpr write back data

//with csr
    output           wb_csr_ena         , // csr write enable signal
    output reg[63:0] wb_csr_wdata       , // csr write back data

//with control
    output           wb_ctrl_alu_stall  , // alu inst writing-back is waiting, please hold alu

//with oitf
    output           wb_oitf_store_cmt_vld ,
    output           wb_oitf_store_fake_vld,
    output reg       wb_oitf_alu_flag   , // alu inst writed back now
    output reg       wb_oitf_csr_flag   , // csr inst writed back now
    output reg       wb_oitf_mul_flag   , // mul inst writed back now
    output reg       wb_oitf_div_flag   , // div inst writed back now 
    output reg       wb_oitf_ls_flag    , // ls  inst writed back now
    output           wb_oitf_alu_fake   , // the alu inst writed back is fake
    output           wb_oitf_csr_fake   , // the csr inst writed back is fake
    output           wb_oitf_mul_fake   , // the mul inst writed back is fake
    output           wb_oitf_div_fake   , // the div inst writed back is fake
    output           wb_oitf_ls_fake    , // the ls  inst writed back is fake

//with ROB
    output           wb_rob_alu_gpr_vld        , // alu instruction need write to gpr
    output  [63:0]   wb_rob_alu_gpr_wdata      , // writed back data from alu inst
    output           wb_rob_alu_gpr_fake_vld   , // alu's fake wb, just commit, not write back
    output           wb_rob_alu_csr_vld        , // csr instruction need write to gpr
    output  [63:0]   wb_rob_alu_csr_wdata      , // writed back data from csr inst
    output           wb_rob_alu_csr_fake_vld   , // alu's fake wb, just commit, not write back
    output           wb_rob_load_fake_vld      ,
    output           wb_rob_store_fake_vld     , //
   //--MDU
    output           wb_rob_mul_vld            , // mul instruction need write to gpr
    output  [63:0]   wb_rob_mul_wdata          , // writed back data from mul inst
    output           wb_rob_mul_fake_vld       , // mul's fake wb, just commit, not write back
    output           wb_rob_div_vld            , // div instruction need write to gpr
    output  [63:0]   wb_rob_div_wdata          , // writed back data from div inst
    output           wb_rob_div_fake_vld       , // div's fake wb, just commit, not write back
   //--LSU 
    output           wb_rob_lsu_store_cmt_vld, // store ins, oitf store case
    output           wb_rob_lsu_vld            , // ls instruction need write to gpr
    output    [63:0] wb_rob_lsu_wdata          , // writed back data from ls inst
    output           wb_rob_lsu_wen              // ls instruction need write back

);

reg  alu_vld  ; // alu wite back need to wait, extent its real valid signal 
wire alu_vld_r; // final alu valid signal to write back

reg  csr_vld  ; // csr wite back need to wait, extent its real valid signal 
wire csr_vld_r; // final csr valid signal to write back

wire mul_vld_r; // final mul valid signal to write back
               // mul inst has the toppest priority. It never wait

reg div_vld  ; // div wite back need to wait, extent its real valid signal 
wire div_vld_r; // final div valid signal to write back

reg ls_vld   ; // ls  wite back need to wait, extent its real valid signal 
wire ls_vld_r ; // final ls valid signal to write back

//alu_vld_r
always@(posedge clk) begin
    if(alu_wb_gpr_vld && (mul_vld_r || div_vld_r || ls_vld_r)) begin
        alu_vld <= 1'b1;
    end
    else if(alu_wb_gpr_vld ==0 && (mul_vld_r || div_vld_r || ls_vld_r)==0) begin
        alu_vld <= 1'b0;
    end
end

assign alu_vld_r = alu_vld | alu_wb_gpr_vld;

//csr_vld_r
always@(posedge clk) begin
    if(alu_wb_csr_vld && (mul_vld_r || div_vld_r || ls_vld_r)) begin
        csr_vld <= 1'b1;
    end
    else if(mul_vld_r || div_vld_r || ls_vld_r==0) begin
        csr_vld <= 1'b0;
    end
end

assign csr_vld_r = csr_vld | alu_wb_csr_vld;

//mul_vld_r
assign mul_vld_r = mdu_wb_mul_vld;

//div_vld_r
always@(posedge clk) begin
    if(mdu_wb_div_vld && mul_vld_r) begin
        div_vld <= 1'b1;
    end
    else if(mul_vld_r ==0) begin
        div_vld <= 1'b0;
    end
end

assign div_vld_r = div_vld | mdu_wb_div_vld;

//ls_vld_r
always@(posedge clk) begin
    if(lsu_wb_vld && (mul_vld_r || div_vld_r)) begin
        ls_vld <= 1'b1;
    end
    else if(mul_vld_r || div_vld_r ==0) begin
        ls_vld <= 1'b0;
    end
end

assign ls_vld_r = ls_vld | lsu_wb_vld;

//arbitration process of write back
always@(*) begin
    if (mul_vld_r) begin
        wb_oitf_mul_flag    = 1'b1;
    end
    else begin
        wb_oitf_mul_flag    = 1'b0;
    end
end

always@(*) begin
    if (mul_vld_r == 0 && div_vld_r) begin
        wb_oitf_div_flag    = 1'b1;
    end
    else begin
        wb_oitf_div_flag    = 1'b0;
    end
end
        
always@(*) begin
    if (mul_vld_r == 0 && div_vld_r == 0 && ls_vld_r) begin
        wb_oitf_ls_flag     = 1'b1;
    end
    else begin
        wb_oitf_ls_flag     = 1'b0;
    end
end

always@(*) begin
    if (mul_vld_r == 0 && div_vld_r == 0 && ls_vld_r == 0 && csr_vld_r && alu_vld_r) begin
        wb_oitf_csr_flag    = 1'b1;
        wb_oitf_alu_flag    = 1'b1;            
    end
    else if (mul_vld_r == 0 && div_vld_r == 0 && ls_vld_r == 0 && csr_vld_r == 0 && alu_vld_r) begin
        wb_oitf_csr_flag    = 1'b0;
        wb_oitf_alu_flag    = 1'b1;            
    end
    else begin
        wb_oitf_csr_flag    = 1'b0;
        wb_oitf_alu_flag    = 1'b0;            
    end
end

assign  wb_oitf_store_cmt_vld  = lsu_wb_store_cmt_vld;
assign  wb_oitf_store_fake_vld = alu_wb_store_fake_vld;


always@(*) begin
    if(mul_vld_r) begin
        wb_gpr_wdata     = mdu_wb_mul_wdata ;
    end
    else if(mul_vld_r == 0 && div_vld_r) begin
        wb_gpr_wdata     = mdu_wb_div_wdata ;
    end
    else if(mul_vld_r == 0 && div_vld_r == 0 && ls_vld_r) begin 
        wb_gpr_wdata     = lsu_wb_wdata     ;
    end
    else if(mul_vld_r == 0 && div_vld_r == 0 && ls_vld_r == 0 && alu_vld_r) begin
        wb_gpr_wdata     = alu_wb_gpr_wdata ;
    end
    else begin
        wb_gpr_wdata     = 64'b0 ;
    end
end

always@(*) begin
    if(mul_vld_r == 0 && div_vld_r == 0 && ls_vld_r == 0 && csr_vld_r && alu_vld_r) begin
        wb_csr_wdata     = alu_wb_csr_wdata ;
    end
    else begin
        wb_csr_wdata     = 64'b0 ;
    end
end

assign wb_gpr_ena = alu_vld_r || mul_vld_r || div_vld_r || (ls_vld_r && lsu_wb_wen);
assign wb_csr_ena = !mul_vld_r && !div_vld_r && !ls_vld_r && csr_vld_r && alu_vld_r;

//fake write back 
assign wb_oitf_alu_fake = alu_wb_gpr_fake_vld;
assign wb_oitf_csr_fake = alu_wb_csr_fake_vld;
assign wb_oitf_mul_fake = mdu_wb_mul_fake_vld;
assign wb_oitf_div_fake = mdu_wb_div_fake_vld;
//assign wb_oitf_ls_fake  = lsu_wb_fake_vld    ;
assign wb_oitf_ls_fake  = alu_wb_load_fake_vld    ;


//stall signal when alu inst being held
assign wb_ctrl_alu_stall = alu_vld_r && (mul_vld_r || div_vld_r || ls_vld_r);



//WITH ROB
assign   wb_rob_alu_gpr_vld       =  alu_wb_gpr_vld         ;
assign   wb_rob_alu_gpr_wdata     =  alu_wb_gpr_wdata       ;
assign   wb_rob_alu_gpr_fake_vld  =  alu_wb_gpr_fake_vld    ;
assign   wb_rob_alu_csr_vld       =  alu_wb_csr_vld         ;
assign   wb_rob_alu_csr_wdata     =  alu_wb_csr_wdata       ;
assign   wb_rob_alu_csr_fake_vld  =  alu_wb_csr_fake_vld    ;
assign   wb_rob_load_fake_vld     =  alu_wb_load_fake_vld   ; 
assign   wb_rob_store_fake_vld    =  alu_wb_store_fake_vld  ;

assign   wb_rob_mul_vld           =  mdu_wb_mul_vld         ;
assign   wb_rob_mul_wdata         =  mdu_wb_mul_wdata       ;
assign   wb_rob_mul_fake_vld      =  mdu_wb_mul_fake_vld    ;
assign   wb_rob_div_vld           =  mdu_wb_div_vld         ;
assign   wb_rob_div_wdata         =  mdu_wb_div_wdata       ;
assign   wb_rob_div_fake_vld      =  mdu_wb_div_fake_vld    ;

assign   wb_rob_lsu_store_cmt_vld   =  lsu_wb_store_cmt_vld ; 
assign   wb_rob_lsu_vld             =  lsu_wb_vld           ; 
assign   wb_rob_lsu_wdata           =  lsu_wb_wdata         ; 
assign   wb_rob_lsu_wen             =  lsu_wb_wen           ; 

endmodule


