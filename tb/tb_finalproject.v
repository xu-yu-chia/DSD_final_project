`timescale 1ns / 1ps

module tb_finalproject;
    reg FPGA_clk;
    reg rstn;
    reg [3:0] tc;
    reg mode;
    reg st;
    wire [6:0] seven_seg;
    wire [3:0] anode;

    integer timeout;

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

    initial begin
        FPGA_clk = 1'b0;
        rstn = 1'b0;
        tc = 4'd15;
        mode = 1'b0;
        st = 1'b0;
        timeout = 0;

        repeat (20) @(posedge FPGA_clk);
        rstn = 1'b1;
        repeat (20) @(posedge FPGA_clk);

        st = 1'b1;
        repeat (1100000) @(posedge FPGA_clk);
        st = 1'b0;

        while ((dut.u_test_circuit.result_valid !== 15'h7fff) && (timeout < 20000000)) begin
            @(posedge FPGA_clk);
            timeout = timeout + 1;
        end

        $display("result_valid = %h", dut.u_test_circuit.result_valid);
        $display("result_pass  = %h", dut.u_test_circuit.result_pass);
        $display("cycle_count  = %0d", dut.u_test_circuit.cycle_counter);
        $display("addr13       = %h", dut.u_test_circuit.captured_addr13);

        if (dut.u_test_circuit.result_valid === 15'h7fff &&
            dut.u_test_circuit.result_pass === 15'h7fff) begin
            $display("FINALPROJECT_RTL_PASS");
        end
        else begin
            $display("FINALPROJECT_RTL_FAIL");
            $fatal;
        end
        $finish;
    end
endmodule
