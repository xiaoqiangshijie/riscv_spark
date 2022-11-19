//------------------------------------------------------------------
//This confidential and proprierary software may be used only as
//authorized by a licensing agrement from Orbbec Inc.
//In the event of publication, the following notice is 
//applicable:
//(c)COPYRIGHT 2013 ORBBEC INC. ALL RIGHTS RESERVED.
//The entire notice above must be reproduced on all authorized
//copies.
//------------------------------------------------------------------
//File        : jtag_top.v
//Author      : kasi & modi
//Date        : 08/03/2021
//Version     : 0.1
//Description : This file is DTM module for JTAG master
//------------------------------------------------------------------
//Modification  History:
//Date        By        Version         Change Description
//08/03/2021  kasi      0.1             Original
//08/10/2021  modi      0.2             continue DTM module design 
module  dtm(
  input           jtag_pin_tck      ,
  input           jtag_pin_tms      ,
  input           jtag_pin_tdi      ,
  input           jtag_pin_trst     ,
  output          jtag_pin_tdo      ,
  input           rstn              , 
  input           dm_dtm_req        ,//from tx of dm module,to rx of dtm
  input[39:0]     dm_dtm_data       ,//from tx of dm module,to rx of dtm
  input           dm_dtm_ack        ,//from rx of dm module,to tx of dtm
  output          dtm_dm_req        ,//from tx of dtm module,to rx of dm
  output[39:0]    dtm_dm_data       ,//from tx of dtm module,to rx of dm
  output          dtm_dm_ack         //from rx of dtm module,to tx of dm
);
//-------define parameter--------------------------------------------
  //read only localparam
  localparam OP_WIDTH           = 2'd2  ;
  localparam IDCODE_VERSION     = 4'h0  ;
  localparam IDCODE_PART_NUMBER = 16'h0 ;
  localparam IDCODE_MANFID      = 11'h0 ;
  localparam DTM_VERSION        = 4'h1  ;
  //16 states in TAP FSM
  parameter  TEST_LOGIC_RESET   = 4'h0  ;
  parameter  RUN_TEST_IDLE      = 4'h1  ;
  parameter  SELECT_DR          = 4'h2  ;
  parameter  CAPTURE_DR         = 4'h3  ;
  parameter  SHIFT_DR           = 4'h4  ;
  parameter  EXIT1_DR           = 4'h5  ;
  parameter  PAUSE_DR           = 4'h6  ;
  parameter  EXIT2_DR           = 4'h7  ;
  parameter  UPDATE_DR          = 4'h8  ;
  parameter  SELECT_IR          = 4'h9  ;
  parameter  CAPTURE_IR         = 4'ha  ;
  parameter  SHIFT_IR           = 4'hb  ;
  parameter  EXIT1_IR           = 4'hc  ;
  parameter  PAUSE_IR           = 4'hd  ;
  parameter  EXIT2_IR           = 4'he  ;
  parameter  UPDATE_IR          = 4'hf  ;
  //DTM control and state register----------------------------------- 
  parameter REG_BYPASS       = 5'b11111 ;
  parameter REG_IDCODE       = 5'b00001 ;
  parameter REG_DMI          = 5'b10001 ;
  parameter REG_DTMCS        = 5'b10000 ;
//decalre wire to handshanke_rx and handshake_tx module-------------- 
  wire            rx_valid;//one pluse valid signal,end of one 40bits transimission
  wire[39:0]      rx_data ;//synchronic with rx_valid
  wire            tx_valid;//one pluse valid signal,beginning of one 40bits transimission
  wire[39:0]      tx_data ;//synchronic with tx_valid
  wire            tx_idle ;//indicate current handshake status,0 is idle,1 is busy
//-------assign internal control and status register-----------------
  wire[31:0]      dtmcs       ;
  reg [39:0]      dmi         ;
  wire[31:0]      idcode      ;
  wire[31:0]      bypass      ;
  wire            dtm_reset   ; 
  wire[1:0]       dmi_status  ;  
