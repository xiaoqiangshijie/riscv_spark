//-----------------------------------------------------------------------------------
//
//-----------------------------------------------------------------------------------
//File          : oitf.v
//Author        : fengyi
//Date          : 8/26/2021
//Version       : 0.1
//Description   : this file is outstand instruction track FIFO module.
//-----------------------------------------------------------------------------------
//Modalu_ication history:
//Date           By            Version           Change Description
//08/27/2021     fengyi        0.1               initial
//                                               
//                                               
//                                              
//-----------------------------------------------------------------------------------

module oitf #(
    parameter SINGLE_DEPTH = 4, // FIFIO width of alu and csr entry width 
    parameter MUL_DEPTH    = 7  // FIFIO width of mul entry width 
)( 
    input  clk                            ,
    input  rstn                           ,

//with decode
    input                    de_oitf_store_vld        , // store 
    input                    de_oitf_inst_vld_ori     , // the instruction decoded is valid  origin
    input                    de_oitf_inst_vld         , // the instruction decoded is valid
    input                    de_oitf_alu              , // the instruction decoded is an alu (not csr) inst
    input                    de_oitf_csr              , // the instruction decoded is an csr inst
    input                    de_oitf_mul              , // the instruction decoded is a mul inst
    input                    de_oitf_div              , // the instruction decoded is a div inst
    input                    de_oitf_ls               , // the instruction decoded is a ls  inst
    input                    de_oitf_ls_type          , //  1:load 0:store
    input [4 :0]             de_oitf_rs1_idx          , // the index of rs1 of instruction
    input [4 :0]             de_oitf_rs2_idx          , // the index of rs2 of instruction
    input [4 :0]             de_oitf_rd_idx           , // the index of rd  of instruction
    input [11:0]             de_oitf_csr_idx          , // the index of csr of instruction
    input                    de_oitf_rs1en            , // the instruction decoded need to read rs1
    input                    de_oitf_rs2en            , // the instruction decoded need to read rs1
    input                    de_oitf_wen              , // the instruction decoded need to write back to rd

//with wb
    input                    wb_oitf_store_cmt_vld     , // needn't to add to oitf,just for empty judgement
    input                    wb_oitf_store_fake_vld    , // needn't to add to oitf,just for empty judgement
    input                    wb_oitf_alu_flag          , // alu write back flag
    input                    wb_oitf_csr_flag          , // csr write back flag
    input                    wb_oitf_mul_flag          , // mul write back flag
    input                    wb_oitf_div_flag          , // div write back flag
    input                    wb_oitf_ls_flag           , // ls  write back flag
    input                    wb_oitf_alu_fake          , // current alu write-back is a fake signal
    input                    wb_oitf_csr_fake          , // current csr write-back is a fake signal
    input                    wb_oitf_mul_fake          , // current mul write-back is a fake signal
    input                    wb_oitf_div_fake          , // current div write-back is a fake signal
    input                    wb_oitf_ls_fake           , // current ls  write-back is a fake signal

//with control
    input                    ctrl_oitf_fake_gen_flag   ,
    output                   oitf_ctrl_empty           , // oitf entried are all empty
    output                   oitf_ctrl_related         , // generate data ralated problem


//with gpr
    output reg [ 4:0]        oitf_gpr_index            , //index of writing-back gpr
    
//with csr
    output     [11:0]        oitf_csr_index            ,  //index of writing-back csr

//with checker
    output                   oitf_checker_empty      
);

//alu fifo
wire                   alu_w_vld                   ;
wire                   alu_related                 ;
wire[SINGLE_DEPTH-1:0] alu_cmt_flag                ;
wire[SINGLE_DEPTH*5-1:0] alu_fifo_1d               ;
reg              [4:0] alu_fifo [SINGLE_DEPTH-1:0] ;
wire                   alu_empty                   ;
wire                   alu_full                    ;
wire             [4:0] alu_index_out               ;

//csr fifo
wire                   csr_w_vld                   ;
wire                   csr_related                 ;
wire[SINGLE_DEPTH-1:0] csr_cmt_flag                ;
wire[SINGLE_DEPTH*12-1:0] csr_fifo_1d              ;
reg             [11:0] csr_fifo [SINGLE_DEPTH-1:0] ;
wire                   csr_empty                   ;
wire                   csr_full                    ;
wire            [11:0] csr_index_out               ;

