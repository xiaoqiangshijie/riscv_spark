module btb (
    input         clk,
    input         rstn,
    input [31:0]  rd_pc,
    input         rd_vld,
    input         wr_req,
    input [31:0]  wr_pc,
    input [2:0]   wr_type,
    input [31:0]  wr_predict_pc,
    input         wr_taken,

    output reg [31:0] rd_pc_1d,
    output     [2:0]  rd_type,
    output            rd_hit,
    output     [31:0] rd_predict_pc,
    output            rd_predict_taken

);

    //rd_pc[31:0]       {tag[31:11],index[2:10],offset[1:0]} = rd_pc[31:0]
    parameter BUFFER_ADDR_LEN   = 9;
    parameter OFFSET = 2;
    parameter TAG_LEN           = 32 - BUFFER_ADDR_LEN - OFFSET; //TAG_LEN = 20
    parameter BUFFER_SIZE       = 1 << BUFFER_ADDR_LEN;          //BUFFER_SIZE = 512
    parameter DATA_SIZE         = 56;

    //2 reg 
    reg [BUFFER_SIZE-1:0] vld                            ;
    reg [1:0]             count      [BUFFER_SIZE-1:0]   ;
   
    //PC addr 
    wire [TAG_LEN-1:0]         wr_pc_tag;
    wire [BUFFER_ADDR_LEN-1:0] wr_pc_index;
    wire [TAG_LEN-1:0]         rd_pc_tag;
    wire [BUFFER_ADDR_LEN-1:0] rd_pc_index;

    //pc addr separate
    assign wr_pc_tag      = wr_pc [31:11];
    assign wr_pc_index    = wr_pc [10:2]; 

    assign rd_pc_tag      = rd_pc [31:11];
    assign rd_pc_index    = rd_pc [10:2];

    //define sram eq sign
    wire             wr_rd_eq_flag;
    reg              wr_rd_eq_flag_1d;
    reg [2:0]        wr_type_1d;
    reg [31:0]       wr_predict_pc_1d;
    reg              wr_taken_1d;
    //whole write read signal
    wire                       wr_en;
    wire [BUFFER_ADDR_LEN-1:0] wr_addr;
    wire [DATA_SIZE - 1:0]     wr_data;

    wire                       rd_en;
    wire [BUFFER_ADDR_LEN-1:0] rd_addr;
   
    //write read signal value
    assign wr_en   = wr_req;
    assign wr_addr = wr_pc_index;
    assign wr_data = {wr_pc_tag,wr_type,wr_predict_pc}; //wr_pc_tag = 21  wr_type = 3  wr_predict_pc = 32 21+3+32=56
    assign rd_addr = rd_pc_index;

    //define vld reg interface
    wire                       vld_wr_en;
    wire [BUFFER_ADDR_LEN-1:0] vld_wr_addr;
    wire [BUFFER_ADDR_LEN-1:0] vld_rd_addr;

    assign vld_wr_en   = wr_en ;
    assign vld_wr_addr = wr_addr;
    assign vld_rd_addr = rd_addr;

    //define count reg interface
    wire                       count_wr_en;
    wire [BUFFER_ADDR_LEN-1:0] count_wr_addr;
    wire                       count_rd_en;
    wire [BUFFER_ADDR_LEN-1:0] count_rd_addr;

    wire [1:0]                 count_rd_current;
    reg                        rd_predict_taken_r;
    reg  [1:0]                 add_ina;
    reg  [1:0]                 add_inb;
    wire [1:0]                 add_out;


    wire    count_wr_en_cond;
    assign     count_wr_en_cond = (wr_taken && count[count_wr_addr] != 2'b11) || (!wr_taken && count[count_wr_addr] != 2'b00);


    assign  count_wr_en   = wr_en & count_wr_en_cond ;
    assign  count_wr_addr = wr_addr;
    assign  count_rd_en   = rd_en && !wr_rd_eq_flag;
    assign  count_rd_addr = rd_addr;

    //define sram reg interface
    wire                       sram_wr_en;
    wire [BUFFER_ADDR_LEN-1:0] sram_wr_addr;
    wire [DATA_SIZE - 1:0]     sram_wr_data;
    wire                       sram_rd_en;
    wire [BUFFER_ADDR_LEN-1:0] sram_rd_addr;
    wire [DATA_SIZE - 1:0]     sram_rd_data;

    wire [20:0]                sram_rd_tag;
    wire [2:0]                 sram_rd_type;
    wire [31:0]                sram_rd_predict_pc;

    assign sram_wr_en   = wr_en;
    assign sram_wr_addr = wr_addr;
    assign sram_wr_data = wr_data;
    assign sram_rd_en   = rd_en && !wr_rd_eq_flag;
    assign sram_rd_addr = rd_addr;

    //define hit signal
    wire               vld_current;
    wire    [20:0]     tag_1d;
    wire               tag_hit;
    reg                vld_1d;

    //when read = write addr
    assign wr_rd_eq_flag = wr_en && rd_vld && (wr_pc == rd_pc);

    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            wr_rd_eq_flag_1d <= 1'b0;
        end
        else begin
            wr_rd_eq_flag_1d <= wr_rd_eq_flag;
        end
    end
 
    //generate write data 1d
    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            wr_type_1d       <= 3'b0;
            wr_predict_pc_1d <= 32'b0;
            wr_taken_1d      <= 1'b0;
        end
        else if (wr_rd_eq_flag) begin
            wr_type_1d        <= wr_type;
            wr_predict_pc_1d  <= wr_predict_pc;
            wr_taken_1d       <= wr_taken;
        end
    end

    //write vld
    always@(posedge clk or negedge rstn)begin
        if(!rstn) begin
            vld <= 512'b0;
        end
        else if (vld_wr_en) begin
            vld[vld_wr_addr] <= 1'b1;
        end
    end
   
    //generate rd_en
    assign vld_current = vld[vld_rd_addr];
    assign rd_en   = vld_current && rd_vld;
   
    //read vld
    always@(posedge clk or negedge rstn)begin
        if(!rstn) begin
            vld_1d <= 1'b0;
        end
        else begin
            vld_1d <= vld_current;
        end
    end

    //write PHT
    wire [1:0] a;
    assign a = count[422];


    always @(*) begin
        if(wr_taken && count[count_wr_addr] != 2'b11)begin
            add_inb = 2'b01;
            add_ina = count[count_wr_addr];
        end
        else if (!wr_taken && count[count_wr_addr] != 2'b00) begin
            add_inb = -2'b01;
            add_ina = count[count_wr_addr];
        end
        else begin
            add_inb = 2'b0;
            add_ina = 2'b0;
        end
    end

    assign add_out = add_ina + add_inb;

    genvar i;
    generate
    for( i = 0; i < BUFFER_SIZE; i = i + 1) begin:COUNT
        always @ (posedge clk or negedge rstn) begin//写入buffer
            if(!rstn) begin
                count[i] <= 2'b01;
            end
            else if(count_wr_en) begin
                if(count_wr_addr == i) begin
                    count[i] <= add_out;
                end
            end
        end
    end
    endgenerate

    //read PHT
    assign count_rd_current = count[count_rd_addr];
    always @ (posedge clk or negedge rstn) begin
        if(!rstn) begin
            rd_predict_taken_r <= 1'b0;
        end
        else if(count_rd_en) begin
            if(count_rd_current[1] == 1'b1) begin
                rd_predict_taken_r <= 1'b1;
            end
            else begin
                rd_predict_taken_r <= 1'b0;
            end
        end
    end
    assign rd_predict_taken = wr_rd_eq_flag_1d ? wr_taken_1d : rd_predict_taken_r;

    //instantiation sram
    ram_dp u_ram_dp(
        .write_clk   (clk),
        .write_en    (sram_wr_en),
        .write_addr  (sram_wr_addr),
        .write_data  (sram_wr_data),
        .read_clk    (clk),
        .read_en     (sram_rd_en),
        .read_addr   (sram_rd_addr),

        .read_data   (sram_rd_data)
    );

    //sram data div to tag type predict_pc 
    assign sram_rd_tag        = sram_rd_data[55:35];
    assign sram_rd_type       = sram_rd_data[34:32];
    assign sram_rd_predict_pc = sram_rd_data[31:0];

    //hit signal
    assign tag_1d  =  rd_pc_1d[31:11];
    assign tag_hit =  sram_rd_tag == tag_1d;
    assign rd_hit  =  wr_rd_eq_flag_1d? 1 : tag_hit && vld_1d;

    //generate rd_pc_1d
    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            rd_pc_1d <= 32'b0;
        end
        else if(rd_vld) begin
            rd_pc_1d <= rd_pc;
        end
    end
   
    //generate rd_type
    assign rd_type = wr_rd_eq_flag_1d? wr_type_1d : sram_rd_type;

    //generate rd_predict_pc
    assign rd_predict_pc = wr_rd_eq_flag_1d? wr_predict_pc_1d : sram_rd_predict_pc;

endmodule