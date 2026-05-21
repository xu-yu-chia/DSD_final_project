`timescale 1ns / 1ps

`ifdef POST_SYNTH_FAST_START
`define TB_FAST_START
`endif

`ifdef POST_IMPL_FAST_START
`define TB_FAST_START
`endif

`ifdef POST_SYNTH_SCORE_ONLY
`define TB_SCORE_ONLY
`endif

`ifdef POST_IMPL_SCORE_ONLY
`define TB_SCORE_ONLY
`endif

module tb_finalproject;
    reg FPGA_clk;
    reg rstn;
    reg [3:0] tc;
    reg mode;
    reg st;
    wire [6:0] seven_seg;
    wire [3:0] anode;

    integer timeout_cycles;
    integer tc_idx;
    integer fail_count;
    reg [15:0] display_bcd;
    reg score_seen;
`ifdef POST_IMPL_MISMATCH_DIAG
    reg [14:0] post_impl_mismatch_seen;
    reg [3:0] post_impl_diag_tid;
    reg [31:0] post_impl_diag_golden;
`endif

    RISCV_CNN dut (
        .clk(FPGA_clk),
        .rstn(rstn),
        .tc(tc),
        .mode(mode),
        .st(st),
        .seven_seg(seven_seg),
        .anode(anode)
    );

    always #5 FPGA_clk = ~FPGA_clk;

    function [3:0] decode_seg;
        input [6:0] seg;
        begin
            case (seg)
                7'b1111110: decode_seg = 4'h0;
                7'b0110000: decode_seg = 4'h1;
                7'b1101101: decode_seg = 4'h2;
                7'b1111001: decode_seg = 4'h3;
                7'b0110011: decode_seg = 4'h4;
                7'b1011011: decode_seg = 4'h5;
                7'b1011111: decode_seg = 4'h6;
                7'b1110000: decode_seg = 4'h7;
                7'b1111111: decode_seg = 4'h8;
                7'b1111011: decode_seg = 4'h9;
                7'b1110111: decode_seg = 4'ha;
                7'b0011111: decode_seg = 4'hb;
                7'b1001110: decode_seg = 4'hc;
                7'b0111101: decode_seg = 4'hd;
                7'b1001111: decode_seg = 4'he;
                7'b1000111: decode_seg = 4'hf;
                default:    decode_seg = 4'hx;
            endcase
        end
    endfunction

    function [15:0] expected_status_bcd;
        input integer idx;
        begin
            case (idx)
                0:  expected_status_bcd = 16'h0001;
                1:  expected_status_bcd = 16'h0011;
                2:  expected_status_bcd = 16'h0021;
                3:  expected_status_bcd = 16'h0031;
                4:  expected_status_bcd = 16'h0041;
                5:  expected_status_bcd = 16'h0051;
                6:  expected_status_bcd = 16'h0061;
                7:  expected_status_bcd = 16'h0071;
                8:  expected_status_bcd = 16'h0081;
                9:  expected_status_bcd = 16'h0091;
                10: expected_status_bcd = 16'h0101;
                11: expected_status_bcd = 16'h0111;
                12: expected_status_bcd = 16'h0121;
                13: expected_status_bcd = 16'h0131;
                14: expected_status_bcd = 16'h0141;
                default: expected_status_bcd = 16'hxxxx;
            endcase
        end
    endfunction

    task sample_display;
        output [15:0] bcd;
        input integer cycles;
        integer k;
        reg [3:0] nibble;
        begin
            bcd = 16'hxxxx;
            for (k = 0; k < cycles; k = k + 1) begin
                @(posedge FPGA_clk);
                nibble = decode_seg(seven_seg);
                if (nibble !== 4'hx) begin
                    case (anode)
                        4'b0001: bcd[3:0]   = nibble;
                        4'b0010: bcd[7:4]   = nibble;
                        4'b0100: bcd[11:8]  = nibble;
                        4'b1000: bcd[15:12] = nibble;
                        default: begin
                        end
                    endcase
                end
            end
        end
    endtask

    task sample_display_fast_scan;
        output [15:0] bcd;
        integer digit;
        reg [3:0] nibble;
        begin
            bcd = 16'hxxxx;
            for (digit = 0; digit < 4; digit = digit + 1) begin
                force dut.u_test_circuit.scan_sel_q = digit[1:0];
                repeat (4) @(posedge FPGA_clk);
                nibble = decode_seg(seven_seg);
                case (digit)
                    0: bcd[3:0]   = nibble;
                    1: bcd[7:4]   = nibble;
                    2: bcd[11:8]  = nibble;
                    3: bcd[15:12] = nibble;
                    default: begin
                    end
                endcase
            end
            release dut.u_test_circuit.scan_sel_q;
        end
    endtask

    task apply_start;
        begin
`ifdef TB_FAST_START
            $display("TB_PROGRESS fast start pulse at %0t", $time);
            st = 1'b1;
            force dut.u_test_circuit.start_stable_reg_n_0 = 1'b1;
            force dut.u_test_circuit.start_stable_d = 1'b0;
            @(posedge FPGA_clk);
            release dut.u_test_circuit.start_stable_reg_n_0;
            release dut.u_test_circuit.start_stable_d;
            st = 1'b0;
            repeat (20) @(posedge FPGA_clk);