//mul fifo
wire                   mul_w_vld                   ;
wire                   mul_related                 ;
wire[MUL_DEPTH-1   :0] mul_cmt_flag                ;
wire[MUL_DEPTH*5-1 :0] mul_fifo_1d                 ;
reg              [4:0] mul_fifo [MUL_DEPTH-1:0]    ;
wire                   mul_empty                   ;
wire                   mul_full                    ;
wire             [4:0] mul_index_out               ;

//div fifo
wire                   div_w_vld                   ;
wire                   div_related                 ;
wire                   div_empty                   ;
wire                   div_full                    ;
reg              [4:0] div_entry                   ;
reg                    div_cmt_flag                ;
wire             [4:0] div_index_out               ;

//ls fifo
wire                   ls_w_vld                    ;
wire                   ls_related                  ;
wire                   ls_empty                    ;
reg                    ls_full                     ;
reg              [4:0] ls_entry                    ;
reg                    ls_cmt_flag                 ;
wire             [4:0] ls_index_out                ;

reg [SINGLE_DEPTH-1:0] alu_related_each            ;
reg [SINGLE_DEPTH-1:0] csr_related_each            ;
reg [MUL_DEPTH-1   :0] mul_related_each            ;

wire                   related_1_source            ;
reg                    related_2_source            ;
wire                   related_2_flag              ;
////////////////////////////////////fifo//////////////////////////////////////
//alu fifo initial

assign alu_w_vld = de_oitf_alu && de_oitf_wen && de_oitf_inst_vld ;

oitf_fifo #(
    .FIFO_DEPTH(SINGLE_DEPTH),
    .INDEX_WIDTH(5)
)alufifo(
    .clk       (clk)              ,
    .rstn      (rstn)             ,
    .ctrl_oitf_fake_gen_flag(ctrl_oitf_fake_gen_flag),
    .w_vld     (alu_w_vld)        ,
    .index     (de_oitf_rd_idx)   ,
    .real_valid(wb_oitf_alu_flag) ,
    .fake_valid(wb_oitf_alu_fake) ,
    .cmt_flag  (alu_cmt_flag)     ,
    .fifo_1d   (alu_fifo_1d)      ,
    .empty     (alu_empty)        ,
    .full      (alu_full)         ,
    .index_out (alu_index_out)
);

integer x;
always@(*) begin
    for (x=0; x<SINGLE_DEPTH; x=x+1) begin
        alu_fifo[x] = alu_fifo_1d[5*x +: 5];
    end
end

assign csr_w_vld = de_oitf_csr && de_oitf_inst_vld ;

oitf_fifo #(
    .FIFO_DEPTH(SINGLE_DEPTH),
    .INDEX_WIDTH(12)
)csrfifo(
    .clk       (clk)              ,
    .rstn      (rstn)             ,
    .ctrl_oitf_fake_gen_flag(ctrl_oitf_fake_gen_flag),
    .w_vld     (csr_w_vld)        ,
    .index     (de_oitf_csr_idx)  ,
    .real_valid(wb_oitf_csr_flag) ,
    .fake_valid(wb_oitf_csr_fake) ,
    .cmt_flag  (csr_cmt_flag)     ,
    .fifo_1d   (csr_fifo_1d)      ,
    .empty     (csr_empty)        ,
    .full      (csr_full)         ,
    .index_out (csr_index_out)
);

integer y;
always@(*) begin
    for (y=0; y<SINGLE_DEPTH; y=y+1) begin
        csr_fifo[y] = csr_fifo_1d[12*y +: 12];
    end
end

assign mul_w_vld = de_oitf_mul && de_oitf_inst_vld ;

oitf_fifo #(
    .FIFO_DEPTH(MUL_DEPTH),
    .INDEX_WIDTH(5)
)mulfifo(
    .clk       (clk)              ,
    .rstn      (rstn)             ,
    .ctrl_oitf_fake_gen_flag(ctrl_oitf_fake_gen_flag),
    .w_vld     (mul_w_vld)        ,
    .index     (de_oitf_rd_idx)   ,
    .real_valid(wb_oitf_mul_flag) ,
    .fake_valid(wb_oitf_mul_fake) ,
    .cmt_flag  (mul_cmt_flag)     ,
    .fifo_1d   (mul_fifo_1d)      ,
    .empty     (mul_empty)        ,
    .full      (mul_full)         ,
    .index_out (mul_index_out)
);

integer z;
always@(*) begin
    for (z=0; z<MUL_DEPTH; z=z+1) begin
