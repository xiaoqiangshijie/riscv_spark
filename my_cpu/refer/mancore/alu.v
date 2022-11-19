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
  parameter   DATA_WIDTH  = 64,
  parameter   SHIFT_WIDTH = 7
)(
//WITH TOP
  input                        clk                          ,
  input                        rstn                         ,
//WITH CONTROL
  input                        ctrl_alu_stall               ,
  input                        ctrl_alu_fake_gen_flag       ,
  output                       alu_ctrl_jump_en             ,
  output                       alu_ctrl_fence_i_flag        ,
//WITH GPR
  input    [DATA_WIDTH-1:0]    gpr_alu_reg1_data            ,
  input    [DATA_WIDTH-1:0]    gpr_alu_reg2_data            ,
  input                        gpr_alu_data_vld             ,
//WITH CSR
  input    [DATA_WIDTH-1:0]    csr_alu_data                 ,
  input                        csr_alu_data_vld             ,
//WITH DE
  input    [          31:0]    de_alu_pc                    ,
  input                        de_alu_inst_vld              ,
  input                        de_alu_wb_vld                ,
  input                        de_alu_reg2_flag             ,//1 is reg2_data,0 is alu_imm
  input                        de_alu_lui_flag              ,//1 represents lui operation is valid 
  input                        de_alu_shift_flag            ,//1 represents shift operation is valid 
  input                        de_alu_shift_right_flag      ,//1 represents shift right,0 represents shift left
  input                        de_alu_shift_logic_flag      ,//1 represents logic shift,0 represents arithmetic shift
  input                        de_alu_iw_en_flag            ,//1 represents add and sub truncation operation is valid
  input    [           1:0]    de_alu_comp_flag             ,//1 represents unsigned comparison operation is valid
  input                        de_alu_and_flag              ,//1 represents and operation is valid 
  input                        de_alu_or_flag               ,//1 represents or operation is valid 
  input                        de_alu_xor_flag              ,//1 represents xor operation is valid 
  input                        de_alu_adder_flag            ,//1 represents addition operation is valid 
  input                        de_alu_sub_flag              ,//1 represents subtraction 
  input                        de_alu_auipc_flag            ,//1 represents  auipc operation is valid 
  input    [           3:0]    de_alu_ls_type               ,//0001~1011 is valid
  input    [DATA_WIDTH-1:0]    de_alu_imm                   ,//immediate data
  input    [           2:0]    de_alu_con_jmp_type          ,        
  input    [           1:0]    de_alu_ucon_jmp_type         ,// 00 is invalid ,jal 01 ,jalr 10;
  input    [           2:0]    de_alu_csr_type              ,// 000 is invalid
  input                        de_alu_fence_i_flag          , 

//WITH WB
  output                       alu_wb_gpr_vld               ,
  output reg [DATA_WIDTH-1:0]  alu_wb_gpr_wdata             ,
  output reg                   alu_wb_gpr_fake_vld          ,
  output                       alu_wb_csr_vld               ,
  output     [DATA_WIDTH-1:0]  alu_wb_csr_wdata             ,
  output                       alu_wb_csr_fake_vld          ,
  output reg                   alu_wb_load_fake_vld         ,
  output reg                   alu_wb_store_fake_vld        ,//
//WITH LSU                     
  output                       alu_lsu_vld_1p               ,  //because we need vld_1p to generate cmd_vld, cmd_vld is later than addr 1cycle
  output                       alu_lsu_vld                  ,
  output   [          31:0]    alu_lsu_addr                 ,
  output   [DATA_WIDTH-1:0]    alu_lsu_wdata                ,
  output   [           3:0]    alu_lsu_ls_type              ,
  output                       alu_lsu_wen                  ,
//WITH IFU
  output   [          31:0]    alu_ifu_pc                   ,
  output                       alu_ifu_pc_vld               ,

//WITH  ROB
  output    [31:0]             alu_rob_flush_pc             ,

//WITH INT
  output                       alu_int_vld                  ,
  output   [          31:0]    alu_int_pc                   ,
  output                       alu_int_beq                  ,
  output reg                   alu_int_l_misa               ,
  output reg                   alu_int_s_misa               ,  
  output   [          31:0]    alu_int_ls_addr              
);

