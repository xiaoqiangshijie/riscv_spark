//-------------------------------------------------------------
//This confidential and proprietary software may be used only as //authorized by a licensing agreement from Orbbec Inc.
//In the event of publication, the following notice is //applicable:
//(C)COPYRIGHT 2013 ORBBEC INC. ALL RIGHTS RESERVED.
//The entire notice above must be reproduced on all authorized //copies.
//-------------------------------------------------------------
//File	  : lsu.v
//Author	: lihua
//Date	  : 08/27/2021
//Version	: 0.1
//Description	  : 
//-------------------------------------------------------------
//Modification History:
//Date	By	Version	Change Description
//08/27/2021   lihua   0.2           Original
//-------------------------------------------------------------




module lsu
#( 
    parameter   LSU_ADW = 32 ,
    parameter   LSU_DW  = 64 ,
    parameter   ITCM_DW  = 32 

)
(

	  input                  clk                    ,
	  input                  rstn                   ,
//      With CTRL                                 
	  input                  ctrl_lsu_fake_gen_flag ,
//      With ALU                                  
    input                  alu_lsu_vld_1p         ,  //because we need vld_1p to generate cmd_vld, cmd_vld is later than addr 1cycle
	  input                  alu_lsu_vld            ,
	  input  [LSU_ADW-1:0]   alu_lsu_addr           ,
	  input  [LSU_DW-1:0]    alu_lsu_wdata          ,
	  input                  alu_lsu_wen            ,
	  input  [3:0]           alu_lsu_ls_type        ,
//      With BIU                                  
	  output reg             lsu2icb_cmd_valid      ,
	  input                  lsu2icb_cmd_ready      ,
	  output [LSU_ADW-1:0]   lsu2icb_cmd_addr       ,
	  output                 lsu2icb_cmd_read       ,
    output reg[LSU_DW-1:0] lsu2icb_cmd_wdata      ,
	  output [7:0]           lsu2icb_cmd_wmask      ,
	  input                  lsu2icb_rsp_valid      ,
	  output                 lsu2icb_rsp_ready      ,
	  input  [LSU_DW-1:0]    lsu2icb_rsp_rdata      ,
	  input                  lsu2icb_rsp_err        ,
//      With WB                                   
	  output                 lsu_wb_store_cmt_vld   ,
	  output                 lsu_wb_vld             ,
	  output reg [LSU_DW-1:0]lsu_wb_wdata           ,
	  output                 lsu_wb_wen             ,
	  output                 lsu_wb_fake_vld	       
);

//-----------------------declare ------------------------------//
localparam  LB  = 4'd1  ;
localparam  LBU = 4'd2  ;
localparam  LH  = 4'd3  ;
localparam  LHU = 4'd4  ;
localparam  LW  = 4'd5  ;
localparam  LWU = 4'd6  ;
localparam  LD  = 4'd7  ;
localparam  SB  = 4'd8  ;
localparam  SH  = 4'd9  ;
localparam  SW  = 4'd10 ;
localparam  SD  = 4'd11 ;

localparam  BIU_OUTSIDE_HEAD = 4'b0000;
localparam  INT_ADDR_HEAD    = 4'b0001;
localparam  ITCM_ADDR_HEAD   = 4'b0010; 
localparam  DTCM_ADDR_HEAD   = 4'b0011; 

//-----------------------   Reg   ----------------------------//
reg               lsu2icb_rsp_valid_1d ;
reg  [LSU_DW-1:0] lsu2icb_rsp_rdata_1d ;
reg  [7:0]        mask                 ;
reg  [LSU_DW-1:0] lsu_wb_wdata_temp    ;
reg  [3:0]        alu_lsu_ls_type_1d   ;
reg  [7:0]        lsu_wb_wdata_byte    ;
reg  [15:0]       lsu_wb_wdata_hword   ;
reg  [31:0]       lsu_wb_wdata_word    ;

//-----------------------  Wire   ----------------------------//
wire              lsu_vld_real         ;
wire              biu_hit              ;


//-----------------------Main code ----------------------------//

//accordingt to the different ls_type and different lsu_add,generate different mask
always@(*)begin
    case(alu_lsu_ls_type)
        SB : begin
            case( alu_lsu_addr[2:0])
                3'd0: mask =   8'b0000_0001;
                3'd1: mask =   8'b0000_0010;      
                3'd2: mask =   8'b0000_0100;      
                3'd3: mask =   8'b0000_1000;      
                3'd4: mask =   8'b0001_0000;      
                3'd5: mask =   8'b0010_0000;      
                3'd6: mask =   8'b0100_0000;      
                default: mask =   8'b1000_0000;    // 3'd7   
            endcase
        end      
        SH : begin
            case( alu_lsu_addr[2:0])
                3'b000,3'b001: mask =   8'b0000_0011;
                3'b010,3'b011: mask =   8'b0000_1100;
                3'b100,3'b101: mask =   8'b0011_0000;      
                default: mask =   8'b1100_0000;    // 3'b110,3b'111   
            endcase
        end 
        SW : begin  
            case( alu_lsu_addr[2])
                1'b0: mask =   8'b0000_1111;
                default: mask =   8'b1111_0000;    // 1'b1  
            endcase
        end
        default   :   mask =   8'b1111_1111;//SD
    endcase
end

//concat a icb_cmd_wdata
always@(*)begin
    case(alu_lsu_ls_type)
        SB :       lsu2icb_cmd_wdata =   {8{alu_lsu_wdata[7:0] }};
        SH :       lsu2icb_cmd_wdata =   {4{alu_lsu_wdata[15:0]}};
        SW :       lsu2icb_cmd_wdata =   {2{alu_lsu_wdata[31:0]}};
        default:   lsu2icb_cmd_wdata =      alu_lsu_wdata[63:0]  ;//SD
    endcase