//        mul_fifo[z] = mul_fifo_1d[5*x+4 : 5*x];
          mul_fifo[z] = mul_fifo_1d[5*z +: 5];        
    end
end

assign div_w_vld = de_oitf_div && de_oitf_inst_vld ;

always@(posedge clk or negedge rstn) begin
    if(!rstn) begin
        div_entry <= 0;
    end
    else if(div_w_vld) begin
        div_entry <= de_oitf_rd_idx;
    end
end

always@(posedge clk or negedge rstn) begin
    if(!rstn) begin
        div_cmt_flag <= 1'b1;
    end
    else if(div_w_vld) begin
        div_cmt_flag <= 1'b0;
    end
    else if(wb_oitf_div_flag || wb_oitf_div_fake) begin
        div_cmt_flag <= 1'b1;
    end
end

assign div_empty = div_cmt_flag ;

assign div_full  = !div_cmt_flag;

assign div_index_out = div_entry;

//ls fifo initial 

assign ls_w_vld = de_oitf_ls && de_oitf_inst_vld ;

always@(posedge clk or negedge rstn) begin
    if(!rstn) begin
        ls_entry <= 0;
    end
    else if(ls_w_vld & de_oitf_ls_type) begin
        ls_entry <= de_oitf_rd_idx;
    end
end

always@(posedge clk or negedge rstn) begin
    if(!rstn) begin
        ls_cmt_flag <= 1'b1;
    end
    else if(ls_w_vld&&de_oitf_ls_type) begin
        ls_cmt_flag <= 1'b0;
    end
    else if(wb_oitf_ls_flag || wb_oitf_ls_fake) begin
        ls_cmt_flag <= 1'b1;
    end
end

always@(posedge clk or negedge rstn) begin
    if(!rstn) begin
        ls_full <= 1'b0;
    end
    else if(ls_w_vld ) begin
        ls_full <= 1'b1;
    end
    else if(wb_oitf_ls_flag || wb_oitf_ls_fake || wb_oitf_store_fake_vld || wb_oitf_store_cmt_vld) begin
        ls_full <= 1'b0;
    end
end

assign ls_empty = ls_cmt_flag ;


assign ls_index_out = ls_entry;

///////////////////////////data related problem////////////////////////////

//alu
reg  [SINGLE_DEPTH-1:0]  alu_current_ins_related_flag;

integer alu_i;

always@(posedge clk or negedge rstn) begin
    if(!rstn) begin
        for (alu_i=0; alu_i<SINGLE_DEPTH; alu_i=alu_i+1) begin
            alu_current_ins_related_flag[alu_i] <= 1'b0;
        end
    end
    else if(de_oitf_inst_vld_ori) begin
        for (alu_i=0; alu_i<SINGLE_DEPTH; alu_i=alu_i+1) begin
            alu_current_ins_related_flag[alu_i] <=(de_oitf_rs1_idx == alu_fifo[alu_i] && de_oitf_rs1en && alu_cmt_flag[alu_i] == 0) || 
                                                  (de_oitf_rs2_idx == alu_fifo[alu_i] && de_oitf_rs2en && alu_cmt_flag[alu_i] == 0) || 
                                                  (de_oitf_rd_idx  == alu_fifo[alu_i] && de_oitf_wen   && alu_cmt_flag[alu_i] == 0)  ;

        end
    end
end


integer i;
always@(*) begin
    for (i=0; i<SINGLE_DEPTH; i=i+1) begin
        alu_related_each[i] =(de_oitf_rs1_idx == alu_fifo[i] && de_oitf_rs1en && alu_cmt_flag[i] == 0) || 
                             (de_oitf_rs2_idx == alu_fifo[i] && de_oitf_rs2en && alu_cmt_flag[i] == 0) || 
                             (de_oitf_rd_idx  == alu_fifo[i] && de_oitf_wen   && alu_cmt_flag[i] == 0)  ;

       end
end
/////////////  ALU_TEST WIRE  begin //////////////////////
wire        test_0 ;
wire [4:0]  fifo_0 ;

assign fifo_0 =  alu_fifo[0];
assign test_0 = (de_oitf_rs1_idx == fifo_0) & (alu_cmt_flag[0] == 0 ) ;

wire        test_1 ;
wire [4:0]  fifo_1 ;

