//-----------------------------------------------------------------------------------
//
//-----------------------------------------------------------------------------------
//File          : clint.v
//Author        : fengyi
//Date          : 7/27/2021
//Version       : 0.1
//Description   : this file is clint module in int_top module.
//-----------------------------------------------------------------------------------
//Modiication history:
//Date           By            Version           Change Description
//07/27/2021     fengyi        0.1               responsible for timing, 
//                                               generate software interrupt and
//                                               and timer interrupt
//                                               
//                                              
//-----------------------------------------------------------------------------------

module clint(
  input        clk  ,
  input        rstn ,

//with regfile
  input [63:0] count        ,    //high 32 bits of count
  input [63:0] countcmp     ,    //low 32 bits of countcmp
  input [63:0] msip         ,    //msip value for software interrupt
  output       trigger_edge ,    //trigger_edge for counting

//with timer
  input        trigger      ,    //always on clk trigger signal

//with int_ctrl
  output  reg  tmr_irq      ,
  output  reg  sft_irq  
);
  

  reg        trigger_1_r    ;
  reg        trigger_2_r    ;
  reg        trigger_3_r    ;

  

//trigger sync and find edge
  always@(posedge clk) begin                        //sync-------------------------------
    trigger_1_r <= trigger; 
    trigger_2_r <= trigger_1_r;
  end

  always@(posedge clk) begin
    trigger_3_r <= trigger_2_r; 
  end

  assign trigger_edge = trigger_3_r ^ trigger_2_r;  //posedge and negedge of trigger

//interrupt generation
  always@(posedge clk) begin
    if(count >= countcmp) begin
      tmr_irq <= 1'b1;
    end
    else begin
      tmr_irq <= 1'b0;
    end
  end

  always@(posedge clk) begin
    if(msip[0]) begin
      sft_irq <= 1'b1;
    end
    else begin
      sft_irq <= 1'b0;
    end
  end

endmodule
