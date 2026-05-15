`timescale 1ns / 1ps

module RISCV_CNN (
    input  wire       clk,
    input  wire       rstn,
    input  wire [3:0] tc,
    input  wire       mode,
    input  wire       st,
    output wire [6:0] seven_seg,
    output wire [3:0] anode
);
    wire [9:0]  cpu_addr;
    wire [31:0] cpu_wdata;
    wire        cpu_we;
    wire [31:0] cpu_rdata;

    wire [9:0]  cnn_addr;
    wire [31:0] cnn_wdata;
    wire        cnn_we_raw;
    wire [31:0] cnn_rdata;
    wire        cnn_busy;
    wire        cnn_done;

    wire [9:0]  tester_addr;
    wire [31:0] tester_wdata;
    wire        tester_we;
    wire        tester_active;
    wire [15:0] tester_display;
    wire [1:0]  tester_phase;

    wire [9:0]  mem_a_addr;
    wire [31:0] mem_a_wdata;
    wire        mem_a_we;
    wire [31:0] mem_a_rdata;
    wire        core_rstn;

    function cpu_write_allowed;
        input [9:0] addr;
        begin
            cpu_write_allowed = (addr == 10'd6)  ||
                                (addr == 10'd7)  ||
                                (addr == 10'd12) ||
                                (addr == 10'd13) ||
                                (addr == 10'd14) ||
                                (addr == 10'd15);
        end
    endfunction

    function cnn_write_allowed;
        input [9:0] addr;
        begin
            cnn_write_allowed = (addr == 10'd6)  ||
                                (addr == 10'd7)  ||
                                (addr == 10'd13) ||
                                ((addr >= 10'd272) && (addr < 10'd960));
        end
    endfunction

    assign mem_a_addr  = tester_active ? tester_addr  : cpu_addr;
    assign mem_a_wdata = tester_active ? tester_wdata : cpu_wdata;
    assign mem_a_we    = tester_active ? tester_we    : (cpu_we && cpu_write_allowed(cpu_addr));
    assign cpu_rdata   = mem_a_rdata;
    assign core_rstn   = rstn & ~tester_active;

    shared_data_memory u_mem (
        .clk(clk),
        .a_addr(mem_a_addr),
        .a_wdata(mem_a_wdata),
        .a_we(mem_a_we),
        .a_rdata(mem_a_rdata),
        .b_addr(cnn_addr),
        .b_wdata(cnn_wdata),
        .b_we(cnn_we_raw && cnn_write_allowed(cnn_addr)),
        .b_rdata(cnn_rdata)
    );

    rv32_pipelined_cpu u_cpu (
        .clk(clk),
        .rstn(core_rstn),
        .dmem_addr(cpu_addr),
        .dmem_wdata(cpu_wdata),
        .dmem_we(cpu_we),
        .dmem_rdata(cpu_rdata)
    );

    cnn_coprocessor u_cnn (
        .clk(clk),
        .rstn(core_rstn),
        .mem_addr(cnn_addr),
        .mem_wdata(cnn_wdata),
        .mem_we(cnn_we_raw),
        .mem_rdata(cnn_rdata),
        .busy(cnn_busy),
        .done(cnn_done)
    );

    local_test_controller u_tester (
        .clk(clk),
        .rstn(rstn),
        .tc(tc),
        .st(st),
        .system_done(cnn_done),
        .mem_addr(tester_addr),
        .mem_wdata(tester_wdata),
        .mem_we(tester_we),
        .active(tester_active),
        .display_value(tester_display),
        .phase(tester_phase)
    );

    seven_segment_driver u_display (
        .clk(clk),
        .rstn(rstn),
        .mode(mode),
        .phase(tester_phase),
        .value(tester_display),
        .seven_seg(seven_seg),
        .anode(anode)
    );
endmodule

module shared_data_memory (
    input  wire        clk,
    input  wire [9:0]  a_addr,
    input  wire [31:0] a_wdata,
    input  wire        a_we,
    output reg  [31:0] a_rdata,
    input  wire [9:0]  b_addr,
    input  wire [31:0] b_wdata,
    input  wire        b_we,
    output reg  [31:0] b_rdata
);
    reg [31:0] mem [0:1023];
    integer i;

    initial begin
        for (i = 0; i < 1024; i = i + 1)
            mem[i] = 32'd0;
        a_rdata = 32'd0;
        b_rdata = 32'd0;
    end

    always @(posedge clk) begin
        if (a_we)
            mem[a_addr] <= a_wdata;
        a_rdata <= mem[a_addr];
    end

    always @(posedge clk) begin
        if (b_we)
            mem[b_addr] <= b_wdata;
        b_rdata <= mem[b_addr];
    end
endmodule

module rv32_multicycle_cpu (
    input  wire        clk,
    input  wire        rstn,
    output reg  [9:0]  dmem_addr,
    output reg  [31:0] dmem_wdata,
    output wire        dmem_we,
    input  wire [31:0] dmem_rdata
);
    localparam S_FETCH    = 3'd0;
    localparam S_DECODE   = 3'd1;
    localparam S_MEM_WAIT = 3'd2;
    localparam S_MEM_WB   = 3'd3;
    localparam S_MEM_WR   = 3'd4;

    reg [2:0]  state;
    reg [31:0] pc;
    reg [31:0] instr;
    reg [4:0]  load_rd;
    reg [31:0] regs [0:31];
    integer r;

    wire [31:0] imem_instr;
    wire [6:0]  opcode = instr[6:0];
    wire [4:0]  rd     = instr[11:7];
    wire [2:0]  funct3 = instr[14:12];
    wire [4:0]  rs1    = instr[19:15];
    wire [4:0]  rs2    = instr[24:20];
    wire [6:0]  funct7 = instr[31:25];

    wire signed [31:0] imm_i = {{20{instr[31]}}, instr[31:20]};
    wire signed [31:0] imm_s = {{20{instr[31]}}, instr[31:25], instr[11:7]};
    wire signed [31:0] imm_b = {{19{instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};
    wire [31:0] load_byte_addr = regs[rs1] + imm_i;
    wire [31:0] store_byte_addr = regs[rs1] + imm_s;

    riscv_instruction_rom u_rom (
        .addr(pc[9:2]),
        .instr(imem_instr)
    );

    assign dmem_we = (state == S_MEM_WR);

    always @(posedge clk) begin
        if (!rstn) begin
            state <= S_FETCH;
            pc <= 32'd0;
            instr <= 32'd0;
            load_rd <= 5'd0;
            dmem_addr <= 10'd0;
            dmem_wdata <= 32'd0;
            for (r = 0; r < 32; r = r + 1)
                regs[r] <= 32'd0;
        end else begin
            regs[0] <= 32'd0;
            case (state)
                S_FETCH: begin
                    instr <= imem_instr;
                    state <= S_DECODE;
                end

                S_DECODE: begin
                    case (opcode)
                        7'b0110011: begin
                            if (funct3 == 3'b000 && funct7 == 7'b0100000) begin
                                if (rd != 5'd0)
                                    regs[rd] <= regs[rs1] - regs[rs2];
                            end else if (funct3 == 3'b000 && funct7 == 7'b0000000) begin
                                if (rd != 5'd0)
                                    regs[rd] <= regs[rs1] + regs[rs2];
                            end
                            pc <= pc + 32'd4;
                            state <= S_FETCH;
                        end

                        7'b0010011: begin
                            if (funct3 == 3'b000 && rd != 5'd0)
                                regs[rd] <= regs[rs1] + imm_i;
                            pc <= pc + 32'd4;
                            state <= S_FETCH;
                        end

                        7'b0000011: begin
                            dmem_addr <= load_byte_addr[11:2];
                            load_rd <= rd;
                            pc <= pc + 32'd4;
                            state <= S_MEM_WAIT;
                        end

                        7'b0100011: begin
                            dmem_addr <= store_byte_addr[11:2];
                            dmem_wdata <= regs[rs2];
                            pc <= pc + 32'd4;
                            state <= S_MEM_WR;
                        end

                        7'b1100011: begin
                            if ((funct3 == 3'b000 && regs[rs1] == regs[rs2]) ||
                                (funct3 == 3'b100 && $signed(regs[rs1]) < $signed(regs[rs2])))
                                pc <= pc + imm_b;
                            else
                                pc <= pc + 32'd4;
                            state <= S_FETCH;
                        end

                        default: begin
                            pc <= pc + 32'd4;
                            state <= S_FETCH;
                        end
                    endcase
                end

                S_MEM_WAIT: begin
                    state <= S_MEM_WB;
                end

                S_MEM_WB: begin
                    if (load_rd != 5'd0)
                        regs[load_rd] <= dmem_rdata;
                    state <= S_FETCH;
                end

                S_MEM_WR: begin
                    state <= S_FETCH;
                end

                default: begin
                    state <= S_FETCH;
                end
            endcase
        end
    end
endmodule

module rv32_pipelined_cpu (
    input  wire        clk,
    input  wire        rstn,
    output wire [9:0]  dmem_addr,
    output wire [31:0] dmem_wdata,
    output wire        dmem_we,
    input  wire [31:0] dmem_rdata
);
    localparam ALU_ADD = 1'b0;
    localparam ALU_SUB = 1'b1;

    reg [31:0] pc;
    reg [31:0] regs [0:31];
    integer r;

    wire [31:0] imem_instr;
    riscv_instruction_rom u_rom (
        .addr(pc[9:2]),
        .instr(imem_instr)
    );

    reg        if_id_valid;
    reg [31:0] if_id_pc;
    reg [31:0] if_id_instr;

    reg        id_ex_valid;
    reg [31:0] id_ex_pc;
    reg [31:0] id_ex_rs1_value;
    reg [31:0] id_ex_rs2_value;
    reg [31:0] id_ex_imm;
    reg [4:0]  id_ex_rd;
    reg [2:0]  id_ex_funct3;
    reg        id_ex_alu_op;
    reg        id_ex_alu_src_imm;
    reg        id_ex_mem_read;
    reg        id_ex_mem_write;
    reg        id_ex_reg_write;
    reg        id_ex_branch;

    reg        ex_mem_valid;
    reg [31:0] ex_mem_alu_result;
    reg [4:0]  ex_mem_rd;
    reg        ex_mem_mem_read;
    reg        ex_mem_reg_write;

    reg        mem_wb_valid;
    reg [31:0] mem_wb_data;
    reg [4:0]  mem_wb_rd;
    reg        mem_wb_reg_write;

    wire [6:0] id_opcode = if_id_instr[6:0];
    wire [4:0] id_rd     = if_id_instr[11:7];
    wire [2:0] id_funct3 = if_id_instr[14:12];
    wire [4:0] id_rs1    = if_id_instr[19:15];
    wire [4:0] id_rs2    = if_id_instr[24:20];
    wire [6:0] id_funct7 = if_id_instr[31:25];

    wire signed [31:0] id_imm_i = {{20{if_id_instr[31]}}, if_id_instr[31:20]};
    wire signed [31:0] id_imm_s = {{20{if_id_instr[31]}}, if_id_instr[31:25], if_id_instr[11:7]};
    wire signed [31:0] id_imm_b = {{19{if_id_instr[31]}}, if_id_instr[31], if_id_instr[7], if_id_instr[30:25], if_id_instr[11:8], 1'b0};

    wire id_is_r      = (id_opcode == 7'b0110011) && (id_funct3 == 3'b000);
    wire id_is_addi   = (id_opcode == 7'b0010011) && (id_funct3 == 3'b000);
    wire id_is_lw     = (id_opcode == 7'b0000011) && (id_funct3 == 3'b010);
    wire id_is_sw     = (id_opcode == 7'b0100011) && (id_funct3 == 3'b010);
    wire id_is_branch = (id_opcode == 7'b1100011) && ((id_funct3 == 3'b000) || (id_funct3 == 3'b100));
    wire id_use_rs1   = if_id_valid && (id_is_r || id_is_addi || id_is_lw || id_is_sw || id_is_branch);
    wire id_use_rs2   = if_id_valid && (id_is_r || id_is_sw || id_is_branch);

    wire id_hazard_rs1 = id_use_rs1 && (id_rs1 != 5'd0) &&
                         ((id_ex_valid  && id_ex_reg_write  && (id_ex_rd  == id_rs1)) ||
                          (ex_mem_valid && ex_mem_reg_write && (ex_mem_rd == id_rs1)) ||
                          (mem_wb_valid && mem_wb_reg_write && (mem_wb_rd == id_rs1)));
    wire id_hazard_rs2 = id_use_rs2 && (id_rs2 != 5'd0) &&
                         ((id_ex_valid  && id_ex_reg_write  && (id_ex_rd  == id_rs2)) ||
                          (ex_mem_valid && ex_mem_reg_write && (ex_mem_rd == id_rs2)) ||
                          (mem_wb_valid && mem_wb_reg_write && (mem_wb_rd == id_rs2)));
    wire stall_decode = id_hazard_rs1 || id_hazard_rs2;

    wire [31:0] ex_operand_b = id_ex_alu_src_imm ? id_ex_imm : id_ex_rs2_value;
    wire [31:0] ex_alu_result = (id_ex_alu_op == ALU_SUB) ?
                                (id_ex_rs1_value - ex_operand_b) :
                                (id_ex_rs1_value + ex_operand_b);
    wire ex_branch_taken = id_ex_valid && id_ex_branch &&
                           (((id_ex_funct3 == 3'b000) && (id_ex_rs1_value == id_ex_rs2_value)) ||
                            ((id_ex_funct3 == 3'b100) && ($signed(id_ex_rs1_value) < $signed(id_ex_rs2_value))));
    wire [31:0] ex_branch_target = id_ex_pc + id_ex_imm;

    assign dmem_addr  = (id_ex_valid && (id_ex_mem_read || id_ex_mem_write)) ? ex_alu_result[11:2] : 10'd0;
    assign dmem_wdata = id_ex_rs2_value;
    assign dmem_we    = id_ex_valid && id_ex_mem_write;

    always @(posedge clk) begin
        if (!rstn) begin
            pc <= 32'd0;
            if_id_valid <= 1'b0;
            if_id_pc <= 32'd0;
            if_id_instr <= 32'h00000013;
            id_ex_valid <= 1'b0;
            id_ex_pc <= 32'd0;
            id_ex_rs1_value <= 32'd0;
            id_ex_rs2_value <= 32'd0;
            id_ex_imm <= 32'd0;
            id_ex_rd <= 5'd0;
            id_ex_funct3 <= 3'd0;
            id_ex_alu_op <= ALU_ADD;
            id_ex_alu_src_imm <= 1'b0;
            id_ex_mem_read <= 1'b0;
            id_ex_mem_write <= 1'b0;
            id_ex_reg_write <= 1'b0;
            id_ex_branch <= 1'b0;
            ex_mem_valid <= 1'b0;
            ex_mem_alu_result <= 32'd0;
            ex_mem_rd <= 5'd0;
            ex_mem_mem_read <= 1'b0;
            ex_mem_reg_write <= 1'b0;
            mem_wb_valid <= 1'b0;
            mem_wb_data <= 32'd0;
            mem_wb_rd <= 5'd0;
            mem_wb_reg_write <= 1'b0;
            for (r = 0; r < 32; r = r + 1)
                regs[r] <= 32'd0;
        end else begin
            if (mem_wb_valid && mem_wb_reg_write && (mem_wb_rd != 5'd0))
                regs[mem_wb_rd] <= mem_wb_data;
            regs[0] <= 32'd0;

            mem_wb_valid <= ex_mem_valid;
            mem_wb_rd <= ex_mem_rd;
            mem_wb_reg_write <= ex_mem_reg_write;
            mem_wb_data <= ex_mem_mem_read ? dmem_rdata : ex_mem_alu_result;

            ex_mem_valid <= id_ex_valid && !id_ex_branch;
            ex_mem_alu_result <= ex_alu_result;
            ex_mem_rd <= id_ex_rd;
            ex_mem_mem_read <= id_ex_mem_read;
            ex_mem_reg_write <= id_ex_reg_write;

            if (ex_branch_taken) begin
                pc <= ex_branch_target;
                if_id_valid <= 1'b0;
                id_ex_valid <= 1'b0;
            end else if (stall_decode) begin
                id_ex_valid <= 1'b0;
            end else begin
                if_id_valid <= 1'b1;
                if_id_pc <= pc;
                if_id_instr <= imem_instr;
                pc <= pc + 32'd4;

                id_ex_valid <= if_id_valid &&
                               (id_is_r || id_is_addi || id_is_lw || id_is_sw || id_is_branch);
                id_ex_pc <= if_id_pc;
                id_ex_rs1_value <= regs[id_rs1];
                id_ex_rs2_value <= regs[id_rs2];
                id_ex_rd <= id_rd;
                id_ex_funct3 <= id_funct3;
                id_ex_alu_op <= (id_is_r && (id_funct7 == 7'b0100000)) ? ALU_SUB : ALU_ADD;
                id_ex_alu_src_imm <= id_is_addi || id_is_lw || id_is_sw;
                id_ex_mem_read <= id_is_lw;
                id_ex_mem_write <= id_is_sw;
                id_ex_reg_write <= (id_is_r || id_is_addi || id_is_lw) && (id_rd != 5'd0);
                id_ex_branch <= id_is_branch;

                if (id_is_branch)
                    id_ex_imm <= id_imm_b;
                else if (id_is_sw)
                    id_ex_imm <= id_imm_s;
                else
                    id_ex_imm <= id_imm_i;
            end
        end
    end
endmodule

module riscv_instruction_rom (
    input  wire [7:0]  addr,
    output wire [31:0] instr
);
    reg [31:0] rom [0:255];
    integer i;

    function [31:0] rv_r;
        input [6:0] funct7;
        input [4:0] rs2;
        input [4:0] rs1;
        input [2:0] funct3;
        input [4:0] rd;
        begin
            rv_r = {funct7, rs2, rs1, funct3, rd, 7'b0110011};
        end
    endfunction

    function [31:0] rv_i;
        input integer imm;
        input [4:0] rs1;
        input [2:0] funct3;
        input [4:0] rd;
        input [6:0] opcode;
        reg [11:0] imm12;
        begin
            imm12 = imm[11:0];
            rv_i = {imm12, rs1, funct3, rd, opcode};
        end
    endfunction

    function [31:0] rv_s;
        input integer imm;
        input [4:0] rs2;
        input [4:0] rs1;
        input [2:0] funct3;
        reg [11:0] imm12;
        begin
            imm12 = imm[11:0];
            rv_s = {imm12[11:5], rs2, rs1, funct3, imm12[4:0], 7'b0100011};
        end
    endfunction

    function [31:0] rv_b;
        input integer imm;
        input [4:0] rs2;
        input [4:0] rs1;
        input [2:0] funct3;
        reg [12:0] imm13;
        begin
            imm13 = imm[12:0];
            rv_b = {imm13[12], imm13[10:5], rs2, rs1, funct3, imm13[4:1], imm13[11], 7'b1100011};
        end
    endfunction

    initial begin
        for (i = 0; i < 256; i = i + 1)
            rom[i] = 32'h00000013; // addi x0, x0, 0

        rom[0]  = rv_i(48,  5'd0, 3'b000, 5'd1, 7'b0010011); // addi x1, x0, 48
        rom[1]  = rv_i(0,   5'd1, 3'b010, 5'd2, 7'b0000011); // lw   x2, 0(x1)
        rom[2]  = rv_b(-8,  5'd0, 5'd2, 3'b000);             // beq  x2, x0, poll
        rom[3]  = rv_i(1,   5'd0, 3'b000, 5'd7, 7'b0010011); // addi x7, x0, 1
        rom[4]  = rv_r(7'b0100000, 5'd7, 5'd2, 3'b000, 5'd2);// sub  x2, x2, x7
        rom[5]  = rv_s(0,   5'd2, 5'd1, 3'b010);             // sw   x2, 0(x1)
        rom[6]  = rv_i(64,  5'd0, 3'b000, 5'd1, 7'b0010011); // addi x1, x0, 64
        rom[7]  = rv_i(0,   5'd1, 3'b010, 5'd2, 7'b0000011); // lw   x2, 0(x1)
        rom[8]  = rv_i(4,   5'd1, 3'b010, 5'd3, 7'b0000011); // lw   x3, 4(x1)
        rom[9]  = rv_i(8,   5'd1, 3'b010, 5'd4, 7'b0000011); // lw   x4, 8(x1)
        rom[10] = rv_r(7'b0000000, 5'd3, 5'd2, 3'b000, 5'd5);// add  x5, x2, x3
        rom[11] = rv_r(7'b0000000, 5'd4, 5'd5, 3'b000, 5'd5);// add  x5, x5, x4
        rom[12] = rv_s(56,  5'd5, 5'd0, 3'b010);             // sw   x5, 56(x0)
        rom[13] = rv_b(8,   5'd2, 5'd3, 3'b100);             // blt  x3, x2, T
        rom[14] = rv_r(7'b0000000, 5'd1, 5'd2, 3'b000, 5'd3);// add  x3, x2, x1
        rom[15] = rv_r(7'b0100000, 5'd3, 5'd2, 3'b000, 5'd4);// sub  x4, x2, x3
        rom[16] = rv_i(1,   5'd4, 3'b000, 5'd4, 7'b0010011); // addi x4, x4, 1
        rom[17] = rv_s(60,  5'd4, 5'd0, 3'b010);             // sw   x4, 60(x0)
        rom[18] = rv_i(1,   5'd0, 3'b000, 5'd6, 7'b0010011); // addi x6, x0, 1
        rom[19] = rv_s(24,  5'd6, 5'd0, 3'b010);             // sw   x6, 24(x0)
        rom[20] = rv_b(0,   5'd0, 5'd0, 3'b000);             // beq  x0, x0, idle
    end

    assign instr = rom[addr];
endmodule

module cnn_coprocessor (
    input  wire        clk,
    input  wire        rstn,
    output reg  [9:0]  mem_addr,
    output reg  [31:0] mem_wdata,
    output wire        mem_we,
    input  wire [31:0] mem_rdata,
    output reg         busy,
    output reg         done
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
    localparam C_FINISH_PIXEL  = 6'd27;
    localparam C_ACCUM_ROW     = 6'd28;

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
    reg [1:0] krow;
    reg [11:0] out_index;
    reg signed [31:0] accum;
    reg [31:0] pack_word;

    reg [11:0] req_index;
    reg [9:0]  req_word_addr;
    reg [1:0]  req_lane;
    reg [31:0] word0;
    reg [31:0] word1;
    reg signed [7:0] kernel0;
    reg signed [7:0] kernel1;
    reg signed [7:0] kernel2;
    reg signed [31:0] row_sum_reg;

    integer wi;

    wire signed [7:0] feature0;
    wire signed [7:0] feature1;
    wire signed [7:0] feature2;
    wire signed [31:0] row_sum;
    wire signed [31:0] acc_next;
    wire signed [7:0] rounded_accum;
    wire [31:0] pack_finished;
    wire [5:0] row_for_kernel = row + {4'd0, krow};
    wire [11:0] current_feature_index = ({6'd0, row_for_kernel} * {6'd0, in_w}) + {6'd0, col};
    wire [9:0] current_word_addr = base_in + current_feature_index[11:2];
    wire [1:0] current_lane = current_feature_index[1:0];
    wire last_pixel = (out_index == (total_pixels - 12'd1));
    wire flush_word = (out_index[1:0] == 2'd3) || last_pixel;

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
            if (lane == 2'd3)
                get_feature1 = lane_value(b, 2'd0);
            else
                get_feature1 = lane_value(a, lane + 2'd1);
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

    function signed [31:0] mul8;
        input signed [7:0] a;
        input signed [7:0] b;
        begin
            mul8 = a * b;
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
    assign row_sum = mul8(feature0, kernel0) +
                     mul8(feature1, kernel1) +
                     mul8(feature2, kernel2);
    assign acc_next = accum + row_sum_reg;
    assign rounded_accum = round_sat_q12_to_q6(accum);
    assign pack_finished = put_lane(pack_word, out_index[1:0], rounded_accum);
    assign mem_we = (state == C_CLEAR_CMD) || (state == C_WRITE_OUT) || (state == C_WRITE_DONE);

    always @(posedge clk) begin
        if (!rstn) begin
            state <= C_IDLE;
            mem_addr <= 10'd6;
            mem_wdata <= 32'd0;
            busy <= 1'b0;
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
            krow <= 2'd0;
            out_index <= 12'd0;
            accum <= 32'sd0;
            pack_word <= 32'd0;
            req_index <= 12'd0;
            req_word_addr <= 10'd0;
            req_lane <= 2'd0;
            word0 <= 32'd0;
            word1 <= 32'd0;
            kernel0 <= 8'sd0;
            kernel1 <= 8'sd0;
            kernel2 <= 8'sd0;
            row_sum_reg <= 32'sd0;
            bias0 <= 8'sd0;
            bias1 <= 8'sd0;
            for (wi = 0; wi < 18; wi = wi + 1)
                weights[wi] <= 8'sd0;
        end else begin
            case (state)
                C_IDLE: begin
                    mem_addr <= 10'd6;
                    mem_wdata <= 32'd0;
                    busy <= 1'b0;
                    done <= 1'b0;
                    state <= C_POLL_WAIT;
                end

                C_POLL_WAIT: begin
                    state <= C_POLL_CHECK;
                end

                C_POLL_CHECK: begin
                    if (mem_rdata[0]) begin
                        mem_addr <= 10'd6;
                        mem_wdata <= 32'd0;
                        busy <= 1'b1;
                        state <= C_CLEAR_CMD;
                    end else begin
                        mem_addr <= 10'd6;
                        state <= C_POLL_WAIT;
                    end
                end

                C_CLEAR_CMD: begin
                    state <= C_LOAD_CFG_ADDR;
                end

                C_LOAD_CFG_ADDR: begin
                    mem_addr <= 10'd12;
                    state <= C_LOAD_CFG_WAIT;
                end

                C_LOAD_CFG_WAIT: begin
                    state <= C_LOAD_CFG_CAP;
                end

                C_LOAD_CFG_CAP: begin
                    fmap_size <= mem_rdata[6:1];
                    state <= C_LOAD_B0_ADDR;
                end

                C_LOAD_B0_ADDR: begin
                    mem_addr <= 10'd14;
                    state <= C_LOAD_B0_WAIT;
                end

                C_LOAD_B0_WAIT: begin
                    state <= C_LOAD_B0_CAP;
                end

                C_LOAD_B0_CAP: begin
                    bias0 <= mem_rdata[7:0];
                    state <= C_LOAD_B1_ADDR;
                end

                C_LOAD_B1_ADDR: begin
                    mem_addr <= 10'd15;
                    state <= C_LOAD_B1_WAIT;
                end

                C_LOAD_B1_WAIT: begin
                    state <= C_LOAD_B1_CAP;
                end

                C_LOAD_B1_CAP: begin
                    bias1 <= mem_rdata[7:0];
                    load_idx <= 4'd0;
                    state <= C_LOAD_W_ADDR;
                end

                C_LOAD_W_ADDR: begin
                    mem_addr <= {6'd0, load_idx};
                    state <= C_LOAD_W_WAIT;
                end

                C_LOAD_W_WAIT: begin
                    state <= C_LOAD_W_CAP;
                end

                C_LOAD_W_CAP: begin
                    case (load_idx)
                        4'd0: begin
                            weights[0] <= mem_rdata[31:24];
                            weights[1] <= mem_rdata[23:16];
                            weights[2] <= mem_rdata[15:8];
                            weights[3] <= mem_rdata[7:0];
                        end
                        4'd1: begin
                            weights[4] <= mem_rdata[31:24];
                            weights[5] <= mem_rdata[23:16];
                            weights[6] <= mem_rdata[15:8];
                            weights[7] <= mem_rdata[7:0];
                        end
                        4'd2: begin
                            weights[8] <= mem_rdata[31:24];
                        end
                        4'd3: begin
                            weights[9]  <= mem_rdata[31:24];
                            weights[10] <= mem_rdata[23:16];
                            weights[11] <= mem_rdata[15:8];
                            weights[12] <= mem_rdata[7:0];
                        end
                        4'd4: begin
                            weights[13] <= mem_rdata[31:24];
                            weights[14] <= mem_rdata[23:16];
                            weights[15] <= mem_rdata[15:8];
                            weights[16] <= mem_rdata[7:0];
                        end
                        default: begin
                            weights[17] <= mem_rdata[31:24];
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
                        out_index <= 12'd0;
                        pack_word <= 32'd0;
                        state <= C_PIXEL_START;
                    end else begin
                        load_idx <= load_idx + 4'd1;
                        state <= C_LOAD_W_ADDR;
                    end
                end

                C_PIXEL_START: begin
                    accum <= {{18{(layer ? bias1[7] : bias0[7])}}, (layer ? bias1 : bias0), 6'd0};
                    krow <= 2'd0;
                    state <= C_ROW_ADDR;
                end

                C_ROW_ADDR: begin
                    req_index <= current_feature_index;
                    req_word_addr <= current_word_addr;
                    req_lane <= current_lane;
                    kernel0 <= selected_weight(layer, krow, 2'd0);
                    kernel1 <= selected_weight(layer, krow, 2'd1);
                    kernel2 <= selected_weight(layer, krow, 2'd2);
                    mem_addr <= current_word_addr;
                    state <= C_ROW_WAIT_A;
                end

                C_ROW_WAIT_A: begin
                    state <= C_ROW_CAP_A;
                end

                C_ROW_CAP_A: begin
                    word0 <= mem_rdata;
                    if (req_lane >= 2'd2) begin
                        mem_addr <= req_word_addr + 10'd1;
                        state <= C_ROW_WAIT_B;
                    end else begin
                        word1 <= 32'd0;
                        state <= C_MAC;
                    end
                end

                C_ROW_WAIT_B: begin
                    state <= C_ROW_CAP_B;
                end

                C_ROW_CAP_B: begin
                    word1 <= mem_rdata;
                    state <= C_MAC;
                end

                C_MAC: begin
                    row_sum_reg <= row_sum;
                    state <= C_ACCUM_ROW;
                end

                C_ACCUM_ROW: begin
                    accum <= acc_next;
                    if (krow == 2'd2) begin
                        state <= C_FINISH_PIXEL;
                    end else begin
                        krow <= krow + 2'd1;
                        state <= C_ROW_ADDR;
                    end
                end

                C_FINISH_PIXEL: begin
                    if (flush_word) begin
                        mem_addr <= base_out + out_index[11:2];
                        mem_wdata <= pack_finished;
                        pack_word <= 32'd0;
                        state <= C_WRITE_OUT;
                    end else begin
                        pack_word <= pack_finished;
                        if (col == out_w - 6'd1) begin
                            col <= 6'd0;
                            row <= row + 6'd1;
                        end else begin
                            col <= col + 6'd1;
                        end
                        out_index <= out_index + 12'd1;
                        state <= C_PIXEL_START;
                    end
                end

                C_WRITE_OUT: begin
                    if (last_pixel) begin
                        state <= C_LAYER_NEXT;
                    end else begin
                        if (col == out_w - 6'd1) begin
                            col <= 6'd0;
                            row <= row + 6'd1;
                        end else begin
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
                        out_index <= 12'd0;
                        pack_word <= 32'd0;
                        state <= C_PIXEL_START;
                    end else begin
                        mem_addr <= 10'd13;
                        mem_wdata <= 32'd1025; // (512 << 1) | 1
                        state <= C_WRITE_DONE;
                    end
                end

                C_WRITE_DONE: begin
                    done <= 1'b1;
                    busy <= 1'b0;
                    state <= C_FINISHED;
                end

                C_FINISHED: begin
                    done <= 1'b1;
                    busy <= 1'b0;
                end

                default: begin
                    state <= C_IDLE;
                end
            endcase
        end
    end
endmodule

module local_test_controller (
    input  wire       clk,
    input  wire       rstn,
    input  wire [3:0] tc,
    input  wire       st,
    input  wire       system_done,
    output reg  [9:0] mem_addr,
    output reg  [31:0] mem_wdata,
    output wire       mem_we,
    output wire       active,
    output reg  [15:0] display_value,
    output reg  [1:0]  phase
);
    localparam T_IDLE  = 3'd0;
    localparam T_INIT  = 3'd1;
    localparam T_START = 3'd2;
    localparam T_RUN   = 3'd3;
    localparam T_DONE  = 3'd4;

    reg [2:0] state;
    reg [9:0] init_addr;
    reg [3:0] tc_latched;
    reg [31:0] cycle_count;
    reg st_d0;
    reg st_d1;
    wire st_rise = st_d0 & ~st_d1;

    assign active = (state == T_INIT) || (state == T_START);
    assign mem_we = active;

    function [5:0] size_from_tc;
        input [3:0] tc_sel;
        begin
            case (tc_sel)
                4'd0: size_from_tc = 6'd10;
                4'd1: size_from_tc = 6'd11;
                4'd2: size_from_tc = 6'd12;
                4'd3: size_from_tc = 6'd16;
                4'd4: size_from_tc = 6'd20;
                4'd5: size_from_tc = 6'd24;
                4'd6: size_from_tc = 6'd28;
                4'd7: size_from_tc = 6'd31;
                4'd8: size_from_tc = 6'd32;
                4'd9: size_from_tc = 6'd13;
                4'd10: size_from_tc = 6'd15;
                4'd11: size_from_tc = 6'd18;
                4'd12: size_from_tc = 6'd21;
                4'd13: size_from_tc = 6'd25;
                4'd14: size_from_tc = 6'd29;
                default: size_from_tc = 6'd32;
            endcase
        end
    endfunction

    function [7:0] feature_byte;
        input [11:0] idx;
        input [3:0] tc_sel;
        reg [7:0] mixed;
        begin
            mixed = {2'b00, idx[5:0]} + {4'b0000, tc_sel} + {idx[3:0], 1'b0};
            feature_byte = mixed - 8'd32;
        end
    endfunction

    function [31:0] feature_word;
        input [9:0] addr;
        input [3:0] tc_sel;
        reg [11:0] base;
        begin
            base = ({2'd0, addr} - 12'd16) << 2;
            feature_word = {feature_byte(base, tc_sel),
                            feature_byte(base + 12'd1, tc_sel),
                            feature_byte(base + 12'd2, tc_sel),
                            feature_byte(base + 12'd3, tc_sel)};
        end
    endfunction

    function [31:0] init_word;
        input [9:0] addr;
        input [3:0] tc_sel;
        reg [5:0] n;
        begin
            n = size_from_tc(tc_sel);
            case (addr)
                10'd0: init_word = {8'sd16, -8'sd8, 8'sd4, 8'sd8};
                10'd1: init_word = {-8'sd4, 8'sd10, 8'sd6, -8'sd6};
                10'd2: init_word = {8'sd12, 24'd0};
                10'd3: init_word = {8'sd6, 8'sd4, -8'sd4, 8'sd8};
                10'd4: init_word = {-8'sd8, 8'sd12, 8'sd5, 8'sd3};
                10'd5: init_word = {-8'sd7, 24'd0};
                10'd6: init_word = 32'd0;
                10'd7: init_word = 32'd0;
                10'd12: init_word = {25'd0, n, 1'b0};
                10'd13: init_word = 32'd0;
                10'd14: init_word = 32'd0;
                10'd15: init_word = 32'd0;
                default: begin
                    if (addr >= 10'd16 && addr <= 10'd271)
                        init_word = feature_word(addr, tc_sel);
                    else
                        init_word = 32'd0;
                end
            endcase
        end
    endfunction

    always @(posedge clk) begin
        if (!rstn) begin
            state <= T_IDLE;
            init_addr <= 10'd0;
            tc_latched <= 4'd0;
            mem_addr <= 10'd0;
            mem_wdata <= 32'd0;
            cycle_count <= 32'd0;
            display_value <= 16'd0;
            phase <= 2'd0;
            st_d0 <= 1'b0;
            st_d1 <= 1'b0;
        end else begin
            st_d0 <= st;
            st_d1 <= st_d0;

            case (state)
                T_IDLE: begin
                    phase <= 2'd0;
                    display_value <= {12'd0, tc};
                    cycle_count <= 32'd0;
                    if (st_rise) begin
                        tc_latched <= tc;
                        init_addr <= 10'd0;
                        mem_addr <= 10'd0;
                        mem_wdata <= init_word(10'd0, tc);
                        state <= T_INIT;
                    end
                end

                T_INIT: begin
                    phase <= 2'd1;
                    if (init_addr == 10'd271) begin
                        mem_addr <= 10'd12;
                        mem_wdata <= {25'd0, size_from_tc(tc_latched), 1'b1};
                        state <= T_START;
                    end else begin
                        init_addr <= init_addr + 10'd1;
                        mem_addr <= init_addr + 10'd1;
                        mem_wdata <= init_word(init_addr + 10'd1, tc_latched);
                    end
                end

                T_START: begin
                    phase <= 2'd2;
                    cycle_count <= 32'd0;
                    state <= T_RUN;
                end

                T_RUN: begin
                    phase <= 2'd2;
                    cycle_count <= cycle_count + 32'd1;
                    display_value <= cycle_count[15:0];
                    if (system_done) begin
                        display_value <= cycle_count[15:0];
                        state <= T_DONE;
                    end
                end

                T_DONE: begin
                    phase <= 2'd3;
                    display_value <= cycle_count[15:0];
                end

                default: begin
                    state <= T_IDLE;
                end
            endcase
        end
    end
endmodule

module seven_segment_driver (
    input  wire       clk,
    input  wire       rstn,
    input  wire       mode,
    input  wire [1:0] phase,
    input  wire [15:0] value,
    output reg  [6:0] seven_seg,
    output reg  [3:0] anode
);
    reg [15:0] div;
    reg [3:0] nibble;
    reg [15:0] shown;

    function [6:0] hex_to_seg;
        input [3:0] h;
        begin
            case (h)
                4'h0: hex_to_seg = 7'b1111110;
                4'h1: hex_to_seg = 7'b0110000;
                4'h2: hex_to_seg = 7'b1101101;
                4'h3: hex_to_seg = 7'b1111001;
                4'h4: hex_to_seg = 7'b0110011;
                4'h5: hex_to_seg = 7'b1011011;
                4'h6: hex_to_seg = 7'b1011111;
                4'h7: hex_to_seg = 7'b1110000;
                4'h8: hex_to_seg = 7'b1111111;
                4'h9: hex_to_seg = 7'b1111011;
                4'hA: hex_to_seg = 7'b1110111;
                4'hB: hex_to_seg = 7'b0011111;
                4'hC: hex_to_seg = 7'b1001110;
                4'hD: hex_to_seg = 7'b0111101;
                4'hE: hex_to_seg = 7'b1001111;
                default: hex_to_seg = 7'b1000111;
            endcase
        end
    endfunction

    always @(posedge clk) begin
        if (!rstn)
            div <= 16'd0;
        else
            div <= div + 16'd1;
    end

    always @(*) begin
        if (mode)
            shown = {8'hCA, 4'd0, phase};
        else
            shown = value;

        case (div[15:14])
            2'd0: begin anode = 4'b0001; nibble = shown[15:12]; end
            2'd1: begin anode = 4'b0010; nibble = shown[11:8]; end
            2'd2: begin anode = 4'b0100; nibble = shown[7:4]; end
            default: begin anode = 4'b1000; nibble = shown[3:0]; end
        endcase
        seven_seg = hex_to_seg(nibble);
    end
endmodule
