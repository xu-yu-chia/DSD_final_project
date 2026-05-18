`timescale 1ns / 1ps

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
    reg [15:0] display_bcd;
    reg score_seen;

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

    initial begin
        FPGA_clk = 1'b0;
        rstn = 1'b0;
        tc = 4'd15;
        mode = 1'b0;
        st = 1'b0;
        score_seen = 1'b0;

        repeat (20) @(posedge FPGA_clk);
        rstn = 1'b1;
        repeat (20) @(posedge FPGA_clk);

        st = 1'b1;
        repeat (1000100) @(posedge FPGA_clk);
        st = 1'b0;

        mode = 1'b1;
        timeout_cycles = 0;
        while (!score_seen && timeout_cycles < 2500000) begin
            sample_display(display_bcd, 70000);
            timeout_cycles = timeout_cycles + 70000;
            if (display_bcd === 16'h0100) begin
                score_seen = 1'b1;
            end
        end

        $display("score_bcd = %h", display_bcd);
        if (!score_seen) begin
            $display("FINALPROJECT_SIM_FAIL score did not reach 0100");
            $fatal;
        end

        mode = 1'b0;
        for (tc_idx = 0; tc_idx < 15; tc_idx = tc_idx + 1) begin
            tc = tc_idx[3:0];
            sample_display(display_bcd, 70000);
            $display("tc = %h, bcd = %h", tc, display_bcd);
            if (display_bcd !== expected_status_bcd(tc_idx)) begin
                $display("FINALPROJECT_SIM_FAIL tc = %h expected %h got %h",
                         tc, expected_status_bcd(tc_idx), display_bcd);
                $fatal;
            end
        end

        $display("FINALPROJECT_SIM_PASS");
        $finish;
    end
endmodule