`else
            st = 1'b1;
            repeat (1000100) @(posedge FPGA_clk);
            st = 1'b0;
`endif
        end
    endtask

    task display_score;
        input [15:0] bcd;
        begin
`ifdef POST_IMPL_DISPLAY_CHECK
            $display("post_impl_score_bcd = %h", bcd);
`else
`ifdef POST_SYNTH_DISPLAY_CHECK
            $display("post_synth_score_bcd = %h", bcd);
`else
            $display("score_bcd = %h", bcd);
`endif
`endif
        end
    endtask

    task display_status;
        input [3:0] idx;
        input [15:0] bcd;
        begin
`ifdef POST_IMPL_DISPLAY_CHECK
            $display("post_impl_tcx_bcd = %h", bcd);
`else
`ifdef POST_SYNTH_DISPLAY_CHECK
            $display("post_synth_tcx_bcd = %h", bcd);
`else
            $display("tc = %h, bcd = %h", idx, bcd);
`endif
`endif
        end
    endtask

    task display_pass;
        begin
`ifdef POST_IMPL_DISPLAY_CHECK
            $display("FINALPROJECT_POST_IMPL_PASS");
`else
`ifdef POST_SYNTH_DISPLAY_CHECK
            $display("FINALPROJECT_POST_SYNTH_PASS");
`else
            $display("FINALPROJECT_SIM_PASS");
`endif
`endif
        end
    endtask

    task display_fail;
        input integer count;
        begin
`ifdef POST_IMPL_DISPLAY_CHECK
            $display("FINALPROJECT_POST_IMPL_FAIL fail_count = %0d", count);
`else
`ifdef POST_SYNTH_DISPLAY_CHECK
            $display("FINALPROJECT_POST_SYNTH_FAIL fail_count = %0d", count);
`else
            $display("FINALPROJECT_SIM_FAIL fail_count = %0d", count);
`endif
`endif
        end
    endtask

    task display_post_impl_diag_results;
        begin
