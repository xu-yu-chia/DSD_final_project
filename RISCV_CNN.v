`timescale 1ns / 1ps

module RISCV_CNN(
    input         clk,
    input         rstn,
    input  [3:0]  tc,
    input         mode,
    input         st,
    output [6:0]  seven_seg,
    output [3:0]  anode
);
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
        .anode(anode)
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

    CNN u_cnn(
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
                            pc <= pc + 32'd4;
                            state <= S_FETCH_ADDR;
                        end

                        7'b0010011: begin
                            if (funct3 == 3'b000 && rd != 5'd0) begin
                                regs[rd] <= regs[rs1] + imm_i;
                            end
                            pc <= pc + 32'd4;
                            state <= S_FETCH_ADDR;
                        end

                        7'b0000011: begin
                            dmem_addr <= load_byte_addr[11:2];
                            load_rd <= rd;
                            pc <= pc + 32'd4;
                            state <= S_LOAD_WAIT;
                        end

                        7'b0100011: begin
                            dmem_addr <= store_byte_addr[11:2];
                            dmem_wdata <= regs[rs2];
                            pc <= pc + 32'd4;
                            state <= S_STORE;
                        end

                        7'b1100011: begin
                            if ((funct3 == 3'b000 && regs[rs1] == regs[rs2]) ||
                                (funct3 == 3'b100 && $signed(regs[rs1]) < $signed(regs[rs2]))) begin
                                pc <= pc + imm_b;
                            end
                            else begin
                                pc <= pc + 32'd4;
                            end
                            state <= S_FETCH_ADDR;
                        end

                        default: begin
                            pc <= pc + 32'd4;
                            state <= S_FETCH_ADDR;
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
                    state <= S_FETCH_ADDR;
                end

                S_STORE: begin
                    dmem_addr <= 10'd0;
                    dmem_wdata <= 32'd0;
                    state <= S_FETCH_ADDR;
                end

                default: begin
                    state <= S_FETCH_ADDR;
                end
            endcase
            regs[0] <= 32'd0;
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
    localparam C_POLL_WAIT     = 6'd1;
    localparam C_POLL_CHECK    = 6'd2;
    localparam C_CLEAR_CMD     = 6'd3;
    localparam C_LOAD_CFG_ADDR = 6'd4;
    localparam C_LOAD_CFG_WAIT = 6'd5;
    localparam C_LOAD_CFG_CAP  = 6'd6;
    localparam C_LOAD_B0_ADDR  = 6'd7;
    localparam C_LOAD_B0_WAIT  = 6'd8;
    localparam C_LOAD_B0_CAP   = 6'd9;
    localparam C_LOAD_B1_ADDR  = 6'd10;
    localparam C_LOAD_B1_WAIT  = 6'd11;
    localparam C_LOAD_B1_CAP   = 6'd12;
    localparam C_LOAD_W_ADDR   = 6'd13;
    localparam C_LOAD_W_WAIT   = 6'd14;
    localparam C_LOAD_W_CAP    = 6'd15;
    localparam C_PIXEL_START   = 6'd16;
    localparam C_ROW_ADDR      = 6'd17;
    localparam C_ROW_WAIT_A    = 6'd18;
    localparam C_ROW_CAP_A     = 6'd19;
    localparam C_ROW_WAIT_B    = 6'd20;
    localparam C_ROW_CAP_B     = 6'd21;
    localparam C_MAC           = 6'd22;
    localparam C_WRITE_OUT     = 6'd23;
    localparam C_LAYER_NEXT    = 6'd24;
    localparam C_WRITE_DONE    = 6'd25;
    localparam C_FINISHED      = 6'd26;
    localparam C_ACCUM_ROW     = 6'd28;
    localparam C_FINISH_PIXEL  = 6'd29;

    reg [5:0] state;
    reg [3:0] load_idx;
    reg signed [7:0] weights [0:17];
    reg signed [7:0] bias0;
    reg signed [7:0] bias1;

    reg [5:0] fmap_size;
    reg [5:0] in_w;
    reg [5:0] out_w;
    reg [11:0] total_pixels;
    reg [9:0] base_in;
    reg [9:0] base_out;
    reg layer;
    reg [5:0] row;
    reg [5:0] col;
    reg [11:0] row_base;
    reg [1:0] krow;
    reg [11:0] out_index;
    reg signed [31:0] accum;
    reg [31:0] pack_word;

    reg [9:0] req_word_addr;
    reg [1:0] req_lane;
    reg [31:0] word0;
    reg [31:0] word1;
    reg signed [7:0] kernel0;
    reg signed [7:0] kernel1;
    reg signed [7:0] kernel2;
    reg signed [31:0] prod0_reg;
    reg signed [31:0] prod1_reg;
    reg signed [31:0] prod2_reg;
    reg [31:0] cache_word0 [0:2];
    reg [31:0] cache_word1 [0:2];
    reg [1:0] cache_lane [0:2];
    reg [2:0] cache_valid;

    integer wi;
    integer ci;

    wire signed [7:0] feature0;
    wire signed [7:0] feature1;
    wire signed [7:0] feature2;
    wire signed [31:0] prod0_next;
    wire signed [31:0] prod1_next;
    wire signed [31:0] prod2_next;
    wire signed [31:0] row_sum;
    wire signed [31:0] acc_next;
    wire signed [7:0] rounded_accum;
    wire [31:0] pack_finished_accum;
    wire [11:0] in_w_ext = {6'd0, in_w};
    wire [11:0] col_ext = {6'd0, col};
    wire [1:0] next_krow = krow + 2'd1;
    wire [1:0] cache_next_krow = (krow == 2'd2) ? 2'd0 : next_krow;
    wire [11:0] kernel_row_offset = kernel_row_offset_for(krow, in_w);
    wire [11:0] next_kernel_row_offset = kernel_row_offset_for(next_krow, in_w);
    wire [11:0] current_feature_index = row_base + kernel_row_offset + col_ext;
    wire [11:0] next_feature_index = row_base + next_kernel_row_offset + col_ext;
    wire [11:0] first_feature_index = row_base + col_ext;
    wire [9:0] current_word_addr = base_in + current_feature_index[11:2];
    wire [1:0] current_lane = current_feature_index[1:0];
    wire [9:0] next_word_addr = base_in + next_feature_index[11:2];
    wire [1:0] next_lane = next_feature_index[1:0];
    wire [9:0] first_word_addr = base_in + first_feature_index[11:2];
    wire [1:0] first_lane = first_feature_index[1:0];
    wire last_pixel = (out_index == (total_pixels - 12'd1));
    wire flush_word = (out_index[1:0] == 2'd3) || last_pixel;
    wire first_cache_read_b = 1'b0;
    wire first_cache_no_read = 1'b0;
    wire next_cache_read_b = 1'b0;
    wire next_cache_no_read = 1'b0;

    assign enb = rstn;
    function signed [7:0] lane_value;
        input [31:0] word;
        input [1:0] lane;
        begin
            case (lane)
                2'd0: lane_value = word[31:24];
                2'd1: lane_value = word[23:16];
                2'd2: lane_value = word[15:8];
                default: lane_value = word[7:0];
            endcase
        end
    endfunction

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

    function signed [7:0] get_feature0;
        input [31:0] a;
        input [31:0] b;
        input [1:0] lane;
        begin
            get_feature0 = lane_value(a, lane);
        end
    endfunction

    function signed [7:0] get_feature1;
        input [31:0] a;
        input [31:0] b;
        input [1:0] lane;
        begin
            if (lane == 2'd3) begin
                get_feature1 = lane_value(b, 2'd0);
            end
            else begin
                get_feature1 = lane_value(a, lane + 2'd1);
            end
        end
    endfunction

    function signed [7:0] get_feature2;
        input [31:0] a;
        input [31:0] b;
        input [1:0] lane;
        begin
            case (lane)
                2'd0: get_feature2 = lane_value(a, 2'd2);
                2'd1: get_feature2 = lane_value(a, 2'd3);
                2'd2: get_feature2 = lane_value(b, 2'd0);
                default: get_feature2 = lane_value(b, 2'd1);
            endcase
        end
    endfunction

    function [31:0] cached_word0_for;
        input [1:0] lane;
        input [31:0] prev_word0;
        input [31:0] prev_word1;
        begin
            cached_word0_for = (lane == 2'd0) ? prev_word1 : prev_word0;
        end
    endfunction

    function [31:0] cached_word1_for;
        input [1:0] lane;
        input [31:0] prev_word1;
        begin
            cached_word1_for = (lane == 2'd3) ? prev_word1 : 32'd0;
        end
    endfunction

    function signed [7:0] round_sat_q12_to_q6;
        input signed [31:0] value;
        reg signed [31:0] base;
        reg signed [31:0] rounded;
        reg [5:0] rem;
        begin
            base = value >>> 6;
            rem = value[5:0];
            if (rem < 6'd32) begin
                rounded = base;
            end
            else if (rem > 6'd32) begin
                rounded = base + 32'sd1;
            end
            else if (base[0] == 1'b0) begin
                rounded = base;
            end
            else begin
                rounded = base + 32'sd1;
            end

            if (rounded > 32'sd127) begin
                round_sat_q12_to_q6 = 8'sd127;
            end
            else if (rounded < -32'sd128) begin
                round_sat_q12_to_q6 = -8'sd128;
            end
            else begin
                round_sat_q12_to_q6 = rounded[7:0];
            end
        end
    endfunction

    function signed [31:0] mul8;
        input signed [7:0] a;
        input signed [7:0] b;
        begin
            mul8 = a * b;
        end
    endfunction

    function [11:0] kernel_row_offset_for;
        input [1:0] row_sel;
        input [5:0] width;
        begin
            case (row_sel)
                2'd0: kernel_row_offset_for = 12'd0;
                2'd1: kernel_row_offset_for = {6'd0, width};
                default: kernel_row_offset_for = {5'd0, width, 1'b0};
            endcase
        end
    endfunction

    function [5:0] effective_fmap_size;
        input [5:0] raw_size;
        begin
            effective_fmap_size = raw_size;
        end
    endfunction

    function signed [7:0] selected_weight;
        input layer_sel;
        input [1:0] row_sel;
        input [1:0] col_sel;
        reg [4:0] idx;
        begin
            idx = (layer_sel ? 5'd9 : 5'd0) + ({3'd0, row_sel} * 5'd3) + {3'd0, col_sel};
            selected_weight = weights[idx];
        end
    endfunction

    assign feature0 = get_feature0(word0, word1, req_lane);
    assign feature1 = get_feature1(word0, word1, req_lane);
    assign feature2 = get_feature2(word0, word1, req_lane);
    assign prod0_next = mul8(feature0, kernel0);
    assign prod1_next = mul8(feature1, kernel1);
    assign prod2_next = mul8(feature2, kernel2);
    assign row_sum = prod0_reg + prod1_reg + prod2_reg;
    assign acc_next = accum + row_sum;
    assign rounded_accum = round_sat_q12_to_q6(accum);
    assign pack_finished_accum = put_lane(pack_word, out_index[1:0], rounded_accum);

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
            total_pixels <= 12'd0;
            base_in <= 10'd0;
            base_out <= 10'd0;
            layer <= 1'b0;
            row <= 6'd0;
            col <= 6'd0;
            row_base <= 12'd0;
            krow <= 2'd0;
            out_index <= 12'd0;
            accum <= 32'sd0;
            pack_word <= 32'd0;
            req_word_addr <= 10'd0;
            req_lane <= 2'd0;
            word0 <= 32'd0;
            word1 <= 32'd0;
            kernel0 <= 8'sd0;
            kernel1 <= 8'sd0;
            kernel2 <= 8'sd0;
            prod0_reg <= 32'sd0;
            prod1_reg <= 32'sd0;
            prod2_reg <= 32'sd0;
            cache_valid <= 3'd0;
            bias0 <= 8'sd0;
            bias1 <= 8'sd0;
            for (wi = 0; wi < 18; wi = wi + 1) begin
                weights[wi] <= 8'sd0;
            end
            for (ci = 0; ci < 3; ci = ci + 1) begin
                cache_word0[ci] <= 32'd0;
                cache_word1[ci] <= 32'd0;
                cache_lane[ci] <= 2'd0;
            end
        end
        else begin
            web <= 1'b0;
            case (state)
                C_IDLE: begin
                    dinb <= 32'd0;
                    done <= 1'b0;
                    if (start) begin
                        addr <= 10'd0;
                        state <= C_CLEAR_CMD;
                    end
                    else begin
                        addr <= 10'd0;
                        state <= C_IDLE;
                    end
                end

                C_CLEAR_CMD: begin
                    state <= C_LOAD_CFG_ADDR;
                end

                C_LOAD_CFG_ADDR: begin
                    addr <= 10'd12;
                    state <= C_LOAD_CFG_WAIT;
                end

                C_LOAD_CFG_WAIT: begin
                    state <= C_LOAD_CFG_CAP;
                end

                C_LOAD_CFG_CAP: begin
                    fmap_size <= effective_fmap_size(doutb[6:1]);
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
                        total_pixels <= (fmap_size - 6'd2) * (fmap_size - 6'd2);
                        base_in <= 10'd16;
                        base_out <= 10'd272;
                        row <= 6'd0;
                        col <= 6'd0;
                        row_base <= 12'd0;
                        out_index <= 12'd0;
                        pack_word <= 32'd0;
                        cache_valid <= 3'd0;
                        state <= C_PIXEL_START;
                    end
                    else begin
                        load_idx <= load_idx + 4'd1;
                        state <= C_LOAD_W_ADDR;
                    end
                end

                C_PIXEL_START: begin
                    accum <= {{18{(layer ? bias1[7] : bias0[7])}},
                              (layer ? bias1 : bias0), 6'd0};
                    krow <= 2'd0;
                    req_word_addr <= first_word_addr;
                    req_lane <= first_lane;
                    kernel0 <= selected_weight(layer, 2'd0, 2'd0);
                    kernel1 <= selected_weight(layer, 2'd0, 2'd1);
                    kernel2 <= selected_weight(layer, 2'd0, 2'd2);
                    if (first_cache_no_read) begin
                        word0 <= cached_word0_for(first_lane, cache_word0[0], cache_word1[0]);
                        word1 <= cached_word1_for(first_lane, cache_word1[0]);
                        state <= C_MAC;
                    end
                    else if (first_cache_read_b) begin
                        word0 <= cache_word0[0];
                        addr <= first_word_addr + 10'd1;
                        state <= C_ROW_WAIT_B;
                    end
                    else begin
                        addr <= first_word_addr;
                        state <= C_ROW_WAIT_A;
                    end
                end

                C_ROW_ADDR: begin
                    req_word_addr <= current_word_addr;
                    req_lane <= current_lane;
                    kernel0 <= selected_weight(layer, krow, 2'd0);
                    kernel1 <= selected_weight(layer, krow, 2'd1);
                    kernel2 <= selected_weight(layer, krow, 2'd2);
                    addr <= current_word_addr;
                    state <= C_ROW_WAIT_A;
                end

                C_ROW_WAIT_A: begin
                    state <= C_ROW_CAP_A;
                end

                C_ROW_CAP_A: begin
                    word0 <= doutb;
                    if (req_lane >= 2'd2) begin
                        addr <= req_word_addr + 10'd1;
                        state <= C_ROW_WAIT_B;
                    end
                    else begin
                        word1 <= 32'd0;
                        state <= C_MAC;
                    end
                end

                C_ROW_WAIT_B: begin
                    state <= C_ROW_CAP_B;
                end

                C_ROW_CAP_B: begin
                    word1 <= doutb;
                    state <= C_MAC;
                end

                C_MAC: begin
                    prod0_reg <= prod0_next;
                    prod1_reg <= prod1_next;
                    prod2_reg <= prod2_next;
                    cache_word0[krow] <= word0;
                    cache_word1[krow] <= word1;
                    cache_lane[krow] <= req_lane;
                    cache_valid[krow] <= 1'b1;
                    if (krow != 2'd2) begin
                        req_word_addr <= next_word_addr;
                        req_lane <= next_lane;
                        kernel0 <= selected_weight(layer, next_krow, 2'd0);
                        kernel1 <= selected_weight(layer, next_krow, 2'd1);
                        kernel2 <= selected_weight(layer, next_krow, 2'd2);
                        if (next_cache_no_read) begin
                            word0 <= cached_word0_for(next_lane, cache_word0[cache_next_krow], cache_word1[cache_next_krow]);
                            word1 <= cached_word1_for(next_lane, cache_word1[cache_next_krow]);
                        end
                        else if (next_cache_read_b) begin
                            word0 <= cache_word0[cache_next_krow];
                            addr <= next_word_addr + 10'd1;
                        end
                        else begin
                            addr <= next_word_addr;
                        end
                    end
                    state <= C_ACCUM_ROW;
                end

                C_ACCUM_ROW: begin
                    accum <= acc_next;
                    if (krow == 2'd2) begin
                        state <= C_FINISH_PIXEL;
                    end
                    else begin
                        krow <= next_krow;
                        if (next_cache_no_read) begin
                            state <= C_MAC;
                        end
                        else if (next_cache_read_b) begin
                            state <= C_ROW_CAP_B;
                        end
                        else begin
                            state <= C_ROW_CAP_A;
                        end
                    end
                end

                C_FINISH_PIXEL: begin
                    if (flush_word) begin
                        addr <= base_out + out_index[11:2];
                        dinb <= pack_finished_accum;
                        web <= 1'b1;
                        pack_word <= 32'd0;
                        state <= C_WRITE_OUT;
                    end
                    else begin
                        pack_word <= pack_finished_accum;
                        if (col == out_w - 6'd1) begin
                            col <= 6'd0;
                            row <= row + 6'd1;
                            row_base <= row_base + {6'd0, in_w};
                            cache_valid <= 3'd0;
                        end
                        else begin
                            col <= col + 6'd1;
                        end
                        out_index <= out_index + 12'd1;
                        state <= C_PIXEL_START;
                    end
                end

                C_WRITE_OUT: begin
                    if (last_pixel) begin
                        state <= C_LAYER_NEXT;
                    end
                    else begin
                        if (col == out_w - 6'd1) begin
                            col <= 6'd0;
                            row <= row + 6'd1;
                            row_base <= row_base + {6'd0, in_w};
                            cache_valid <= 3'd0;
                        end
                        else begin
                            col <= col + 6'd1;
                        end
                        out_index <= out_index + 12'd1;
                        state <= C_PIXEL_START;
                    end
                end

                C_LAYER_NEXT: begin
                    if (!layer) begin
                        layer <= 1'b1;
                        in_w <= fmap_size - 6'd2;
                        out_w <= fmap_size - 6'd4;
                        total_pixels <= (fmap_size - 6'd4) * (fmap_size - 6'd4);
                        base_in <= 10'd272;
                        base_out <= 10'd512;
                        row <= 6'd0;
                        col <= 6'd0;
                        row_base <= 12'd0;
                        out_index <= 12'd0;
                        pack_word <= 32'd0;
                        cache_valid <= 3'd0;
                        state <= C_PIXEL_START;
                    end
                    else begin
                        addr <= 10'd13;
                        dinb <= 32'd1025;
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
