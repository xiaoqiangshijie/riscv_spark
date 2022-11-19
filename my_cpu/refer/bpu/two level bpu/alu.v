//-----------------------------------------------------------------------------
//This confidential and proprietary software may be used only used as
//by a licensing aggrement from Orbbec Inc.
//In the event of publication ,the following notice is applicable:
//(C)COPYRIGHT 2013 ORBBEC INC.ALL RIGHTS RESERVED.
//The entire notice ablove must be reproduced on all authorized copies
//-----------------------------------------------------------------------------
//File          :alu.v
//Author        :yingzheng
//Date          :2021/8/26
//Version       :0.1
//Description   :This file is a logic and arithmetic module of risc-v
//-----------------------------------------------------------------------------
//Modification History:
//Date          By          Version         Change Description 
//2021/8/26    yingzheng        0.1             Original
//-----------------------------------------------------------------------------            
module alu
#(
  parameter   PC_WIDTH    = 64 ,
  parameter   DATA_WIDTH  = 64 ,
  parameter   ADDR_WIDTH  = 64 ,
  parameter   SHIFT_WIDTH = 7  
   
)(
//WITH TOP
  input                       clk                          ,
  input                       rstn                         ,

//WITH CONTROL
  input                       ctrl_alu_flush               ,
  output                      alu_ctrl_jump_en             ,
  output                      alu_ctrl_fence_i             ,
  input                       ctrl_alu_stall               ,

//WITH BYPASS
  input    [DATA_WIDTH-1:0]   bypass_alu_rs1_data          ,
  input    [DATA_WIDTH-1:0]   bypass_alu_rs2_data          ,
  input    [DATA_WIDTH-1:0]   bypass_alu_csr_data          ,
  output                      alu_bypass_vld               ,
  output   [DATA_WIDTH-1:0]   alu_bypass_data              ,
  output   [           4:0]   alu_bypass_rd_idx            ,
  output                      alu_bypass_vld_1d            ,
  output   [DATA_WIDTH-1:0]   alu_bypass_data_1d           ,
  output   [           4:0]   alu_bypass_rd_idx_1d         ,

//WITH DE
  input    [PC_WIDTH  -1:0]   de_alu_pc                    ,
  input    [PC_WIDTH  -1:0]   de_alu_npc                   ,
  input                       de_alu_inst_vld              ,
  input                       de_alu_wb_vld                ,
  input                       de_alu_reg2_flag             ,//1 is reg2_data,0 is alu_imm
  input                       de_alu_lui_flag              ,//1 represents lui operation is valid 
  input                       de_alu_shift_flag            ,//1 represents shift operation is valid 
  input                       de_alu_shift_right_flag      ,//1 represents shift right,0 represents shift left
  input                       de_alu_shift_logic_flag      ,//1 represents logic shift,0 represents arithmetic shift
  input                       de_alu_iw_en_flag            ,//1 represents add and sub truncation operation is valid
  input    [           1:0]   de_alu_comp_flag             ,//1 represents unsigned comparison operation is valid
  input                       de_alu_and_flag              ,//1 represents and operation is valid 
  input                       de_alu_or_flag               ,//1 represents or operation is valid 
  input                       de_alu_xor_flag              ,//1 represents xor operation is valid 
  input                       de_alu_adder_flag            ,//1 represents addition operation is valid 
  input                       de_alu_sub_flag              ,//1 represents subtraction 
  input                       de_alu_auipc_flag            ,//1 represents  auipc operation is valid 
  input    [           3:0]   de_alu_ls_type               ,//0001~1011 is valid
  input    [DATA_WIDTH-1:0]   de_alu_imm                   ,//immediate data
  input    [           2:0]   de_alu_con_jmp_type          ,        
  input    [           1:0]   de_alu_ucon_jmp_type         ,// 00 is invalid ,jal 01 ,jalr 10;
  input    [           2:0]   de_alu_csr_type              ,// 000 is invalid
  input    [           1:0]   de_alu_fence_type            ,
  input    [           4:0]   de_alu_rd_idx                ,
  input    [          11:0]   de_alu_csr_idx               ,
  input    [           2:0]   de_alu_predict_jmp_type      ,

//WITH WB
  output                      alu_wb_gpr_vld               ,
  output reg [DATA_WIDTH-1:0] alu_wb_gpr_wdata             ,
  output wire[           4:0] alu_wb_gpr_rd_idx            , 
  output                      alu_wb_csr_vld               ,
  output reg [DATA_WIDTH-1:0] alu_wb_csr_wdata             ,
  output reg [          11:0] alu_wb_csr_rd_idx            , 

//WITH LSU                    
  output                      alu_lsu_vld                  , 
  output   [ADDR_WIDTH-1:0]   alu_lsu_addr                 ,
  output   [DATA_WIDTH-1:0]   alu_lsu_wdata                ,
  output   [           3:0]   alu_lsu_ls_type              ,
  output                      alu_lsu_wen                  ,
  output   [           4:0]   alu_lsu_rd_idx               ,

//WITH IFU
  output   [PC_WIDTH  -1:0]   alu_ifu_pc                   ,
  output                      alu_ifu_pc_vld               ,

//WITH BPU
  output                      alu_bpu_wr_req               ,  //BTB write req
  output   [           2:0]   alu_bpu_wr_type              ,  //BTB write type
  output   [PC_WIDTH  -1:0]   alu_bpu_wr_pc                ,  //BTB write addr
  output                      alu_bpu_wr_predict_taken     ,  //BTB write taken
  output   [PC_WIDTH  -1:0]   alu_bpu_wr_predict_pc        ,  //BTB write predict_pc
  output                      alu_bpu_jump_en              ,  //BTB control jump

//WITH  ROB
  output                      alu_rob_alu_flush            ,
  output                      alu_rob_load_flush           ,
  output                      alu_rob_csr_flush            ,
  output                      alu_rob_special_cmt          ,
//WITH OITF
  output                      alu_oitf_csr_cmt_flag        ,
  output                      alu_oitf_csr_flush_flag      ,
  output                      alu_oitf_load_flush_flag     ,

//WITH INT
  output                      alu_int_vld                  ,
  output   [PC_WIDTH  -1:0]   alu_int_pc                   ,
  output                      alu_int_beq                  ,
  output reg                  alu_int_l_misa               ,
  output reg                  alu_int_s_misa               ,  
  output   [ADDR_WIDTH-1:0]   alu_int_ls_addr              
);