assign fifo_1 =  alu_fifo[1];
assign test_1 = (de_oitf_rs1_idx == fifo_1) & (alu_cmt_flag[1] == 0 ) ;

wire        test_2 ;
wire [4:0]  fifo_2 ;

assign fifo_2 =  alu_fifo[2];
assign test_2 = (de_oitf_rs1_idx == fifo_2) & (alu_cmt_flag[2] == 0 ) ;

wire        test_3 ;
wire [4:0]  fifo_3 ;

assign fifo_3 =  alu_fifo[3];
assign test_3 = (de_oitf_rs1_idx == fifo_3) & (alu_cmt_flag[3] == 0 ) ;



assign alu_related = |alu_related_each & ( (|alu_current_ins_related_flag) | de_oitf_inst_vld_ori )  ;

wire aaaa;

assign aaaa  = ( (|alu_current_ins_related_flag) | de_oitf_inst_vld_ori );

/////////////  ALU_TEST WIRE  end //////////////////////

//csr

reg  [SINGLE_DEPTH-1:0]  csr_current_ins_related_flag;

integer csr_i;

always@(posedge clk or negedge rstn) begin
    if(!rstn) begin
        for (csr_i=0; csr_i<SINGLE_DEPTH; csr_i=csr_i+1) begin
            csr_current_ins_related_flag[csr_i] <= 1'b0;
        end
    end
    else if(de_oitf_inst_vld_ori) begin
        for (csr_i=0; csr_i<SINGLE_DEPTH; csr_i=csr_i+1) begin
            csr_current_ins_related_flag[csr_i] <=(de_oitf_csr_idx == csr_fifo[csr_i] && de_oitf_csr && csr_cmt_flag[csr_i] == 0);
        end
    end
end

integer j;
always@(*) begin
    for (j=0; j<SINGLE_DEPTH; j=j+1) begin
        csr_related_each[j] =(de_oitf_csr_idx == csr_fifo[j] && de_oitf_csr && csr_cmt_flag[j] == 0);
    end
end

assign csr_related = |csr_related_each & ( (|csr_current_ins_related_flag) | de_oitf_inst_vld_ori )  ;

/////////////  CSR_TEST WIRE  begin //////////////////////
wire        test_csr_0 ;
wire [4:0]  fifo_csr_0 ;

assign fifo_csr_0 =  csr_fifo[0];
assign test_csr_0 = (de_oitf_rs1_idx == fifo_csr_0) & (csr_cmt_flag[0] == 0 ) ;

wire        test_csr_1 ;
wire [4:0]  fifo_csr_1 ;

assign fifo_csr_1 =  csr_fifo[1];
assign test_csr_1 = (de_oitf_rs1_idx == fifo_csr_1) & (csr_cmt_flag[1] == 0 ) ;

wire        test_csr_2 ;
wire [4:0]  fifo_csr_2 ;

assign fifo_csr_2 =  csr_fifo[2];
assign test_csr_2 = (de_oitf_rs1_idx == fifo_csr_2) & (csr_cmt_flag[2] == 0 ) ;

wire        test_csr_3 ;
wire [4:0]  fifo_csr_3 ;

assign fifo_csr_3 =  csr_fifo[3];
assign test_csr_3 = (de_oitf_rs1_idx == fifo_csr_3) & (csr_cmt_flag[3] == 0 ) ;





//mul
reg  [MUL_DEPTH-1:0]  mul_current_ins_related_flag;

integer mul_i;

always@(posedge clk or negedge rstn) begin
    if(!rstn) begin
        for (mul_i=0; mul_i<MUL_DEPTH; mul_i=mul_i+1) begin
            mul_current_ins_related_flag[mul_i] <= 1'b0;
        end
    end
    else if(de_oitf_inst_vld_ori) begin
        for (mul_i=0; mul_i<MUL_DEPTH; mul_i=mul_i+1) begin
            mul_current_ins_related_flag[mul_i] <=(de_oitf_rs1_idx == mul_fifo[mul_i] && de_oitf_rs1en && mul_cmt_flag[mul_i] == 0) || 
                                                  (de_oitf_rs2_idx == mul_fifo[mul_i] && de_oitf_rs2en && mul_cmt_flag[mul_i] == 0) || 
                                                  (de_oitf_rd_idx  == mul_fifo[mul_i] && de_oitf_wen   && mul_cmt_flag[mul_i] == 0)  ;

        end
    end
end

integer l;