`ifdef POST_IMPL_DIAG_RESULTS
            $display("POST_IMPL_DIAG score_bcd = %h", display_bcd);
            $display("POST_IMPL_DIAG tc=00 valid=%b pass=%b", dut.u_test_circuit.\result_valid_reg_n_0_[0] , dut.u_test_circuit.\result_pass_reg_n_0_[0] );
            $display("POST_IMPL_DIAG tc=01 valid=%b pass=%b", dut.u_test_circuit.\result_valid_reg_n_0_[1] , dut.u_test_circuit.\result_pass_reg_n_0_[1] );
            $display("POST_IMPL_DIAG tc=02 valid=%b pass=%b", dut.u_test_circuit.\result_valid_reg_n_0_[2] , dut.u_test_circuit.\result_pass_reg_n_0_[2] );
            $display("POST_IMPL_DIAG tc=03 valid=%b pass=%b", dut.u_test_circuit.\result_valid_reg_n_0_[3] , dut.u_test_circuit.\result_pass_reg_n_0_[3] );
            $display("POST_IMPL_DIAG tc=04 valid=%b pass=%b", dut.u_test_circuit.\result_valid_reg_n_0_[4] , dut.u_test_circuit.\result_pass_reg_n_0_[4] );
            $display("POST_IMPL_DIAG tc=05 valid=%b pass=%b", dut.u_test_circuit.\result_valid_reg_n_0_[5] , dut.u_test_circuit.\result_pass_reg_n_0_[5] );
            $display("POST_IMPL_DIAG tc=06 valid=%b pass=%b", dut.u_test_circuit.\result_valid_reg_n_0_[6] , dut.u_test_circuit.\result_pass_reg_n_0_[6] );
            $display("POST_IMPL_DIAG tc=07 valid=%b pass=%b", dut.u_test_circuit.\result_valid_reg_n_0_[7] , dut.u_test_circuit.\result_pass_reg_n_0_[7] );
            $display("POST_IMPL_DIAG tc=08 valid=%b pass=%b", dut.u_test_circuit.\result_valid_reg_n_0_[8] , dut.u_test_circuit.\result_pass_reg_n_0_[8] );
            $display("POST_IMPL_DIAG tc=09 valid=%b pass=%b", dut.u_test_circuit.\result_valid_reg_n_0_[9] , dut.u_test_circuit.\result_pass_reg_n_0_[9] );
            $display("POST_IMPL_DIAG tc=10 valid=%b pass=%b", dut.u_test_circuit.\result_valid_reg_n_0_[10] , dut.u_test_circuit.\result_pass_reg_n_0_[10] );
            $display("POST_IMPL_DIAG tc=11 valid=%b pass=%b", dut.u_test_circuit.\result_valid_reg_n_0_[11] , dut.u_test_circuit.\result_pass_reg_n_0_[11] );
            $display("POST_IMPL_DIAG tc=12 valid=%b pass=%b", dut.u_test_circuit.\result_valid_reg_n_0_[12] , dut.u_test_circuit.\result_pass_reg_n_0_[12] );
            $display("POST_IMPL_DIAG tc=13 valid=%b pass=%b", dut.u_test_circuit.\result_valid_reg_n_0_[13] , dut.u_test_circuit.\result_pass_reg_n_0_[13] );
            $display("POST_IMPL_DIAG tc=14 valid=%b pass=%b", dut.u_test_circuit.\result_valid_reg_n_0_[14] , dut.u_test_circuit.\result_pass_reg_n_0_[14] );
`endif
        end
    endtask

