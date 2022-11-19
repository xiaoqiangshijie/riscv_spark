//------------------------------------------------------------------
//This confidential and proprierary software may be used only as
//authorized by a licensing agrement from Orbbec Inc.
//In the event of publication, the following notice is 
//applicable:
//(c)COPYRIGHT 2013 ORBBEC INC. ALL RIGHTS RESERVED.
//The entire notice above must be reproduced on all authorized
//copies.
//------------------------------------------------------------------
//File        : handshake_rx.v
//Author      : modi
//Date        : 08/16/2021
//Version     : 0.1
//Description : This file is a handshake module to Jtag transmission
//------------------------------------------------------------------
//Modification  History:
//Date        By        Version         Change Description
//08/16/2021  modi      0.1             Original 
//------------------------------------------------------------------
module  handshake_rx(
  input         clk         ,
  input         rstn        ,
  input         req_i       ,   //from tx
  input [39:0]  req_data_i  ,   //from tx
  output        ack_o       ,   //to tx
  output[39:0]  recv_data_o ,   //to rx
  output        recv_rdy_o  
);
//-------define localparameter---------------------------------------
  localparam    IDLE    = 2'b01;
  localparam    DEASSERT= 2'b10;
//-------define internal register------------------------------------
  reg[1:0]      state     ;
  reg[1:0]      next_state;
  reg           req_d0    ;
  reg           req       ;
  reg           recv_rdy  ;
  reg           ack       ;
  reg[39:0]     recv_data ;
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
        if(req == 1'b1)
          next_state = DEASSERT ;
        else 
          next_state = IDLE     ;
      end 
      DEASSERT:begin
        if(req == 1'b0)
          next_state = IDLE     ;
        else
          next_state = DEASSERT ;
      end 
      default:
          next_state = IDLE     ;
    endcase
  end 

//-------assign------------------------------------------------------
  always@(posedge clk or negedge rstn)begin
    if(rstn == 1'b0)begin
      req_d0  <= 1'b0   ;
      req     <= 1'b0   ;
    end 
    else begin 
      req_d0  <= req_i  ;
      req     <= req_d0 ;
    end 
  end 

  always@(posedge clk or negedge rstn)begin
    if(rstn == 1'b0)begin
      ack       <= 1'b0     ;
      recv_rdy  <= 1'b0     ;
    end 
    else 
      case(state)
        IDLE:begin
          if(req == 1'b1)begin
            ack       <= 1'b1       ;
            recv_rdy  <= 1'b1       ;
            recv_data <= req_data_i ;
          end
        end 
        DEASSERT:begin
          recv_rdy    <= 1'b0       ;
          if(req == 1'b0)
            ack       <= 1'b0       ;
        end         
      endcase
  end 

  assign  ack_o       = ack       ;
  assign  recv_rdy_o  = recv_rdy  ;
  assign  recv_data_o = recv_data ;
endmodule 
