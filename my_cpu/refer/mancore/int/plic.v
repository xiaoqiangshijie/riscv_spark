//-----------------------------------------------------------------------------------
//
//-----------------------------------------------------------------------------------
//File          : plic.v
//Author        : fengyi
//Date          : 7/27/2021
//Version       : 0.1
//Description   : this file is plic module in int_top module.
//-----------------------------------------------------------------------------------
//Modiication history:
//Date           By            Version           Change Description
//07/27/2021     fengyi        0.1               Interrupt LEVELS configurable
//                                               Support nesting
//-----------------------------------------------------------------------------------


module plic #(
  parameter EXT_IRQ_NUM = 31,                          //number of external interrupts
  parameter PRIO_WIDTH  = 3                            //bit width of priority
)(
  input   clk  ,
  input   rstn ,

// external interrupt signals
  input      [EXT_IRQ_NUM:0]  ext_plic_irq            , //ext_plic_irq[0] = 1'b0
  
//with regfile
  output     [EXT_IRQ_NUM:0]  plic_reg_gate           , //the gate signals to change ip regs in regfile
  output     [7:0]            final_id                , //the final interrupt id after arbitration, but has not compared with threshold and claim interrupt yet
  input      [EXT_IRQ_NUM:0]  ip_r                    , //the total ip value of all interrupt require for target 0 
  input      [EXT_IRQ_NUM:0]  ie_r                    , //the total ie value of all interrupt pending for target 0
  input      [PRIO_WIDTH*(EXT_IRQ_NUM+1)-1:0] prio_r_1d     , //one dementional
//  input      [PRIO_WIDTH-1:0] prio_r [EXT_IRQ_NUM:0]  , //the total prioity value of all interrupt requires
  input      [PRIO_WIDTH-1:0] threshold_r             , //the value of target 0 's threshold
  input      [7:0]            claim_id                , //the claiming interrupt id 
  input      [7:0]            cmplt_id                , //the value of cmplt interrupt id

//final external interrupt signal
  output                      ext_irq
);
 
function integer clog2;
  input integer value;
  begin
    value = value -1;
    for (clog2=0; value>0; clog2=clog2+1)
      value = value>>1;
  end
endfunction

  localparam LEVELS        = clog2(EXT_IRQ_NUM+1)                  ; //arbitration LEVELS
  localparam EXT_IRQ_NUM_E = EXT_IRQ_NUM+(EXT_IRQ_NUM %2)          ; //odd +0 ,even +1, to make sure ext_irq_num+2 is an odd number

  reg  [PRIO_WIDTH-1:0]                   prio_r [EXT_IRQ_NUM:0]   ;
  reg  [EXT_IRQ_NUM :0]                   cmplt                    ; //cmplt signals of all interrupt for gates                                      
  reg  [PRIO_WIDTH-1:0]                   prio_tmp [EXT_IRQ_NUM:0] ;
  reg  [7:0]                              id_tmp   [EXT_IRQ_NUM:0] ;

  wire [PRIO_WIDTH*(EXT_IRQ_NUM_E+1)-1:0] prio_arb [LEVELS:0]      ;
  wire [8*(EXT_IRQ_NUM_E+1)-1         :0] id_arb   [LEVELS:0]      ;

  wire [PRIO_WIDTH-1:0]                   final_prio               ; 

  integer q;
  always@(*) begin
      for(q=0; q<=EXT_IRQ_NUM; q=q+1) begin
          prio_r[q] = prio_r_1d[q*PRIO_WIDTH +: PRIO_WIDTH];
      end
  end

//cmplt id for gate to refresh
integer x;
  always@(*) begin
    for (x=0; x<=EXT_IRQ_NUM;x=x+1) begin
      if(x==cmplt_id) begin
        cmplt[x] = 1'b1;
      end
      else begin
        cmplt[x] = 1'b0;
      end
    end
  end

//gate for each id
  genvar l;

  generate
    for (l=0; l<=EXT_IRQ_NUM; l=l+1) begin:GATE_DFF
      gate gate(
        .clk(clk),
        .rstn(rstn),
        .ext_irq(ext_plic_irq[l]),
        .cmplt(cmplt[l]),
        .gate(plic_reg_gate[l])
      );
    end
  endgenerate