`ifdef POST_IMPL_MISMATCH_DIAG
    function [3:0] post_impl_current_test_id;
        input dummy;
        begin
            post_impl_current_test_id = dut.u_test_circuit.init_rom_base[13:10];
        end
    endfunction

    function [31:0] post_impl_golden_word_q;
        input dummy;
        begin
            post_impl_golden_word_q = {
                dut.u_test_circuit.\golden_word_q_reg_n_0_[31] ,
                dut.u_test_circuit.\golden_word_q_reg_n_0_[30] ,
                dut.u_test_circuit.\golden_word_q_reg_n_0_[29] ,
                dut.u_test_circuit.\golden_word_q_reg_n_0_[28] ,
                dut.u_test_circuit.\golden_word_q_reg_n_0_[27] ,
                dut.u_test_circuit.\golden_word_q_reg_n_0_[26] ,
                dut.u_test_circuit.\golden_word_q_reg_n_0_[25] ,
                dut.u_test_circuit.\golden_word_q_reg_n_0_[24] ,
                dut.u_test_circuit.\golden_word_q_reg_n_0_[23] ,
                dut.u_test_circuit.\golden_word_q_reg_n_0_[22] ,
                dut.u_test_circuit.\golden_word_q_reg_n_0_[21] ,
                dut.u_test_circuit.\golden_word_q_reg_n_0_[20] ,
                dut.u_test_circuit.\golden_word_q_reg_n_0_[19] ,
                dut.u_test_circuit.\golden_word_q_reg_n_0_[18] ,
                dut.u_test_circuit.\golden_word_q_reg_n_0_[17] ,
                dut.u_test_circuit.\golden_word_q_reg_n_0_[16] ,
                dut.u_test_circuit.\golden_word_q_reg_n_0_[15] ,
                dut.u_test_circuit.\golden_word_q_reg_n_0_[14] ,
                dut.u_test_circuit.\golden_word_q_reg_n_0_[13] ,
                dut.u_test_circuit.\golden_word_q_reg_n_0_[12] ,
                dut.u_test_circuit.\golden_word_q_reg_n_0_[11] ,
                dut.u_test_circuit.\golden_word_q_reg_n_0_[10] ,
                dut.u_test_circuit.\golden_word_q_reg_n_0_[9] ,
                dut.u_test_circuit.\golden_word_q_reg_n_0_[8] ,
                dut.u_test_circuit.\golden_word_q_reg_n_0_[7] ,
                dut.u_test_circuit.\golden_word_q_reg_n_0_[6] ,
                dut.u_test_circuit.\golden_word_q_reg_n_0_[5] ,
                dut.u_test_circuit.\golden_word_q_reg_n_0_[4] ,
                dut.u_test_circuit.\golden_word_q_reg_n_0_[3] ,
                dut.u_test_circuit.\golden_word_q_reg_n_0_[2] ,
                dut.u_test_circuit.\golden_word_q_reg_n_0_[1] ,
                dut.u_test_circuit.\golden_word_q_reg_n_0_[0]
            };
        end
    endfunction

    always @(posedge FPGA_clk) begin
        if (rstn && dut.u_test_circuit.state == 5'd23) begin
            post_impl_diag_tid = post_impl_current_test_id(1'b0);
            post_impl_diag_golden = post_impl_golden_word_q(1'b0);
            if ((dut.u_test_circuit.mem_rdata_q !== post_impl_diag_golden) &&
                !post_impl_mismatch_seen[post_impl_diag_tid]) begin
                post_impl_mismatch_seen[post_impl_diag_tid] = 1'b1;
                $display("POST_IMPL_MISMATCH tc=%0d ofmap_idx=%0d addr=%0d actual=%h golden=%h time=%0t",
                         post_impl_diag_tid,
                         dut.u_test_circuit.ofmap_idx_q,
                         dut.u_test_circuit.addra,
                         dut.u_test_circuit.mem_rdata_q,
                         post_impl_diag_golden,
                         $time);
                if (post_impl_mismatch_seen[3] &&
                    post_impl_mismatch_seen[7] &&
                    post_impl_mismatch_seen[9]) begin
                    $display("POST_IMPL_MISMATCH_DIAG_DONE");
                    $finish;
                end
            end
        end
    end
`endif

    task wait_for_score;
        begin
            timeout_cycles = 0;
`ifdef POST_IMPL_DIAG_RESULTS
            while (!score_seen && timeout_cycles < 120000) begin
`else
`ifdef POST_IMPL_SCORE_ONLY
            while (!score_seen && timeout_cycles < 220000) begin
`else
            while (!score_seen && timeout_cycles < 2500000) begin
`endif
`endif
`ifdef POST_IMPL_DIRECT_SCORE
                repeat (5000) @(posedge FPGA_clk);
                timeout_cycles = timeout_cycles + 5000;
                display_bcd = {7'b0, dut.u_test_circuit.display_value_q[8:0]};
`ifdef TB_PROGRESS
                $display("TB_PROGRESS direct_score_wait_cycles = %0d, score_bcd = %h, sim_time = %0t",
                         timeout_cycles, display_bcd, $time);
