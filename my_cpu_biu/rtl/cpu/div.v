module div(

    input clk,
    input rst_n,

    input [31:0] op1_data,
    input [31:0] op2_data,
    input start_flag,
    input annul,
    input signed_div,

    output reg [63:0] div_result,
    output reg        div_ready

);

wire [32:0] div_temp;
reg  [5:0]  cnt;
reg  [64:0] dividend;
reg  [1:0]  state;
reg  [31:0] divisor;
reg  [31:0] temp_op1;
reg  [31:0] temp_op2;

assign div_temp = {1'b0,dividend[63:32]} - {1'b0,divisor};  //33bit?


always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        state      <= 2'b00;
        div_ready  <= 1'b0;
        div_result <= 64'b0;
    end
    else begin
        case(state)
            //enter init state
            00:begin
                if(start_flag == 1'b1 && annul == 1'b0)begin
                    if(op2_data == 32'b0) begin
                        state <= 2'b01;
                    end
                    else begin
                        state <= 2'b10;
                        // init data1
                        if(signed_div == 1'b1 && op1_data[31] == 1'b1) begin
                            temp_op1 = ~op1_data + 1;
                        end
                        else begin
                            temp_op1 = op1_data;
                        end
                        //init data2
                        if(signed_div == 1'b1 && op2_data[31] == 1'b1) begin
                            temp_op2 = ~op2_data + 1;
                        end
                        else begin
                            temp_op2 = op2_data;
                        end
                        //init dividend divisor
                        dividend       <= 65'b0;
                        dividend[32:1] <= temp_op1;
                        divisor        <= temp_op2;
                    end
                end
                else begin
                    div_ready  <= 1'b0; 
                    div_result <= 64'b0;
                end
            end
            //enter byzero state
            01:begin
                dividend <= 65'b0;
                state    <= 2'b11;
            end
            //enter div_on state
            10:begin
                if(annul == 1'b0) begin
                    if(cnt! = 6'b100000) begin
                        if(div_temp[32] == 1'b1) begin
                            dividend <= {dividend[63:0],1'b0};
                        end
                        else begin
                            dividend <= {div_temp[31:0],dividend[31:0],1'b0};
                        end
                        cnt <= cnt +1;
                    end
                    //div end
                    else begin
                        if((signed_div == 1'b1) && (op1_data[31] ^ op2_data[31])) begin
                            dividend[31:0] <= (~dividend[31:0] + 1);
                        end
                        if((signed_div == 1'b1) && (op1_data[31] ^ op2_data[31])) begin
                            dividend[64:33] <= (~dividend[64:33] + 1);
                        end
                        state <= 2'b11;
                        cnt   <= 6'b000000; //cnt bss
                    end
                end 
                else begin
                    state <= 2'b00;
                end
            end
            11:begin
                div_result <= {dividend[64:33],dividend[31:0]};
                div_ready  <= 1'b1;
                if(start_flag == 1'b0) begin
                    state      <= 2'b00;
                    div_ready  <= 1'b0;
                    div_result <= 64'b0;
                end
            end
        endcase
    end
end

endmodule