//priority after gate, pending and enable regs
integer y;
  always@(*) begin
    for (y=0; y<=EXT_IRQ_NUM; y=y+1) begin
      prio_tmp[y] = (ip_r[y] && ie_r[y]) ? prio_r[y] : 0;
      id_tmp[y] = y;
    end 
  end

//id array
//  always@(*) begin
//    for (int i=0; i<=EXT_IRQ_NUM; i++) begin
//      id_tmp[i] = i;
//    end
//  end

//arbitration process
genvar i;
genvar j;

generate
  if(EXT_IRQ_NUM == EXT_IRQ_NUM_E) begin                              //dont need extent width
    for(i=0; i<=EXT_IRQ_NUM; i=i+1) begin:GEN
      assign prio_arb[0][i*PRIO_WIDTH +: PRIO_WIDTH] = prio_tmp[i];
      assign   id_arb[0][i*8 +: 8]                   = id_tmp[i]  ;
    end
  end
  else begin                                                          //need extent width
    for(i=0; i<=EXT_IRQ_NUM; i=i+1) begin:GEN
      assign prio_arb[0][i*PRIO_WIDTH +: PRIO_WIDTH] = prio_tmp[i];
      assign   id_arb[0][i*8 +: 8]                   = id_tmp[i]  ;
    end

    for(i=EXT_IRQ_NUM_E; i<=EXT_IRQ_NUM_E; i=i+1) begin:GEN_HIGHEST_POS  //extent 1 bit width
      assign prio_arb[0][i*PRIO_WIDTH +: PRIO_WIDTH] = {PRIO_WIDTH{1'b0}};
      assign   id_arb[0][i*8 +: 8]                   = 8'b0              ;
    end
  end

  for(j=1; j<=LEVELS; j=j+1) begin:ARB
    for(i=0; i<(EXT_IRQ_NUM/(2**(j-1))+1)/2; i=i+1) begin:ARB
      compare #(.WIDTH(PRIO_WIDTH)) compare(
          .clk  (clk),
          .prio0(prio_arb[j-1][ 2*i*PRIO_WIDTH     +: PRIO_WIDTH]),
          .prio1(prio_arb[j-1][(2*i+1)*PRIO_WIDTH  +: PRIO_WIDTH]),
          .id0  (  id_arb[j-1][ 2*i*8              +: 8         ]),
          .id1  (  id_arb[j-1][(2*i+1)*8           +: 8         ]),
          .prio (prio_arb[j  ][ i*PRIO_WIDTH       +: PRIO_WIDTH]),
          .id   (  id_arb[j  ][ i*8                +: 8         ])
          );
    end

    for(i=(EXT_IRQ_NUM/(2**(j-1))+1)/2; i<(EXT_IRQ_NUM/(2**(j-1))+1)/2+1; i=i+1) begin:UNARB            //move first bit data not participate in arbitration to next level
      assign prio_arb[j][i*PRIO_WIDTH +: PRIO_WIDTH] = prio_arb[j-1][2*i*PRIO_WIDTH  +:  PRIO_WIDTH];
      assign   id_arb[j][i*8          +: 8         ] =   id_arb[j-1][2*i*8           +:  8         ];
    end
    for(i=(EXT_IRQ_NUM/(2**(j-1))+1)/2+1; i<(EXT_IRQ_NUM/(2**(j-1))+1)/2+2; i=i+1) begin:FILL_ZERO      //add zero whatever
      assign prio_arb[j][i*PRIO_WIDTH +: PRIO_WIDTH] = {PRIO_WIDTH{1'b0}};
      assign   id_arb[j][i*8          +: 8         ] = 8'b0              ;
    end
  end

endgenerate

//fianal priority and final id
  assign final_prio = prio_arb[LEVELS-1][0 +: PRIO_WIDTH];
  assign final_id   =   id_arb[LEVELS-1][7 :  0         ];
 
//external interrupt signal for int_ctrl module
  assign ext_irq = (final_prio > threshold_r) && (final_prio > prio_r[claim_id]);

endmodule