// -----------LOCAL PARAMETER ---------------------------
//csr
localparam   CSRRW   =   3'd1  ;
localparam   CSRRS   =   3'd2  ;
localparam   CSRRC   =   3'd3  ;
localparam   CSRRWI  =   3'd4  ;
localparam   CSRRSI  =   3'd5  ;
localparam   CSRRCI  =   3'd6  ;
//load store
localparam   LB      =   4'h1  ;
localparam   LBU     =   4'h2  ;
localparam   LH      =   4'h3  ;
localparam   LHU     =   4'h4  ;
localparam   LW      =   4'h5  ;
localparam   LWU     =   4'h6  ;
localparam   LD      =   4'h7  ;
localparam   SB      =   4'h8  ;
localparam   SH      =   4'h9  ;
localparam   SW      =   4'ha  ;
localparam   SD      =   4'hb  ;

//branch
localparam   BEQ     =   3'h1  ;
localparam   BNE     =   3'h2  ;
localparam   BLT     =   3'h3  ;
localparam   BGE     =   3'h4  ;
localparam   BLTU    =   3'h5  ;
localparam   BGEU    =   3'h6  ;

//ucon_jump
localparam   JAL     =   2'h1  ;
localparam   JALR    =   2'h2  ;

//fence
localparam   FENCE   =   2'h1  ;
localparam   FENCE_I =   2'h2  ;