//LOCAL PARAMETER
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

//----------------------- REAL     VALID ------------------------------
//---------------------generate real_valid-----------------------------
//---------------------------------------------------------------------
wire   alu_real_valid ;
wire   alu_wb_real_valid ;

//extend vld
reg  de_alu_inst_vld_extend;
reg  de_alu_wb_vld_extend;

always @(posedge clk or negedge rstn) begin
  if(!rstn)
    de_alu_inst_vld_extend <= 1'b0 ;
  else if( de_alu_inst_vld & ctrl_alu_stall )
    de_alu_inst_vld_extend <= 1'b1 ;
  else if( !ctrl_alu_stall )begin
    de_alu_inst_vld_extend <= 1'b0 ;
  end
end

always @(posedge clk or negedge rstn) begin
  if(!rstn)
    de_alu_wb_vld_extend <= 1'b0 ;
  else if( de_alu_wb_vld & ctrl_alu_stall )
    de_alu_wb_vld_extend <= 1'b1 ;
  else if( !ctrl_alu_stall )begin
    de_alu_wb_vld_extend <= 1'b0 ;
  end
end

//gen real vld
assign alu_real_valid    = ( de_alu_inst_vld | de_alu_inst_vld_extend ) & (!ctrl_alu_stall) &  (!ctrl_alu_fake_gen_flag); 
assign alu_wb_real_valid = ( de_alu_wb_vld   | de_alu_wb_vld_extend   ) & (!ctrl_alu_stall) &  (!ctrl_alu_fake_gen_flag); 


//-----------------------LOGIC OPERATION ------------------------------
//----------RELATED TO: OR ORI XOR XORI AND ANDI ----------------------
//---------------------------------------------------------------------

//STEP 1 :choose operation from reg2_data and de_alu_imm
wire    [DATA_WIDTH-1:0]     logic_1op;
wire    [DATA_WIDTH-1:0]     logic_2op;

assign logic_1op = gpr_alu_reg1_data ;
assign logic_2op = de_alu_reg2_flag ? gpr_alu_reg2_data : de_alu_imm ;


//STEP 2: and,or,xor operation
wire    [DATA_WIDTH-1:0]    and_result          ;//and
wire    [DATA_WIDTH-1:0]    or_result           ;//or
wire    [DATA_WIDTH-1:0]    xor_result          ;//xor
reg     [DATA_WIDTH-1:0]    logic_result        ;//three of one result

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
  
//STEP 2 :output csr_data 
reg     [DATA_WIDTH-1:0]   csr_wdata;
  
