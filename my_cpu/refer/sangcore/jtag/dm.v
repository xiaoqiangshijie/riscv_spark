//------------------------------------------------------------------
//This confidential and proprierary software may be used only as
//authorized by a licensing agrement from Orbbec Inc.
//In the event of publication, the following notice is 
//applicable:
//(c)COPYRIGHT 2013 ORBBEC INC. ALL RIGHTS RESERVED.
//The entire notice above must be reproduced on all authorized
//copies.
//------------------------------------------------------------------
//File        : dm.v
//Author      : modi
//Date        : 08/15/2021
//Version     : 0.1
//Description : This file is DM module for JTAG master
//------------------------------------------------------------------
//Modification  History:
//Date        By        Version         Change Description
//08/15/2021  modi      0.1             Original 
//-------------------------------------------------------------------
module  dm 
(
  input               clk               ,
  input               rstn              ,
//----------With DTM-------------------------------------------------
  input               dtm_dm_req        ,//from tx of dtm module,to rx of dm
  input[39:0]         dtm_dm_data       ,//from tx of dtm module,to rx of dm
  input               dtm_dm_ack        ,//from rx of dtm module,to tx of dm
  output              dm_dtm_req        ,//from tx of dm module,to rx of dtm  
  output[39:0]        dm_dtm_data       ,//from tx of dm module,to rx of dtm
  output              dm_dtm_ack        ,//from rx of dm module,to tx of dtm
//---------With CSRs-------------------------------------------------
  output[11:0]        dm_csr_idx        ,//index of csr
  output[31:0]        dm_csr_wdata      ,//data that write to csr
  output              dm_csr_we         ,//write enable to csr
  output              dm_csr_ena        ,//read and write enable 
  input [31:0]        csr_dm_rdata      ,//read data from csr
  output              dm_csr_reset_req  ,
  output              dm_csr_halt_req   ,
//---------With GPRs-------------------------------------------------
  output[31:0]        dm_gpr_wdata      ,//data that write to gpr
  output[4:0]         dm_gpr_addr       ,//address of gpr
  output              dm_gpr_we         ,//write enable to gpr
  input [31:0]        gpr_dm_rdata      ,//read data from gpr 
//---------With System bus-------------------------------------------
  input               jtag2icb_cmd_ready,
  input               jtag2icb_rsp_valid,
  input [31:0]        jtag2icb_rsp_rdata,
  input               jtag2icb_rsp_err  ,
  output              jtag2icb_cmd_valid,
  output[31:0]        jtag2icb_cmd_addr ,
  output[31:0]        jtag2icb_cmd_wdata,
  output              jtag2icb_cmd_read ,     //read enable 
  output[3:0 ]        jtag2icb_cmd_wmask,
  output              jtag2icb_rsp_ready,
//---------With interrupt--------------------------------------------
  input               int_jtag_ebreak   ,
  output              jtag_irq          
  );
//---------Local Parameter-------------------------------------------
  localparam          DCRS      = 16'h7b0 ;
  localparam          DMSTATUS  = 6'h11   ;
  localparam          DMCONTROL = 6'h10   ;
  localparam          HARTINFO  = 6'h12   ;
  localparam          ABSTRACTCS= 6'h16   ;
  localparam          DATA0     = 6'h04   ;
  localparam          DATA1     = 6'h05   ;
  localparam          COMMAND   = 6'h17   ;
  localparam          DPC       = 16'h7b1 ;
//---------define DM register----------------------------------------
  reg[31:0]           dmstatus            ;
  reg[31:0]           dmcontrol           ;
  reg[31:0]           hartinfo            ;
  reg[31:0]           abstractcs          ;
  reg[31:0]           data0               ;
  reg[31:0]           data1               ;
  reg[31:0]           command             ;
