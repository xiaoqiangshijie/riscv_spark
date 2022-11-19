
module ram_sp #(
    parameter   DATA        = 72,
    parameter   ADDR        = 9,
    parameter   DEPTH       = (2**ADDR),
    parameter   PIPELINE    = 0,    // enable additional pipeline register on output
    parameter   WARNINGS    = 1
) (
    //input   wire         [1:0]  WTSEL,
    //input   wire         [1:0]  RTSEL,
    input   wire                clk,
    input   wire                rstn,
    input   wire                cg_bypass,
    input   wire                slp,
    input   wire                sd,
    input   wire    [ADDR-1:0]  addr,
    input   wire                chip_en,
    input   wire                write_en,
    input   wire    [DATA-1:0]  write_data,
    output  wire    [DATA-1:0]  read_data
);

wire         [1:0]  WTSEL;
wire         [1:0]  RTSEL;
wire         [1:0]  SVT_WTSEL;
wire         [1:0]  SVT_RTSEL;
assign WTSEL = 2'b00;
assign RTSEL = 2'b00;
assign SVT_WTSEL = 2'b00;
assign SVT_RTSEL = 2'b01;

wire [DATA-1:0] read_data_r0;
reg [DATA-1:0] read_data_r1;


wire gated_clk;
reg chip_en_dly;

always @(posedge clk)
   	read_data_r1 <= read_data_r0;

// for suki requirement ,add by Rfish . March.1.2018

always @(posedge clk)
   	chip_en_dly <= chip_en;

//`ifdef CHIP_FPGA TBD
assign gated_clk = clk;
//`else //CHIP_FPGA
//clock_gate sram_ckgt_clk(
// 	.in_clk(clk),
//	.en(chip_en | chip_en_dly | cg_bypass),
//	.out_clk(gated_clk));
//`endif //CHIP_FPGA


//`ifdef SIM_VER
//
//property  cg_ck;
//  @(posedge clk)
// ##1   $isunknown(cg_bypass) == 0;
//endproperty
//assert property(cg_ck)
//else `uvm_error("Error",$psprintf("%t : orbbec_ram_sp cg_bypass unconnect \n %m\n", $time));
//
////property  cg_fun_ck;
////  @(posedge wr_clk)  if(cg_bypass == 0)
//// ##1   chip_en != 0 || chip_en_dly != 0;
////endproperty
////assert property(cg_fun_ck)
////else `uvm_error("Error",$psprintf("%t : orbbec_ram_sp cg_bypass function miss \n%m\n", $time));
//
//covergroup sp_cg_bypass_cov;
// coverpoint cg_bypass ;
//endgroup
//
//`endif //SIM_VER

//end-----------



`ifdef ASIC_RAM
generate
genvar i; 

if ((DATA==9) && (ADDR==10) && (DEPTH==1024) ) begin:MEM_9_1024_S

  DISP130BCD1kx9m16  u_ram_sp (
    .CLK      (gated_clk),
    .RST_N    (rstn),
    .CS_N     (~chip_en),
    .WR_N     (~write_en),
    .RW_ADDR  (addr),
    .DATA_IN  (write_data),
    .DATA_OUT (read_data_r0)
  );

end

else begin:REG_RAM

`ifdef SIM_VER
    initial begin 
        #1;
        if((DATA*DEPTH >1023)&&(DEPTH > 31)) $display("MEM_WARNING: [%m] NO memory match DATA=%d, ADDR=%d, DEPTH=%d", DATA, ADDR, DEPTH);
    end 
`endif //SIM_VER

	reg [DATA-1:0] mem [DEPTH-1:0];
	reg [DATA-1:0] read_data_r0_reg;
	assign read_data_r0 = read_data_r0_reg;
	
	always @(posedge clk) begin
	    if(chip_en & write_en) begin
	        mem[addr] <= write_data;
	    end
	end
	
	always @(posedge clk) begin
	    if(chip_en & ~write_en) begin
	        read_data_r0_reg    <= mem[addr];
	    end
	end

end
endgenerate
`else
	reg [DATA-1:0] mem [DEPTH-1:0];
	reg [DATA-1:0] read_data_r0_reg;
	assign read_data_r0 = read_data_r0_reg;
	
	
	always @(posedge clk) begin
	    if(chip_en & write_en) begin
	        mem[addr] <= write_data;
	    end
	end
	
	always @(posedge clk) begin
	    if(chip_en & ~write_en) begin
	        read_data_r0_reg    <= mem[addr];
	    end
	end

`endif

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
reg [DATA-1:0] expect_data;
reg [DATA-1:0] mem [DEPTH-1:0];
	
always @(posedge clk) begin
    if(chip_en & write_en) begin
        mem[addr] <= write_data;
    end
end

always @(posedge clk) begin
    if(chip_en & ~write_en) begin
        expect_data    <= mem[addr];
    end
    else if(chip_en & write_en) begin
        expect_data    <= write_data;
    end
end


`endif //SIM_VER

endmodule