always@(*) begin
    for (l=0; l<MUL_DEPTH; l=l+1) begin
        mul_related_each[l] =(de_oitf_rs1_idx == mul_fifo[l]  && de_oitf_rs1en  && mul_cmt_flag[l] == 0) || 
                             (de_oitf_rs2_idx == mul_fifo[l]  && de_oitf_rs2en  && mul_cmt_flag[l] == 0) || 
                             (de_oitf_rd_idx  == mul_fifo[l]  && de_oitf_wen    && mul_cmt_flag[l] == 0)  ;
    end
end

assign mul_related = |mul_related_each & ( (|mul_current_ins_related_flag) | de_oitf_inst_vld_ori )  ;

//TEST WIRE
wire mul_rd0;
wire mul_rd1;
wire mul_rd2;
wire mul_rd3;
wire mul_rd4;
wire mul_rd5;
wire mul_rd6;
assign        mul_rd0 =(de_oitf_rd_idx == mul_fifo[0]  && de_oitf_wen  && mul_cmt_flag[0] == 0) ;
assign        mul_rd1 =(de_oitf_rd_idx == mul_fifo[1]  && de_oitf_wen  && mul_cmt_flag[1] == 0) ;
assign        mul_rd2 =(de_oitf_rd_idx == mul_fifo[2]  && de_oitf_wen  && mul_cmt_flag[2] == 0) ;
assign        mul_rd3 =(de_oitf_rd_idx == mul_fifo[3]  && de_oitf_wen  && mul_cmt_flag[3] == 0) ;
assign        mul_rd4 =(de_oitf_rd_idx == mul_fifo[4]  && de_oitf_wen  && mul_cmt_flag[4] == 0) ;
assign        mul_rd5 =(de_oitf_rd_idx == mul_fifo[5]  && de_oitf_wen  && mul_cmt_flag[5] == 0) ;
assign        mul_rd6 =(de_oitf_rd_idx == mul_fifo[6]  && de_oitf_wen  && mul_cmt_flag[6] == 0) ;

wire mul_rs1_0;
wire mul_rs1_1;
wire mul_rs1_2;
wire mul_rs1_3;
wire mul_rs1_4;
wire mul_rs1_5;
wire mul_rs1_6;

assign        mul_rs1_0 =(de_oitf_rs1_idx == mul_fifo[0]  && de_oitf_rs1en  && mul_cmt_flag[0] == 0) ;
assign        mul_rs1_1 =(de_oitf_rs1_idx == mul_fifo[1]  && de_oitf_rs1en  && mul_cmt_flag[1] == 0) ;
assign        mul_rs1_2 =(de_oitf_rs1_idx == mul_fifo[2]  && de_oitf_rs1en  && mul_cmt_flag[2] == 0) ;
assign        mul_rs1_3 =(de_oitf_rs1_idx == mul_fifo[3]  && de_oitf_rs1en  && mul_cmt_flag[3] == 0) ;
assign        mul_rs1_4 =(de_oitf_rs1_idx == mul_fifo[4]  && de_oitf_rs1en  && mul_cmt_flag[4] == 0) ;
assign        mul_rs1_5 =(de_oitf_rs1_idx == mul_fifo[5]  && de_oitf_rs1en  && mul_cmt_flag[5] == 0) ;
assign        mul_rs1_6 =(de_oitf_rs1_idx == mul_fifo[6]  && de_oitf_rs1en  && mul_cmt_flag[6] == 0) ;

wire [4:0] mul_fifo_0;
wire [4:0] mul_fifo_1;
wire [4:0] mul_fifo_2;
wire [4:0] mul_fifo_3;
wire [4:0] mul_fifo_4;
wire [4:0] mul_fifo_5;
wire [4:0] mul_fifo_6;

assign mul_fifo_0 = mul_fifo[0];
assign mul_fifo_1 = mul_fifo[1];
assign mul_fifo_2 = mul_fifo[2];
assign mul_fifo_3 = mul_fifo[3];
assign mul_fifo_4 = mul_fifo[4];
assign mul_fifo_5 = mul_fifo[5];
assign mul_fifo_6 = mul_fifo[6];



//div
reg                   div_current_ins_related_flag;