// ------------- WIRE ---------------------------------------
wire                         alu_real_valid       ;
wire                         alu_wb_real_valid    ;
wire    [DATA_WIDTH-1:0]     logic_1op            ;
wire    [DATA_WIDTH-1:0]     logic_2op            ;
wire    [DATA_WIDTH-1:0]     and_result           ;//and
wire    [DATA_WIDTH-1:0]     or_result            ;//or
wire    [DATA_WIDTH-1:0]     xor_result           ;//xor
wire                         csr_en               ;
wire                         ls_flag              ;
wire    [DATA_WIDTH-1:0]     ls_operation1        ;
wire    [DATA_WIDTH-1:0]     ls_operation2        ;
wire                         jump_beq             ;
wire                         jump_bne             ;
wire                         jump_bltu            ;
wire                         jump_bgeu            ; 
wire                         jump_blt             ; 
wire                         jump_bge             ;  
wire    [DATA_WIDTH-1:0]     con_jmp_operation1   ;
wire    [DATA_WIDTH-1:0]     con_jmp_operation2   ;
wire                         ucon_jmp_flag        ;
wire                         con_jmp_flag         ;
wire                         jump_inst_flag       ;
wire    [DATA_WIDTH-1:0]     ucon_jmp_operation1  ;
wire    [DATA_WIDTH-1:0]     ucon_jmp_operation2  ;
wire    [DATA_WIDTH-1:0]     add_operation1       ;
wire    [DATA_WIDTH-1:0]     add_operation2       ;
wire    [DATA_WIDTH-1:0]     sub_operation1       ;
wire    [DATA_WIDTH-1:0]     sub_operation2       ;
wire                         comp_flag            ;
wire    [DATA_WIDTH-1:0]     comp_operation1      ;
wire    [DATA_WIDTH-1:0]     comp_operation2      ;
wire                         real_add_flag        ;
wire                         add_sub              ;
wire    [DATA_WIDTH  :0]     sum                  ;
wire                         ls_misa              ;
wire                         alu_int_beq_temp     ;

// ------------  REG  ---------------------------------------
reg     [DATA_WIDTH-1:0]     logic_result         ;//three of one result
reg                          csr_wvld             ;
reg     [DATA_WIDTH-1:0]     csr_wdata            ;
reg                          jump                 ;
reg     [DATA_WIDTH-1:0]     shifter_result       ;
reg                          ctrl_jump_en         ;
reg                          ctrl_fence_i_en      ;
reg     [DATA_WIDTH-1:0]     op1                  ;
reg     [DATA_WIDTH-1:0]     op2                  ;
reg     [DATA_WIDTH-1:0]     arith_result         ;
reg                          co                   ;
reg     [           1:0]     ls_size              ;
reg     [DATA_WIDTH-1:0]     alu_wb_data          ;
reg                          gpr_vld              ;
reg                          special_cmt          ;
reg     [DATA_WIDTH-1:0]     wb_data              ;
reg                          alu_vld_extend       ;
reg                          jump_state           ;
reg     [PC_WIDTH  -1:0]     jump_pc              ;  

//------------SIGNED -------------------------------------------
wire signed [DATA_WIDTH-1:0] shifter_operation1   ;
reg  signed [           5:0] shifter_operation2   ;


//----------------------- REAL     VALID ------------------------------
//---------------------generate real_valid-----------------------------
//---------------------------------------------------------------------

//gen real vld
//extend vld
always @(posedge clk or negedge rstn) begin
  if(!rstn)
    alu_vld_extend <= 1'b0 ;
  else if( de_alu_inst_vld & ctrl_alu_stall )
    alu_vld_extend <= 1'b1 ;
  else if( !ctrl_alu_stall)begin
    alu_vld_extend <= 1'b0 ;
  end
end

assign alu_real_valid    = ( de_alu_inst_vld | alu_vld_extend) & (!ctrl_alu_stall)  &(!ctrl_alu_flush);
assign alu_wb_real_valid =  de_alu_wb_vld   & (!ctrl_alu_flush) ; 




//-----------------------LOGIC OPERATION ------------------------------
//----------RELATED TO: OR ORI XOR XORI AND ANDI ----------------------
//---------------------------------------------------------------------

//STEP 1 :choose operation from reg2_data and de_alu_imm
assign logic_1op = bypass_alu_rs1_data ;
assign logic_2op = de_alu_reg2_flag ? bypass_alu_rs2_data : de_alu_imm ;