//---------define internal register----------------------------------
  reg[31:0]           read_data     ; 
  //gpr
  reg                 gpr_we        ;
  reg[4:0 ]           gpr_addr      ;
  reg[31:0]           gpr_wdata     ;
  //csr
  reg                 csr_ena       ;
  reg                 csr_we        ;
  reg[11:0]           csr_idx       ;
  reg[31:0]           csr_wdata     ;
  reg                 halt_req      ;
  reg                 reset_req     ;
  //system bus  
  reg                 dm_cmd_valid  ;
  reg[31:0]           dm_cmd_addr   ;
  reg[31:0]           dm_cmd_wdata  ;
  reg                 dm_cmd_read   ;//read enable 
  reg[3:0 ]           dm_cmd_wmask  ;
  reg                 dm_rsp_ready  ;
  //
  reg                 is_read_csr   ;
  reg                 is_read_gpr   ;
  reg                 is_write_sysbus;
  reg                 need_resp     ;
  reg                 read_ready    ;
  reg[31:0]           sysb_read_data;
  wire[1:0 ]          op            ;
  wire[31:0]          data          ;
  wire[5:0 ]          address       ;
  wire[39:0]          dm_resp_data  ;
  wire                tx_idle       ;
  wire                rx_valid      ;
  wire[39:0]          rx_data       ;
  wire                dtm_dm_data_valid;
  wire                cmd_ready     ;
  //assign wire
  assign              cmd_ready = jtag2icb_cmd_ready && dm_cmd_valid;
  assign              dtm_dm_data_valid = rx_valid;
  assign              op      = rx_data[1:0]    ;
  assign              data    = rx_data[33:2]   ;
  assign              address = rx_data[39:34]  ;
  assign              dm_resp_data = {address,read_data,2'b00};
  assign              jtag2icb_cmd_wmask = 4'b1111;
  
//---------read or write DM register---------------------------------
  always @(posedge clk or negedge rstn)begin 
    if(rstn == 1'b0)begin
      //----grp
      gpr_we   <= 1'b0 ;
//    dm_gpr_addr   <= 5'b0 ;
//    dm_gpr_wdat   <= 32'b0;   //data path do not need reset
      //----csr
      csr_we   <= 1'b0 ;
      csr_ena  <= 1'b0 ;
      halt_req   <= 1'b0 ;
      reset_req  <= 1'b0 ;
//    dm_csr_idx    <=  'b0 ;
//    dm_csr_wdata  <=  'b0 ;
      //----DM register 
      hartinfo      <=  'b0 ;
      dmcontrol     <=  'b0 ;
      abstractcs    <= 32'h0000_0002;
      data0         <=  'b0 ;
      data1         <=  'b0 ;
      command       <=  'b0 ;
      dmstatus      <= 32'h0043_0c82;
      read_data     <= 32'b0;
      need_resp     <= 1'b0 ;
    end
    else if(int_jtag_ebreak == 1'b1)
      halt_req   <= 1'b1 ;
    else if(dtm_dm_data_valid)begin   //data from DTM is valid 
      need_resp <= 1'b1;              //response to DTM from DM
      case(op)
      2'b01:begin//read
        case(address)
          DMSTATUS  :read_data <= dmstatus   ;
          DMCONTROL :read_data <= dmcontrol  ;
          HARTINFO  :read_data <= hartinfo   ;
          ABSTRACTCS:read_data <= abstractcs ;          
          DATA0     :begin
                       if(is_read_csr == 1'b1)
                         read_data <= csr_dm_rdata;
                       else if(is_read_gpr == 1'b1)
                         read_data <= gpr_dm_rdata;
                       else if(read_ready == 1'b1)
                         read_data <= sysb_read_data;
                       else 
                         read_data <= {30'b0,2'b11};


                         is_read_csr <= 1'b0;            
                         is_read_gpr <= 1'b0;
                         csr_ena     <= 1'b0;
                       //dm_csr_ena_r  <= 1'b0;
                     end 
          DATA1     :begin                                 
                       read_data <= data1  ;                                 
                     end                  
          default   :read_data <= 32'b0; 
        endcase   
      end 
      2'b10:begin//write
      read_data <= 32'b0;
        case(address)
          DMCONTROL:begin 
            if(data[0] == 1'b0)begin //reset DM module 
              dmstatus  <= 32'h0043_0c82;
              hartinfo  <= 32'b0        ;
              abstractcs<= 32'h0000_0002;
              dmcontrol <= data         ;
              halt_req  <= 1'b0       ;
              reset_req <= 1'b0       ;
            end 
            else begin 
              dmcontrol <= data         ;
              if(data[31] == 1'b1)begin
                halt_req <= 1'b1     ;
                dmstatus    <= {dmstatus[31:12],4'h3,dmstatus[7:0]};
              end 
              else if(halt_req == 1'b1 && data[30] == 1'b1)begin 
                halt_req <= 1'b0     ;
                dmstatus    <= {dmstatus[31:12],4'hc,dmstatus[7:0]};
              end 
            end 
          end 
          COMMAND:begin //write or read
            if(data[31:24] == 8'h0)begin //read
              if(data[22:20] != 3'b010)
                abstractcs <= {abstractcs[31:11],3'b010,abstractcs[7:0]};
              else 
                abstractcs <= {abstractcs[31:11],3'b000,abstractcs[7:0]};
                
              if(data[17] == 1'b1)begin
                if(data[15:0] == DPC && data[16] == 1'b1)begin  //when write dpc,wen need reset cpu
                  reset_req <= 1'b1;
                  halt_req  <= 1'b0;
                  dmstatus <= {dmstatus[31:12],4'hc,dmstatus[7:0]};
                end                
                else if(data[15:0] < 16'h1000)begin//access csr
                  if(data[16] == 1'b0)begin        //read csr
                    is_read_csr <= 1'b1;
                    csr_we <= 1'b0;
                    csr_ena<= 1'b1;
                    csr_idx<= data[11:0];
                  end 
                  else begin                       //write csr
                    csr_ena <= 1'b1  ;
                    csr_we  <= 1'b1  ;
                    csr_wdata<= data0;
                    csr_idx <= data[11:0];
                 end 
                end
                else if(data[15:0] < 16'h1020)begin //access gpr
                  if(data[16] == 1'b0)begin         //read gpr
                    gpr_we<= 1'b0;
                    is_read_gpr<= 1'b1;
                    gpr_addr<= data[4:0];
                  end 
                  else begin
                    gpr_we  <= 1'b1  ;
                    gpr_wdata<= data0 ;
                    gpr_addr<= data[4:0];
                  end 
                end                
              end
              else begin
                csr_we <= 1'b0;
                gpr_we <= 1'b0;
              end  
            end 
            else if(data[31:24] == 8'h2)begin//access mem              
              dm_rsp_ready <= 1'b1    ;
              dm_cmd_addr  <= data1   ;
              dm_cmd_wdata <= data0   ;                             

              if(data[16] == 1'b1)begin//write or read mem
                dm_cmd_read <= 1'b0;
              end 
              else begin
                dm_cmd_read <= 1'b1;           
              end 
            end 
            else begin                 //no transmission 
              gpr_we <= 1'b0;
              csr_ena<= 1'b0;                      
            end                   
          end         
          DATA0     :data0 <= data ;
          DATA1     :data1 <= data ;
          default   :begin
                       gpr_we <= 1'b0;
                       csr_ena<= 1'b0;
                     end       
        endcase
      end 
      2'b00,2'b11:read_data <= 32'h0000_0000;
      default    :read_data <= 32'h0000_0000;
      endcase
    end 
    else begin
      if(data[19] == 1'b1)begin
        if(jtag2icb_cmd_ready == 1'b1 && dm_cmd_valid == 1'b1)
          data1 <= data1 +4;
      end 

      need_resp       <= 1'b0  ;
      reset_req       <= 1'b0  ;
      gpr_we          <= 1'b0  ;
    end 
  end
  
  always@(posedge clk,negedge rstn)begin
    if(!rstn)
      dm_cmd_valid <= 1'b0;
    else if(dtm_dm_data_valid == 1'b1)begin
        if(data[31:24] == 8'h2)
          dm_cmd_valid <= 1'b1;
    end 
    else begin
      if(dm_cmd_valid == 1'b1 && jtag2icb_cmd_ready == 1'b1)
        dm_cmd_valid <= 1'b0;        
    end 
  end 

  always@(posedge clk,negedge rstn)begin
    if(!rstn)
      read_ready <= 1'b0;
    else if(jtag2icb_rsp_valid == 1'b1 && dm_cmd_read == 1'b1)begin
      sysb_read_data <= jtag2icb_rsp_rdata;
      read_ready <= 1'b1;
    end 
    else if(dm_cmd_read == 1'b0)
      read_ready <= 1'b0;
  end 
    

//-------assign gpr--------------------------------------------------
assign  dm_gpr_we   = gpr_we   ;
assign  dm_gpr_wdata= gpr_wdata;
assign  dm_gpr_addr = gpr_addr ;
//-------assign csr--------------------------------------------------
assign  dm_csr_ena  = csr_ena  ;
assign  dm_csr_we   = csr_we   ;
assign  dm_csr_idx  = csr_idx  ;
assign  dm_csr_wdata= csr_wdata;
//-------assign system bus-------------------------------------------
assign  jtag_irq    =      halt_req ;
assign  dm_csr_reset_req = reset_req;
assign  dm_csr_halt_req  = halt_req ;

assign  jtag2icb_cmd_valid = dm_cmd_valid   ; 
assign  jtag2icb_cmd_addr  = dm_cmd_addr    ;
assign  jtag2icb_cmd_wdata = dm_cmd_wdata   ;
assign  jtag2icb_cmd_read  = dm_cmd_read    ;
assign  jtag2icb_rsp_ready = dm_rsp_ready   ;

//examplify handshake 
  handshake_tx tx(
    .clk        (clk        ),
    .rstn       (rstn       ),
    .ack_i      (dtm_dm_ack ),
    .req_i      (need_resp  ),
    .req_data_i (dm_resp_data),
    .idle_o     (tx_idle    ),
    .req_o      (dm_dtm_req ),
    .req_data_o (dm_dtm_data)
);
  handshake_rx rx(
    .clk        (clk        ),
    .rstn       (rstn       ),
    .req_i      (dtm_dm_req ),
    .req_data_i (dtm_dm_data),
    .ack_o      (dm_dtm_ack ),
    .recv_data_o(rx_data    ),
    .recv_rdy_o (rx_valid   )
);
endmodule 






              

            


