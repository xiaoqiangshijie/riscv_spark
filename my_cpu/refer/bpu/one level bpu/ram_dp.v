/////////////////////////////////////////////////////////////////////////
//File	        : ram_dp.v
//Author        : 
//Date	        : 
//Version	      : 0.1
//Description	  : 
// Infers a simple-dual-port (1 write port, 1 read port) block RAM with
// independent clocks. Will generate warnings on read/write collisions (which
// typically yield indeterminate behavior in real hardware).
// Reads take 1 or 2 cycles (depending on if PIPELINE is set).
//-------------------------------------------------------------
//Modification History:
//Date	By	Version	Change Description
//
//-------------------------------------------------------------

module ram_dp #(
    parameter   DATA        = 56,
    parameter   ADDR        = 9,
    parameter   DEPTH       = (2**ADDR),
    parameter   PIPELINE    = 0,    // enable additional pipeline register on output
    parameter   WARNINGS    = 1
) (
    // write port
    input   wire                write_clk,
    input   wire                write_en,
    input   wire    [ADDR-1:0]  write_addr,
    input   wire    [DATA-1:0]  write_data,
    
    // read port
    input   wire                read_en,
    input   wire                read_clk,
    input   wire    [ADDR-1:0]  read_addr,
    output  wire    [DATA-1:0]  read_data
);

reg [DATA-1:0] mem [DEPTH-1:0];

always @(posedge write_clk) begin
    if(write_en) begin
        mem[write_addr] <= write_data;
    end
end

reg [DATA-1:0] read_data_r0;
reg [DATA-1:0] read_data_r1;

always @(posedge read_clk) begin
    if(read_en) begin
        read_data_r0    <= mem[read_addr];
    end
    read_data_r1    <= read_data_r0;

`ifdef SIMULATION
/* verilator coverage_off */
    if(write_en && read_en && read_addr == write_addr) begin
        read_data_r0    <= {DATA{1'bx}};
`ifndef SIM_VER
        if(WARNINGS>0) begin
            $display("%t: [%m] *** WARNING *** read/write overlap (0x%0x)", $time, read_addr);
        end
`endif
    end
/* verilator coverage_on */
`endif

end

generate
if(PIPELINE==0) begin:GEN_NOPIPE

    // 1-cycle latency
    assign read_data = read_data_r0;

end else begin:GEN_PIPE

    // 2-cycle latency
    assign read_data = read_data_r1;

end
endgenerate


`ifdef SIM_VER
always @(posedge read_clk) begin
    if(read_en && read_addr >= DEPTH) begin
        $display("Error: %t: [%m] read_addr (0x%0x) exceeds memory bounds (0x%0x)", $time, read_addr, DEPTH);
    end
end
always @(posedge write_clk) begin
    if(write_en && write_addr >= DEPTH) begin
        $display("Error: %t: [%m] write_addr (0x%0x) exceeds memory bounds (0x%0x)", $time, write_addr, DEPTH);
    end
end
if(WARNINGS>0) begin:GEN_WARNINGS
    always @(posedge read_clk or posedge write_clk) begin
        if(write_en && read_en && read_addr == write_addr) begin
            $display("%t: [%m] *** WARNING *** read/write overlap (0x%0x)", $time, read_addr);
        end
    end
end
`endif

endmodule

