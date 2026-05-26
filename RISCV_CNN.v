`timescale 1ns / 1ps

module RISCV_CNN(
    input         FPGA_clk,
    input         rstn,
    input  [3:0]  tc,
    input         mode,
    input         st,
    output        all_done,
    output [6:0]  seven_seg,
    output [3:0]  anode
);
    localparam integer CNN_MAC_PARALLEL = 9;

    wire clk = FPGA_clk;
    wire sys_rstn;
    wire locked;
    wire [9:0] tc_mem_addr;
    wire [31:0] tc_mem_wdata;
    wire [31:0] tc_cpu_rdata;
    wire tc_mem_we;

    wire cpu_dmem_en, cpu_dmem_we;
    wire [9:0] cpu_dmem_addr;
    wire [31:0] cpu_dmem_wdata;
    wire [31:0] cpu_dmem_rdata;

    wire cnn_enb, cnn_web, cnn_done;
    wire [9:0] cnn_addr;
    wire [31:0] cnn_dinb, cnn_doutb;
    
    wire cnn_finish_event;
    wire cnn_start_event;
    reg rstn_sync0;
    reg rstn_sync1;
    reg cnn_start_latched;
    wire test_rstn;

    assign cnn_finish_event = cnn_done;
    assign cnn_start_event = cpu_dmem_we && (cpu_dmem_addr == 10'd11) && !cpu_dmem_wdata[0];
    assign test_rstn = rstn_sync1;

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            rstn_sync0 <= 1'b0;
            rstn_sync1 <= 1'b0;
        end
        else begin
            rstn_sync0 <= 1'b1;
            rstn_sync1 <= rstn_sync0;
        end
    end

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            cnn_start_latched <= 1'b0;
        end
        else if (!sys_rstn) begin
            cnn_start_latched <= 1'b0;
        end
        else if (cnn_start_event) begin
            cnn_start_latched <= 1'b1;
        end
    end
    
    test_circuit u_test_circuit(
        .clk(clk),
        .rstn(test_rstn),
        .sys_rstn(sys_rstn),
        .mem_addr(tc_mem_addr),
        .mem_wdata(tc_mem_wdata),
        .mem_rdata(cpu_dmem_rdata),
        .mem_we(tc_mem_we),
        .cpu_addr(cpu_dmem_addr),
        .cpu_wdata(cpu_dmem_wdata),
        .cpu_rdata(tc_cpu_rdata),
        .cpu_we(cpu_dmem_we),
        .system_done(cnn_finish_event),
        .start_bt(st),
        .mode(mode),
        .tc(tc),        
        .seven_seg(seven_seg),
        .anode(anode),
        .all_done(all_done)
    );

    Simple_CPU u_cpu(
        .CLK(clk),
        .RSTN(sys_rstn),
        .dmem_en(cpu_dmem_en),
        .dmem_we(cpu_dmem_we),
        .dmem_addr(cpu_dmem_addr),
        .dmem_wdata(cpu_dmem_wdata),
        .dmem_rdata(tc_cpu_rdata)
    );

    CNN #(
        .MAC_PARALLEL(CNN_MAC_PARALLEL)
    ) u_cnn(
        .clk(clk),
        .rstn(sys_rstn),
        .start(cnn_start_latched),
        .doutb(cnn_doutb),
        .web(cnn_web),
        .enb(cnn_enb),
        .dinb(cnn_dinb),
        .addr(cnn_addr),
        .done(cnn_done)
    );

    Data_mem u_data_mem(
        .clka(clk),
        .ena(1'b1),
        .wea(tc_mem_we),
        .addra(tc_mem_addr),
        .dina(tc_mem_wdata),
        .douta(cpu_dmem_rdata),
        .clkb(clk),
        .enb(cnn_enb),
        .web(cnn_web),
        .addrb(cnn_addr),
        .dinb(cnn_dinb),
        .doutb(cnn_doutb)
    );
endmodule

module Simple_CPU(
    input         CLK,
    input         RSTN,
    output        dmem_en,
    output        dmem_we,
    output reg [9:0]  dmem_addr,
    output reg [31:0] dmem_wdata,
    input      [31:0] dmem_rdata
);
    localparam S_FETCH_ADDR      = 5'd0;
    localparam S_FETCH_WAIT      = 5'd1;
    localparam S_DECODE          = 5'd2;
    localparam S_LOAD_WAIT       = 5'd3;
    localparam S_LOAD_WB         = 5'd4;
    localparam S_STORE           = 5'd5;
    localparam S_FETCH_CAP       = 5'd6;

    reg [4:0] state;
    reg [31:0] pc;
    reg [4:0] load_rd;
    reg [31:0] regs [0:31];
    reg [9:0] imem_addr;
    reg [31:0] instr_reg;
    integer i;

    wire [31:0] instr;
    wire [6:0] opcode = instr_reg[6:0];
    wire [4:0] rd     = instr_reg[11:7];
    wire [2:0] funct3 = instr_reg[14:12];
    wire [4:0] rs1    = instr_reg[19:15];
    wire [4:0] rs2    = instr_reg[24:20];
    wire [6:0] funct7 = instr_reg[31:25];

    wire signed [31:0] imm_i = {{20{instr_reg[31]}}, instr_reg[31:20]};
    wire signed [31:0] imm_s = {{20{instr_reg[31]}}, instr_reg[31:25], instr_reg[11:7]};
    wire signed [31:0] imm_b = {{19{instr_reg[31]}}, instr_reg[31], instr_reg[7],
                                instr_reg[30:25], instr_reg[11:8], 1'b0};

    wire [31:0] load_byte_addr  = regs[rs1] + imm_i;
    wire [31:0] store_byte_addr = regs[rs1] + imm_s;
    wire [31:0] pc_plus4 = pc + 32'd4;
    wire [31:0] pc_branch = pc + imm_b;

    assign dmem_en = 1'b1;
    assign dmem_we = (state == S_STORE);

    Instruction_Memory u_Instruction_Memory (
        .clka(CLK),
        .addra(imem_addr),
        .douta(instr)
    );

    always @(posedge CLK) begin
        if (!RSTN) begin
            state <= S_FETCH_ADDR;
            pc <= 32'd0;
            load_rd <= 5'd0;
            dmem_addr <= 10'd0;
            dmem_wdata <= 32'd0;
            imem_addr <= 10'd0;
            instr_reg <= 32'd0;
            for (i = 0; i < 32; i = i + 1) begin
                regs[i] <= 32'd0;
            end
        end
        else begin
            case (state)
                S_FETCH_ADDR: begin
                    imem_addr <= pc[9:2];
                    state <= S_FETCH_WAIT;
                end

                S_FETCH_WAIT: begin
                    state <= S_FETCH_CAP;
                end

                S_FETCH_CAP: begin
                    instr_reg <= instr;
                    state <= S_DECODE;
                end

                S_DECODE: begin
                    case (opcode)
                        7'b0110011: begin
                            if (funct3 == 3'b000 && funct7 == 7'b0000000) begin
                                if (rd != 5'd0) regs[rd] <= regs[rs1] + regs[rs2];
                            end
                            else if (funct3 == 3'b000 && funct7 == 7'b0100000) begin
                                if (rd != 5'd0) regs[rd] <= regs[rs1] - regs[rs2];
                            end
                            pc <= pc_plus4;
                            imem_addr <= pc_plus4[9:2];
                            state <= S_FETCH_WAIT;
                        end

                        7'b0010011: begin
                            if (funct3 == 3'b000 && rd != 5'd0) begin
                                regs[rd] <= regs[rs1] + imm_i;
                            end
                            pc <= pc_plus4;
                            imem_addr <= pc_plus4[9:2];
                            state <= S_FETCH_WAIT;
                        end

                        7'b0000011: begin
                            dmem_addr <= load_byte_addr[11:2];
                            load_rd <= rd;
                            pc <= pc_plus4;
                            imem_addr <= pc_plus4[9:2];
                            state <= S_LOAD_WAIT;
                        end

                        7'b0100011: begin
                            dmem_addr <= store_byte_addr[11:2];
                            dmem_wdata <= regs[rs2];
                            pc <= pc_plus4;
                            imem_addr <= pc_plus4[9:2];
                            state <= S_STORE;
                        end

                        7'b1100011: begin
                            if ((funct3 == 3'b000 && regs[rs1] == regs[rs2]) ||
                                (funct3 == 3'b100 && $signed(regs[rs1]) < $signed(regs[rs2]))) begin
                                pc <= pc_branch;
                                imem_addr <= pc_branch[9:2];
                            end
                            else begin
                                pc <= pc_plus4;
                                imem_addr <= pc_plus4[9:2];
                            end
                            state <= S_FETCH_WAIT;
                        end

                        default: begin
                            pc <= pc_plus4;
                            imem_addr <= pc_plus4[9:2];
                            state <= S_FETCH_WAIT;
                        end
                    endcase
                end

                S_LOAD_WAIT: begin
                    state <= S_LOAD_WB;
                end

                S_LOAD_WB: begin
                    if (load_rd != 5'd0) begin
                        regs[load_rd] <= dmem_rdata;
                    end
                    instr_reg <= instr;
                    state <= S_DECODE;
                end

                S_STORE: begin
                    dmem_addr <= 10'd0;
                    dmem_wdata <= 32'd0;
                    state <= S_FETCH_CAP;
                end

                default: begin
                    state <= S_FETCH_ADDR;
                end
            endcase
            regs[0] <= 32'd0;
        end
    end
endmodule

module CNN #(
    parameter integer MAC_PARALLEL = 3
)(
    input         clk,
    input         rstn,
    input         start,
    input  [31:0] doutb,
    output reg    web,
    output        enb,
    output reg [31:0] dinb,
    output reg [9:0]  addr,
    output reg        done
);
    localparam C_IDLE          = 6'd0;
    localparam C_LOAD_CFG_ADDR = 6'd1;
    localparam C_LOAD_CFG_WAIT = 6'd2;
    localparam C_LOAD_CFG_CAP  = 6'd3;
    localparam C_LOAD_B0_ADDR  = 6'd4;
    localparam C_LOAD_B0_WAIT  = 6'd5;
    localparam C_LOAD_B0_CAP   = 6'd6;
    localparam C_LOAD_B1_ADDR  = 6'd7;
    localparam C_LOAD_B1_WAIT  = 6'd8;
    localparam C_LOAD_B1_CAP   = 6'd9;
    localparam C_LOAD_W_ADDR   = 6'd10;
    localparam C_LOAD_W_WAIT   = 6'd11;
    localparam C_LOAD_W_CAP    = 6'd12;
    localparam C_LAYER_SETUP   = 6'd13;
    localparam C_STREAM_NEXT   = 6'd14;
    localparam C_READ_WAIT     = 6'd15;
    localparam C_READ_CAP      = 6'd16;
    localparam C_UNPACK        = 6'd17;
    localparam C_WINDOW        = 6'd18;
    localparam C_MAC_WAIT      = 6'd19;
    localparam C_WRITE_OUT     = 6'd20;
    localparam C_LAYER_NEXT    = 6'd21;
    localparam C_WRITE_DONE    = 6'd22;
    localparam C_FINISHED      = 6'd23;

    localparam [9:0] INPUT_BASE = 10'd16;
    localparam [9:0] INTER_BASE = 10'd272;
    localparam [9:0] FINAL_BASE = 10'd600;

    reg [5:0] state;
    reg [3:0] load_idx;
    reg signed [7:0] weights [0:17];
    reg signed [7:0] bias0;
    reg signed [7:0] bias1;
    reg [5:0] fmap_size;
    reg [5:0] in_w;
    reg [5:0] out_w;
    reg [9:0] base_in;
    reg [9:0] base_out;
    reg layer;
    reg [11:0] input_total;
    reg [11:0] input_index;
    reg [5:0] stream_x;
    reg [5:0] stream_y;
    reg [31:0] stream_word;
    reg [11:0] output_total;
    reg [11:0] out_index;
    reg [11:0] retire_count;
    reg [11:0] active_out_index;
    reg active_last;
    reg write_pending;
    reg [9:0] pending_addr;
    reg [31:0] pending_word;
    reg [31:0] pack_word;
    integer wi;

    wire [1:0] stream_lane = input_index[1:0];
    wire [9:0] stream_word_addr = base_in + input_index[11:2];
    wire stream_done = (input_index == input_total);
    wire line_valid;
    wire line_accept = (state == C_UNPACK);
    wire mac_start = (state == C_WINDOW) && line_valid;
    wire current_last = (out_index == (output_total - 12'd1));
    wire flush_word = (active_out_index[1:0] == 2'd3) || active_last;
    wire signed [7:0] unpacked_pixel;
    wire signed [7:0] quant_pixel;
    wire [31:0] packed_next_word;
    wire signed [31:0] active_bias_q12 =
        layer ? {{18{bias1[7]}}, bias1, 6'd0} : {{18{bias0[7]}}, bias0, 6'd0};
    wire signed [7:0] k0 = weights[layer ? 9 : 0];
    wire signed [7:0] k1 = weights[layer ? 10 : 1];
    wire signed [7:0] k2 = weights[layer ? 11 : 2];
    wire signed [7:0] k3 = weights[layer ? 12 : 3];
    wire signed [7:0] k4 = weights[layer ? 13 : 4];
    wire signed [7:0] k5 = weights[layer ? 14 : 5];
    wire signed [7:0] k6 = weights[layer ? 15 : 6];
    wire signed [7:0] k7 = weights[layer ? 16 : 7];
    wire signed [7:0] k8 = weights[layer ? 17 : 8];
    wire [5:0] line_out_x;
    wire [5:0] line_out_y;
    wire signed [7:0] win00;
    wire signed [7:0] win01;
    wire signed [7:0] win02;
    wire signed [7:0] win10;
    wire signed [7:0] win11;
    wire signed [7:0] win12;
    wire signed [7:0] win20;
    wire signed [7:0] win21;
    wire signed [7:0] win22;
    wire mac_valid;
    wire mac_busy;
    wire signed [31:0] mac_result;
    wire [11:0] mac_out_index;
    wire mac_out_last;
    wire streaming_mac = (MAC_PARALLEL == 9);
    wire mac_result_flush = (mac_out_index[1:0] == 2'd3) || mac_out_last;

    assign enb = rstn;

    CNN_Unpacker u_unpacker(
        .word(stream_word),
        .lane(stream_lane),
        .pixel(unpacked_pixel)
    );

    CNN_LineBuffer u_line_buffer(
        .clk(clk),
        .rstn(rstn),
        .layer_start(state == C_LAYER_SETUP),
        .accept(line_accept),
        .x(stream_x),
        .y(stream_y),
        .pixel(unpacked_pixel),
        .valid(line_valid),
        .out_x(line_out_x),
        .out_y(line_out_y),
        .w00(win00),
        .w01(win01),
        .w02(win02),
        .w10(win10),
        .w11(win11),
        .w12(win12),
        .w20(win20),
        .w21(win21),
        .w22(win22)
    );

    CNN_MAC_Engine #(
        .MAC_PARALLEL(MAC_PARALLEL)
    ) u_mac_engine (
        .clk(clk),
        .rstn(rstn),
        .start(mac_start),
        .bias_q12(active_bias_q12),
        .w00(win00),
        .w01(win01),
        .w02(win02),
        .w10(win10),
        .w11(win11),
        .w12(win12),
        .w20(win20),
        .w21(win21),
        .w22(win22),
        .k0(k0),
        .k1(k1),
        .k2(k2),
        .k3(k3),
        .k4(k4),
        .k5(k5),
        .k6(k6),
        .k7(k7),
        .k8(k8),
        .tag_index(out_index),
        .tag_last(current_last),
        .busy(mac_busy),
        .valid(mac_valid),
        .result_index(mac_out_index),
        .result_last(mac_out_last),
        .result_q12(mac_result)
    );

    CNN_Quantizer u_quantizer(
        .value_q12(mac_result),
        .pixel_q6(quant_pixel)
    );

    function [31:0] put_lane;
        input [31:0] word;
        input [1:0] lane;
        input [7:0] value;
        begin
            case (lane)
                2'd0: put_lane = {value, word[23:0]};
                2'd1: put_lane = {word[31:24], value, word[15:0]};
                2'd2: put_lane = {word[31:16], value, word[7:0]};
                default: put_lane = {word[31:8], value};
            endcase
        end
    endfunction

    function [11:0] square6;
        input [5:0] value;
        begin
            square6 = value * value;
        end
    endfunction

    assign packed_next_word = put_lane(pack_word, active_out_index[1:0], quant_pixel);

    task advance_input;
        begin
            input_index <= input_index + 12'd1;
            if (stream_x == (in_w - 6'd1)) begin
                stream_x <= 6'd0;
                stream_y <= stream_y + 6'd1;
            end
            else begin
                stream_x <= stream_x + 6'd1;
            end
        end
    endtask

    always @(posedge clk) begin
        if (!rstn) begin
            state <= C_IDLE;
            addr <= 10'd0;
            dinb <= 32'd0;
            web <= 1'b0;
            done <= 1'b0;
            load_idx <= 4'd0;
            fmap_size <= 6'd0;
            in_w <= 6'd0;
            out_w <= 6'd0;
            base_in <= 10'd0;
            base_out <= 10'd0;
            layer <= 1'b0;
            input_total <= 12'd0;
            input_index <= 12'd0;
            stream_x <= 6'd0;
            stream_y <= 6'd0;
            stream_word <= 32'd0;
            output_total <= 12'd0;
            out_index <= 12'd0;
            retire_count <= 12'd0;
            active_out_index <= 12'd0;
            active_last <= 1'b0;
            write_pending <= 1'b0;
            pending_addr <= 10'd0;
            pending_word <= 32'd0;
            pack_word <= 32'd0;
            bias0 <= 8'sd0;
            bias1 <= 8'sd0;
            for (wi = 0; wi < 18; wi = wi + 1) begin
                weights[wi] <= 8'sd0;
            end
        end
        else begin
            web <= 1'b0;
            if (streaming_mac && mac_valid) begin
                retire_count <= retire_count + 12'd1;
                if (mac_result_flush) begin
                    pending_addr <= base_out + mac_out_index[11:2];
                    pending_word <= put_lane(pack_word, mac_out_index[1:0], quant_pixel);
                    write_pending <= 1'b1;
                    pack_word <= 32'd0;
                end
                else begin
                    pack_word <= put_lane(pack_word, mac_out_index[1:0], quant_pixel);
                end
            end

            case (state)
                C_IDLE: begin
                    addr <= 10'd0;
                    dinb <= 32'd0;
                    done <= 1'b0;
                    if (start) begin
                        state <= C_LOAD_CFG_ADDR;
                    end
                end

                C_LOAD_CFG_ADDR: begin
                    addr <= 10'd12;
                    state <= C_LOAD_CFG_WAIT;
                end

                C_LOAD_CFG_WAIT: begin
                    state <= C_LOAD_CFG_CAP;
                end

                C_LOAD_CFG_CAP: begin
                    fmap_size <= doutb[6:1];
                    state <= C_LOAD_B0_ADDR;
                end

                C_LOAD_B0_ADDR: begin
                    addr <= 10'd14;
                    state <= C_LOAD_B0_WAIT;
                end

                C_LOAD_B0_WAIT: begin
                    state <= C_LOAD_B0_CAP;
                end

                C_LOAD_B0_CAP: begin
                    bias0 <= doutb[7:0];
                    state <= C_LOAD_B1_ADDR;
                end

                C_LOAD_B1_ADDR: begin
                    addr <= 10'd15;
                    state <= C_LOAD_B1_WAIT;
                end

                C_LOAD_B1_WAIT: begin
                    state <= C_LOAD_B1_CAP;
                end

                C_LOAD_B1_CAP: begin
                    bias1 <= doutb[7:0];
                    load_idx <= 4'd0;
                    state <= C_LOAD_W_ADDR;
                end

                C_LOAD_W_ADDR: begin
                    addr <= {6'd0, load_idx};
                    state <= C_LOAD_W_WAIT;
                end

                C_LOAD_W_WAIT: begin
                    state <= C_LOAD_W_CAP;
                end

                C_LOAD_W_CAP: begin
                    case (load_idx)
                        4'd0: begin
                            weights[0] <= doutb[31:24];
                            weights[1] <= doutb[23:16];
                            weights[2] <= doutb[15:8];
                            weights[3] <= doutb[7:0];
                        end
                        4'd1: begin
                            weights[4] <= doutb[31:24];
                            weights[5] <= doutb[23:16];
                            weights[6] <= doutb[15:8];
                            weights[7] <= doutb[7:0];
                        end
                        4'd2: begin
                            weights[8] <= doutb[31:24];
                        end
                        4'd3: begin
                            weights[9]  <= doutb[31:24];
                            weights[10] <= doutb[23:16];
                            weights[11] <= doutb[15:8];
                            weights[12] <= doutb[7:0];
                        end
                        4'd4: begin
                            weights[13] <= doutb[31:24];
                            weights[14] <= doutb[23:16];
                            weights[15] <= doutb[15:8];
                            weights[16] <= doutb[7:0];
                        end
                        default: begin
                            weights[17] <= doutb[31:24];
                        end
                    endcase

                    if (load_idx == 4'd5) begin
                        layer <= 1'b0;
                        in_w <= fmap_size;
                        out_w <= fmap_size - 6'd2;
                        base_in <= INPUT_BASE;
                        base_out <= INTER_BASE;
                        state <= C_LAYER_SETUP;
                    end
                    else begin
                        load_idx <= load_idx + 4'd1;
                        state <= C_LOAD_W_ADDR;
                    end
                end

                C_LAYER_SETUP: begin
                    input_total <= square6(in_w);
                    output_total <= square6(out_w);
                    input_index <= 12'd0;
                    stream_x <= 6'd0;
                    stream_y <= 6'd0;
                    out_index <= 12'd0;
                    retire_count <= 12'd0;
                    active_out_index <= 12'd0;
                    active_last <= 1'b0;
                    write_pending <= 1'b0;
                    pending_addr <= 10'd0;
                    pending_word <= 32'd0;
                    pack_word <= 32'd0;
                    state <= C_STREAM_NEXT;
                end

                C_STREAM_NEXT: begin
                    if (streaming_mac && write_pending) begin
                        state <= C_WRITE_OUT;
                    end
                    else if (stream_done) begin
                        if (streaming_mac && (retire_count != output_total)) begin
                            state <= C_MAC_WAIT;
                        end
                        else begin
                            state <= C_LAYER_NEXT;
                        end
                    end
                    else if (stream_lane == 2'd0) begin
                        addr <= stream_word_addr;
                        state <= C_READ_WAIT;
                    end
                    else begin
                        state <= C_UNPACK;
                    end
                end

                C_READ_WAIT: begin
                    state <= C_READ_CAP;
                end

                C_READ_CAP: begin
                    stream_word <= doutb;
                    state <= C_UNPACK;
                end

                C_UNPACK: begin
                    state <= C_WINDOW;
                end

                C_WINDOW: begin
                    if (line_valid) begin
                        if (streaming_mac) begin
                            out_index <= out_index + 12'd1;
                            advance_input;
                            state <= C_STREAM_NEXT;
                        end
                        else begin
                            active_out_index <= out_index;
                            active_last <= current_last;
                            state <= C_MAC_WAIT;
                        end
                    end
                    else begin
                        advance_input;
                        state <= C_STREAM_NEXT;
                    end
                end

                C_MAC_WAIT: begin
                    if (streaming_mac) begin
                        if (write_pending) begin
                            state <= C_WRITE_OUT;
                        end
                        else if (retire_count == output_total) begin
                            state <= C_LAYER_NEXT;
                        end
                    end
                    else if (mac_valid) begin
                        if (flush_word) begin
                            addr <= base_out + active_out_index[11:2];
                            dinb <= packed_next_word;
                            web <= 1'b1;
                            pack_word <= 32'd0;
                            state <= C_WRITE_OUT;
                        end
                        else begin
                            pack_word <= packed_next_word;
                            out_index <= out_index + 12'd1;
                            advance_input;
                            state <= C_STREAM_NEXT;
                        end
                    end
                end

                C_WRITE_OUT: begin
                    if (streaming_mac) begin
                        addr <= pending_addr;
                        dinb <= pending_word;
                        web <= 1'b1;
                        write_pending <= 1'b0;
                        state <= C_STREAM_NEXT;
                    end
                    else begin
                        out_index <= out_index + 12'd1;
                        advance_input;
                        state <= active_last ? C_LAYER_NEXT : C_STREAM_NEXT;
                    end
                end

                C_LAYER_NEXT: begin
                    if (!layer) begin
                        layer <= 1'b1;
                        in_w <= fmap_size - 6'd2;
                        out_w <= fmap_size - 6'd4;
                        base_in <= INTER_BASE;
                        base_out <= FINAL_BASE;
                        state <= C_LAYER_SETUP;
                    end
                    else begin
                        addr <= 10'd13;
                        dinb <= {21'd0, FINAL_BASE, 1'b1};
                        web <= 1'b1;
                        state <= C_WRITE_DONE;
                    end
                end

                C_WRITE_DONE: begin
                    done <= 1'b1;
                    state <= C_FINISHED;
                end

                C_FINISHED: begin
                    done <= 1'b1;
                end

                default: begin
                    state <= C_IDLE;
                end
            endcase
        end
    end
endmodule

module CNN_Unpacker(
    input      [31:0] word,
    input      [1:0]  lane,
    output reg signed [7:0] pixel
);
    always @(*) begin
        case (lane)
            2'd0: pixel = word[31:24];
            2'd1: pixel = word[23:16];
            2'd2: pixel = word[15:8];
            default: pixel = word[7:0];
        endcase
    end
endmodule

module CNN_LineBuffer(
    input              clk,
    input              rstn,
    input              layer_start,
    input              accept,
    input      [5:0]   x,
    input      [5:0]   y,
    input signed [7:0] pixel,
    output reg         valid,
    output reg [5:0]   out_x,
    output reg [5:0]   out_y,
    output reg signed [7:0] w00,
    output reg signed [7:0] w01,
    output reg signed [7:0] w02,
    output reg signed [7:0] w10,
    output reg signed [7:0] w11,
    output reg signed [7:0] w12,
    output reg signed [7:0] w20,
    output reg signed [7:0] w21,
    output reg signed [7:0] w22
);
    (* ram_style = "distributed" *) reg signed [7:0] line0 [0:31];
    (* ram_style = "distributed" *) reg signed [7:0] line1 [0:31];
    reg signed [7:0] top0;
    reg signed [7:0] top1;
    reg signed [7:0] mid0;
    reg signed [7:0] mid1;
    reg signed [7:0] bot0;
    reg signed [7:0] bot1;

    wire [4:0] x_idx = x[4:0];
    wire signed [7:0] top2 = line0[x_idx];
    wire signed [7:0] mid2 = line1[x_idx];
    wire signed [7:0] bot2 = pixel;

    always @(posedge clk) begin
        if (!rstn) begin
            valid <= 1'b0;
            out_x <= 6'd0;
            out_y <= 6'd0;
            top0 <= 8'sd0;
            top1 <= 8'sd0;
            mid0 <= 8'sd0;
            mid1 <= 8'sd0;
            bot0 <= 8'sd0;
            bot1 <= 8'sd0;
            w00 <= 8'sd0;
            w01 <= 8'sd0;
            w02 <= 8'sd0;
            w10 <= 8'sd0;
            w11 <= 8'sd0;
            w12 <= 8'sd0;
            w20 <= 8'sd0;
            w21 <= 8'sd0;
            w22 <= 8'sd0;
        end
        else begin
            valid <= 1'b0;
            if (layer_start) begin
                top0 <= 8'sd0;
                top1 <= 8'sd0;
                mid0 <= 8'sd0;
                mid1 <= 8'sd0;
                bot0 <= 8'sd0;
                bot1 <= 8'sd0;
            end
            else if (accept) begin
                if (x == 6'd0) begin
                    top0 <= 8'sd0;
                    top1 <= top2;
                    mid0 <= 8'sd0;
                    mid1 <= mid2;
                    bot0 <= 8'sd0;
                    bot1 <= bot2;
                end
                else begin
                    top0 <= top1;
                    top1 <= top2;
                    mid0 <= mid1;
                    mid1 <= mid2;
                    bot0 <= bot1;
                    bot1 <= bot2;
                end

                if ((x >= 6'd2) && (y >= 6'd2)) begin
                    valid <= 1'b1;
                    out_x <= x - 6'd2;
                    out_y <= y - 6'd2;
                    w00 <= top0;
                    w01 <= top1;
                    w02 <= top2;
                    w10 <= mid0;
                    w11 <= mid1;
                    w12 <= mid2;
                    w20 <= bot0;
                    w21 <= bot1;
                    w22 <= bot2;
                end

                line0[x_idx] <= line1[x_idx];
                line1[x_idx] <= pixel;
            end
        end
    end
endmodule

module CNN_MAC_Engine_old #(
    parameter integer MAC_PARALLEL = 3
)(
    input clk,
    input rstn,
    input start,
    input signed [31:0] bias_q12,
    input signed [7:0] w00,
    input signed [7:0] w01,
    input signed [7:0] w02,
    input signed [7:0] w10,
    input signed [7:0] w11,
    input signed [7:0] w12,
    input signed [7:0] w20,
    input signed [7:0] w21,
    input signed [7:0] w22,
    input signed [7:0] k0,
    input signed [7:0] k1,
    input signed [7:0] k2,
    input signed [7:0] k3,
    input signed [7:0] k4,
    input signed [7:0] k5,
    input signed [7:0] k6,
    input signed [7:0] k7,
    input signed [7:0] k8,
    output reg busy,
    output reg valid,
    output reg signed [31:0] result_q12
);
    localparam M_IDLE = 3'd0;
    localparam M_RUN  = 3'd1;
    localparam M9_S2  = 3'd2;
    localparam M9_S3  = 3'd3;

    reg [2:0] state;
    reg [3:0] term_idx;
    reg [1:0] row_idx;
    reg signed [31:0] acc;
    reg signed [31:0] p0_r;
    reg signed [31:0] p1_r;
    reg signed [31:0] p2_r;
    reg signed [31:0] p3_r;
    reg signed [31:0] p4_r;
    reg signed [31:0] p5_r;
    reg signed [31:0] p6_r;
    reg signed [31:0] p7_r;
    reg signed [31:0] p8_r;
    reg signed [31:0] s1_0;
    reg signed [31:0] s1_1;
    reg signed [31:0] s1_2;
    reg signed [31:0] s1_3;
    reg signed [31:0] s1_4;
    reg signed [31:0] s2_0;
    reg signed [31:0] s2_1;
    reg signed [31:0] s2_2;

    wire signed [15:0] p0_16 = w00 * k0;
    wire signed [15:0] p1_16 = w01 * k1;
    wire signed [15:0] p2_16 = w02 * k2;
    wire signed [15:0] p3_16 = w10 * k3;
    wire signed [15:0] p4_16 = w11 * k4;
    wire signed [15:0] p5_16 = w12 * k5;
    wire signed [15:0] p6_16 = w20 * k6;
    wire signed [15:0] p7_16 = w21 * k7;
    wire signed [15:0] p8_16 = w22 * k8;
    wire signed [31:0] p0 = {{16{p0_16[15]}}, p0_16};
    wire signed [31:0] p1 = {{16{p1_16[15]}}, p1_16};
    wire signed [31:0] p2 = {{16{p2_16[15]}}, p2_16};
    wire signed [31:0] p3 = {{16{p3_16[15]}}, p3_16};
    wire signed [31:0] p4 = {{16{p4_16[15]}}, p4_16};
    wire signed [31:0] p5 = {{16{p5_16[15]}}, p5_16};
    wire signed [31:0] p6 = {{16{p6_16[15]}}, p6_16};
    wire signed [31:0] p7 = {{16{p7_16[15]}}, p7_16};
    wire signed [31:0] p8 = {{16{p8_16[15]}}, p8_16};

    function signed [31:0] term_value;
        input [3:0] idx;
        begin
            case (idx)
                4'd1: term_value = p1_r;
                4'd2: term_value = p2_r;
                4'd3: term_value = p3_r;
                4'd4: term_value = p4_r;
                4'd5: term_value = p5_r;
                4'd6: term_value = p6_r;
                4'd7: term_value = p7_r;
                default: term_value = p8_r;
            endcase
        end
    endfunction

    always @(posedge clk) begin
        if (!rstn) begin
            state <= M_IDLE;
            term_idx <= 4'd0;
            row_idx <= 2'd0;
            acc <= 32'sd0;
            result_q12 <= 32'sd0;
            busy <= 1'b0;
            valid <= 1'b0;
            p0_r <= 32'sd0;
            p1_r <= 32'sd0;
            p2_r <= 32'sd0;
            p3_r <= 32'sd0;
            p4_r <= 32'sd0;
            p5_r <= 32'sd0;
            p6_r <= 32'sd0;
            p7_r <= 32'sd0;
            p8_r <= 32'sd0;
            s1_0 <= 32'sd0;
            s1_1 <= 32'sd0;
            s1_2 <= 32'sd0;
            s1_3 <= 32'sd0;
            s1_4 <= 32'sd0;
            s2_0 <= 32'sd0;
            s2_1 <= 32'sd0;
            s2_2 <= 32'sd0;
        end
        else begin
            valid <= 1'b0;
            case (state)
                M_IDLE: begin
                    busy <= 1'b0;
                    if (start) begin
                        p0_r <= p0;
                        p1_r <= p1;
                        p2_r <= p2;
                        p3_r <= p3;
                        p4_r <= p4;
                        p5_r <= p5;
                        p6_r <= p6;
                        p7_r <= p7;
                        p8_r <= p8;
                        busy <= 1'b1;
                        if (MAC_PARALLEL == 1) begin
                            acc <= bias_q12 + p0;
                            term_idx <= 4'd1;
                            state <= M_RUN;
                        end
                        else if (MAC_PARALLEL == 9) begin
                            s1_0 <= p0 + p1;
                            s1_1 <= p2 + p3;
                            s1_2 <= p4 + p5;
                            s1_3 <= p6 + p7;
                            s1_4 <= bias_q12 + p8;
                            state <= M9_S2;
                        end
                        else begin
                            acc <= bias_q12 + p0 + p1 + p2;
                            row_idx <= 2'd1;
                            state <= M_RUN;
                        end
                    end
                end

                M_RUN: begin
                    if (MAC_PARALLEL == 1) begin
                        if (term_idx == 4'd8) begin
                            result_q12 <= acc + p8_r;
                            valid <= 1'b1;
                            busy <= 1'b0;
                            state <= M_IDLE;
                        end
                        else begin
                            acc <= acc + term_value(term_idx);
                            term_idx <= term_idx + 4'd1;
                        end
                    end
                    else begin
                        if (row_idx == 2'd1) begin
                            acc <= acc + p3_r + p4_r + p5_r;
                            row_idx <= 2'd2;
                        end
                        else begin
                            result_q12 <= acc + p6_r + p7_r + p8_r;
                            valid <= 1'b1;
                            busy <= 1'b0;
                            state <= M_IDLE;
                        end
                    end
                end

                M9_S2: begin
                    s2_0 <= s1_0 + s1_1;
                    s2_1 <= s1_2 + s1_3;
                    s2_2 <= s1_4;
                    state <= M9_S3;
                end

                M9_S3: begin
                    result_q12 <= s2_0 + s2_1 + s2_2;
                    valid <= 1'b1;
                    busy <= 1'b0;
                    state <= M_IDLE;
                end

                default: begin
                    state <= M_IDLE;
                    busy <= 1'b0;
                end
            endcase
        end
    end
endmodule

module CNN_MAC_Engine #(
    parameter integer MAC_PARALLEL = 3
)(
    input clk,
    input rstn,
    input start,
    input signed [31:0] bias_q12,
    input signed [7:0] w00,
    input signed [7:0] w01,
    input signed [7:0] w02,
    input signed [7:0] w10,
    input signed [7:0] w11,
    input signed [7:0] w12,
    input signed [7:0] w20,
    input signed [7:0] w21,
    input signed [7:0] w22,
    input signed [7:0] k0,
    input signed [7:0] k1,
    input signed [7:0] k2,
    input signed [7:0] k3,
    input signed [7:0] k4,
    input signed [7:0] k5,
    input signed [7:0] k6,
    input signed [7:0] k7,
    input signed [7:0] k8,
    input [11:0] tag_index,
    input tag_last,
    output reg busy,
    output reg valid,
    output reg [11:0] result_index,
    output reg result_last,
    output reg signed [31:0] result_q12
);
    localparam M_IDLE    = 2'd0;
    localparam M_RUN     = 2'd1;
    localparam M9_S2     = 2'd2;
    localparam M3_FINISH = 2'd3;

    function signed [31:0] mul_ext;
        input signed [7:0] a;
        input signed [7:0] b;
        reg signed [15:0] prod;
        begin
            prod = a * b;
            mul_ext = {{16{prod[15]}}, prod};
        end
    endfunction

    function signed [17:0] sx18;
        input signed [7:0] value;
        begin
            sx18 = {{10{value[7]}}, value};
        end
    endfunction

    function signed [31:0] prod36_to_q12;
        input signed [35:0] value;
        begin
            prod36_to_q12 = {{16{value[15]}}, value[15:0]};
        end
    endfunction

generate
    if (MAC_PARALLEL == 1) begin : gen_mac1
        reg [1:0] state;
        reg [3:0] term_idx;
        reg signed [31:0] acc;
        reg signed [7:0] f1;
        reg signed [7:0] f2;
        reg signed [7:0] f3;
        reg signed [7:0] f4;
        reg signed [7:0] f5;
        reg signed [7:0] f6;
        reg signed [7:0] f7;
        reg signed [7:0] f8;
        reg signed [7:0] kr1;
        reg signed [7:0] kr2;
        reg signed [7:0] kr3;
        reg signed [7:0] kr4;
        reg signed [7:0] kr5;
        reg signed [7:0] kr6;
        reg signed [7:0] kr7;
        reg signed [7:0] kr8;
        reg [11:0] tag_index_r;
        reg tag_last_r;

        always @(posedge clk) begin
            if (!rstn) begin
                state <= M_IDLE;
                term_idx <= 4'd0;
                acc <= 32'sd0;
                busy <= 1'b0;
                valid <= 1'b0;
                result_index <= 12'd0;
                result_last <= 1'b0;
                result_q12 <= 32'sd0;
                tag_index_r <= 12'd0;
                tag_last_r <= 1'b0;
            end
            else begin
                valid <= 1'b0;
                case (state)
                    M_IDLE: begin
                        busy <= 1'b0;
                        if (start) begin
                            f1 <= w01; f2 <= w02; f3 <= w10; f4 <= w11;
                            f5 <= w12; f6 <= w20; f7 <= w21; f8 <= w22;
                            kr1 <= k1; kr2 <= k2; kr3 <= k3; kr4 <= k4;
                            kr5 <= k5; kr6 <= k6; kr7 <= k7; kr8 <= k8;
                            tag_index_r <= tag_index;
                            tag_last_r <= tag_last;
                            acc <= bias_q12 + mul_ext(w00, k0);
                            term_idx <= 4'd1;
                            busy <= 1'b1;
                            state <= M_RUN;
                        end
                    end

                    M_RUN: begin
                        case (term_idx)
                            4'd1: acc <= acc + mul_ext(f1, kr1);
                            4'd2: acc <= acc + mul_ext(f2, kr2);
                            4'd3: acc <= acc + mul_ext(f3, kr3);
                            4'd4: acc <= acc + mul_ext(f4, kr4);
                            4'd5: acc <= acc + mul_ext(f5, kr5);
                            4'd6: acc <= acc + mul_ext(f6, kr6);
                            4'd7: acc <= acc + mul_ext(f7, kr7);
                            default: begin
                                result_q12 <= acc + mul_ext(f8, kr8);
                                result_index <= tag_index_r;
                                result_last <= tag_last_r;
                                valid <= 1'b1;
                                busy <= 1'b0;
                                state <= M_IDLE;
                            end
                        endcase
                        if (term_idx < 4'd8) begin
                            term_idx <= term_idx + 4'd1;
                        end
                    end

                    default: begin
                        state <= M_IDLE;
                        busy <= 1'b0;
                    end
                endcase
            end
        end
    end
    else if (MAC_PARALLEL == 9) begin : gen_mac9
        reg [2:0] pipe_valid;
        (* use_dsp = "yes" *) reg signed [35:0] p0;
        (* use_dsp = "yes" *) reg signed [35:0] p1;
        (* use_dsp = "yes" *) reg signed [35:0] p2;
        (* use_dsp = "yes" *) reg signed [35:0] p3;
        (* use_dsp = "yes" *) reg signed [35:0] p4;
        (* use_dsp = "yes" *) reg signed [35:0] p5;
        (* use_dsp = "yes" *) reg signed [35:0] p6;
        (* use_dsp = "yes" *) reg signed [35:0] p7;
        (* use_dsp = "yes" *) reg signed [35:0] p8;
        reg signed [31:0] bias_s1;
        reg [11:0] tag_s1;
        reg tag_last_s1;
        reg signed [31:0] s2_0;
        reg signed [31:0] s2_1;
        reg signed [31:0] s2_2;
        reg signed [31:0] s2_3;
        reg signed [31:0] s2_4;
        reg [11:0] tag_s2;
        reg tag_last_s2;
        reg signed [31:0] s3_0;
        reg signed [31:0] s3_1;
        reg signed [31:0] s3_2;
        reg [11:0] tag_s3;
        reg tag_last_s3;

        always @(posedge clk) begin
            if (!rstn) begin
                busy <= 1'b0;
                valid <= 1'b0;
                result_index <= 12'd0;
                result_last <= 1'b0;
                result_q12 <= 32'sd0;
                pipe_valid <= 3'b000;
                p0 <= 36'sd0;
                p1 <= 36'sd0;
                p2 <= 36'sd0;
                p3 <= 36'sd0;
                p4 <= 36'sd0;
                p5 <= 36'sd0;
                p6 <= 36'sd0;
                p7 <= 36'sd0;
                p8 <= 36'sd0;
                bias_s1 <= 32'sd0;
                tag_s1 <= 12'd0;
                tag_last_s1 <= 1'b0;
                s2_0 <= 32'sd0;
                s2_1 <= 32'sd0;
                s2_2 <= 32'sd0;
                s2_3 <= 32'sd0;
                s2_4 <= 32'sd0;
                tag_s2 <= 12'd0;
                tag_last_s2 <= 1'b0;
                s3_0 <= 32'sd0;
                s3_1 <= 32'sd0;
                s3_2 <= 32'sd0;
                tag_s3 <= 12'd0;
                tag_last_s3 <= 1'b0;
            end
            else begin
                valid <= pipe_valid[2];
                busy <= start | (|pipe_valid);
                pipe_valid <= {pipe_valid[1:0], start};

                if (start) begin
                    p0 <= sx18(w00) * sx18(k0);
                    p1 <= sx18(w01) * sx18(k1);
                    p2 <= sx18(w02) * sx18(k2);
                    p3 <= sx18(w10) * sx18(k3);
                    p4 <= sx18(w11) * sx18(k4);
                    p5 <= sx18(w12) * sx18(k5);
                    p6 <= sx18(w20) * sx18(k6);
                    p7 <= sx18(w21) * sx18(k7);
                    p8 <= sx18(w22) * sx18(k8);
                    bias_s1 <= bias_q12;
                    tag_s1 <= tag_index;
                    tag_last_s1 <= tag_last;
                end

                if (pipe_valid[0]) begin
                    s2_0 <= prod36_to_q12(p0) + prod36_to_q12(p1);
                    s2_1 <= prod36_to_q12(p2) + prod36_to_q12(p3);
                    s2_2 <= prod36_to_q12(p4) + prod36_to_q12(p5);
                    s2_3 <= prod36_to_q12(p6) + prod36_to_q12(p7);
                    s2_4 <= bias_s1 + prod36_to_q12(p8);
                    tag_s2 <= tag_s1;
                    tag_last_s2 <= tag_last_s1;
                end

                if (pipe_valid[1]) begin
                    s3_0 <= s2_0 + s2_1;
                    s3_1 <= s2_2 + s2_3;
                    s3_2 <= s2_4;
                    tag_s3 <= tag_s2;
                    tag_last_s3 <= tag_last_s2;
                end

                if (pipe_valid[2]) begin
                    result_q12 <= s3_0 + s3_1 + s3_2;
                    result_index <= tag_s3;
                    result_last <= tag_last_s3;
                end
            end
        end
    end
    else begin : gen_mac3
        reg [1:0] state;
        reg [1:0] row_idx;
        reg signed [31:0] acc;
        reg signed [31:0] row_sum;
        reg signed [7:0] f3;
        reg signed [7:0] f4;
        reg signed [7:0] f5;
        reg signed [7:0] f6;
        reg signed [7:0] f7;
        reg signed [7:0] f8;
        reg signed [7:0] kr3;
        reg signed [7:0] kr4;
        reg signed [7:0] kr5;
        reg signed [7:0] kr6;
        reg signed [7:0] kr7;
        reg signed [7:0] kr8;
        reg [11:0] tag_index_r;
        reg tag_last_r;

        always @(posedge clk) begin
            if (!rstn) begin
                state <= M_IDLE;
                row_idx <= 2'd0;
                acc <= 32'sd0;
                row_sum <= 32'sd0;
                busy <= 1'b0;
                valid <= 1'b0;
                result_index <= 12'd0;
                result_last <= 1'b0;
                result_q12 <= 32'sd0;
                tag_index_r <= 12'd0;
                tag_last_r <= 1'b0;
            end
            else begin
                valid <= 1'b0;
                case (state)
                    M_IDLE: begin
                        busy <= 1'b0;
                        if (start) begin
                            f3 <= w10; f4 <= w11; f5 <= w12;
                            f6 <= w20; f7 <= w21; f8 <= w22;
                            kr3 <= k3; kr4 <= k4; kr5 <= k5;
                            kr6 <= k6; kr7 <= k7; kr8 <= k8;
                            tag_index_r <= tag_index;
                            tag_last_r <= tag_last;
                            acc <= bias_q12 + mul_ext(w00, k0) +
                                   mul_ext(w01, k1) + mul_ext(w02, k2);
                            row_idx <= 2'd1;
                            busy <= 1'b1;
                            state <= M_RUN;
                        end
                    end

                    M_RUN: begin
                        if (row_idx == 2'd1) begin
                            acc <= acc + mul_ext(f3, kr3) +
                                   mul_ext(f4, kr4) + mul_ext(f5, kr5);
                            row_idx <= 2'd2;
                        end
                        else begin
                            row_sum <= mul_ext(f6, kr6) +
                                       mul_ext(f7, kr7) + mul_ext(f8, kr8);
                            state <= M3_FINISH;
                        end
                    end

                    M3_FINISH: begin
                        result_q12 <= acc + row_sum;
                        result_index <= tag_index_r;
                        result_last <= tag_last_r;
                        valid <= 1'b1;
                        busy <= 1'b0;
                        state <= M_IDLE;
                    end

                    default: begin
                        state <= M_IDLE;
                        busy <= 1'b0;
                    end
                endcase
            end
        end
    end
endgenerate
endmodule

module CNN_Quantizer(
    input signed [31:0] value_q12,
    output reg signed [7:0] pixel_q6
);
    reg signed [31:0] base;
    reg signed [31:0] rounded;
    reg round_bit;
    reg sticky;
    reg lsb;

    always @(*) begin
        base = value_q12 >>> 6;
        round_bit = value_q12[5];
        sticky = |value_q12[4:0];
        lsb = value_q12[6];
        if (round_bit && (sticky || lsb)) begin
            rounded = base + 32'sd1;
        end
        else begin
            rounded = base;
        end

        if (rounded > 32'sd127) begin
            pixel_q6 = 8'sd127;
        end
        else if (rounded < -32'sd128) begin
            pixel_q6 = -8'sd128;
        end
        else begin
            pixel_q6 = rounded[7:0];
        end
    end
endmodule