//STEP 2: and,or,xor operation
assign  and_result = logic_1op & logic_2op ;
assign  or_result  = logic_1op | logic_2op ;
assign  xor_result = logic_1op ^ logic_2op ;

always@(*)begin:CHOOSE_LOGIC_RESULT              //only one flag is valid at the same time 
  if(de_alu_and_flag == 1'b1)
    logic_result = and_result                   ;
  else if(de_alu_or_flag == 1'b1)
    logic_result = or_result                    ;
  else if(de_alu_xor_flag == 1'b1)
    logic_result = xor_result                   ;
  else 
    logic_result = {DATA_WIDTH{1'b0}}           ;
end 


//---------------------CSR OPERATION -----------------------------------
//---------RELATED TO :RW RS RC RWI RSI RCI ----------------------------
//----------------------------------------------------------------------

//STEP 1 :csr operation

//STEP 2 :output csr_data_vld
assign  csr_en =  | de_alu_csr_type  ;

always @(posedge clk or negedge rstn) begin
  if(!rstn) 
    csr_wvld <= 1'b0 ;
  else if(csr_en & alu_real_valid)
    csr_wvld <= 1'b1 ;
  else
    csr_wvld <= 1'b0 ;
end

assign alu_wb_csr_vld = csr_wvld ;
  
//STEP 3 :output csr_data 
  
always @(*) begin
  case(de_alu_csr_type)
    CSRRW : csr_wdata = bypass_alu_rs1_data ;
    CSRRS : csr_wdata = bypass_alu_csr_data | bypass_alu_rs1_data ;
    CSRRC : csr_wdata = bypass_alu_csr_data & (~ bypass_alu_rs1_data) ;
    CSRRWI: csr_wdata = de_alu_imm ;
    CSRRSI: csr_wdata = de_alu_imm | bypass_alu_csr_data;
    CSRRCI: csr_wdata = bypass_alu_csr_data & (~ de_alu_imm );
    default:csr_wdata = {DATA_WIDTH{1'b0}} ;
  endcase
end

always@(posedge clk) begin
  if(csr_en & alu_real_valid)
    alu_wb_csr_wdata <= csr_wdata ;
end

//STEP 4 :output csr_rd_idx
always@(posedge clk) begin
  if(csr_en & alu_real_valid)
    alu_wb_csr_rd_idx <=  de_alu_csr_idx ;
end

assign alu_oitf_csr_cmt_flag   = csr_wvld                                        ;
assign alu_oitf_csr_flush_flag = csr_en && ctrl_alu_flush && de_alu_inst_vld     ;

//---------------------LS  OPERATION SELECT -------------------------
//---------RELATED TO :LB LH LW LBU LHU SB SH SW SD------------------
//-------------------------------------------------------------------

//STEP1 generate LS_FLAG
assign ls_flag = | de_alu_ls_type ;

//STEP2 generate LS_operation1 LS_operation2
assign ls_operation1 = bypass_alu_rs1_data ;
assign ls_operation2 = de_alu_imm        ;


//STEP3 generate lsu_valid
assign alu_lsu_vld = ls_flag & alu_real_valid ;

//STEP4 generate lsu_wen
assign alu_lsu_wen = de_alu_ls_type[3];

// STEP5 generate lsu_ls_flag
assign alu_lsu_ls_type = de_alu_ls_type ;

// STEP6 genearate lsu_cmt_flag
assign alu_oitf_load_flush_flag = (!de_alu_ls_type[3]) && ctrl_alu_flush && de_alu_inst_vld & (de_alu_ls_type !=4'b0 ) ;

//STEP6 generate lsu_data
assign alu_lsu_wdata = bypass_alu_rs2_data ;

//STEP7 generate lsu_rd_idx
assign alu_lsu_rd_idx = de_alu_rd_idx ;



// -------------------CON_JMP OPERATION SELECT-----------------------
// ---------RELATED TO :BEQ  BNE BLT BLTU BGE BGEU ------------------
//-------------------------------------------------------------------


//STEP1 compute whether to jump
assign  jump_beq  = (bypass_alu_rs1_data == bypass_alu_rs2_data)  ; 
assign  jump_bne  = !jump_beq ;
assign  jump_bltu = (bypass_alu_rs1_data <  bypass_alu_rs2_data)  ; 
assign  jump_bgeu = !jump_bltu ;
assign  jump_blt  = ({~bypass_alu_rs1_data[63],bypass_alu_rs1_data[62:0]} < {~bypass_alu_rs2_data[63],bypass_alu_rs2_data[62:0]})  ; 
assign  jump_bge  = !jump_blt  ;

always@(*)begin
  case(de_alu_con_jmp_type)
    BEQ : jump = jump_beq  ; //beq
    BNE : jump = jump_bne  ; //bne
    BLTU: jump = jump_bltu ; //bltu unsigned
    BGEU: jump = jump_bgeu ; //bgeu unsigned
    BLT : jump = jump_blt  ; //blt
    BGE : jump = jump_bge  ; //bge
    default : jump = 1'b0 ;
  endcase
end



//STEP2 generate LS_operation1 LS_operation2
assign con_jmp_operation1 = de_alu_pc   ;
assign con_jmp_operation2 = de_alu_imm  ;


// -------------------JMP OPERATION SELECT---------------------------
// ---------   RELATED TO :JAL JALR                ------------------
//-------------------------------------------------------------------

//STEP1 generate LS_FLAG
assign ucon_jmp_flag  = | de_alu_ucon_jmp_type ;
assign con_jmp_flag   = | de_alu_con_jmp_type;
assign jump_inst_flag = ucon_jmp_flag | con_jmp_flag;

//STEP2 generate LS_operation1 LS_operation2
assign ucon_jmp_operation1 = de_alu_imm ;
assign ucon_jmp_operation2 = de_alu_ucon_jmp_type[0] ? de_alu_pc : bypass_alu_rs1_data ; 


//STEP3 generate jump_en
always@(*) begin
    ctrl_jump_en     = (jump | ucon_jmp_flag) & alu_real_valid ;
    ctrl_fence_i_en  = de_alu_fence_type == FENCE_I & alu_real_valid;
end

assign alu_ctrl_fence_i = ctrl_fence_i_en ;

// -------------------ADD OPERATION SELECT ----------------
// --- RELATED: ADD ADDI ADDW ADDIW -----------------------
// --------------------------------------------------------

// STEP 1 generate add_flag  
// allready have a de_alu_adder_flag 

// STEP 2 generate add_op1 add_op2

assign add_operation1  = bypass_alu_rs1_data ;
assign add_operation2  = de_alu_reg2_flag ? bypass_alu_rs2_data : de_alu_imm ;




// -------------------SUB OPERATION SELECT ----------------
// --- RELATED: SUB SUBIW           -----------------------
// --------------------------------------------------------



// STEP 1 generate sub_flag  
// allready have a de_alu_sub_flag 



//STEP 2 generate sub_op1 sub_op2

assign sub_operation1  = bypass_alu_rs1_data ;
assign sub_operation2  = bypass_alu_rs2_data ;






// -------------------COMP OPERATION SELECT ----------------
// --- RELATED: SLT SLTI SLTU SLTIU -----------------------
// --------------------------------------------------------
// STEP 1 generate comp_flag  
assign comp_flag = | de_alu_comp_flag ;

//STEP 2 generate comp_op1 comp_op2

assign comp_operation1 = bypass_alu_rs1_data ;
assign comp_operation2 = de_alu_reg2_flag ?  bypass_alu_rs2_data : de_alu_imm ;




// -----------------SHIFT OPERTION ----------------------------------------
// --- RELATED :SLL SLLI SRL SRLI SRA SRAI SLLIW SRLIW SRAIW SLLW SRLW SRAW
// -------------------------------------------------------------------------

//STEP 1 generate shift flag
// already have shift_en
  
  
  
//STEP 2 generate shift_op1 shift_op2


assign  shifter_operation1 =  (de_alu_shift_right_flag & de_alu_iw_en_flag) ? {bypass_alu_rs1_data[31:0],32'b0} : bypass_alu_rs1_data  ;

always @(*) begin
  case({de_alu_reg2_flag,de_alu_iw_en_flag})
    2'b00:shifter_operation2 = de_alu_imm[5:0] ;
    2'b01:shifter_operation2 = de_alu_imm[5:0] ;
    2'b10:shifter_operation2 = bypass_alu_rs2_data[5:0] ;
    2'b11:shifter_operation2 = {1'b0,bypass_alu_rs2_data[4:0]} ;
    default:shifter_operation2 = 6'b0 ;
  endcase
end




//STEP 3  generate different shift

`ifdef DW
reg     [SHIFT_WIDTH-1:0]   sh                  ;
reg                         sh_tc               ;     //0 represents shifter_op2 is signed,1 represents shifter_op2 is unsigned
reg                         data_tc             ;     //0 represents logic 0 padding,1 represents sign-extened padding 
 
always@(*)begin:SH                                    //sh:numbers of shift
  if(de_alu_shift_right_flag == 1'b1)
    sh = {1'b1,shifter_operation2[SHIFT_WIDTH-2:0]}    ;     //shift right,sh_dc = 1,sh is a signed numbers
  else 
    sh = {1'b0,shifter_operation2[SHIFT_WIDTH-2:0]}    ;     //shift left,sh_dc  = 0,sh is a unsigned numbers
end 

always@(*)begin:SHI_TC                                //sh_tc:1 represents signed,0 represents unsigned
  if(de_alu_shift_right_flag == 1'b1)
    sh_tc = 1'b1    ;
  else 
    sh_tc = 1'b0    ;
end 

always@(*)begin                              //data_tc:1 represents signed,0 represents unsigned
  if(de_alu_shift_logic_flag == 1'b1)
    data_tc = 1'b0  ;
  else 
    data_tc = 1'b1  ;
end     

//STEP 4 excute shift operation
DW_shifter 
#(    .data_width (DATA_WIDTH      ),
      .sh_width   (SHIFT_WIDTH     ),
      .inv_mode   (0               )
)U0_DW_shifter
(
      .data_in    (shifter_operation1),
      .data_tc    (data_tc         ),
      .sh         (sh              ),
      .sh_tc      (sh_tc           ),
      .sh_mode    (1'b1            ),
      .data_out   (shifter_result  )
);

`else
always @(*)begin
  if(~de_alu_shift_right_flag)
    shifter_result = shifter_operation1 <<  shifter_operation2 ;
  else if(de_alu_shift_logic_flag)
    shifter_result = shifter_operation1 >>  shifter_operation2 ;
  else
    shifter_result = shifter_operation1 >>> shifter_operation2 ;
end

`endif



// -----------------ADD_SUB OPERTION -----------------------------------------
// --- RELATED TO ALL OPERATION NEEDS ADD_SUB OPERATION ----------------------
// ---------------------------------------------------------------------------

// STEP 1  GENERATE REAL_ADD_FLAG REAL_SUB_FLAG

assign real_add_flag = de_alu_adder_flag | de_alu_auipc_flag | ucon_jmp_flag | ls_flag | con_jmp_flag;


// STEP 2 GENERATE ADD_SUB 
assign add_sub = !real_add_flag ;

// STEP 3 CHOOSE operation 

always@(*) begin
  if(de_alu_adder_flag) begin
    op1 = add_operation1 ;
    op2 = add_operation2 ;
  end
  else if(de_alu_sub_flag) begin
    op1 = sub_operation1 ;
    op2 = sub_operation2 ;
  end
  else if(ls_flag) begin
    op1 = ls_operation1  ;
    op2 = ls_operation2  ;
  end
  else if(con_jmp_flag) begin
    op1 = con_jmp_operation1 ;
    op2 = con_jmp_operation2 ;
  end
  else if(ucon_jmp_flag) begin
    op1 = ucon_jmp_operation1 ;
    op2 = ucon_jmp_operation2 ;
  end
  else if(comp_flag) begin
    op1 = comp_operation1 ;
    op2 = comp_operation2 ;
  end
  else if(de_alu_auipc_flag) begin 
    op1 = de_alu_imm  ;
    op2 = de_alu_pc   ;
  end
  else begin
    op1 = add_operation1 ;
    op2 = add_operation2 ;
  end
end

//STEP 4 add_sub operation
`ifdef DW  
//examplify dw01_addsub module 
DW01_addsub 
#(      
           .width    (DATA_WIDTH      )
)
U0_dw01_addsub
(
           .A        (op1),
           .B        (op2),
           .CI       (1'b0            ),
           .ADD_SUB  (add_sub         ),
           .CO       (co              ),
           .SUM      (sum             )
);
`else
assign sum = add_sub ? (op1 - op2 ) : (op1 + op2 );


always@(*) begin
  if(de_alu_comp_flag == 2'b01 && (op1[DATA_WIDTH-1]) && (!op2[DATA_WIDTH-1]))       //s - +
    co = 1'b1 ;
  else if(de_alu_comp_flag == 2'b01 && (!op1[DATA_WIDTH-1]) && (op2[DATA_WIDTH-1]))  //s + -
    co = 1'b0 ;
  else                                                                               //U 
    co = sum[DATA_WIDTH];
end

`endif
// -------------- OUTPUT ---------------------------
//MUX to alu_wb_data

always@(*)begin:ARITH_RESULT_OUT
  if(comp_flag)begin
    if(co == 1'b1)
      arith_result = 64'h0000_0001              ;
    else 
      arith_result = {DATA_WIDTH{1'b0}}         ;
  end 
  else 
      arith_result = sum [DATA_WIDTH-1:0]       ;
end 

//output the pc
assign alu_ifu_pc =  (jump | ucon_jmp_flag) ? arith_result  : de_alu_pc + 64'd4;

assign alu_ifu_pc_vld = alu_ctrl_jump_en || ctrl_fence_i_en ;

// output lsu_addr
assign alu_lsu_addr = sum[ADDR_WIDTH-1:0] ;                              //same value to alu_lsu_addr outputs


//generate ls_size

always @(*) begin
  case(de_alu_ls_type)
    LB,LBU,SB: ls_size = 2'b00 ; //8
    LH,LHU,SH: ls_size = 2'b01 ; //16
    LW,LWU,SW: ls_size = 2'b10 ; //32
    LD,SD    : ls_size = 2'b11 ; //64
    default  : ls_size = 2'b00 ;
  endcase
end



// wb_alu_wb_data output
always@(*)begin 
    if(de_alu_and_flag | de_alu_or_flag | de_alu_xor_flag)
      alu_wb_data = logic_result            ;
    else if(de_alu_shift_flag)
      alu_wb_data = shifter_result          ;
    else if(de_alu_adder_flag | de_alu_sub_flag | comp_flag | de_alu_auipc_flag)
      alu_wb_data = arith_result            ;
    else if(de_alu_lui_flag)
      alu_wb_data = de_alu_imm              ;
    else if(ucon_jmp_flag)
      alu_wb_data = de_alu_pc + 64'h4       ; 
    else if(csr_en) 
      alu_wb_data = bypass_alu_csr_data     ;
    else
      alu_wb_data = arith_result            ;
end 

always@(*) begin
  case({de_alu_iw_en_flag,de_alu_shift_right_flag})
    2'b00:wb_data = alu_wb_data ;
    2'b01:wb_data = alu_wb_data ;
    2'b10:wb_data = {{32{alu_wb_data[31]}},alu_wb_data[31: 0]} ;
    2'b11:wb_data = {{32{alu_wb_data[63]}},alu_wb_data[63:32]} ;
    default:wb_data = alu_wb_data ;
  endcase
end

always @(posedge clk) begin
  if(alu_wb_real_valid & (de_alu_ls_type == 4'd0))
      alu_wb_gpr_wdata <= wb_data ;
end

// wb_gpr_vld output

always @(posedge clk or negedge rstn) begin
  if(!rstn)
    gpr_vld <= 1'b0 ;
  else 
    gpr_vld <= alu_wb_real_valid & (de_alu_ls_type == 4'd0);
end
  
assign alu_wb_gpr_vld = gpr_vld ;
assign alu_wb_gpr_rd_idx = alu_bypass_rd_idx ;
//--------------------------- BPU ------------------------------------
//---------------------generate BTB WRITE-----------------------------
//--------------------------------------------------------------------

assign alu_bpu_wr_req           = de_alu_predict_jmp_type != 3'b000 && de_alu_predict_jmp_type != 3'b111 && alu_real_valid ;

assign alu_bpu_wr_type          = alu_real_valid ? de_alu_predict_jmp_type : 1'b0;

assign alu_bpu_wr_pc            = de_alu_pc;

assign alu_bpu_wr_predict_taken = alu_bpu_wr_req ? ctrl_jump_en : 1'b0 ;

assign alu_bpu_wr_predict_pc    = arith_result ;

assign alu_ctrl_jump_en         = (de_alu_npc != alu_ifu_pc) && alu_real_valid;

assign alu_bpu_jump_en          = alu_ctrl_jump_en;



// with int
assign alu_int_vld     = de_alu_inst_vld ;

//no need fence_i , because int will also pull up fake_gen_flag 
assign alu_int_beq_temp = jump | ucon_jmp_flag ;

//When the ALU is in the jump process, there is an interrupt, EPC is the address corresponding to the jump destination instruction
always@(posedge clk or negedge rstn) begin
  if(!rstn)
    jump_state <= 1'b0;
  else if(alu_int_beq_temp)
    jump_state <= 1'b1;
  else if(de_alu_inst_vld & (!ctrl_alu_flush))
    jump_state <= 1'b0  ;
end

always@(posedge clk) begin
  if(alu_int_beq_temp &  (!ctrl_alu_flush))begin
    jump_pc <= alu_ifu_pc;
  end
end

assign alu_int_beq = alu_int_beq_temp | jump_state;
assign alu_int_pc  = jump_state ? jump_pc : de_alu_pc;


// ls_misa 
assign ls_misa = (   sum[  0]  && ls_size == 2'b01 && de_alu_ls_type != 4'b0000)|| 
                 (( |sum[1:0]) && ls_size == 2'b10 && de_alu_ls_type != 4'b0000)|| 
                 (( |sum[2:0]) && ls_size == 2'b11 && de_alu_ls_type != 4'b0000 ); 

always@(*) begin
  if(ls_misa && (!de_alu_ls_type[3])&alu_real_valid) begin
    alu_int_l_misa = 1'b1;
  end
  else begin
     alu_int_l_misa = 1'b0;
  end
end

always@(*) begin
  if(ls_misa && de_alu_ls_type[3]&alu_real_valid) begin
    alu_int_s_misa = 1'b1;
  end
  else begin
    alu_int_s_misa = 1'b0;
  end
end
assign alu_int_ls_addr = alu_lsu_addr;

//with rob  
assign alu_rob_alu_flush  = de_alu_inst_vld & ctrl_alu_flush   ;
assign alu_rob_load_flush = alu_oitf_load_flush_flag           ;
assign alu_rob_csr_flush  = alu_oitf_csr_flush_flag            ;

always@(posedge clk or negedge rstn) begin
  if(!rstn)
    special_cmt <= 1'b0;
  else 
    special_cmt <= ((|de_alu_fence_type) | (|de_alu_con_jmp_type)) && alu_real_valid ;
end

assign alu_rob_special_cmt = special_cmt ;

//WITH BYPASS_ALU
exu_bypass alu_bypass(
  .clk                    (clk                      ),
  .rstn                   (rstn                     ),
  .bypass_exu_vld         (alu_wb_gpr_vld           ),
  .bypass_exu_data        (alu_wb_gpr_wdata         ),
  .bypass_exu_rd_idx      (de_alu_rd_idx            ),
  .exu_valid              (alu_wb_real_valid        ),
  .exu_bypass_vld         (alu_bypass_vld           ),
  .exu_bypass_data        (alu_bypass_data          ),
  .exu_bypass_rd_idx      (alu_bypass_rd_idx        ),
  .exu_bypass_vld_1d      (alu_bypass_vld_1d        ),      
  .exu_bypass_data_1d     (alu_bypass_data_1d       ),      
  .exu_bypass_rd_idx_1d   (alu_bypass_rd_idx_1d     )       
);


endmodule
