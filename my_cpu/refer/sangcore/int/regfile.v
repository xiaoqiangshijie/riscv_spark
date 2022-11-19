//-----------------------------------------------------------------------------------
//
//-----------------------------------------------------------------------------------
//File          : regfile.v
//Author        : fengyi
//Date          : 7/28/2021
//Version       : 0.1
//Description   : this file is regfile module in interrupt module.
//-----------------------------------------------------------------------------------
//Modiication history:
//Date           By            Version           Change Description
//07/28/2021     fengyi        0.1               
//08/06/2021     fengyi        0.1               add comments                                          
//-----------------------------------------------------------------------------------

module regfile #(
  parameter EXT_IRQ_NUM = 31,                          //number of external interrupts
  parameter PRIO_WIDTH  = 3                            //bit width of priority
)(
  input                       clk                     ,
  input                       rstn                    ,

//with csr
  input                       counterstop             , //counterstop signal from csr to stop count0 and count1

//with ahbl_slave_if
  input                       if_reg_wr               ,
  input                       if_reg_en               ,
  input      [31:0]           if_reg_wdata            ,
  input      [31:0]           if_reg_addr             ,
  output reg [31:0]           reg_if_rdata            ,

//with plic
  input      [EXT_IRQ_NUM: 0] plic_reg_gate           , //gate signals to verify ip regs
  input      [7:0]            final_id                , //final priority id after arbitration
  output     [EXT_IRQ_NUM: 0] ip_r                    , //the total ip value of all interrupt require in target 0 
  output     [EXT_IRQ_NUM: 0] ie_r                    , //the total ie value of all interrupt require in target 0
//  output     [PRIO_WIDTH-1:0] prio_r [EXT_IRQ_NUM:0]  , //the total prioity value of all interrupt require
  output reg [PRIO_WIDTH *(EXT_IRQ_NUM+1)-1:0] prio_r_1d   ,
  output     [PRIO_WIDTH-1:0] threshold_r             , //the value of target 0 's threshold
  output reg [7:0]            claim_id                , //the claiming interrupt id 
  output     [7:0]            cmplt_id                , //the completed id from software to open gate corresponding to this id

//with clint
  input                       trigger_edge            , //trigger signals for counting
  output     [31:0]           count0                  , //low 32 bits of count
  output     [31:0]           count1                  , //high 32 bits of count
  output     [31:0]           countcmp0               , //low 32 bits of countcmp
  output     [31:0]           countcmp1               , //high 32 bits of countcmp
  output     [31:0]           msip                      //msip register for soft interrupt    
  );

  localparam IDLE      = 0  ; //address region of regs
  localparam IP        = 1  ;
  localparam IE        = 2  ;
  localparam PRIO      = 3  ;
  localparam THRESHOLD = 4  ;
  localparam CLAIM     = 5  ;
  localparam CMPLT     = 6  ;
  localparam COUNT0    = 7  ;
  localparam COUNT1    = 8  ;
  localparam COUNTCMP0 = 9  ;
  localparam COUNTCMP1 = 10 ;
  localparam MSIP      = 11 ;

  wire [PRIO_WIDTH-1:0] prio_r [EXT_IRQ_NUM:0]     ;
//select signals
  wire [EXT_IRQ_NUM:0]  sel_ip                     ;  //region of N ip regs
  wire [7:0]            sel_ie                     ;  //region of 8 ie regs
  wire [EXT_IRQ_NUM:0]  sel_prio                   ;  //region of N prio regs
  wire                  sel_threshold              ;  //only one reg below
  wire                  sel_cmplt                  ;
  wire                  sel_0_countcmp             ;
  wire                  sel_1_countcmp             ;
  wire                  sel_msip                   ;

  reg  [3:0]            sel                        ;  //state of sel

  wire [7:0]            rdata_idx_ip               ;  //binary index of ip registers
  wire [7:0]            rdata_idx_prio             ;  //binary index of priority registers
  wire [2:0]            rdata_idx_ie               ;  //binary index of ie registers

  wire [31:0]           ie     [7:0]               ;  //value of 8 ie regs
  wire [255:0]          ie_r_tmp                   ;  //256 bits consists of 8 ie regs

  wire [31:0]           prio   [EXT_IRQ_NUM:0]     ;  //value of all prio regs

  wire [31:0]           threshold                  ;  //value of target 0 's threshold

  wire [31:0]           claim                      ;  // value of claim reg
  wire                  claim_ena                  ;  // enable signal to verify claim regs
  wire [31:0]           final_id_e                 ;  // 32 bits final priority signal
  reg  [EXT_IRQ_NUM:0]  claim_all                  ;  // all interrupt sourses claim signals

  wire [31:0]           cmplt                      ;  // value of complete register

  wire                  count1_trigger             ;  // the trigger signal of count1 reg

  genvar i;

