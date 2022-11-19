//-------------------------------------------------------------
//This confidential and proprietary software may be used only as 
//authorized by a licensing agreement from Orbbec Inc.
//In the event of publication, the following notice is
//applicable:
//(C)COPYRIGHT 2013 ORBBEC INC. ALL RIGHTS RESERVED.
//The entire notice above must be reproduced on all authorized
//copies.
//-------------------------------------------------------------
//File:        vld_pipe
//Author:      lihua
//Date:        21-03-23 13:46:35
//Version:     0.1
//Description:  
//             
//-------------------------------------------------------------
//Modification History:
//Date         By            Version         Change Description
//21-03-23 13:46:35   lihua         0.1             Original
//-------------------------------------------------------------
module   vld_pipe #(
    parameter PIPE_NUM = 10 
)( 
    input                        clk   , //clk
    input                        rstn  ,

    input                        vld_in,

    output reg  [PIPE_NUM-1:0]   vld_d
); 

//--------------------LOCAL_PAMETER----------------------------

//--------------------reg -------------------------------------

//--------------------wire -- ---------------------------------

//--------------------Main Code--------------------------------


generate

if(PIPE_NUM == 1)begin:PIPE_1_CYCLE

    always@ (posedge clk or negedge rstn) begin
        if(rstn == 1'b0)begin
            vld_d <= 1'b0; 
        end
        else  begin
            vld_d <= vld_in;
        end
    end

end

else if(PIPE_NUM == 2)begin:PIPE_2_CYCLE

    always@ (posedge clk or negedge rstn) begin
        if(rstn == 1'b0)begin
            vld_d[0] <= 1'b0; 
            vld_d[1] <= 1'b0; 
        end
        else  begin
            vld_d[0] <= vld_in;
            vld_d[1] <= vld_d[0];
        end
    end

end

else if(PIPE_NUM == 3)begin:PIPE_3_CYCLE

    always@ (posedge clk or negedge rstn) begin
        if(rstn == 1'b0)begin
            vld_d[0] <= 1'b0; 
            vld_d[1] <= 1'b0; 
            vld_d[2] <= 1'b0; 
        end
        else  begin
            vld_d[0] <= vld_in;
            vld_d[1] <= vld_d[0];
            vld_d[2] <= vld_d[1];
        end
    end

end
else begin:PIPE_GT_3_CYCLE // PIPE_NUM > 3

    wire    cg_en;
    assign  cg_en = vld_in | (|vld_d[PIPE_NUM-1:0]);

    always@ (posedge clk or negedge rstn) begin
        if(rstn == 1'b0)begin
            vld_d[PIPE_NUM-1:0] <= {PIPE_NUM{1'b0}}; 
        end
        else  if(cg_en == 1'b1)begin
            vld_d[PIPE_NUM-1:0] <= {vld_d[PIPE_NUM-2:0],vld_in};
        end
    end

end
endgenerate


endmodule
