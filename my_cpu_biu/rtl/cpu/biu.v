module biu(
    input clk,
    input rst_n,

    // master 0 interface            //ex
    input        m0_req, 
    input        m0_we,         
    input [31:0] m0_addr,      
    input [3:0]  m0_addr_sel,
    input [31:0] m0_wdata,         
    output reg [31:0] m0_rdata,                               

    // master 1 interface            //if
    input        m1_req, 
    input        m1_we,         
    input [31:0] m1_addr,      
    input [3:0]  m1_addr_sel,
    input [31:0] m1_wdata,         
    output reg [31:0] m1_rdata,

    // slave 0 interface            //rom
    output reg        s0_we,         
    output reg [31:0] s0_addr,      
    output reg [3:0]  s0_addr_sel,
    output reg [31:0] s0_wdata,         
    input  [31:0] s0_rdata,   

    // slave 1 interface            //ram
    output reg       s1_we,         
    output reg [31:0] s1_addr,      
    output reg [3:0]  s1_addr_sel,
    output reg [31:0] s1_wdata,         
    input [31:0] s1_rdata,

    output reg biu_hold_flag

);

reg [1:0] sel_master;
parameter master0 = 2'b01;
parameter master1 = 2'b10;

wire req[1:0];     //req[0] = m0 req[1] = m1
assign req = {m1_req,m0_req};

always @(*) begin
    if(req[0] == 1'b1) begin
        sel_master = master0;
        biu_hold_flag  = 1'b1;
    end
    else begin
        sel_master = master1;
        biu_hold_flag  = 1'b0;
    end
end

always @(*) begin

    s0_we       = 1'b0;
    s1_we       = 1'b0;    
    s0_addr     = 32'b0;
    s1_addr     = 32'b0;
    s0_addr_sel = 4'b0;
    s1_addr_sel = 4'b0;
    s0_wdata    = 32'b0;
    s1_wdata    = 32'b0;
    m0_rdata    = 32'b0;
    m1_rdata    = 31'b1;

    case(sel_master)
        master0:begin
            case(m0_addr[31:28])
                4'b0:begin
                    s0_we       = m0_we;         
                    s0_addr     = {{4'b0},{m0_addr[27:0]}};     
                    s0_addr_sel = m0_addr_sel;
                    s0_wdata    = m0_wdata;         
                    m0_rdata    = s0_rdata;   
                end
                4'b1:begin
                    s1_we       = m0_we;         
                    s1_addr     = {{4'b0},{m0_addr[27:0]}};      
                    s1_addr_sel = m0_addr_sel;
                    s1_wdata    = m0_wdata;         
                    m0_rdata    = s1_rdata;   
                end
            default:begin
                
            end
            endcase
        end
        master1:begin
            case(m1_addr[31:28])
                4'b0:begin
                    s0_we       = m1_we;         
                    s0_addr     = {{4'b0},{m1_addr[27:0]}};     
                    s0_addr_sel = m1_addr_sel;
                    s0_wdata    = m1_wdata;         
                    m1_rdata    = s0_rdata;   
                end
                4'b1:begin
                    s1_we       = m1_we;         
                    s1_addr     = {{4'b0},{m1_addr[27:0]}};          
                    s1_addr_sel = m1_addr_sel;
                    s1_wdata    = m1_wdata;         
                    m1_rdata    = s1_rdata;   
                end
            default:begin
                
            end
            endcase
        end
        default:begin
            
        end
    endcase
end
endmodule