end



//generate a really valid
assign  lsu_vld_real  = (~ctrl_lsu_fake_gen_flag) & alu_lsu_vld;



//WITH BIU
//generate cmd_valid
assign  biu_hit = (alu_lsu_addr[LSU_ADW-1:LSU_ADW-4] == BIU_OUTSIDE_HEAD || alu_lsu_addr[LSU_ADW-1:LSU_ADW-4] == INT_ADDR_HEAD );
always@(posedge clk or negedge rstn) begin	
  if (!rstn)
    lsu2icb_cmd_valid <= 1'b0;
  else if (alu_lsu_vld_1p)
    lsu2icb_cmd_valid <= 1'b1;
  else if (lsu2icb_cmd_ready)
    lsu2icb_cmd_valid <= 1'b0;
end

assign  lsu2icb_cmd_addr  =  {alu_lsu_addr[31:3],3'd0}       ;
assign  lsu2icb_cmd_read  =  (~alu_lsu_wen)                  ;
assign  lsu2icb_cmd_wmask =  mask                            ;
assign  lsu2icb_rsp_ready =  1'b1                            ;

//WITH WB

always@(posedge clk or negedge rstn) begin	
    if(!rstn)
        alu_lsu_ls_type_1d <= 4'b0;
    else
        alu_lsu_ls_type_1d <= alu_lsu_ls_type;
end

always@(posedge clk or negedge rstn) begin	
    if(!rstn)
        lsu2icb_rsp_valid_1d <= 1'b0;
    else
        lsu2icb_rsp_valid_1d <= lsu2icb_rsp_valid;
end

always@(posedge clk ) begin	
	  if(lsu2icb_rsp_valid == 1'b1) 
		   lsu2icb_rsp_rdata_1d  <= lsu2icb_rsp_rdata;
end

assign  lsu_wb_vld             = lsu2icb_rsp_valid_1d & (~alu_lsu_wen);
assign  lsu_wb_store_cmt_vld   = lsu2icb_rsp_valid_1d & ( alu_lsu_wen);



assign lsu_wb_wdata_temp  = lsu2icb_rsp_rdata_1d ;

//according to the lsu_addr and ls_type,generate different grain such like byte/hword/word
always@(*)begin
    if(alu_lsu_ls_type_1d == LB || alu_lsu_ls_type_1d == LBU )begin
        case(alu_lsu_addr[2:0])
            3'd0:     lsu_wb_wdata_byte = lsu_wb_wdata_temp[7  :0 ];
            3'd1:     lsu_wb_wdata_byte = lsu_wb_wdata_temp[15 :8 ];
            3'd2:     lsu_wb_wdata_byte = lsu_wb_wdata_temp[23 :16];
            3'd3:     lsu_wb_wdata_byte = lsu_wb_wdata_temp[31 :24];
            3'd4:     lsu_wb_wdata_byte = lsu_wb_wdata_temp[39 :32];
            3'd5:     lsu_wb_wdata_byte = lsu_wb_wdata_temp[47 :40];
            3'd6:     lsu_wb_wdata_byte = lsu_wb_wdata_temp[55 :48];
            default:  lsu_wb_wdata_byte = lsu_wb_wdata_temp[63 :56]; //3'd7
        endcase    
    end
    else begin
       lsu_wb_wdata_byte = 8'd0;
    end
end

always@(*)begin
    if(alu_lsu_ls_type_1d == LH || alu_lsu_ls_type_1d == LHU )begin
        case(alu_lsu_addr[2:1])
            2'd0:     lsu_wb_wdata_hword = lsu_wb_wdata_temp[15 :0 ];
            2'd1:     lsu_wb_wdata_hword = lsu_wb_wdata_temp[31 :16];
            2'd2:     lsu_wb_wdata_hword = lsu_wb_wdata_temp[47 :32];
            default:  lsu_wb_wdata_hword = lsu_wb_wdata_temp[63 :48]; //2'd3
        endcase    
    end
    else begin
       lsu_wb_wdata_hword = 16'd0;
    end
end

always@(*)begin
    if(alu_lsu_ls_type_1d == LW || alu_lsu_ls_type_1d == LWU )begin
        if(alu_lsu_addr[2] == 1'b0)
            lsu_wb_wdata_word = lsu_wb_wdata_temp[31 :0 ];
        else 
            lsu_wb_wdata_word = lsu_wb_wdata_temp[63 :32 ];
    end
    else begin
       lsu_wb_wdata_word = 32'd0;
    end
end

always@(*)begin
    case(alu_lsu_ls_type_1d)
        LB : lsu_wb_wdata = { {56{lsu_wb_wdata_byte[7]}},  lsu_wb_wdata_byte[7:0]};  
        LBU: lsu_wb_wdata = { 56'd0,                       lsu_wb_wdata_byte[7:0]};
        LH : lsu_wb_wdata = { {48{lsu_wb_wdata_hword[15]}},lsu_wb_wdata_hword[15:0]};
        LHU: lsu_wb_wdata = { 48'd0,                       lsu_wb_wdata_hword[15:0]};
        LW : lsu_wb_wdata = { {32{lsu_wb_wdata_word[31]}}, lsu_wb_wdata_word[31:0]};
        LWU: lsu_wb_wdata = { 32'd0,                       lsu_wb_wdata_word[31:0]};
        LD : lsu_wb_wdata = {                              lsu_wb_wdata_temp[63:0]};
        default: lsu_wb_wdata = 64'd0;
    endcase
end

assign  lsu_wb_fake_vld = ctrl_lsu_fake_gen_flag & alu_lsu_vld;
assign  lsu_wb_wen      = ~alu_lsu_wen; //LOAD ins:  lsu2biu = read  but  lsu2wb = write

endmodule