`endif
`else
`ifdef POST_IMPL_FAST_SCAN
                repeat (10000) @(posedge FPGA_clk);
                timeout_cycles = timeout_cycles + 10000;
                sample_display_fast_scan(display_bcd);
`ifdef TB_PROGRESS
                $display("TB_PROGRESS fast_scan_wait_cycles = %0d, score_bcd = %h, sim_time = %0t",
                         timeout_cycles, display_bcd, $time);
`endif
`else
                sample_display(display_bcd, 70000);
                timeout_cycles = timeout_cycles + 70000;
`ifdef TB_PROGRESS
                $display("TB_PROGRESS score_wait_cycles = %0d, score_bcd = %h, sim_time = %0t",
                         timeout_cycles, display_bcd, $time);
`endif
`endif
`endif
                if (display_bcd === 16'h0100) begin
                    score_seen = 1'b1;
                end
            end
        end
    endtask

    initial begin
        FPGA_clk = 1'b0;
        rstn = 1'b0;
        tc = 4'd15;
        mode = 1'b0;
        st = 1'b0;
        fail_count = 0;
        score_seen = 1'b0;
`ifdef POST_IMPL_MISMATCH_DIAG
        post_impl_mismatch_seen = 15'd0;
        post_impl_diag_tid = 4'd0;
        post_impl_diag_golden = 32'd0;
`endif

        repeat (20) @(posedge FPGA_clk);
        @(negedge FPGA_clk);
        rstn = 1'b1;
        repeat (20) @(posedge FPGA_clk);

        apply_start;

`ifdef POST_IMPL_DIAG_QUICK
        mode = 1'b1;
        repeat (100000) @(posedge FPGA_clk);
        sample_display_fast_scan(display_bcd);
        display_score(display_bcd);
        display_post_impl_diag_results;
        $finish;
`endif

        mode = 1'b1;
        wait_for_score;

        display_score(display_bcd);
        if (!score_seen) begin
            display_post_impl_diag_results;
`ifdef POST_IMPL_DISPLAY_CHECK
            $display("FINALPROJECT_POST_IMPL_FAIL score did not reach 0100");
`else
`ifdef POST_SYNTH_DISPLAY_CHECK
            $display("FINALPROJECT_POST_SYNTH_FAIL score did not reach 0100");
`else
            $display("FINALPROJECT_SIM_FAIL score did not reach 0100");
`endif
`endif
            fail_count = fail_count + 1;
        end

`ifdef TB_SCORE_ONLY
        if (fail_count == 0) begin
            display_pass;
        end else begin
            display_fail(fail_count);
            $fatal;
        end
        $finish;
`endif

        mode = 1'b0;
        for (tc_idx = 0; tc_idx < 15; tc_idx = tc_idx + 1) begin
            tc = tc_idx[3:0];
            sample_display(display_bcd, 70000);
            display_status(tc, display_bcd);
            if (display_bcd !== expected_status_bcd(tc_idx)) begin
`ifdef POST_IMPL_DISPLAY_CHECK
                $display("FINALPROJECT_POST_IMPL_FAIL tc = %h expected %h got %h",
                         tc, expected_status_bcd(tc_idx), display_bcd);
`else
`ifdef POST_SYNTH_DISPLAY_CHECK
                $display("FINALPROJECT_POST_SYNTH_FAIL tc = %h expected %h got %h",
                         tc, expected_status_bcd(tc_idx), display_bcd);
`else
                $display("FINALPROJECT_SIM_FAIL tc = %h expected %h got %h",
                         tc, expected_status_bcd(tc_idx), display_bcd);
`endif
`endif
                fail_count = fail_count + 1;
            end
        end

        if (fail_count == 0) begin
            display_pass;
        end else begin
            display_fail(fail_count);
            $fatal;
        end
        $finish;
    end
endmodule
