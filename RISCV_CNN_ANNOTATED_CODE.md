# RISCV_CNN.v 中文註解版完整程式碼

這份文件保留 `RISCV_CNN.v` 的原始程式碼順序，並在 code block 內加入中文註解。註解只用於閱讀理解，不代表要把這份 markdown 直接拿去 synthesis；正式 RTL 仍以 [RISCV_CNN.v](RISCV_CNN.v) 為準。

```verilog
`timescale 1ns / 1ps

// ============================================================
// Top module: RISCV_CNN
// ------------------------------------------------------------
// 這是整個 final project 的最上層 DUT。
// 對外介面完全對齊 PDF 要求：
//   FPGA_clk, rstn, tc, mode, st, all_done, seven_seg, anode
//
// 內部整合：
//   1. TA 提供的 test_circuit
//   2. 自己實作的 Simple_CPU
//   3. 自己實作的 CNN coprocessor
//   4. Vivado Block Memory Generator 產生的 Data_mem
// ============================================================
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
    // 2026-05-24 TA update 將 top-level clock port 改為 FPGA_clk。
    // 內部仍使用 clk alias，避免大幅改動已驗證的 datapath。
    wire clk = FPGA_clk;

    // ------------------------------------------------------------
    // test_circuit 會產生 sys_rstn。
    // sys_rstn 是給 CPU/CNN 使用的系統 reset。
    // ------------------------------------------------------------
    wire sys_rstn;
    wire locked;

    // ------------------------------------------------------------
    // test_circuit 對 Data_mem port A 的控制訊號。
    // 初始化與結果檢查時，test_circuit 會透過 port A 存取 Data_mem。
    // ------------------------------------------------------------
    wire [9:0] tc_mem_addr;
    wire [31:0] tc_mem_wdata;
    wire [31:0] tc_cpu_rdata;
    wire tc_mem_we;

    // ------------------------------------------------------------
    // Simple_CPU 對 Data_mem port A 的觀察/控制訊號。
    // 注意：Data_mem port A 實際接的是 test_circuit 的 mem_addr/mem_we。
    // test_circuit 會在非初始化/非檢查階段 pass-through CPU 存取。
    // ------------------------------------------------------------
    wire cpu_dmem_en, cpu_dmem_we;
    wire [9:0] cpu_dmem_addr;
    wire [31:0] cpu_dmem_wdata;
    wire [31:0] cpu_dmem_rdata;

    // ------------------------------------------------------------
    // CNN coprocessor 使用 Data_mem port B。
    // port B 只給 CNN 使用，避免 CPU 和 CNN 搶同一個 memory port。
    // ------------------------------------------------------------
    wire cnn_enb, cnn_web, cnn_done;
    wire [9:0] cnn_addr;
    wire [31:0] cnn_dinb, cnn_doutb;
    
    // ------------------------------------------------------------
    // CNN start/finish 控制。
    // start event 由 CPU 寫 Data_mem[11] 且 bit0 清成 0 時產生。
    // finish event 使用 CNN registered done，避免 timing simulation 下
    // 直接用 write bus 偵測 done 造成 race。
    // ------------------------------------------------------------
    wire cnn_finish_event;
    wire cnn_start_event;
    reg rstn_sync0;
    reg rstn_sync1;
    reg cnn_start_latched;
    wire test_rstn;

    assign cnn_finish_event = cnn_done;
    assign cnn_start_event = cpu_dmem_we && (cpu_dmem_addr == 10'd11) && !cpu_dmem_wdata[0];
    assign test_rstn = rstn_sync1;

    // ------------------------------------------------------------
    // Reset synchronizer。
    // rstn 是外部 asynchronous active-low reset。
    // reset assert 時非同步清 0，reset release 時用兩級 FF 同步到 clk。
    // 這樣可以避免 test_circuit 在 reset release 邊界進入不穩狀態。
    // ------------------------------------------------------------
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

    // ------------------------------------------------------------
    // CNN start latch。
    // 當 CPU 完成 start bit clear 後，top latch 住 start request。
    // CNN 不直接 poll Data_mem[11]，而是等這個穩定的 start。
    // ------------------------------------------------------------
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
    
    // ------------------------------------------------------------
    // TA 提供的 test circuit。
    // 這份 RTL 不修改 test_circuit，也不靠 testbench 特判。
    // system_done 接 registered cnn_done，讓完成訊號在 timing sim 穩定。
    // all_done 是 2026-05-24 update 新增輸出，用於量測 simulation processing time。
    // ------------------------------------------------------------
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

    // ------------------------------------------------------------
    // 簡化版 multi-cycle RV32 CPU。
    // CPU 執行 Instruction_Memory 裡的 machine code：
    //   - 保留 TA CPU-check program
    //   - 追加 bias generation / start clear 程式
    // ------------------------------------------------------------
    Simple_CPU u_cpu(
        .CLK(clk),
        .RSTN(sys_rstn),
        .dmem_en(cpu_dmem_en),
        .dmem_we(cpu_dmem_we),
        .dmem_addr(cpu_dmem_addr),
        .dmem_wdata(cpu_dmem_wdata),
        .dmem_rdata(tc_cpu_rdata)
    );

    // ------------------------------------------------------------
    // CNN coprocessor。
    // 使用 Data_mem port B 自主讀 input/weight/bias，計算後寫 output。
    // ------------------------------------------------------------
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

    // ------------------------------------------------------------
    // Shared Data Memory。
    // 依 MEMORY_SETTING.md：
    //   Data_mem 是 True Dual Port RAM
    //   Port A/B 都使用 enable pin
    //
    // 所以 .ena(1'b1) 是正確的。
    // 注意這和 Instruction_Memory 不同；
    // Instruction_Memory 是 Always Enabled，不應接 .ena。
    // ------------------------------------------------------------
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

// ============================================================
// Simple_CPU
// ------------------------------------------------------------
// 這是一個專案需求導向的 multi-cycle RV32 CPU。
// 支援指令：
//   add, sub, addi, lw, sw, beq, blt
//
// 設計重點：
//   1. PC 仍依 RISC-V byte addressing，每次 +4。
//   2. Instruction_Memory 以 word index 存 instruction，
//      因此 fetch address 使用 pc[9:2]。
//   3. Instruction fetch 多加 S_FETCH_CAP，把 BRAM output
//      capture 到 instr_reg 後再 decode，避免 timing sim 出錯。
// ============================================================
module Simple_CPU(
    input         CLK,
    input         RSTN,
    output        dmem_en,
    output        dmem_we,
    output reg [9:0]  dmem_addr,
    output reg [31:0] dmem_wdata,
    input      [31:0] dmem_rdata
);
    // ------------------------------------------------------------
    // CPU FSM state。
    // S_FETCH_CAP 是 timing 修正重點：
    //   S_FETCH_ADDR 設 imem address
    //   S_FETCH_WAIT 等 BRAM output
    //   S_FETCH_CAP capture instruction
    //   S_DECODE 才 decode/execute
    // ------------------------------------------------------------
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

    // ------------------------------------------------------------
    // Instruction decode wires。
    // 全部從 instr_reg decode，而不是直接從 instr decode。
    // 這樣可以把 Instruction_Memory output 的 timing path 切開。
    // ------------------------------------------------------------
    wire [31:0] instr;
    wire [6:0] opcode = instr_reg[6:0];
    wire [4:0] rd     = instr_reg[11:7];
    wire [2:0] funct3 = instr_reg[14:12];
    wire [4:0] rs1    = instr_reg[19:15];
    wire [4:0] rs2    = instr_reg[24:20];
    wire [6:0] funct7 = instr_reg[31:25];

    // ------------------------------------------------------------
    // Immediate generation。
    // imm_i: addi/lw
    // imm_s: sw
    // imm_b: beq/blt，最低 bit 為 0，符合 branch offset encoding。
    // ------------------------------------------------------------
    wire signed [31:0] imm_i = {{20{instr_reg[31]}}, instr_reg[31:20]};
    wire signed [31:0] imm_s = {{20{instr_reg[31]}}, instr_reg[31:25], instr_reg[11:7]};
    wire signed [31:0] imm_b = {{19{instr_reg[31]}}, instr_reg[31], instr_reg[7],
                                instr_reg[30:25], instr_reg[11:8], 1'b0};

    // ------------------------------------------------------------
    // RISC-V 使用 byte address；Data_mem 是 32-bit word address。
    // 因此送到 memory 的 address 使用 [11:2]。
    // ------------------------------------------------------------
    wire [31:0] load_byte_addr  = regs[rs1] + imm_i;
    wire [31:0] store_byte_addr = regs[rs1] + imm_s;

    assign dmem_en = 1'b1;
    assign dmem_we = (state == S_STORE);

    // ------------------------------------------------------------
    // Instruction_Memory 依 PDF/MEMORY_SETTING.md 是 Always Enabled。
    // 因此 wrapper 只有 clka/addra/douta，沒有 ena。
    // ------------------------------------------------------------
    Instruction_Memory u_Instruction_Memory (
        .clka(CLK),
        .addra(imem_addr),
        .douta(instr)
    );

    always @(posedge CLK) begin
        if (!RSTN) begin
            // ----------------------------------------------------
            // Reset CPU architectural state。
            // ----------------------------------------------------
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
                    // ------------------------------------------------
                    // 設定 instruction memory address。
                    // PC 是 byte address，所以取 pc[9:2] 當 word index。
                    // ------------------------------------------------
                    imem_addr <= pc[9:2];
                    state <= S_FETCH_WAIT;
                end

                S_FETCH_WAIT: begin
                    // ------------------------------------------------
                    // 等待 Instruction_Memory douta 穩定。
                    // ------------------------------------------------
                    state <= S_FETCH_CAP;
                end

                S_FETCH_CAP: begin
                    // ------------------------------------------------
                    // 將 instruction capture 到 instr_reg。
                    // 這是 post-synth/post-impl timing 的重要修正。
                    // ------------------------------------------------
                    instr_reg <= instr;
                    state <= S_DECODE;
                end

                S_DECODE: begin
                    // ------------------------------------------------
                    // Multi-cycle CPU 在此 state 完成大多數 ALU/branch
                    // 指令；load/store 會進入額外 state 等 memory。
                    // ------------------------------------------------
                    case (opcode)
                        7'b0110011: begin
                            // R-type add/sub
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
                            // I-type addi
                            if (funct3 == 3'b000 && rd != 5'd0) begin
                                regs[rd] <= regs[rs1] + imm_i;
                            end
                            pc <= pc + 32'd4;
                            state <= S_FETCH_ADDR;
                        end

                        7'b0000011: begin
                            // lw：設定 Data_mem word address，下一拍等 data。
                            dmem_addr <= load_byte_addr[11:2];
                            load_rd <= rd;
                            pc <= pc + 32'd4;
                            state <= S_LOAD_WAIT;
                        end

                        7'b0100011: begin
                            // sw：設定 Data_mem word address/data，下一個
                            // S_STORE state 讓 dmem_we pulse high。
                            dmem_addr <= store_byte_addr[11:2];
                            dmem_wdata <= regs[rs2];
                            pc <= pc + 32'd4;
                            state <= S_STORE;
                        end

                        7'b1100011: begin
                            // branch：支援 beq 與 blt。
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
                            // 未支援 opcode 當作 NOP-like，避免 CPU 卡死。
                            pc <= pc + 32'd4;
                            state <= S_FETCH_ADDR;
                        end
                    endcase
                end

                S_LOAD_WAIT: begin
                    // ------------------------------------------------
                    // 等待 Data_mem read data 穩定。
                    // ------------------------------------------------
                    state <= S_LOAD_WB;
                end

                S_LOAD_WB: begin
                    // ------------------------------------------------
                    // load write-back。
                    // x0 不可被寫入。
                    // ------------------------------------------------
                    if (load_rd != 5'd0) begin
                        regs[load_rd] <= dmem_rdata;
                    end
                    state <= S_FETCH_ADDR;
                end

                S_STORE: begin
                    // ------------------------------------------------
                    // store 的 write enable 由 assign dmem_we 控制。
                    // 此 state 結束後清掉 address/data，讓 bus 乾淨。
                    // ------------------------------------------------
                    dmem_addr <= 10'd0;
                    dmem_wdata <= 32'd0;
                    state <= S_FETCH_ADDR;
                end

                default: begin
                    state <= S_FETCH_ADDR;
                end
            endcase
            // --------------------------------------------------------
            // RISC-V x0 永遠保持 0。
            // --------------------------------------------------------
            regs[0] <= 32'd0;
        end
    end
endmodule

// ============================================================
// CNN Coprocessor
// ------------------------------------------------------------
// 負責執行兩層 3x3 convolution。
//
// Memory layout 重點：
//   weights: Data_mem[0:5]
//   config:  Data_mem[12][6:1]
//   bias0:   Data_mem[14][7:0]
//   bias1:   Data_mem[15][7:0]
//   input:   Data_mem[16...]
//   layer0 output: Data_mem[272...]
//   final output:  Data_mem[512...]
//   done/status:   Data_mem[13] = 32'd1025
//
// 設計重點：
//   1. BRAM read 使用 ADDR -> WAIT -> CAP
//   2. web 是 registered one-cycle pulse
//   3. done 是 registered signal
//   4. output 用 4 個 int8 packing 成 1 個 32-bit word
//   5. row-cache reuse path 目前停用，換取 post-impl timing correctness
// ============================================================
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
    // ------------------------------------------------------------
    // CNN FSM state definitions。
    // C_POLL_WAIT/C_POLL_CHECK 是舊輪詢設計留下的 state 編號，
    // 目前 active flow 不會進入。
    // ------------------------------------------------------------
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

    // ------------------------------------------------------------
    // CNN 控制/資料暫存器。
    // weights 存兩層 3x3 kernel，共 18 個 signed int8。
    // ------------------------------------------------------------
    reg [5:0] state;
    reg [3:0] load_idx;
    reg signed [7:0] weights [0:17];
    reg signed [7:0] bias0;
    reg signed [7:0] bias1;

    // ------------------------------------------------------------
    // Layer 與 feature map 座標控制。
    // fmap_size 是原始 input feature map size。
    // in_w/out_w 是目前 layer 的 input/output width。
    // base_in/base_out 是目前 layer 的 memory base。
    // ------------------------------------------------------------
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

    // ------------------------------------------------------------
    // 目前要讀取的 packed word 與 lane。
    // word0 是主要 word；若 3 個連續 feature 跨 word，word1 存下一個 word。
    // ------------------------------------------------------------
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

    // ------------------------------------------------------------
    // Row-cache registers。
    // 早期版本用來重用相鄰 pixel 的 input word 以降低 cycle。
    // 目前 reuse path 停用，但保留 register 與清除邏輯。
    // ------------------------------------------------------------
    reg [31:0] cache_word0 [0:2];
    reg [31:0] cache_word1 [0:2];
    reg [1:0] cache_lane [0:2];
    reg [2:0] cache_valid;

    integer wi;
    integer ci;

    // ------------------------------------------------------------
    // Combinational datapath wires。
    // feature0/1/2 是一個 kernel row 對應的三個 input feature。
    // prod*_next 是三個 signed 8x8 乘法結果。
    // row_sum/acc_next 分開是為了切 timing path。
    // ------------------------------------------------------------
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

    // ------------------------------------------------------------
    // Address calculation。
    // row_base = row * in_w，由 FSM 每換 row 累加。
    // current_feature_index = row_base + krow*in_w + col。
    // word address = base + feature_index / 4。
    // lane = feature_index % 4。
    // ------------------------------------------------------------
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

    // ------------------------------------------------------------
    // Cache reuse fast path currently disabled。
    // 這是 post-impl timing correctness 修正：
    // 舊 cache reuse 在 timing netlist 會造成部分 testcase mismatch。
    // 固定為 0 表示永遠走穩定 BRAM read path。
    // ------------------------------------------------------------
    wire first_cache_read_b = 1'b0;
    wire first_cache_no_read = 1'b0;
    wire next_cache_read_b = 1'b0;
    wire next_cache_no_read = 1'b0;

    // Data_mem port B enable。reset 期間關閉，正常運作時打開。
    assign enb = rstn;

    // ------------------------------------------------------------
    // lane_value:
    // 從 32-bit packed word 中依 big-endian lane 取出 signed int8。
    // Figure 5 要求：
    //   lane0 = [31:24], lane1 = [23:16], lane2 = [15:8], lane3 = [7:0]
    // ------------------------------------------------------------
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

    // ------------------------------------------------------------
    // put_lane:
    // 將 signed int8 output 放回 32-bit packed word。
    // 用於 output feature map packing。
    // ------------------------------------------------------------
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

    // ------------------------------------------------------------
    // get_feature0/1/2:
    // 取出 convolution window 同一 row 的三個連續 feature。
    // 如果 req_lane 是 2 或 3，三個 feature 會跨到下一個 word，
    // 因此需要 word1。
    // ------------------------------------------------------------
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

    // ------------------------------------------------------------
    // cached_word*_for:
    // 舊 cache reuse path 的輔助 function。
    // 目前 cache hit wires 固定為 0，所以 active datapath 不使用。
    // ------------------------------------------------------------
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

    // ------------------------------------------------------------
    // round_sat_q12_to_q6:
    // 將高精度 convolution accumulator 轉回 signed int8 Q1.6。
    //
    // 流程：
    //   1. value >>> 6 取 base
    //   2. value[5:0] 判斷 fractional remainder
    //   3. round-to-nearest, ties-to-even
    //   4. saturation clamp 到 [-128, 127]
    // ------------------------------------------------------------
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

    // signed 8-bit multiply，結果放大到 signed 32-bit。
    function signed [31:0] mul8;
        input signed [7:0] a;
        input signed [7:0] b;
        begin
            mul8 = a * b;
        end
    endfunction

    // ------------------------------------------------------------
    // kernel_row_offset_for:
    // 回傳 kernel row 對應 input feature map 的 index offset。
    // row 0: 0
    // row 1: width
    // row 2: 2*width
    // ------------------------------------------------------------
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

    // 目前 raw_size 直接使用；保留 function 方便之後若規格改可集中處理。
    function [5:0] effective_fmap_size;
        input [5:0] raw_size;
        begin
            effective_fmap_size = raw_size;
        end
    endfunction

    // ------------------------------------------------------------
    // selected_weight:
    // layer 0 使用 weights[0:8]
    // layer 1 使用 weights[9:17]
    // row/col mapping 對齊 Figure 6 的 w00~w22。
    // ------------------------------------------------------------
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

    // ------------------------------------------------------------
    // Combinational datapath。
    // C_MAC 會 register prod*_next。
    // C_ACCUM_ROW 再把 row_sum 加進 accum。
    // 這樣把 multiply 和 accumulation 分拍，改善 timing。
    // ------------------------------------------------------------
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
            // ----------------------------------------------------
            // Reset CNN state/datapath。
            // ----------------------------------------------------
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
            // ----------------------------------------------------
            // web 預設每拍清 0。
            // 只有真正寫 Data_mem 的 state 才 pulse 1。
            // 這是 post-impl timing correctness 的重要修正。
            // ----------------------------------------------------
            web <= 1'b0;
            case (state)
                C_IDLE: begin
                    // ------------------------------------------------
                    // 等待 top-level latched start。
                    // start 為 1 後，CNN 進入資料載入流程。
                    // ------------------------------------------------
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
                    // ------------------------------------------------
                    // start bit 已由 CPU 清除，CNN 這裡只作為流程銜接。
                    // ------------------------------------------------
                    state <= C_LOAD_CFG_ADDR;
                end

                C_LOAD_CFG_ADDR: begin
                    // 讀 Data_mem[12]，其中 [6:1] 是 feature map size。
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
                    // 讀 bias0：Data_mem[14][7:0]。
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
                    // 讀 bias1：Data_mem[15][7:0]。
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
                    // 依序讀 Data_mem[0] 到 Data_mem[5] 的 packed weights。
                    addr <= {6'd0, load_idx};
                    state <= C_LOAD_W_WAIT;
                end

                C_LOAD_W_WAIT: begin
                    state <= C_LOAD_W_CAP;
                end

                C_LOAD_W_CAP: begin
                    // ------------------------------------------------
                    // Unpack weights。
                    // 每個 32-bit word 依 big-endian 拆成四個 signed int8。
                    // 第一層 weights[0:8]，第二層 weights[9:17]。
                    // ------------------------------------------------
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
                        // --------------------------------------------
                        // 所有 weights 載入完成，初始化 layer 0。
                        // layer 0:
                        //   input base  = 16
                        //   output base = 272
                        //   out_w = fmap_size - 2
                        // --------------------------------------------
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
                    // ------------------------------------------------
                    // 開始計算一個 output pixel。
                    // accum 先放 bias，並左移 6 bits 對齊 Q1.6 乘法後格式。
                    // ------------------------------------------------
                    accum <= {{18{(layer ? bias1[7] : bias0[7])}},
                              (layer ? bias1 : bias0), 6'd0};
                    krow <= 2'd0;
                    req_word_addr <= first_word_addr;
                    req_lane <= first_lane;
                    kernel0 <= selected_weight(layer, 2'd0, 2'd0);
                    kernel1 <= selected_weight(layer, 2'd0, 2'd1);
                    kernel2 <= selected_weight(layer, 2'd0, 2'd2);
                    if (first_cache_no_read) begin
                        // 目前不會進入，因 first_cache_no_read 固定為 0。
                        word0 <= cached_word0_for(first_lane, cache_word0[0], cache_word1[0]);
                        word1 <= cached_word1_for(first_lane, cache_word1[0]);
                        state <= C_MAC;
                    end
                    else if (first_cache_read_b) begin
                        // 目前不會進入，因 first_cache_read_b 固定為 0。
                        word0 <= cache_word0[0];
                        addr <= first_word_addr + 10'd1;
                        state <= C_ROW_WAIT_B;
                    end
                    else begin
                        // 穩定路徑：讀第一個 packed word。
                        addr <= first_word_addr;
                        state <= C_ROW_WAIT_A;
                    end
                end

                C_ROW_ADDR: begin
                    // ------------------------------------------------
                    // 舊 prefetch/row-read path 保留的 address state。
                    // 目前主要 row 轉移通常由 C_MAC/C_ACCUM_ROW 安排。
                    // ------------------------------------------------
                    req_word_addr <= current_word_addr;
                    req_lane <= current_lane;
                    kernel0 <= selected_weight(layer, krow, 2'd0);
                    kernel1 <= selected_weight(layer, krow, 2'd1);
                    kernel2 <= selected_weight(layer, krow, 2'd2);
                    addr <= current_word_addr;
                    state <= C_ROW_WAIT_A;
                end

                C_ROW_WAIT_A: begin
                    // 等 Data_mem port B doutb 穩定。
                    state <= C_ROW_CAP_A;
                end

                C_ROW_CAP_A: begin
                    // Capture word0。
                    // 若 lane >= 2，三個 feature 會跨 word，需要再讀 word1。
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
                    // 等第二個 packed word。
                    state <= C_ROW_CAP_B;
                end

                C_ROW_CAP_B: begin
                    // Capture word1。
                    word1 <= doutb;
                    state <= C_MAC;
                end

                C_MAC: begin
                    // ------------------------------------------------
                    // Register 三個乘法結果。
                    // 不在同一拍直接加進 accum，避免 timing path 太長。
                    // ------------------------------------------------
                    prod0_reg <= prod0_next;
                    prod1_reg <= prod1_next;
                    prod2_reg <= prod2_next;

                    // Cache register 仍更新，但 reuse path 已停用。
                    cache_word0[krow] <= word0;
                    cache_word1[krow] <= word1;
                    cache_lane[krow] <= req_lane;
                    cache_valid[krow] <= 1'b1;

                    if (krow != 2'd2) begin
                        // --------------------------------------------
                        // 預先準備下一個 kernel row 的 address/lane/weight。
                        // --------------------------------------------
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
                    // ------------------------------------------------
                    // 將上一拍 register 的三個 product 加進 accum。
                    // 每個 output pixel 需要三個 kernel row。
                    // ------------------------------------------------
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
                    // ------------------------------------------------
                    // 一個 output pixel 的 3x3 MAC 完成。
                    // 做 rounding/saturation，放進 pack_word。
                    // 若已滿 4 bytes 或最後一個 pixel，寫回 Data_mem。
                    // ------------------------------------------------
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
                    // ------------------------------------------------
                    // 前一拍已經 pulse web 寫出 packed output word。
                    // 這裡更新 row/col/out_index 或切換 layer。
                    // ------------------------------------------------
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
                        // --------------------------------------------
                        // layer 0 完成，切到 layer 1。
                        // layer 1:
                        //   input base  = 272
                        //   output base = 512
                        //   out_w = fmap_size - 4
                        // --------------------------------------------
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
                        // --------------------------------------------
                        // layer 1 完成。
                        // Data_mem[13] = 1025 = 0x00000401：
                        //   [10:1] = 512 output start position
                        //   [0]    = 1 finish bit
                        // web 是 registered pulse。
                        // --------------------------------------------
                        addr <= 10'd13;
                        dinb <= 32'd1025;
                        web <= 1'b1;
                        state <= C_WRITE_DONE;
                    end
                end

                C_WRITE_DONE: begin
                    // ------------------------------------------------
                    // status word 前一拍已寫出，這拍 assert registered done。
                    // Top module 將此 done 送給 test_circuit。
                    // ------------------------------------------------
                    done <= 1'b1;
                    state <= C_FINISHED;
                end

                C_FINISHED: begin
                    // 保持 done，直到下一次 sys_rstn/reset。
                    done <= 1'b1;
                end

                default: begin
                    state <= C_IDLE;
                end
            endcase
        end
    end
endmodule
```