always @(posedge clk) begin
  case(de_alu_csr_type)
    CSRRW : csr_wdata <= gpr_alu_reg1_data ;
    CSRRS : csr_wdata <= csr_alu_data | gpr_alu_reg1_data ;
    CSRRC : csr_wdata <= csr_alu_data & (~ gpr_alu_reg1_data) ;
    CSRRWI: csr_wdata <= de_alu_imm ;
    CSRRSI: csr_wdata <= de_alu_imm | csr_alu_data;
    CSRRCI: csr_wdata <= csr_alu_data & (~ de_alu_imm );
    default:csr_wdata <= {DATA_WIDTH{1'b0}} ;
  endcase
end
  
assign alu_wb_csr_wdata = csr_wdata ;


//STEP 3 :output csr_data_vld
reg                       csr_wvld;
wire                      csr_en  ;

assign  csr_en = ( | de_alu_csr_type ) & alu_real_valid;

always @(posedge clk or negedge rstn) begin
  if(!rstn) 
    csr_wvld <= 1'b0 ;
  else if(csr_en & alu_real_valid & csr_alu_data_vld)
    csr_wvld <= 1'b1 ;
  else
    csr_wvld <= 1'b0 ;
end

assign alu_wb_csr_vld = csr_wvld ;


//STEP 4:output csr_fake_vld 

assign alu_wb_csr_fake_vld = csr_en & ctrl_alu_fake_gen_flag & alu_real_valid ;



//---------------------LS  OPERATION SELECT -------------------------
//---------RELATED TO :LB LH LW LBU LHU SB SH SW SD------------------
//-------------------------------------------------------------------

//STEP1 generate LS_FLAG
wire ls_flag ;
assign ls_flag = | de_alu_ls_type ;

//STEP2 generate LS_operation1 LS_operation2
wire [DATA_WIDTH-1:0] ls_operation1;
wire [DATA_WIDTH-1:0] ls_operation2;

assign ls_operation1 = gpr_alu_reg1_data ;
assign ls_operation2 = de_alu_imm        ;

//STEP3 generate result
wire [          31:0]  ls_addr_result;

//STEP4 generate lsu_valid
assign alu_lsu_vld_1p = ls_flag & alu_real_valid ;

reg                    ls_valid ;
always @(posedge clk or negedge rstn) begin
  if(!rstn)
    ls_valid <= 1'b0 ;
  else 
    ls_valid <= alu_lsu_vld_1p ; 
end
assign alu_lsu_vld    = ls_valid ;


//STEP5 generate lsu_wen
reg lsu_wen;

always @(posedge clk or negedge rstn) begin
 if(rstn == 1'b0)
   lsu_wen <= 1'b0 ;
 else if(alu_lsu_vld_1p) begin   
   if(de_alu_ls_type[3])
     lsu_wen <= 1'b1 ;
   else
     lsu_wen <= 1'b0 ;
 end
end

assign alu_lsu_wen = lsu_wen;

// STEP6 generate lsu_ls_flag
reg [3:0] lsu_ls_flag;

always @(posedge clk) begin
  if(alu_lsu_vld_1p)
    lsu_ls_flag <= de_alu_ls_type;
end

assign alu_lsu_ls_type = lsu_ls_flag;

//STEP6 generate lsu_data
reg [DATA_WIDTH-1:0] lsu_data ;

always @(posedge clk) begin
  if(alu_lsu_vld_1p & de_alu_ls_type[3])
    lsu_data <= gpr_alu_reg2_data;
end

assign alu_lsu_wdata = lsu_data;




// -------------------CON_JMP OPERATION SELECT-----------------------
// ---------RELATED TO :BEQ  BNE BLT BLTU BGE BGEU ------------------
//-------------------------------------------------------------------


//STEP1 compute whether to jump
reg jump;
wire jump_beq  = (gpr_alu_reg1_data == gpr_alu_reg2_data)  ; 
wire jump_bne  = !jump_beq ;
wire jump_bltu = (gpr_alu_reg1_data <  gpr_alu_reg2_data)  ; 
wire jump_bgeu = !jump_bltu ;
wire jump_blt  = ({~gpr_alu_reg1_data[63],gpr_alu_reg1_data[62:0]} < {~gpr_alu_reg2_data[63],gpr_alu_reg2_data[62:0]})  ; 
wire jump_bge  = !jump_blt  ;

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
wire [DATA_WIDTH-1:0] con_jmp_operation1;
wire [DATA_WIDTH-1:0] con_jmp_operation2;

assign con_jmp_operation1 = {32'b0,de_alu_pc}  ;
assign con_jmp_operation2 = de_alu_imm         ;








// -------------------JMP OPERATION SELECT---------------------------
// ---------   RELATED TO :JAL JALR                ------------------
//-------------------------------------------------------------------

//STEP1 generate LS_FLAG
wire ucon_jmp_flag ;
assign ucon_jmp_flag = | de_alu_ucon_jmp_type ;

//STEP2 generate LS_operation1 LS_operation2
wire [DATA_WIDTH-1:0] ucon_jmp_operation1;
reg  [DATA_WIDTH-1:0] ucon_jmp_operation2;

assign ucon_jmp_operation1 = de_alu_imm ;

always @(*) begin
  case(de_alu_ucon_jmp_type) 
    JAL : ucon_jmp_operation2 = {32'b0,de_alu_pc} ;
    JALR: ucon_jmp_operation2 = gpr_alu_reg1_data ;
    default:ucon_jmp_operation2 = {DATA_WIDTH{1'b0}};
  endcase
end


//STEP3 generate jump_en
reg ctrl_jump_en ;
reg ctrl_fence_i_en;

always@(*) begin
    ctrl_jump_en = (jump | ucon_jmp_flag) & alu_real_valid ;
    ctrl_fence_i_en  = de_alu_fence_i_flag & alu_real_valid;
end


assign alu_ctrl_jump_en      = (!ctrl_alu_fake_gen_flag) & ctrl_jump_en    ; 
assign alu_ctrl_fence_i_flag = (!ctrl_alu_fake_gen_flag) & ctrl_fence_i_en  ;



// -------------------ADD OPERATION SELECT ----------------
// --- RELATED: ADD ADDI ADDW ADDIW -----------------------
// --------------------------------------------------------

// STEP 1 generate add_flag  
// allready have a de_alu_adder_flag 

// STEP 2 generate add_op1 add_op2
wire [DATA_WIDTH-1:0] add_operation1 ;
wire [DATA_WIDTH-1:0] add_operation2 ;

assign add_operation1  = gpr_alu_reg1_data ;
assign add_operation2  = de_alu_reg2_flag ? gpr_alu_reg2_data : de_alu_imm ;




// -------------------SUB OPERATION SELECT ----------------
// --- RELATED: SUB SUBIW           -----------------------
// --------------------------------------------------------



// STEP 1 generate sub_flag  
// allready have a de_alu_sub_flag 



//STEP 2 generate sub_op1 sub_op2
wire [DATA_WIDTH-1:0] sub_operation1;
wire [DATA_WIDTH-1:0] sub_operation2;

assign sub_operation1  = gpr_alu_reg1_data ;
assign sub_operation2  = gpr_alu_reg2_data ;






// -------------------COMP OPERATION SELECT ----------------
// --- RELATED: SLT SLTI SLTU SLTIU -----------------------
// --------------------------------------------------------
// STEP 1 generate comp_flag  
wire comp_flag ;
assign comp_flag = | de_alu_comp_flag ;

//STEP 2 generate comp_op1 comp_op2
wire [DATA_WIDTH-1:0] comp_operation1 ;
wire [DATA_WIDTH-1:0] comp_operation2 ;

assign comp_operation1 = gpr_alu_reg1_data ;
assign comp_operation2 = de_alu_reg2_flag ?  gpr_alu_reg2_data : de_alu_imm ;




// -----------------SHIFT OPERTION ----------------------------------------
// --- RELATED :SLL SLLI SRL SRLI SRA SRAI SLLIW SRLIW SRAIW SLLW SRLW SRAW
// -------------------------------------------------------------------------

//STEP 1 generate shift flag
// already have shift_en
  
  
  
//STEP 2 generate shift_op1 shift_op2
wire     [DATA_WIDTH-1:0]    shifter_operation1  ;
reg      [           5:0]    shifter_operation2  ;


assign  shifter_operation1 =  (de_alu_shift_right_flag & de_alu_iw_en_flag) ? {gpr_alu_reg1_data[31:0],32'b0} : gpr_alu_reg1_data  ;

always @(*) begin
  case({de_alu_reg2_flag,de_alu_iw_en_flag})
    2'b00:shifter_operation2 = de_alu_imm[5:0] ;
    2'b01:shifter_operation2 = de_alu_imm[5:0] ;
    2'b10:shifter_operation2 = gpr_alu_reg2_data[5:0] ;
    2'b11:shifter_operation2 = {1'b0,gpr_alu_reg2_data[4:0]} ;
    default:shifter_operation2 = 6'b0 ;
  endcase
end




//STEP 3  generate different shift
wire        [DATA_WIDTH-1:0]    shifter_result      ;

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
  
  always@(*)begin:DATA_TC                              //data_tc:1 represents signed,0 represents unsigned
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
assign shifter_result = (~de_alu_shift_right_flag & ~de_alu_shift_logic_flag) ? (shifter_operation1 <<  shifter_operation2) : //left 
                        (~de_alu_shift_right_flag &  de_alu_shift_logic_flag) ? (shifter_operation1 <<  shifter_operation2) :
                        ( de_alu_shift_right_flag & ~de_alu_shift_logic_flag) ? ($signed(($signed(shifter_operation1)) >>> shifter_operation2)) :
                                                                                (shifter_operation1 >>  shifter_operation2) ;

`endif



// -----------------ADD_SUB OPERTION -----------------------------------------
// --- RELATED TO ALL OPERATION NEEDS ADD_SUB OPERATION ----------------------
// ---------------------------------------------------------------------------

// STEP 1  GENERATE REAL_ADD_FLAG REAL_SUB_FLAG

wire real_add_flag ;
assign real_add_flag = de_alu_adder_flag | de_alu_auipc_flag | ucon_jmp_flag |ls_flag | jump ;


// STEP 2 GENERATE ADD_SUB 

reg  add_sub;

always @(*) begin
  if(real_add_flag)
     add_sub = 1'b0 ;
  else 
     add_sub = 1'b1 ;
end

// STEP 3 CHOOSE operation 
reg [DATA_WIDTH-1:0] op1;
reg [DATA_WIDTH-1:0] op2;

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
  else if(jump) begin
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
    op1 = de_alu_imm         ;
    op2 = {32'h0,de_alu_pc} ;
  end
  else begin
    op1 = {DATA_WIDTH{1'b0}};
    op2 = {DATA_WIDTH{1'b0}};
  end
end

//STEP 4 add_sub operation

wire [DATA_WIDTH:0] sum ;
reg                 co  ;
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
  else if (de_alu_comp_flag == 2'b01 && op1[DATA_WIDTH-1] && op2[DATA_WIDTH-1])      //s - -
    co = sum[DATA_WIDTH];
  else if (de_alu_comp_flag == 2'b01 && (!op1[DATA_WIDTH-1]) && (!op2[DATA_WIDTH-1]))//s + +  
    co = sum[DATA_WIDTH];
  else                                                                               //U 
    co = sum[DATA_WIDTH];
  
end

`endif
// -------------- OUTPUT ---------------------------
//MUX to alu_wb_data
reg [DATA_WIDTH-1:0]  arith_result              ;

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
reg [31:0] pc_out;



always @(*) begin
  if( (|de_alu_con_jmp_type)  ||  (|de_alu_ucon_jmp_type))
    pc_out = arith_result[31:0];
  else
    pc_out = 32'b0;
end

assign alu_ifu_pc =(de_alu_fence_i_flag&(!ctrl_alu_fake_gen_flag))? (de_alu_pc + 32'd4) :pc_out ;



reg       pc_vld;
always @(*) begin
    pc_vld = (!ctrl_alu_fake_gen_flag) && (alu_ctrl_jump_en || alu_ctrl_fence_i_flag);
end

assign alu_ifu_pc_vld = pc_vld ;

// output lsu_addr
reg [31:0]  lsu_addr ;

always @(posedge clk) begin
  if(ls_flag & alu_real_valid)
    lsu_addr <= sum[31:0];
end


//generate ls_size
reg [1:0] ls_size ;

always @(*) begin
  case(de_alu_ls_type)
    LB,LBU,SB: ls_size = 2'b00 ; //8
    LH,LHU,SH: ls_size = 2'b01 ; //16
    LW,LWU,SW: ls_size = 2'b10 ; //32
    LD,SD    : ls_size = 2'b11 ; //64
    default  : ls_size = 2'b00 ;
  endcase
end


assign alu_lsu_addr = lsu_addr[31:0];                              //same value to alu_lsu_addr outputs

// wb_gpr_wdata output
reg     [DATA_WIDTH-1:0]    alu_wb_data     ;

always@(*)begin 
  if(de_alu_and_flag | de_alu_or_flag | de_alu_xor_flag)
    alu_wb_data = logic_result              ;
  else if(de_alu_shift_flag)
    alu_wb_data = shifter_result            ;
  else if(de_alu_adder_flag | de_alu_sub_flag | comp_flag | de_alu_auipc_flag)
    alu_wb_data = arith_result              ;
  else if(de_alu_lui_flag)
    alu_wb_data = de_alu_imm                ;
  else if(ucon_jmp_flag)
    alu_wb_data = de_alu_pc + 4             ; 
  else 
    alu_wb_data = {DATA_WIDTH{1'b0}}        ;
end 

reg [DATA_WIDTH-1:0 ] wb_data_out ;

always @(posedge clk) begin
  if(alu_real_valid)
      wb_data_out <= alu_wb_data ;
end

reg iw_en_flag ;
always @(posedge clk) begin
  if(alu_real_valid)
     iw_en_flag  <= de_alu_iw_en_flag ;
end

reg alu_gpr_csr_en;

always @(posedge clk or negedge rstn) begin
  if(!rstn)
    alu_gpr_csr_en <= 1'b0 ;
  else 
    alu_gpr_csr_en <= csr_en;
end

reg shift_right_flag;
always @(posedge clk) begin
  if(alu_real_valid)
     shift_right_flag  <= de_alu_shift_right_flag;
end



wire [DATA_WIDTH-1:0] gpr_wdata ;
assign gpr_wdata = alu_gpr_csr_en ? alu_wb_csr_wdata : wb_data_out ; 

always@(*) begin
  case({iw_en_flag,shift_right_flag})
    2'b00:alu_wb_gpr_wdata = gpr_wdata ;
    2'b01:alu_wb_gpr_wdata = gpr_wdata ;
    2'b10:alu_wb_gpr_wdata = {{32{gpr_wdata[31]}},gpr_wdata[31: 0]} ;
    2'b11:alu_wb_gpr_wdata = {{32{gpr_wdata[63]}},gpr_wdata[63:32]} ;
    default:alu_wb_gpr_wdata = gpr_wdata ;
  endcase
end


// wb_gpr_vld output
reg                        gpr_vld ;

always @(posedge clk or negedge rstn) begin
  if(!rstn)
    gpr_vld <= 1'b0 ;
  else 
    gpr_vld <= alu_wb_real_valid & (de_alu_ls_type == 4'd0);
end
  
assign alu_wb_gpr_vld = gpr_vld ;

// wb_gpr_fake_vld
always @(posedge clk or negedge rstn) begin
  if(!rstn)
    alu_wb_gpr_fake_vld <= 1'b0 ;
  else 
    alu_wb_gpr_fake_vld <= de_alu_wb_vld & ctrl_alu_fake_gen_flag  ;
end

// with int

assign alu_int_vld     = de_alu_inst_vld & (!ctrl_alu_fake_gen_flag);
assign alu_int_pc      = de_alu_pc;

//no need fence_i , because int will also pull up fake_gen_flag 
assign alu_int_beq     = jump | ucon_jmp_flag ;


//modify the lsu_addr


// ls_misa 
wire       ls_misa ;


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


// generate lsu fake vld
always @(posedge clk or negedge rstn) begin
  if(!rstn)
    alu_wb_load_fake_vld <= 1'b0 ;
  else 
    alu_wb_load_fake_vld <= (de_alu_ls_type <= 4'd7) && (de_alu_ls_type > 4'd0) && ctrl_alu_fake_gen_flag  && de_alu_inst_vld  ;
end

always @(posedge clk or negedge rstn) begin
  if(!rstn)
    alu_wb_store_fake_vld <= 1'b0 ;
  else 
    alu_wb_store_fake_vld <= (de_alu_ls_type > 4'd7)  && ctrl_alu_fake_gen_flag  && de_alu_inst_vld  ;
//with rob  
assign  alu_rob_flush_pc = de_alu_pc;


endmodule
