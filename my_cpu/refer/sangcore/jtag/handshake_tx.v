//------------------------------------------------------------------
//This confidential and proprierary software may be used only as
//authorized by a licensing agrement from Orbbec Inc.
//In the event of publication, the following notice is 
//applicable:
//(c)COPYRIGHT 2013 ORBBEC INC. ALL RIGHTS RESERVED.
//The entire notice above must be reproduced on all authorized
//copies.
//------------------------------------------------------------------
//File        : handshake_tx.v
//Author      : modi
//Date        : 08/16/2021
//Version     : 0.1
//Description : This file is a handshake module to Jtag transmission
//------------------------------------------------------------------
//Modification  History:
//Date        By        Version         Change Description
//08/16/2021  modi      0.1             Original 
//------------------------------------------------------------------
module  handshake_tx(
  input             clk         ,
  input             rstn        ,
  input             ack_i       ,
  input             req_i       ,
  input [39:0]      req_data_i  ,
  output            idle_o      ,
  output            req_o       ,
  output[39:0]      req_data_o  
);
//-------define local parameter--------------------------------------
  localparam        IDLE    = 3'b001;
  localparam        ASSERT  = 3'b010;
  localparam        DEASSERT= 3'b100;
//-------define internal register------------------------------------
  reg[2:0]          state       ;
  reg[2:0]          next_state  ;
  reg               ack_d0      ;
  reg               ack         ;
  reg               req         ;
  reg               idle_d0     ;
  reg[39:0]         req_data    ;
//-------state change------------------------------------------------
  always@(posedge clk or negedge rstn)begin 
    if(rstn == 1'b0)
      state <= IDLE       ; 
    else 
      state <= next_state ;  
  end 

  always@(*)begin 
    case(state)
    IDLE:begin 
      if(req_i == 1'b1)
        next_state <= ASSERT;
      else 
        next_state <= IDLE  ;
    end 
    ASSERT:begin
      if(ack == 1'b1)
        next_state <= DEASSERT;
      else 
        next_state <= ASSERT  ;
    end 
    DEASSERT:begin
      if(ack == 1'b1)
        next_state <= DEASSERT;
      else 
        next_state <= IDLE    ;
    end 
    default:
        next_state <= IDLE    ;
    endcase
  end 
//-------assign------------------------------------------------------
  always@(posedge clk or negedge rstn)begin 
    if(rstn == 1'b0)begin 
      ack_d0 <= 1'b0;
      ack    <= 1'b0;
    end 
    else begin 
      ack_d0 <= ack_i ;
      ack    <= ack_d0;
    end 
  end 

  always@(posedge clk or negedge rstn)begin  
    if(rstn == 1'b0)begin 
      idle_d0<= 1'b1    ;
      req    <= 1'b0    ;
    end 
    else begin 
      case(state)
        IDLE:begin 
          if(req_i == 1'b1)begin 
            idle_d0   <= 1'b0      ;
            req      <= req_i     ;
            req_data <= req_data_i;
          end 
          else begin 
            idle_d0   <= 1'b1      ;
            req      <= 1'b0      ;
          end 
        end 
        ASSERT:begin 
          if(ack == 1'b1) 
            req       <= 1'b0     ;
          end 
        DEASSERT:begin
          if(ack == 1'b0)
            idle_d0    <= 1'b1     ;
        end 
      endcase
    end 
 end

 assign   idle_o    = idle_d0 ;
 assign   req_o     = req     ;
 assign   req_data_o= req_data;
endmodule 


            


     