//read process addr select
always@(*) begin
  if     (if_reg_addr>=32'hf000_0000 && if_reg_addr<32'hf000_4000) begin
    sel = PRIO;
  end
  else if(if_reg_addr>=32'hf000_4000 && if_reg_addr<32'hf000_8000) begin
    sel = IP;
  end 
  else if(if_reg_addr>=32'hf000_8000 && if_reg_addr<32'hf000_8020) begin
    sel = IE;
  end
  else if(if_reg_addr == 32'hf001_0000) begin
    sel = THRESHOLD;
  end
  else if(if_reg_addr == 32'hf001_0004) begin
    sel = CLAIM;
  end
  else if(if_reg_addr == 32'hf001_0008) begin
    sel = CMPLT;
  end
  else if(if_reg_addr == 32'hf020_0000) begin
    sel = COUNT0;
  end
  else if(if_reg_addr == 32'hf020_0004) begin
    sel = COUNT1;
  end
  else if(if_reg_addr == 32'hf020_0008) begin
    sel = COUNTCMP0;
  end
  else if(if_reg_addr == 32'hf020_000C) begin
    sel = COUNTCMP1;
  end
  else if(if_reg_addr == 32'hf020_0010) begin
    sel = MSIP;
  end
  else begin
    sel = IDLE;
  end
end

  assign rdata_idx_prio = if_reg_addr[9:2] ;
  assign rdata_idx_ip   = if_reg_addr[9:2] ;
  assign rdata_idx_ie   = if_reg_addr[4:2] ;

//regs
generate 
//inst ip  1 bit
  for(i=0; i<=EXT_IRQ_NUM; i=i+1) begin:IP_REG
    ip_dff ip_d(
      .clk (clk)              ,
      .rstn(rstn)             ,
      .reg_rdata(ip_r[i])     ,
      .gate(plic_reg_gate[i]) ,
      .claim(claim_all[i])
    );
  end

//inst ie  32 bits
  for(i=0; i<=7; i=i+1) begin:IE_REG
    assign sel_ie[i] = (if_reg_addr == 32'hf000_8000 + 32'h4 * i);
    rw_dff ie_d(
      .clk (clk)               ,
      .rstn(rstn)              ,
      .reg_en(if_reg_en)       ,
      .reg_addr(if_reg_addr)   ,
      .reg_wr(if_reg_wr)       ,
      .reg_wdata(if_reg_wdata) ,
      .reg_rdata(ie[i])        ,
      .sel (sel_ie[i])
    );
  end

  for(i=0; i<=7; i=i+1) begin:IE_R_TMP
    assign ie_r_tmp[32*i +: 32] = ie[i];
  end

//inst prio  PRIO_WIDTH
  for(i=0; i<=EXT_IRQ_NUM; i=i+1) begin:PRIO_REG
    assign sel_prio[i] = (if_reg_addr == 32'hf000_0000 + 32'h4 * i);
    rw_dff prio_d(
      .clk (clk)               ,
      .rstn(rstn)              ,
      .reg_en(if_reg_en)       ,
      .reg_addr(if_reg_addr)   ,
      .reg_wr(if_reg_wr)       ,
      .reg_wdata(if_reg_wdata) ,
      .reg_rdata(prio[i])      ,
      .sel(sel_prio[i])
    );
  end

  for(i=0; i<=EXT_IRQ_NUM; i=i+1) begin:PRIO_R
    assign prio_r[i] = prio[i][PRIO_WIDTH-1:0];
  end

endgenerate

  assign ie_r        = ie_r_tmp [EXT_IRQ_NUM :0] ;
  assign threshold_r = threshold[PRIO_WIDTH-1:0] ;
  assign final_id_e  = {24'b0,final_id}          ;

//inst threshold register
  assign sel_threshold = sel==THRESHOLD;
  rw_dff threshold_d(
    .clk(clk)                ,
    .rstn(rstn)              ,
    .reg_en(if_reg_en)       ,
    .reg_addr(if_reg_addr)   ,
    .reg_wr(if_reg_wr)       ,
    .reg_wdata(if_reg_wdata) ,
    .reg_rdata(threshold)    ,
    .sel(sel_threshold)
  );

//claim_ena
  assign claim_ena = (sel == CLAIM) && !if_reg_wr && if_reg_en;

//inst claim register
  claim_dff claim_d(
    .clk(clk)             ,
    .rstn(rstn)           ,
    .reg_rdata(claim)     ,
    .claim_ena(claim_ena) ,
    .final_id(final_id_e)
  );
  
//inst cmplt register
  assign sel_cmplt = sel==CMPLT ;
  rw_dff cmplt_d(
    .clk(clk)                ,
    .rstn(rstn)              ,
    .reg_en(if_reg_en)       ,
    .reg_addr(if_reg_addr)   ,
    .reg_wr(if_reg_wr)       ,
    .reg_wdata(if_reg_wdata) ,
    .reg_rdata(cmplt)        ,
    .sel(sel_cmplt)
  );
  assign cmplt_id = cmplt[7:0];


//claim_id and claim_all----------------------------
  always@(posedge clk) begin
    if(sel == CLAIM && !if_reg_wr && if_reg_en) begin
      claim_id <= claim[7:0];
    end
    else begin
      claim_id <= 8'b0;
    end
  end

  integer j;
  always@(*) begin                            //claim_id to onehot
    for(j=0; j<=EXT_IRQ_NUM; j=j+1) begin
      if(claim_id == j) begin
        claim_all[j] = 1'b1;
      end
      else begin
        claim_all[j] = 1'b0;
      end
    end
  end

//inst count
  count_dff count0_d(
    .clk(clk)                 ,
    .rstn(rstn)               ,
    .reg_rdata(count0)        ,
    .counterstop(counterstop) ,
    .trigger(trigger_edge)
  );

  count_dff count1_d(
    .clk(clk)                 ,
    .rstn(rstn)               ,
    .reg_rdata(count1)        ,
    .counterstop(counterstop) ,
    .trigger(count1_trigger)
  );

  assign count1_trigger = count0 == 32'hffff_ffff;

//inst countcmp
  assign sel_0_countcmp = sel==COUNTCMP0 ;
  countcmp_dff countcmp0_d(
    .clk(clk)                ,
    .rstn(rstn)              ,
    .reg_en(if_reg_en)       ,
    .reg_addr(if_reg_addr)   ,
    .reg_wr(if_reg_wr)       ,
    .reg_wdata(if_reg_wdata) ,
    .reg_rdata(countcmp0)    ,
    .sel(sel_0_countcmp)
  );

  assign sel_1_countcmp = sel==COUNTCMP1 ;
  countcmp_dff countcmp1_d(
    .clk(clk)                ,
    .rstn(rstn)              ,
    .reg_en(if_reg_en)       ,
    .reg_addr(if_reg_addr)   ,
    .reg_wr(if_reg_wr)       ,
    .reg_wdata(if_reg_wdata) ,
    .reg_rdata(countcmp1)    ,
    .sel(sel_1_countcmp)
  );

//inst msip
  assign sel_msip = sel==MSIP ;
  rw_dff msip_d(
    .clk(clk)                ,
    .rstn(rstn)              ,
    .reg_en(if_reg_en)       ,
    .reg_addr(if_reg_addr)   ,
    .reg_wr(if_reg_wr)       ,
    .reg_wdata(if_reg_wdata) ,
    .reg_rdata(msip)         ,
    .sel(sel_msip)
  );



//read data mux
  always@(posedge clk) begin
    case(sel)
      IDLE     : reg_if_rdata <= 32'b0                           ;
      IP       : reg_if_rdata <= {{31{1'b0}},ip_r[rdata_idx_ip]} ;
      IE       : reg_if_rdata <= ie_r[rdata_idx_ie]              ;
      PRIO     : reg_if_rdata <= prio[rdata_idx_prio]            ;
      THRESHOLD: reg_if_rdata <= threshold                       ;
      CLAIM    : reg_if_rdata <= claim                           ;
      CMPLT    : reg_if_rdata <= cmplt                           ;
      COUNT0   : reg_if_rdata <= count0                          ;
      COUNT1   : reg_if_rdata <= count1                          ;
      COUNTCMP0: reg_if_rdata <= countcmp0                       ;
      COUNTCMP1: reg_if_rdata <= countcmp1                       ;
      MSIP     : reg_if_rdata <= msip                            ;

      default  : reg_if_rdata <= 32'b0;
    endcase
  end
      
  integer z;  
  always@(*) begin
    for(z=0;z<=EXT_IRQ_NUM;z=z+1) begin
      prio_r_1d[z*PRIO_WIDTH +: PRIO_WIDTH] = prio_r[z];
    end
  end

endmodule


