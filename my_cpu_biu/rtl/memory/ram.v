module ram(

    input clk,
    input rst_n,

    input        ram_wr_en,
    input [31:0] ram_addr,
    input [3:0]  ram_addr_sel,
    input [31:0] ram_wr_data,

    output reg [31:0] ram_data_in

);

reg [7:0] _ram3 [1023:0];
reg [7:0] _ram2 [1023:0];
reg [7:0] _ram1 [1023:0];
reg [7:0] _ram0 [1023:0];

// write mem
always @(posedge clk) begin
    if(ram_wr_en == 1'b1) begin
        if(ram_addr_sel[3] == 1'b1) begin
            _ram3[ram_addr[7:2]] <= ram_wr_data[31:24];
        end
        if(ram_addr_sel[2] == 1'b1) begin
            _ram2[ram_addr[7:2]] <= ram_wr_data[23:16];
        end
        if(ram_addr_sel[1] == 1'b1) begin
            _ram1[ram_addr[7:2]] <= ram_wr_data[15:8];
        end
        if(ram_addr_sel[0] == 1'b1) begin
            _ram0[ram_addr[7:2]] <= ram_wr_data[7:0];
        end
    end
end

// read mem
always @ (*) begin
    if(ram_wr_en == 1'b0)begin
        ram_data_in = {
                        _ram3[ram_addr[7:2]],
                        _ram2[ram_addr[7:2]],
                        _ram1[ram_addr[7:2]],
                        _ram0[ram_addr[7:2]]
                      };
    end
    else begin
        ram_data_in = 32'b0;
    end
end

endmodule