always@(posedge clk or negedge rstn) begin
    if(!rstn) begin
            div_current_ins_related_flag <= 1'b0;
    end
    else if(de_oitf_inst_vld_ori) begin
            div_current_ins_related_flag <=(de_oitf_rs1_idx == div_entry && de_oitf_rs1en && div_cmt_flag == 0) || 
                                           (de_oitf_rs2_idx == div_entry && de_oitf_rs2en && div_cmt_flag == 0) || 
                                           (de_oitf_rd_idx  == div_entry && de_oitf_wen   && div_cmt_flag == 0)  ;

    end
end



assign div_related = (de_oitf_rs1_idx == div_entry   && de_oitf_rs1en && div_cmt_flag == 0) || 
                     (de_oitf_rs2_idx == div_entry   && de_oitf_rs2en && div_cmt_flag == 0) || 
                     (de_oitf_rd_idx  == div_entry   && de_oitf_wen   && div_cmt_flag == 0) &( div_current_ins_related_flag | de_oitf_inst_vld_ori ) ;
                 
//ls

reg                   ls_current_ins_related_flag;

always@(posedge clk or negedge rstn) begin
  if(!rstn) begin
    ls_current_ins_related_flag <= 1'b0;
  end
  else if(de_oitf_inst_vld_ori) begin
    ls_current_ins_related_flag <=(de_oitf_rs1_idx == ls_entry && de_oitf_rs1en && ls_cmt_flag == 0) || 
                                  (de_oitf_rs2_idx == ls_entry && de_oitf_rs2en && ls_cmt_flag == 0) || 
                                  (de_oitf_rd_idx  == ls_entry && de_oitf_wen   && ls_cmt_flag == 0)  ;

  end
end

assign ls_related  = (de_oitf_rs1_idx == ls_entry   && de_oitf_rs1en  && ls_cmt_flag == 0) || 
                     (de_oitf_rs2_idx == ls_entry   && de_oitf_rs2en  && ls_cmt_flag == 0) || 
                     (de_oitf_rd_idx  == ls_entry   && de_oitf_wen    && ls_cmt_flag == 0)  &( ls_current_ins_related_flag | de_oitf_inst_vld_ori ) ;

////////////////////////////output to control //////////////////////////
assign related_1_source = alu_related || csr_related || mul_related || div_related || ls_related;



assign related_2_flag =   ((de_oitf_alu && alu_full) ||
                           (de_oitf_csr && csr_full) ||
                           (de_oitf_mul && mul_full) ||
                           (de_oitf_div && div_full) ||
                           (de_oitf_ls  && ls_full ));

always @(posedge clk or negedge rstn) begin
  if(!rstn)
    related_2_source <= 1'b0 ;
  else if(de_oitf_inst_vld_ori&&related_2_flag) 
    related_2_source <= 1'b1 ;
  else if(de_oitf_inst_vld_ori && (!related_2_flag ))
    related_2_source <= 1'b0 ;
end




                           
assign oitf_ctrl_related = related_1_source || (related_2_flag &&(related_2_source |de_oitf_inst_vld_ori)) ;
//assign oitf_ctrl_related = related_1_source || related_2_flag ;

//oitf store case ,this ins need not to add to oitf,but it will use for empty judgement
reg [2:0]  oitf_store_ins_cnt;

always @(posedge clk or negedge rstn) begin
    if(!rstn)begin
        oitf_store_ins_cnt <= 3'd0 ;
    end
    else if(de_oitf_store_vld)begin
        oitf_store_ins_cnt <= oitf_store_ins_cnt + 3'd1 ;
    end
    else if(wb_oitf_store_cmt_vld ^ wb_oitf_store_fake_vld)begin
        oitf_store_ins_cnt <= oitf_store_ins_cnt - 3'd1 ;
    end
    else if(wb_oitf_store_cmt_vld & wb_oitf_store_fake_vld)begin
        oitf_store_ins_cnt <= oitf_store_ins_cnt - 3'd2 ;
    end
end

assign oitf_ctrl_empty   = alu_empty && csr_empty && mul_empty && div_empty && ls_empty && (oitf_store_ins_cnt == 3'd0);

assign oitf_checker_empty  = oitf_ctrl_empty ;

always@(*) begin
    if(wb_oitf_alu_flag) begin
        oitf_gpr_index = alu_index_out;
    end
    else if(wb_oitf_mul_flag) begin
        oitf_gpr_index = mul_index_out;
    end
    else if(wb_oitf_div_flag) begin
        oitf_gpr_index = div_index_out;
    end
    else begin //ls index
        oitf_gpr_index = ls_index_out;
    end
end

assign oitf_csr_index = csr_index_out;

endmodule