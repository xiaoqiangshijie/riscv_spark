module dcache_data_array #(
    parameter   DATA        = 256,
    parameter   ADDR        = 8,
    parameter   DEPTH       = (2**ADDR),
    parameter   PIPELINE    = 0,    // enable additional pipeline register on output
    parameter   WARNINGS    = 1
) (
    input   wire                clk        ,
    input   wire                rstn       ,
    input   wire                cg_bypass  ,
    input   wire                slp        ,
    input   wire                sd         ,
    input   wire    [ADDR-1:0]  addr       ,
    input   wire                chip_en    ,
    input   wire                write_en   ,
    input   wire    [DATA-1:0]  write_data ,
    input   wire    [31:0]      byte_chose ,
    output  reg     [DATA-1:0]  read_data     //Dcache output 63bit tbd
);


// Distinguish between I-CACHE and D-CACHE,
// I-CACHE has 4byte particle size of M and B has A particle size of N
localparam    PART   = 8;
localparam    NUMBER = DATA/PART;   //   DATA / Byte


wire  [NUMBER-1:0]      part_chip_en                ; 
wire  [PART-1:0]        part_write_data [NUMBER-1:0];
wire  [PART-1:0]        part_read_data  [NUMBER-1:0];  

genvar i;
generate 

for(i=0; i<NUMBER; i=i+1)begin:MEM_BYTE 

    assign  part_chip_en[i]    = chip_en & byte_chose[i];
    
    assign  part_write_data[i] = write_data[PART*(i+1)-1 : PART*i]; 

    ram_sp  #(
        .DATA               ( PART     ),
        .ADDR               ( ADDR     ),
        .DEPTH              ( DEPTH    ),
        .PIPELINE           ( 0        )
    )  
    u_ram_sp (
        .clk            ( clk                  ),
        .rstn           ( rstn                 ),
        .slp            ( 1'b0                 ),
        .sd             ( 1'b0                 ),
        .addr           ( addr                 ),
        .cg_bypass      ( 1'b1                 ),    
        .chip_en        ( part_chip_en[i]      ),
        .write_en       ( write_en             ),
        .write_data     ( part_write_data[i]   ),
        .read_data      ( part_read_data[i]    )
    );

end

endgenerate


reg [3:0]  rd_double_word_chose;  


//D-CACHE read , output 64bit(8 byte), the byte_chose info should pipe 1cycle to align with ram_output

//TBD lowpower

//always @(posedge clk or negedge rstn) begin
//    if(!rstn)begin
//        rd_double_word_chose <= 4'd0;
//    end
//    else if(chip_en & (!write_en)) begin
//        rd_double_word_chose <= {byte_chose[24],byte_chose[16],byte_chose[8],byte_chose[0]};  
//    end
//end
//
//always@(*)begin
//    case (rd_double_word_chose)
//        4'b0001:  read_data = {part_read_data[7] ,part_read_data[6] , part_read_data[5] , part_read_data[4] , part_read_data[3] ,part_read_data[2] ,part_read_data[1] ,part_read_data[0]};
//        4'b0010:  read_data = {part_read_data[15],part_read_data[14], part_read_data[13], part_read_data[12], part_read_data[11],part_read_data[10],part_read_data[9] ,part_read_data[8]};
//        4'b0100:  read_data = {part_read_data[23],part_read_data[22], part_read_data[21], part_read_data[20], part_read_data[19],part_read_data[18],part_read_data[17],part_read_data[16]};
//        4'b1000:  read_data = {part_read_data[31],part_read_data[30], part_read_data[29], part_read_data[28], part_read_data[27],part_read_data[26],part_read_data[25],part_read_data[24]};
//        default:  read_data = 64'd0;
//    endcase
//end
integer j;

always@(*)begin
  for(j=0; j <= 31; j=j+1)begin: GEN_READ_DATA
      read_data[ j*8  +: 8] = part_read_data[j];       
  end
end


//  integer z;  
//  always@(*) begin
//    for(z=0;z<=EXT_IRQ_NUM;z=z+1) begin
//      prio_r_1d[z*PRIO_WIDTH +: PRIO_WIDTH] = prio_r[z];
//    end
//  end



endmodule