//-------define internal register------------------------------------
  reg[5:0 ]       ir_reg              ;
  reg[39:0]       shift_reg           ;
  reg             tdo                 ;
  reg[3:0 ]       current_state       ;
  reg[3:0 ]       next_state          ;
  wire            is_busy             ;   
  reg             sticky_busy         ;//the status of last operation,1 represent error
  reg             dm_is_busy          ;//this is a high level signal when one pluse tx valid 
                                       //is active,and when rx_valid is 1,this signal change 
                                       //to low level,this process: 0------>1------>0                                      
                                       //indicates send data to DM and receive data from DM is done 
  reg             dtm_req_valid       ;//sent data,the data--->tx(dtm)--->rx(dm)
  reg[39:0]       dtm_req_data        ;//sent data,the data--->tx(dtm)--->rx(dm)
  reg[31:0]       dm_req_data         ;//receive data,tx(dm)--->rx(dtm)--->the data
  wire[31:0]      busy_response       ;
  wire[31:0]      none_busy_response  ;
  reg[39:0]       dm_resp_data        ;
//-------assign signals----------------------------------------------
  assign          is_busy   = dm_is_busy | sticky_busy;
  assign          dmi_status= is_busy ? 2'b11 : 2'b00;
  assign          dtm_reset = shift_reg[16];
  assign          bypass    = 32'h0000_0000;
  assign          idcode    = {IDCODE_VERSION,IDCODE_PART_NUMBER,IDCODE_MANFID,1'b1};
  assign          dtmcs     = { 14'b0       ,
                                1'b0        ,//dmihardreset
                                1'b0        ,//dmireset
                                1'b0        ,  
                                3'h5        ,//idle
                                dmi_status  ,//dmistat
                                6'h06       ,//addr_bits
                                DTM_VERSION};
  assign          busy_response     = {38'b0,2'b11};
  assign          none_busy_response= dm_resp_data ;
  assign          tx_valid          = dtm_req_valid;
  assign          tx_data           = dtm_req_data ;
//-------state switch------------------------------------------------
  always@(posedge jtag_pin_tck or negedge jtag_pin_trst)begin
    if(jtag_pin_trst == 1'b0)
      current_state <= TEST_LOGIC_RESET;
    else 
      current_state <= next_state      ;
  end 

  always@(*)begin 
    case(current_state)      
      TEST_LOGIC_RESET: next_state = jtag_pin_tms ? TEST_LOGIC_RESET: RUN_TEST_IDLE    ;
      RUN_TEST_IDLE   : next_state = jtag_pin_tms ? SELECT_DR       : RUN_TEST_IDLE    ;
      SELECT_DR       : next_state = jtag_pin_tms ? SELECT_IR       : CAPTURE_DR       ;
      CAPTURE_DR      : next_state = jtag_pin_tms ? EXIT1_DR        : SHIFT_DR         ;
      SHIFT_DR        : next_state = jtag_pin_tms ? EXIT1_DR        : SHIFT_DR         ;
      EXIT1_DR        : next_state = jtag_pin_tms ? UPDATE_DR       : PAUSE_DR         ;
      PAUSE_DR        : next_state = jtag_pin_tms ? EXIT2_DR        : PAUSE_DR         ;
      EXIT2_DR        : next_state = jtag_pin_tms ? UPDATE_DR       : SHIFT_DR         ;
      UPDATE_DR       : next_state = jtag_pin_tms ? SELECT_DR       : RUN_TEST_IDLE    ;
      SELECT_IR       : next_state = jtag_pin_tms ? TEST_LOGIC_RESET: CAPTURE_IR       ;
      CAPTURE_IR      : next_state = jtag_pin_tms ? EXIT1_IR        : SHIFT_IR         ;
      SHIFT_IR        : next_state = jtag_pin_tms ? EXIT1_IR        : SHIFT_IR         ;
      EXIT1_IR        : next_state = jtag_pin_tms ? UPDATE_IR       : PAUSE_IR         ;
      PAUSE_IR        : next_state = jtag_pin_tms ? EXIT2_IR        : PAUSE_IR         ;
      EXIT2_IR        : next_state = jtag_pin_tms ? UPDATE_IR       : SHIFT_IR         ;
      UPDATE_IR       : next_state = jtag_pin_tms ? SELECT_DR       : RUN_TEST_IDLE    ;
    endcase
  end

  always@(posedge jtag_pin_tck)begin
    case(next_state)
      //IR
      CAPTURE_IR : shift_reg <= {32'b0 , 1'b1};//the spec of JTAG ask to do this 
      SHIFT_IR   : shift_reg <= {jtag_pin_tdi, shift_reg[39:1]} ;
      //DR
      CAPTURE_DR : case(ir_reg)
                     REG_IDCODE : shift_reg <= {8'b0 , idcode}  ;
                     REG_BYPASS : shift_reg <= 40'b0            ;
                     REG_DTMCS  : shift_reg <= {8'b0 , dtmcs }  ;
                     REG_DMI    : shift_reg <= is_busy ? (busy_response) : (none_busy_response);
                     default    : shift_reg <= 40'b0            ;
                   endcase
      SHIFT_DR   : shift_reg <= {jtag_pin_tdi , shift_reg[39:1]};
    endcase
  end
//----------access dm module-----------------------------------------
  always@(posedge jtag_pin_tck or negedge rstn)begin
    if(rstn == 1'b0)
      dtm_req_valid <= 1'b0         ;
    else if(next_state == UPDATE_DR)begin   
      if(ir_reg == REG_DMI)begin
        if(is_busy == 1'b0 && tx_idle)begin   
          dtm_req_valid <= 1'b1     ;
          dtm_req_data  <= shift_reg;
        end 
      end 
    end 
    else 
      dtm_req_valid <= 1'b0;
  end 
//-------reset dtm---------------------------------------------------
  always@(posedge jtag_pin_tck or negedge rstn)begin 
    if(rstn == 1'b0)
      sticky_busy <= 1'b0     ;
    else if(next_state == UPDATE_DR)begin 
      if(ir_reg == REG_DTMCS && dtm_reset == 1'b1)
        sticky_busy <= 1'b0   ;
    end 
    else if(next_state == CAPTURE_DR)begin
      if(ir_reg == REG_DMI && none_busy_response[1:0] == 2'b10)
        sticky_busy <= 1'b1;
    end 
  end
//-------receive dm response data,dm_req_data------------------------
  always@(posedge jtag_pin_tck or negedge rstn)begin 
    if(rstn == 1'b0)
      dm_resp_data  <= 32'b0;
    else if(rx_valid == 1'b1)
      dm_resp_data  <= rx_data;
  end 
//-------tx busy-----------------------------------------------------
  always@(posedge jtag_pin_tck or negedge rstn)begin
    if(rstn == 1'b0)
      dm_is_busy <= 1'b0  ;
    else if(dtm_req_valid == 1'b1)
      dm_is_busy <= 1'b1  ;
    else if(rx_valid)
      dm_is_busy <= 1'b0  ;
  end 
//-------ir_reg------------------------------------------------------
  always@(posedge jtag_pin_tck or negedge rstn)begin 
    if(rstn == 1'b0)
      ir_reg <= idcode  ;
    else if(next_state == TEST_LOGIC_RESET)
      ir_reg <= idcode  ;
    else if(next_state == UPDATE_IR)
      ir_reg <= shift_reg[4:0];
  end
//-------TDO output--------------------------------------------------
  always@(negedge jtag_pin_tck or negedge rstn)begin 
    if(rstn == 1'b0)
      tdo <= 1'b0;
    else if(next_state == SHIFT_DR || next_state == SHIFT_IR)
      tdo <= shift_reg[0];
    else 
      tdo <= 1'b0;
  end
  
  assign  jtag_pin_tdo  = tdo   ;
//-------examplify handshake module----------------------------------
handshake_rx  rx(
  .clk        (jtag_pin_tck     ),
  .rstn       (rstn             ),
  .req_i      (dm_dtm_req       ),
  .req_data_i (dm_dtm_data      ),
  .ack_o      (dtm_dm_ack       ),
  .recv_data_o(rx_data          ),
  .recv_rdy_o (rx_valid         )
);

handshake_tx tx(
  .clk        (jtag_pin_tck     ),
  .rstn       (rstn             ),
  .ack_i      (dm_dtm_ack       ),
  .req_i      (tx_valid         ),
  .req_data_i (tx_data          ),
  .idle_o     (tx_idle          ),
  .req_o      (dtm_dm_req       ),
  .req_data_o (dtm_dm_data      )
);
endmodule 


      
