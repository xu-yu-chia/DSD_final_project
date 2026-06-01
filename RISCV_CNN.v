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
    wire clk = FPGA_clk;
    wire sys_rstn;
    wire locked;

    // 1024 data-memory words, each word is 32 bits.
    // Test circuit side signals for initializing/checking Data Memory.
    wire [9:0] tc_mem_addr;
    wire [31:0] tc_mem_wdata;
    wire [31:0] tc_cpu_rdata;
    wire tc_mem_we;

    // CPU side signals for Data Memory access.
    wire cpu_dmem_en, cpu_dmem_we;
    wire [9:0] cpu_dmem_addr;
    wire [31:0] cpu_dmem_wdata;
    wire [31:0] cpu_dmem_rdata;

    // CNN side signals for Data Memory access.
    wire cnn_enb, cnn_web, cnn_done;
    wire [9:0] cnn_addr;
    wire [31:0] cnn_dinb, cnn_doutb;
    
    wire cnn_finish_event;
    wire cnn_start_event;
    reg rstn_sync0;
    reg rstn_sync1;
    reg cnn_start_latched;
    wire test_rstn;
    reg sys_rstn_sync0;
    reg sys_rstn_sync1;
    wire core_rstn;
    reg mode_sync0;
    reg mode_sync1;
    reg st_sync0;
    reg st_sync1;
    reg [3:0] tc_sync0;
    reg [3:0] tc_sync1;

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

    // Synchronize the test-circuit reset before it drives CPU/CNN.
    // This avoids post-implementation timing simulation X/race behavior
    // from sys_rstn directly controlling many FDREs.
    assign core_rstn = sys_rstn_sync1;

    always @(posedge clk or negedge test_rstn) begin
        if (!test_rstn) begin
            sys_rstn_sync0 <= 1'b0;
            sys_rstn_sync1 <= 1'b0;
        end
        else begin
            sys_rstn_sync0 <= sys_rstn;
            sys_rstn_sync1 <= sys_rstn_sync0;
        end
    end

    // The switches/buttons are asynchronous to FPGA_clk in hardware and also
    // appear as top-level inputs in timing simulation. Register them before
    // the TA test circuit so its display/check logic is driven by clocked
    // signals instead of direct I/O paths.
    always @(posedge clk or negedge test_rstn) begin
        if (!test_rstn) begin
            mode_sync0 <= 1'b0;
            mode_sync1 <= 1'b0;
            st_sync0 <= 1'b0;
            st_sync1 <= 1'b0;
            tc_sync0 <= 4'd0;
            tc_sync1 <= 4'd0;
        end
        else begin
            mode_sync0 <= mode;
            mode_sync1 <= mode_sync0;
            st_sync0 <= st;
            st_sync1 <= st_sync0;
            tc_sync0 <= tc;
            tc_sync1 <= tc_sync0;
        end
    end

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            cnn_start_latched <= 1'b0;
        end
        else if (!core_rstn) begin
            cnn_start_latched <= 1'b0;
        end
        else if (cnn_done) begin
            cnn_start_latched <= 1'b0;
        end
        else if (cnn_start_event) begin
            cnn_start_latched <= 1'b1;
        end
    end
    
    // Test circuit controls testcase selection, memory initialization,
    // CPU/CNN reset sequencing, result checking, and seven-segment display.
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
        .start_bt(st_sync1),
        .mode(mode_sync1),
        .tc(tc_sync1),
        .seven_seg(seven_seg),
        .anode(anode),
        .all_done(all_done)
    );

    Simple_CPU u_cpu(
        .CLK(clk),
        .RSTN(core_rstn),
        .dmem_en(cpu_dmem_en),
        .dmem_we(cpu_dmem_we),
        .dmem_addr(cpu_dmem_addr),
        .dmem_wdata(cpu_dmem_wdata),
        .dmem_rdata(tc_cpu_rdata)
    );

    CNN u_cnn(
        .clk(clk),
        .rstn(core_rstn),
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
    output [9:0]  dmem_addr,
    output [31:0] dmem_wdata,
    input      [31:0] dmem_rdata
);
    localparam ALU_ADD = 1'b0;
    localparam ALU_SUB = 1'b1;

    reg [11:0] pc;
    reg [11:0] fetch_pc_d;
    reg        fetch_valid_d;
    reg        if_skid_valid;
    reg [11:0] if_skid_pc;
    reg [31:0] if_skid_instr;

    reg        if_id_valid;
    reg [11:0] if_id_pc;
    reg [31:0] if_id_instr;

    reg        id_ex_valid;
    reg [11:0] id_ex_pc;
    reg [4:0]  id_ex_rs1;
    reg [4:0]  id_ex_rs2;
    reg [4:0]  id_ex_rd;
    reg [31:0] id_ex_rs1_val;
    reg [31:0] id_ex_rs2_val;
    reg [31:0] id_ex_imm;
    reg        id_ex_alu_op;
    reg        id_ex_alu_src_imm;
    reg        id_ex_regwrite;
    reg        id_ex_memread;
    reg        id_ex_memwrite;
    reg        id_ex_branch;
    reg        id_ex_branch_blt;

    reg        mem_valid;
    reg [4:0]  mem_rd;
    reg [31:0] mem_alu_result;
    reg        mem_regwrite;
    reg        mem_memread;

    reg        wb_forward_valid;
    reg [4:0]  wb_forward_rd;
    reg [31:0] wb_forward_data;

    reg [31:0] regs_rs1 [0:31];
    reg [31:0] regs_rs2 [0:31];

    wire [31:0] instr;
    wire [9:0] imem_addr = pc[11:2];

    wire [6:0] id_opcode = if_id_instr[6:0];
    wire [4:0] id_rd     = if_id_instr[11:7];
    wire [2:0] id_funct3 = if_id_instr[14:12];
    wire [4:0] id_rs1    = if_id_instr[19:15];
    wire [4:0] id_rs2    = if_id_instr[24:20];
    wire [6:0] id_funct7 = if_id_instr[31:25];

    wire signed [31:0] id_imm_i = {{20{if_id_instr[31]}}, if_id_instr[31:20]};
    wire signed [31:0] id_imm_s = {{20{if_id_instr[31]}}, if_id_instr[31:25], if_id_instr[11:7]};
    wire signed [31:0] id_imm_b = {{19{if_id_instr[31]}}, if_id_instr[31], if_id_instr[7],
                                   if_id_instr[30:25], if_id_instr[11:8], 1'b0};

    wire id_is_add  = (id_opcode == 7'b0110011) && (id_funct3 == 3'b000) && (id_funct7 == 7'b0000000);
    wire id_is_sub  = (id_opcode == 7'b0110011) && (id_funct3 == 3'b000) && (id_funct7 == 7'b0100000);
    wire id_is_addi = (id_opcode == 7'b0010011) && (id_funct3 == 3'b000);
    wire id_is_lw   = (id_opcode == 7'b0000011);
    wire id_is_sw   = (id_opcode == 7'b0100011);
    wire id_is_beq  = (id_opcode == 7'b1100011) && (id_funct3 == 3'b000);
    wire id_is_blt  = (id_opcode == 7'b1100011) && (id_funct3 == 3'b100);

    wire id_uses_rs1 = id_is_add | id_is_sub | id_is_addi | id_is_lw | id_is_sw | id_is_beq | id_is_blt;
    wire id_uses_rs2 = id_is_add | id_is_sub | id_is_sw | id_is_beq | id_is_blt;
    wire [31:0] id_selected_imm = id_is_sw ? id_imm_s :
                                   (id_is_beq | id_is_blt) ? id_imm_b : id_imm_i;
    wire load_use_stall = if_id_valid && id_ex_valid && id_ex_memread && (id_ex_rd != 5'd0) &&
                          ((id_uses_rs1 && (id_rs1 == id_ex_rd)) ||
                           (id_uses_rs2 && (id_rs2 == id_ex_rd)));

    assign dmem_en = 1'b1;

    Instruction_Memory u_Instruction_Memory (
        .clka(CLK),
        .addra(imem_addr),
        .douta(instr)
    );

    wire [31:0] mem_stage_wdata = mem_memread ? dmem_rdata : mem_alu_result;
    wire mem_forward_valid = mem_valid && mem_regwrite && !mem_memread && (mem_rd != 5'd0);
    wire wb_can_forward = wb_forward_valid && (wb_forward_rd != 5'd0);
    wire id_wb_now = mem_valid && mem_regwrite && !mem_memread && (mem_rd != 5'd0);

    wire [31:0] ex_rs1 =
        ((id_ex_rs1 != 5'd0) && mem_forward_valid && (mem_rd == id_ex_rs1)) ? mem_stage_wdata :
        ((id_ex_rs1 != 5'd0) && wb_can_forward && (wb_forward_rd == id_ex_rs1)) ? wb_forward_data :
        id_ex_rs1_val;
    wire [31:0] ex_rs2 =
        ((id_ex_rs2 != 5'd0) && mem_forward_valid && (mem_rd == id_ex_rs2)) ? mem_stage_wdata :
        ((id_ex_rs2 != 5'd0) && wb_can_forward && (wb_forward_rd == id_ex_rs2)) ? wb_forward_data :
        id_ex_rs2_val;
    wire [31:0] ex_alu_b = id_ex_alu_src_imm ? id_ex_imm : ex_rs2;
    wire [31:0] ex_alu_result = id_ex_alu_op ? (ex_rs1 - ex_rs2) : (ex_rs1 + ex_alu_b);
    wire branch_taken = id_ex_valid && id_ex_branch &&
                        (id_ex_branch_blt ? ($signed(ex_rs1) < $signed(ex_rs2)) : (ex_rs1 == ex_rs2));
    wire [11:0] branch_target = id_ex_pc + id_ex_imm[11:0];

    assign dmem_addr = ex_alu_result[11:2];
    assign dmem_wdata = ex_rs2;
    assign dmem_we = id_ex_valid && id_ex_memwrite;

    wire [31:0] id_rs1_read =
        (id_rs1 == 5'd0) ? 32'd0 :
        (id_wb_now && (mem_rd == id_rs1)) ? mem_stage_wdata :
        regs_rs1[id_rs1];
    wire [31:0] id_rs2_read =
        (id_rs2 == 5'd0) ? 32'd0 :
        (id_wb_now && (mem_rd == id_rs2)) ? mem_stage_wdata :
        regs_rs2[id_rs2];

    always @(posedge CLK) begin
        if (!RSTN) begin
            pc <= 12'd0;
            fetch_pc_d <= 12'd0;
            fetch_valid_d <= 1'b0;
            if_skid_valid <= 1'b0;
            if_skid_pc <= 12'd0;
            if_skid_instr <= 32'd0;
            if_id_valid <= 1'b0;
            if_id_pc <= 12'd0;
            if_id_instr <= 32'd0;
            id_ex_valid <= 1'b0;
            id_ex_pc <= 12'd0;
            id_ex_rs1 <= 5'd0;
            id_ex_rs2 <= 5'd0;
            id_ex_rd <= 5'd0;
            id_ex_rs1_val <= 32'd0;
            id_ex_rs2_val <= 32'd0;
            id_ex_imm <= 32'd0;
            id_ex_alu_op <= ALU_ADD;
            id_ex_alu_src_imm <= 1'b0;
            id_ex_regwrite <= 1'b0;
            id_ex_memread <= 1'b0;
            id_ex_memwrite <= 1'b0;
            id_ex_branch <= 1'b0;
            id_ex_branch_blt <= 1'b0;
            mem_valid <= 1'b0;
            mem_rd <= 5'd0;
            mem_alu_result <= 32'd0;
            mem_regwrite <= 1'b0;
            mem_memread <= 1'b0;
            wb_forward_valid <= 1'b0;
            wb_forward_rd <= 5'd0;
            wb_forward_data <= 32'd0;
        end
        else begin
            if (mem_valid && mem_regwrite && (mem_rd != 5'd0)) begin
                regs_rs1[mem_rd] <= mem_stage_wdata;
                regs_rs2[mem_rd] <= mem_stage_wdata;
            end

            wb_forward_valid <= mem_valid && mem_regwrite && (mem_rd != 5'd0);
            wb_forward_rd <= mem_rd;
            wb_forward_data <= mem_stage_wdata;

            mem_valid <= id_ex_valid;
            mem_rd <= id_ex_rd;
            mem_alu_result <= ex_alu_result;
            mem_regwrite <= id_ex_regwrite;
            mem_memread <= id_ex_memread;

            if (branch_taken) begin
                pc <= branch_target;
                fetch_pc_d <= pc;
                fetch_valid_d <= 1'b0;
                if_skid_valid <= 1'b0;
                if_id_valid <= 1'b0;
                id_ex_valid <= 1'b0;
                id_ex_regwrite <= 1'b0;
                id_ex_memread <= 1'b0;
                id_ex_memwrite <= 1'b0;
                id_ex_branch <= 1'b0;
            end
            else if (load_use_stall) begin
                if (!if_skid_valid && fetch_valid_d) begin
                    if_skid_valid <= 1'b1;
                    if_skid_pc <= fetch_pc_d;
                    if_skid_instr <= instr;
                end
                fetch_pc_d <= pc;
                fetch_valid_d <= 1'b0;
                id_ex_valid <= 1'b0;
                id_ex_regwrite <= 1'b0;
                id_ex_memread <= 1'b0;
                id_ex_memwrite <= 1'b0;
                id_ex_branch <= 1'b0;
            end
            else begin
                pc <= pc + 12'd4;
                fetch_pc_d <= pc;
                fetch_valid_d <= 1'b1;

                if (if_skid_valid) begin
                    if_id_instr <= if_skid_instr;
                    if_id_pc <= if_skid_pc;
                    if_id_valid <= 1'b1;
                    if_skid_valid <= 1'b0;
                end
                else begin
                    if_id_instr <= instr;
                    if_id_pc <= fetch_pc_d;
                    if_id_valid <= fetch_valid_d;
                end

                id_ex_valid <= if_id_valid;
                id_ex_pc <= if_id_pc;
                id_ex_rs1 <= id_rs1;
                id_ex_rs2 <= id_rs2;
                id_ex_rd <= id_rd;
                id_ex_rs1_val <= id_rs1_read;
                id_ex_rs2_val <= id_rs2_read;
                id_ex_imm <= id_selected_imm;
                id_ex_alu_op <= id_is_sub ? ALU_SUB : ALU_ADD;
                id_ex_alu_src_imm <= id_is_addi | id_is_lw | id_is_sw;
                id_ex_regwrite <= id_is_add | id_is_sub | id_is_addi | id_is_lw;
                id_ex_memread <= id_is_lw;
                id_ex_memwrite <= id_is_sw;
                id_ex_branch <= id_is_beq | id_is_blt;
                id_ex_branch_blt <= id_is_blt;
            end
        end
    end
endmodule

module CNN(
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

    // Data Memory map for CNN feature maps.
    localparam [9:0] INPUT_BASE = 10'd16;   // Input feature map starts at address 16.
    localparam [9:0] INTER_BASE = 10'd272;  // Layer-0 output / layer-1 input starts at address 272.
    localparam [9:0] FINAL_BASE = 10'd600;  // Final layer-1 output starts at address 600.

    reg [5:0] state;
    reg [3:0] load_idx; // Index used while loading packed kernel weights.

    // Two 3x3 kernels:
    // weights[0]~weights[8] are used in layer 0.
    // weights[9]~weights[17] are used in layer 1.
    reg signed [7:0] weights [0:17];
    reg signed [7:0] bias0;
    reg signed [7:0] bias1;
    reg [5:0] fmap_size;
    reg [5:0] in_w;
    reg [5:0] out_w;
    reg [9:0] base_in;
    reg [9:0] base_out;
    reg layer;

    // Input streaming position and total number of pixels in the current layer.
    reg [11:0] input_total;
    reg [11:0] input_index;
    reg [5:0] stream_x;
    reg [5:0] stream_y;

    // 32-bit memory word contains four packed 8-bit pixels.
    reg [31:0] stream_word;

    // Output packing and bookkeeping.
    reg [11:0] output_total;
    reg [11:0] out_index;
    // Number of MAC9 pipeline results already completed.
    reg [11:0] retire_count;
    reg write_pending;
    reg [9:0] pending_addr;
    reg [31:0] pending_word;
    // Buffer used to pack four 8-bit output pixels into one 32-bit word.
    reg [31:0] pack_word;
    integer wi;

    wire [1:0] stream_lane = input_index[1:0];
    wire [9:0] stream_word_addr = base_in + input_index[11:2];
    wire stream_done = (input_index == input_total);
    wire [9:0] stream_word_index = input_index[11:2];
    wire [9:0] input_last_word_index = input_total[11:2] - 10'd1;
    wire stream_word_has_next = (stream_word_index < input_last_word_index);
    wire stream_read_slot = (!stream_done) && (stream_lane == 2'd1) && stream_word_has_next;
    wire stream_capture_slot = (!stream_done) && (stream_lane == 2'd3) && stream_word_has_next;
    wire stream_write_slot = (!stream_done) && ((stream_lane == 2'd0) || (stream_lane == 2'd3));
    wire line_valid;
    wire line_accept = (state == C_UNPACK) && !stream_done;
    wire mac_start = (state == C_UNPACK) && line_valid;
    wire current_last = (out_index == (output_total - 12'd1));
    wire signed [7:0] unpacked_pixel;
    wire signed [7:0] quant_pixel;
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
    wire mac_result_flush = (mac_out_index[1:0] == 2'd3) || mac_out_last;

    assign enb = rstn;

    // Select one 8-bit pixel from the current 32-bit packed input word.
    CNN_Unpacker u_unpacker(
        .word(stream_word),
        .lane(stream_lane),
        .pixel(unpacked_pixel)
    );

    // Line buffer receives pixels sequentially and generates a valid 3x3
    // convolution window once enough rows and columns are available.
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

    // MAC engine performs one 3x3 convolution using the fixed MAC9 parallel pipeline.
    CNN_MAC_Engine u_mac_engine (
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

    // Convert the MAC result back to 8-bit output using rounding and clipping.
    CNN_Quantizer u_quantizer(
        .value_q12(mac_result),
        .pixel_q6(quant_pixel)
    );

    // Put one 8-bit pixel back into the selected lane of a 32-bit word.
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

    // Calculate total number of pixels from the feature-map width.
    function [11:0] square6;
        input [5:0] value;
        begin
            case (value)
                6'd0:  square6 = 12'd0;
                6'd1:  square6 = 12'd1;
                6'd2:  square6 = 12'd4;
                6'd3:  square6 = 12'd9;
                6'd4:  square6 = 12'd16;
                6'd5:  square6 = 12'd25;
                6'd6:  square6 = 12'd36;
                6'd7:  square6 = 12'd49;
                6'd8:  square6 = 12'd64;
                6'd9:  square6 = 12'd81;
                6'd10: square6 = 12'd100;
                6'd11: square6 = 12'd121;
                6'd12: square6 = 12'd144;
                6'd13: square6 = 12'd169;
                6'd14: square6 = 12'd196;
                6'd15: square6 = 12'd225;
                6'd16: square6 = 12'd256;
                6'd17: square6 = 12'd289;
                6'd18: square6 = 12'd324;
                6'd19: square6 = 12'd361;
                6'd20: square6 = 12'd400;
                6'd21: square6 = 12'd441;
                6'd22: square6 = 12'd484;
                6'd23: square6 = 12'd529;
                6'd24: square6 = 12'd576;
                6'd25: square6 = 12'd625;
                6'd26: square6 = 12'd676;
                6'd27: square6 = 12'd729;
                6'd28: square6 = 12'd784;
                6'd29: square6 = 12'd841;
                6'd30: square6 = 12'd900;
                6'd31: square6 = 12'd961;
                6'd32: square6 = 12'd1024;
                default: square6 = 12'd0;
            endcase
        end
    endfunction

    // Advance the streaming position across the 2D feature map.
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
            // Feature-map and layer configuration.
            fmap_size <= 6'd0;
            in_w <= 6'd0;
            out_w <= 6'd0;
            base_in <= 10'd0;
            base_out <= 10'd0;
            layer <= 1'b0;
            // Input streaming state.
            input_total <= 12'd0;
            input_index <= 12'd0;
            stream_x <= 6'd0;
            stream_y <= 6'd0;
            stream_word <= 32'd0;
            // Output streaming/packing state.
            output_total <= 12'd0;
            out_index <= 12'd0;
            retire_count <= 12'd0;
            write_pending <= 1'b0;
            pending_addr <= 10'd0;
            pending_word <= 32'd0;
            pack_word <= 32'd0;
            // Bias and kernel initialization.
            bias0 <= 8'sd0;
            bias1 <= 8'sd0;
            for (wi = 0; wi < 18; wi = wi + 1) begin
                weights[wi] <= 8'sd0;
            end
        end
        else begin
            web <= 1'b0;
            // MAC9 results come from a pipeline.
            // Quantize and pack each valid result while input streaming continues.
            if (mac_valid) begin
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
                    // Read feature-map size from Data Memory address 12.
                    fmap_size <= doutb[6:1];
                    state <= C_LOAD_B0_ADDR;
                end

                C_LOAD_B0_ADDR: begin
                    // Read layer-0 bias from Data Memory address 14.
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
                    // Read layer-1 bias from Data Memory address 15.
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
                    // Set current layer dimensions and restart input/output counters.
                    input_total <= square6(in_w);
                    output_total <= square6(out_w);
                    input_index <= 12'd0;
                    stream_x <= 6'd0;
                    stream_y <= 6'd0;
                    out_index <= 12'd0;
                    retire_count <= 12'd0;
                    write_pending <= 1'b0;
                    pending_addr <= 10'd0;
                    pending_word <= 32'd0;
                    pack_word <= 32'd0;
                    state <= C_STREAM_NEXT;
                end

                C_STREAM_NEXT: begin
                    // Prime the first input word of this layer. After this point,
                    // C_UNPACK keeps the pixel stream running at one pixel per cycle
                    // and prefetches the next 32-bit word while unpacking lanes.
                    if (stream_done) begin
                        state <= C_LAYER_NEXT;
                    end
                    else begin
                        addr <= stream_word_addr;
                        state <= C_READ_WAIT;
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
                    // line_accept is asserted in this state when stream_done is false.
                    // line_valid belongs to the previous accepted pixel, so a new MAC
                    // can be launched while the next pixel is being accepted.
                    if (line_valid) begin
                        out_index <= out_index + 12'd1;
                    end

                    if (stream_done) begin
                        state <= C_MAC_WAIT;
                    end
                    else begin
                        // For 32-bit packed input, request the next word at lane 1.
                        // With the BRAM latency used by the reference memory, the word
                        // can be captured when lane 3 is consumed.
                        if (stream_read_slot) begin
                            addr <= base_in + stream_word_index + 10'd1;
                        end
                        else if (write_pending && stream_write_slot) begin
                            // Output writes use otherwise-free memory slots.  The read
                            // request slot has priority so the input stream does not stall.
                            addr <= pending_addr;
                            dinb <= pending_word;
                            web <= 1'b1;
                            write_pending <= 1'b0;
                        end

                        if (stream_capture_slot) begin
                            stream_word <= doutb;
                        end

                        advance_input;
                        state <= C_UNPACK;
                    end
                end

                C_WINDOW: begin
                    // Unused in the fast streaming datapath; kept for state encoding compatibility.
                    state <= C_UNPACK;
                end

                C_MAC_WAIT: begin
                    // If a full packed output word is waiting, write it first.
                    if (write_pending) begin
                        state <= C_WRITE_OUT;
                    end
                    else if (retire_count == output_total) begin
                        state <= C_LAYER_NEXT;
                    end
                end

                C_WRITE_OUT: begin
                    addr <= pending_addr;
                    dinb <= pending_word;
                    web <= 1'b1;
                    write_pending <= 1'b0;
                    state <= C_MAC_WAIT;
                end

                C_LAYER_NEXT: begin
                    // Layer 1 uses the layer-0 output as its input feature map.
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
                    // Give the BRAM write of DataMemory[13] one full cycle to settle
                    // before the test circuit sees system_done.
                    done <= 1'b0;
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
    // line0 and line1 store the previous two rows of pixels.
    // Distributed RAM avoids spending flip-flops on the 2-row buffer.
    reg signed [7:0] line0 [0:31];
    reg signed [7:0] line1 [0:31];
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
            // valid is normally low; it is asserted for one cycle when a
            // complete 3x3 window is generated.
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
                // accept means a new pixel enters the line buffer this cycle.
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

                // A complete 3x3 window exists only after at least 3 rows
                // and 3 columns have been received.
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

                // Update vertical line buffers: current pixel becomes previous row
                // data for the next row, and old line1 moves into line0.
                line0[x_idx] <= line1[x_idx];
                line1[x_idx] <= pixel;
            end
        end
    end
endmodule



module CNN_MAC_Engine(
    input clk,
    input rstn,
    input start,
    input signed [31:0] bias_q12,
    // 3x3 input feature-map window:
    // w00 w01 w02
    // w10 w11 w12
    // w20 w21 w22
    input signed [7:0] w00,
    input signed [7:0] w01,
    input signed [7:0] w02,
    input signed [7:0] w10,
    input signed [7:0] w11,
    input signed [7:0] w12,
    input signed [7:0] w20,
    input signed [7:0] w21,
    input signed [7:0] w22,
    // 3x3 kernel weights:
    // k0 k1 k2
    // k3 k4 k5
    // k6 k7 k8
    input signed [7:0] k0,
    input signed [7:0] k1,
    input signed [7:0] k2,
    input signed [7:0] k3,
    input signed [7:0] k4,
    input signed [7:0] k5,
    input signed [7:0] k6,
    input signed [7:0] k7,
    input signed [7:0] k8,
    // tag_index and tag_last keep output position information aligned
    // with delayed MAC9 pipeline results.
    input [11:0] tag_index,
    input tag_last,
    output reg busy,
    output reg valid,
    output reg [11:0] result_index,
    output reg result_last,
    output reg signed [31:0] result_q12
);

    // hope vivado built 8x8 multipliers into fabric LUTs instead of DSP48s.
    // This trades LUT area for a lower official area score because DSPs
    // carry a 280x penalty in the project formula.
    function signed [7:0] sx8;
        input signed [7:0] value;
        begin
            sx8 = value;
        end
    endfunction

    // The 9 signed 8x8 products plus bias fit in 20 bits; keep the
    // internal reduction narrow and sign-extend only at the output.
    function signed [19:0] prod16_to_q12;
        input signed [15:0] value;
        begin
            prod16_to_q12 = {{4{value[15]}}, value};
        end
    endfunction
    //extend to fit in quantizer
    function signed [31:0] sx20_to_q32;
        input signed [19:0] value;
        begin
            sx20_to_q32 = {{12{value[19]}}, value};
        end
    endfunction

    // Valid shift register for the 3-stage MAC pipeline.
    reg [2:0] pipe_valid;
    reg signed [15:0] p0;
    reg signed [15:0] p1;
    reg signed [15:0] p2;
    reg signed [15:0] p3;
    reg signed [15:0] p4;
    reg signed [15:0] p5;
    reg signed [15:0] p6;
    reg signed [15:0] p7;
    reg signed [15:0] p8;
    // Bias and output tags must move through the pipeline with the data.
    reg signed [19:0] bias_s1;
    reg [11:0] tag_s1;
    reg tag_last_s1;
    reg signed [19:0] s2_0;
    reg signed [19:0] s2_1;
    reg signed [19:0] s2_2;
    reg signed [19:0] s2_3;
    reg signed [19:0] s2_4;
    reg [11:0] tag_s2;
    reg tag_last_s2;
    reg signed [19:0] s3_0;
    reg signed [19:0] s3_1;
    reg signed [19:0] s3_2;
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
            p0 <= 16'sd0;
            p1 <= 16'sd0;
            p2 <= 16'sd0;
            p3 <= 16'sd0;
            p4 <= 16'sd0;
            p5 <= 16'sd0;
            p6 <= 16'sd0;
            p7 <= 16'sd0;
            p8 <= 16'sd0;
            bias_s1 <= 20'sd0;
            tag_s1 <= 12'd0;
            tag_last_s1 <= 1'b0;
            s2_0 <= 20'sd0;
            s2_1 <= 20'sd0;
            s2_2 <= 20'sd0;
            s2_3 <= 20'sd0;
            s2_4 <= 20'sd0;
            tag_s2 <= 12'd0;
            tag_last_s2 <= 1'b0;
            s3_0 <= 20'sd0;
            s3_1 <= 20'sd0;
            s3_2 <= 20'sd0;
            tag_s3 <= 12'd0;
            tag_last_s3 <= 1'b0;
        end
        else begin
            valid <= pipe_valid[2];
            // busy is high when a new input starts or when data remains in the pipeline.
            busy <= start | (|pipe_valid);//只要 pipeline 任一級仍然有有效資料，MAC 就還在忙碌中
            pipe_valid <= {pipe_valid[1:0], start};//000 010 100

            if (start) begin
                // Stage 1: compute 9 parallel products.
                p0 <= sx8(w00) * sx8(k0);
                p1 <= sx8(w01) * sx8(k1);
                p2 <= sx8(w02) * sx8(k2);
                p3 <= sx8(w10) * sx8(k3);
                p4 <= sx8(w11) * sx8(k4);
                p5 <= sx8(w12) * sx8(k5);
                p6 <= sx8(w20) * sx8(k6);
                p7 <= sx8(w21) * sx8(k7);
                p8 <= sx8(w22) * sx8(k8);
                bias_s1 <= bias_q12[19:0];
                tag_s1 <= tag_index;
                tag_last_s1 <= tag_last;
            end

            if (pipe_valid[0]) begin
                // Stage 2: reduce 9 products into 5 partial sums.
                s2_0 <= prod16_to_q12(p0) + prod16_to_q12(p1);
                s2_1 <= prod16_to_q12(p2) + prod16_to_q12(p3);
                s2_2 <= prod16_to_q12(p4) + prod16_to_q12(p5);
                s2_3 <= prod16_to_q12(p6) + prod16_to_q12(p7);
                s2_4 <= bias_s1 + prod16_to_q12(p8);
                tag_s2 <= tag_s1;
                tag_last_s2 <= tag_last_s1;
            end

            if (pipe_valid[1]) begin
                // Stage 3: reduce 5 partial sums into 3 partial sums.
                s3_0 <= s2_0 + s2_1;
                s3_1 <= s2_2 + s2_3;
                s3_2 <= s2_4;
                tag_s3 <= tag_s2;
                tag_last_s3 <= tag_last_s2;
            end

            if (pipe_valid[2]) begin
                // Final stage: produce the convolution result and its tag.
                result_q12 <= sx20_to_q32(s3_0 + s3_1 + s3_2);
                result_index <= tag_s3;
                result_last <= tag_last_s3;
            end
        end
    end
endmodule

// Quantizer rounds the Q12 MAC result back toward Q6-like 8-bit pixel output
// and clips the result to the signed 8-bit range.
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


