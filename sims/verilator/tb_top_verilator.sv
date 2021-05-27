module tb_top_verilator #(

    ) (
       input wire  clk_i,
       input wire  rst_ni
    );

    wire halted;

    wire[31:0] x26 = u_soc_top.u_core.u_regs.regs[26];
    wire[31:0] x27 = u_soc_top.u_core.u_regs.regs[27];

/*
    initial begin: load_prog
        automatic logic [1023:0] firmware;

        if($value$plusargs("firmware=%s", firmware)) begin
            $display("[TESTBENCH] %t: loading firmware %0s ...",
                     $time, firmware);
            $readmemh (firmware, u_tinyriscv_soc_top.u_rom.u_gen_ram.ram);
        end else begin
            $display("No firmware specified");
        end
    end
*/

    initial begin
        $display("asdfgh\n");
        $readmemh ("simple.data",u_soc_top.u_rom._rom);
    end

    reg result_printed;

    always @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            result_printed <= 1'b0;
        end else begin
            if (!result_printed) begin
                if (x26 == 32'b1) begin
                    if (x27 == 32'b1) begin
                        $display("~~~~~~~~~~~~~~~~~~~ TEST_PASS ~~~~~~~~~~~~~~~~~~~");
                        $display("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
                        $display("~~~~~~~~~ #####     ##     ####    #### ~~~~~~~~~");
                        $display("~~~~~~~~~ #    #   #  #   #       #     ~~~~~~~~~");
                        $display("~~~~~~~~~ #    #  #    #   ####    #### ~~~~~~~~~");
                        $display("~~~~~~~~~ #####   ######       #       #~~~~~~~~~");
                        $display("~~~~~~~~~ #       #    #  #    #  #    #~~~~~~~~~");
                        $display("~~~~~~~~~ #       #    #   ####    #### ~~~~~~~~~");
                        $display("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
                    end else begin
                        $display("~~~~~~~~~~~~~~~~~~~ TEST_FAIL ~~~~~~~~~~~~~~~~~~~~");
                        $display("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
                        $display("~~~~~~~~~~######    ##       #    #     ~~~~~~~~~~");
                        $display("~~~~~~~~~~#        #  #      #    #     ~~~~~~~~~~");
                        $display("~~~~~~~~~~#####   #    #     #    #     ~~~~~~~~~~");
                        $display("~~~~~~~~~~#       ######     #    #     ~~~~~~~~~~");
                        $display("~~~~~~~~~~#       #    #     #    #     ~~~~~~~~~~");
                        $display("~~~~~~~~~~#       #    #     #    ######~~~~~~~~~~");
                        $display("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
                    end
                    result_printed <= 1'b1;
                    $finish;
                end
            end
        end
    end

    soc_top u_soc_top(
        .clk(clk_i),
        .rst(rst_ni),
        .halted_ind(halted)
    );
/*
    wire display_regs = 1'b0;

    wire write_gpr_reg = u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.we_i;
    wire[4:0] write_gpr_addr = u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.waddr_i;

    wire write_csr_reg = u_tinyriscv_soc_top.u_tinyriscv_core.u_csr_reg.exu_we_i;
    wire[31:0] write_csr_addr = u_tinyriscv_soc_top.u_tinyriscv_core.u_csr_reg.exu_waddr_i;

    always @ (posedge clk_i) begin
        if (halted && write_gpr_reg && display_regs && (write_gpr_addr == 5'd31)) begin
            $display("\n");
            $display("ra = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.ra);
            $display("sp = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.sp);
            $display("gp = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.gp);
            $display("tp = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.tp);
            $display("t0 = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.t0);
            $display("t1 = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.t1);
            $display("t2 = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.t2);
            $display("s0 = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.s0);
            $display("fp = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.fp);
            $display("s1 = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.s1);
            $display("a0 = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.a0);
            $display("a1 = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.a1);
            $display("a2 = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.a2);
            $display("a3 = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.a3);
            $display("a4 = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.a4);
            $display("a5 = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.a5);
            $display("a6 = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.a6);
            $display("a7 = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.a7);
            $display("s2 = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.s2);
            $display("s3 = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.s3);
            $display("s4 = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.s4);
            $display("s5 = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.s5);
            $display("s6 = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.s6);
            $display("s7 = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.s7);
            $display("s8 = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.s8);
            $display("s9 = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.s9);
            $display("s10 = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.s10);
            $display("s11 = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.s11);
            $display("t3 = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.t3);
            $display("t4 = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.t4);
            $display("t5 = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.t5);
            $display("t6 = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_gpr_reg.t6);
        end else if (halted && write_csr_reg && display_regs && (write_csr_addr[11:0] == 12'hc00)) begin
            $display("\n");
            $display("misa = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_csr_reg.misa);
            $display("cycle = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_csr_reg.cycle[31:0]);
            $display("cycleh = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_csr_reg.cycle[63:32]);
            $display("mtvec = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_csr_reg.mtvec);
            $display("mstatus = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_csr_reg.mstatus);
            $display("mepc = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_csr_reg.mepc);
            $display("mie = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_csr_reg.mie);
            $display("dpc = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_csr_reg.dpc);
            $display("dcsr = 0x%x", u_tinyriscv_soc_top.u_tinyriscv_core.u_csr_reg.dcsr);
        end
    end

*/

endmodule // tb_top_verilator