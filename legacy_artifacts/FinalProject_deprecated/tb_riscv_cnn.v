`timescale 1ns / 1ps

module tb_riscv_cnn;
    reg clk;
    reg rstn;
    reg [3:0] tc;
    reg mode;
    reg st;
    wire [6:0] seven_seg;
    wire [3:0] anode;

    RISCV_CNN dut (
        .clk(clk),
        .rstn(rstn),
        .tc(tc),
        .mode(mode),
        .st(st),
        .seven_seg(seven_seg),
        .anode(anode)
    );

    reg signed [7:0] ref_inter [0:1023];
    reg signed [7:0] ref_final [0:1023];
    reg signed [7:0] tb_w0 [0:8];
    reg signed [7:0] tb_w1 [0:8];
    integer total_errors;

    always #5 clk = ~clk;

    function signed [7:0] lane_value;
        input [31:0] word;
        input integer lane;
        begin
            case (lane)
                0: lane_value = word[31:24];
                1: lane_value = word[23:16];
                2: lane_value = word[15:8];
                default: lane_value = word[7:0];
            endcase
        end
    endfunction

    function signed [7:0] mem_feature;
        input integer base_addr;
        input integer width;
        input integer row;
        input integer col;
        integer idx;
        begin
            idx = row * width + col;
            mem_feature = lane_value(dut.u_mem.mem[base_addr + (idx / 4)], idx % 4);
        end
    endfunction

    function signed [7:0] round_sat_q12_to_q6;
        input signed [31:0] value;
        reg signed [31:0] base;
        reg signed [31:0] rounded;
        reg [5:0] rem;
        begin
            base = value >>> 6;
            rem = value - (base <<< 6);
            if (rem < 6'd32)
                rounded = base;
            else if (rem > 6'd32)
                rounded = base + 32'sd1;
            else if (base[0] == 1'b0)
                rounded = base;
            else
                rounded = base + 32'sd1;

            if (rounded > 32'sd127)
                round_sat_q12_to_q6 = 8'sd127;
            else if (rounded < -32'sd128)
                round_sat_q12_to_q6 = -8'sd128;
            else
                round_sat_q12_to_q6 = rounded[7:0];
        end
    endfunction

    task load_weights;
        begin
            tb_w0[0] = lane_value(dut.u_mem.mem[0], 0);
            tb_w0[1] = lane_value(dut.u_mem.mem[0], 1);
            tb_w0[2] = lane_value(dut.u_mem.mem[0], 2);
            tb_w0[3] = lane_value(dut.u_mem.mem[0], 3);
            tb_w0[4] = lane_value(dut.u_mem.mem[1], 0);
            tb_w0[5] = lane_value(dut.u_mem.mem[1], 1);
            tb_w0[6] = lane_value(dut.u_mem.mem[1], 2);
            tb_w0[7] = lane_value(dut.u_mem.mem[1], 3);
            tb_w0[8] = lane_value(dut.u_mem.mem[2], 0);

            tb_w1[0] = lane_value(dut.u_mem.mem[3], 0);
            tb_w1[1] = lane_value(dut.u_mem.mem[3], 1);
            tb_w1[2] = lane_value(dut.u_mem.mem[3], 2);
            tb_w1[3] = lane_value(dut.u_mem.mem[3], 3);
            tb_w1[4] = lane_value(dut.u_mem.mem[4], 0);
            tb_w1[5] = lane_value(dut.u_mem.mem[4], 1);
            tb_w1[6] = lane_value(dut.u_mem.mem[4], 2);
            tb_w1[7] = lane_value(dut.u_mem.mem[4], 3);
            tb_w1[8] = lane_value(dut.u_mem.mem[5], 0);
        end
    endtask

    task check_case;
        input [3:0] case_tc;
        integer n;
        integer ow0;
        integer ow1;
        integer r;
        integer c;
        integer kr;
        integer kc;
        integer idx;
        integer case_errors;
        integer reserved_addr;
        reg signed [7:0] bias0;
        reg signed [7:0] bias1;
        reg signed [31:0] acc;
        reg signed [7:0] actual;
        reg signed [7:0] expected;
        reg [31:0] exp_bias0_word;
        reg [31:0] exp_bias1_word;
        reg [31:0] x2_word;
        reg [31:0] x3_word;
        begin
            case_errors = 0;
            n = dut.u_mem.mem[12][6:1];
            ow0 = n - 2;
            ow1 = n - 4;
            load_weights;
            bias0 = dut.u_mem.mem[14][7:0];
            bias1 = dut.u_mem.mem[15][7:0];

            exp_bias0_word = dut.u_mem.mem[16] + dut.u_mem.mem[17] + dut.u_mem.mem[18];
            x2_word = dut.u_mem.mem[16];
            x3_word = dut.u_mem.mem[17];
            if (!($signed(x3_word) < $signed(x2_word)))
                x3_word = x2_word + 32'd64;
            exp_bias1_word = x2_word - x3_word + 32'd1;

            if (dut.u_mem.mem[14] !== exp_bias0_word) begin
                $display("TC%0d bias0 mismatch: got %h expected %h", case_tc, dut.u_mem.mem[14], exp_bias0_word);
                case_errors = case_errors + 1;
            end
            if (dut.u_mem.mem[15] !== exp_bias1_word) begin
                $display("TC%0d bias1 mismatch: got %h expected %h", case_tc, dut.u_mem.mem[15], exp_bias1_word);
                case_errors = case_errors + 1;
            end
            if (dut.u_mem.mem[13] !== 32'd1025) begin
                $display("TC%0d status mismatch: got %h expected 00000401", case_tc, dut.u_mem.mem[13]);
                case_errors = case_errors + 1;
            end

            for (r = 0; r < ow0; r = r + 1) begin
                for (c = 0; c < ow0; c = c + 1) begin
                    acc = {{18{bias0[7]}}, bias0, 6'd0};
                    for (kr = 0; kr < 3; kr = kr + 1) begin
                        for (kc = 0; kc < 3; kc = kc + 1) begin
                            acc = acc + (mem_feature(16, n, r + kr, c + kc) * tb_w0[kr * 3 + kc]);
                        end
                    end
                    ref_inter[r * ow0 + c] = round_sat_q12_to_q6(acc);
                end
            end

            for (r = 0; r < ow1; r = r + 1) begin
                for (c = 0; c < ow1; c = c + 1) begin
                    acc = {{18{bias1[7]}}, bias1, 6'd0};
                    for (kr = 0; kr < 3; kr = kr + 1) begin
                        for (kc = 0; kc < 3; kc = kc + 1) begin
                            acc = acc + (ref_inter[(r + kr) * ow0 + (c + kc)] * tb_w1[kr * 3 + kc]);
                        end
                    end
                    ref_final[r * ow1 + c] = round_sat_q12_to_q6(acc);
                end
            end

            for (idx = 0; idx < ow1 * ow1; idx = idx + 1) begin
                actual = lane_value(dut.u_mem.mem[512 + (idx / 4)], idx % 4);
                expected = ref_final[idx];
                if (actual !== expected) begin
                    if (case_errors < 20)
                        $display("TC%0d output[%0d] mismatch: got %0d expected %0d", case_tc, idx, actual, expected);
                    case_errors = case_errors + 1;
                end
            end

            for (reserved_addr = 960; reserved_addr < 1024; reserved_addr = reserved_addr + 1) begin
                if (dut.u_mem.mem[reserved_addr] !== 32'd0) begin
                    $display("TC%0d reserved memory[%0d] overwritten: %h", case_tc, reserved_addr, dut.u_mem.mem[reserved_addr]);
                    case_errors = case_errors + 1;
                end
            end

            if (case_errors == 0)
                $display("TC%0d PASS: N=%0d, cycles=%0d", case_tc, n, dut.u_tester.cycle_count);
            else
                $display("TC%0d FAIL: %0d error(s)", case_tc, case_errors);
            total_errors = total_errors + case_errors;
        end
    endtask

    task run_case;
        input [3:0] case_tc;
        integer timeout;
        begin
            tc = case_tc;
            mode = 1'b0;
            st = 1'b0;
            rstn = 1'b0;
            repeat (8) @(posedge clk);
            rstn = 1'b1;
            repeat (8) @(posedge clk);

            st = 1'b1;
            @(posedge clk);
            st = 1'b0;

            timeout = 0;
            while (dut.u_tester.phase !== 2'd2 && timeout < 10000) begin
                @(posedge clk);
                timeout = timeout + 1;
            end

            if (timeout >= 10000) begin
                $display("TC%0d FAIL: timeout waiting for local tester RUN phase", case_tc);
                total_errors = total_errors + 1;
            end

            timeout = 0;
            while (dut.u_mem.mem[13][0] !== 1'b1 && timeout < 300000) begin
                @(posedge clk);
                timeout = timeout + 1;
            end

            if (timeout >= 300000) begin
                $display("TC%0d FAIL: timeout waiting for DataMemory[13][0]", case_tc);
                $display("  debug: mem6=%h mem12=%h mem13=%h mem14=%h mem15=%h cpu_pc=%h cnn_state=%0d tester_phase=%0d",
                         dut.u_mem.mem[6], dut.u_mem.mem[12], dut.u_mem.mem[13],
                         dut.u_mem.mem[14], dut.u_mem.mem[15], dut.u_cpu.pc,
                         dut.u_cnn.state, dut.u_tester.phase);
                total_errors = total_errors + 1;
            end else begin
                repeat (10) @(posedge clk);
                check_case(case_tc);
            end
        end
    endtask

    initial begin
        clk = 1'b0;
        rstn = 1'b0;
        tc = 4'd0;
        mode = 1'b0;
        st = 1'b0;
        total_errors = 0;

        run_case(4'd0);
        run_case(4'd1);
        run_case(4'd2);
        run_case(4'd3);
        run_case(4'd4);
        run_case(4'd5);
        run_case(4'd6);
        run_case(4'd7);
        run_case(4'd8);
        run_case(4'd9);
        run_case(4'd10);

        if (total_errors == 0)
            $display("ALL TESTCASES PASSED");
        else
            $display("TOTAL ERRORS: %0d", total_errors);

        $finish;
    end
endmodule
