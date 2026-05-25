# RISCV_CNN.v Detailed Explanation

本文以目前 `v0.9.2` 的 `RISCV_CNN.v` 為準，說明整個設計的架構、各模組的責任、CNN datapath 的運作方式、用到的時間壓縮技巧，以及為了讓 post-synthesis / post-implementation timing simulation 穩定通過而採取的避錯方法。

## 目前版本定位

`RISCV_CNN.v` 是本專案的 DUT top RTL，整合三個主要部分：

| 區塊 | 檔案內位置 | 主要功能 |
|---|---:|---|
| `RISCV_CNN` top | `RISCV_CNN.v:3` | 串接 TA `test_circuit`、簡化 RISC-V CPU、CNN coprocessor、`Data_mem`；對齊 2026-05-24 TA update 的 `FPGA_clk` / `all_done` 介面 |
| `Simple_CPU` | `RISCV_CNN.v:120` | 執行 `Instruction_Memory` 內的 machine code，負責初始化 bias/start command 與控制流程 |
| `CNN` | `RISCV_CNN.v:278` | 透過 `Data_mem` port B 讀 feature/weight/bias，執行兩層 3x3 convolution，寫回結果與 done word |

目前正式驗證結果如下：

| 項目 | 結果 |
|---|---|
| RTL simulation | `score_bcd = 0100` |
| RTL `cycle_count` | `25746` |
| #5 post-impl timing simulation | `post_impl_score_bcd = 0100`、`FINALPROJECT_POST_IMPL_PASS` |
| Post-route timing | `WNS = 0.731 ns`、`TNS = 0.000 ns`、`WHS = 0.033 ns` |
| Official Area | `2154 + 1862 + 261 + 2 + 280*2 = 4839` |
| Processing Time | `25746 * 10 ns = 257460 ns` |
| PDF AT product | `1245848940` |

這個版本的優先目標是「clean post-implementation timing PASS」。早期版本曾使用更積極的 row-cache reuse 來壓低 cycle count，但該路徑在 post-impl timing netlist 會造成 CNN 中間資料 mismatch，因此此版停用該 fast path，換取穩定可交付的 timing-correct 結果。

## Top Module: RISCV_CNN

位置：`RISCV_CNN.v:3-118`

### 對外介面

```verilog
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
```

此 top module 直接對齊助教測試環境：

| Signal | 用途 |
|---|---|
| `FPGA_clk` | 系統 clock，專案 timing 以 10 ns clock 驗證；RTL 內部用 `wire clk = FPGA_clk` 維持原本 datapath 命名 |
| `rstn` | 外部 active-low reset |
| `tc` | testcase select |
| `mode` | test circuit 顯示/模式控制 |
| `st` | start button input，送給 TA test circuit |
| `seven_seg`, `anode` | test circuit 的七段顯示輸出 |
| `all_done` | 2026-05-24 TA update 新增輸出，用於 waveform 量測 simulation processing time |

### Reset Synchronizer

位置：`RISCV_CNN.v:30-48`

```verilog
reg rstn_sync0;
reg rstn_sync1;
assign test_rstn = rstn_sync1;
```

外部 `rstn` 是非同步 reset。此處使用兩級 register 將 release reset 的時刻同步到 `clk`：

1. `rstn` 拉低時，`rstn_sync0/rstn_sync1` 立即清為 0。
2. `rstn` 回到 1 後，`rstn_sync0` 先變 1，下一拍 `rstn_sync1` 才變 1。
3. `test_circuit` 使用 `test_rstn`，避免 reset release 邊界造成狀態機不穩。

這是典型的 reset deassertion synchronization。它不是用來加速，而是用來避免 reset release 落在 clock 邊界附近時引入不穩定行為。

### Start Event 偵測

位置：`RISCV_CNN.v:35-60`

```verilog
assign cnn_finish_event = cnn_done;
assign cnn_start_event = cpu_dmem_we && (cpu_dmem_addr == 10'd11) && !cpu_dmem_wdata[0];
```

助教要求 `Data_mem[11][0]` 是 active-high start control bit，而且 CPU 偵測到 start 後必須把這個 bit 清回 0。這個版本採用以下流程：

1. `test_circuit` 先把 testcase data 載入 `Data_mem`。
2. `Simple_CPU` 執行 `Instruction_Memory` 中的 machine code。
3. CPU 偵測並處理 `Data_mem[11][0]`，之後對 `Data_mem[11]` 寫回 bit0 = 0。
4. Top module 監看 CPU 對 address 11 的 write，而且寫入資料 bit0 為 0 時，產生 `cnn_start_event`。
5. `cnn_start_latched` 被設為 1，直到 system reset。

這個作法的重點是：CNN 不直接去輪詢 start bit，也不靠 testbench 特判；start protocol 由 CPU machine code 完成，符合「CPU 應清除 start bit」的要求。

### Finish Event 使用 Registered Done

位置：`RISCV_CNN.v:35`、`RISCV_CNN.v:100-101`

```verilog
assign cnn_finish_event = cnn_done;
```

早期曾考慮用「CNN 寫 `Data_mem[13]`」這類組合條件作為 finish event，但在 timing simulation 中，address/data/write-enable 可能因 net delay 在同一個時刻附近產生不一致觀察。現在改為使用 CNN 內部 register `done`：

| 作法 | 風險 |
|---|---|
| 用 combinational write-detect 當 finish | post-impl timing 下 write bus delay 可能造成誤判 |
| 用 registered `done` | 訊號在 clock edge 後穩定，test circuit 看見的是同步完成事件 |

這是 #5 post-impl timing 能 clean pass 的關鍵修正之一。

### Module Instantiation

Top module instantiates 四個主要元件：

| Instance | 位置 | 功能 |
|---|---:|---|
| `u_test_circuit` | `RISCV_CNN.v:62-80` | 助教測試電路，負責載入測資、監看 CPU/CNN 狀態、顯示分數 |
| `u_cpu` | `RISCV_CNN.v:82-90` | 執行 instruction memory 內的 RISC-V machine code |
| `u_cnn` | `RISCV_CNN.v:92-102` | CNN accelerator |
| `u_data_mem` | `RISCV_CNN.v:104-117` | true dual-port RAM，port A 給 test circuit/CPU，port B 給 CNN |

### Data_mem 雙埠使用方式

位置：`RISCV_CNN.v:104-117`

```verilog
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
```

依照 `MEMORY_SETTING.md`：

| Memory | Enable setting | RTL 對應 |
|---|---|---|
| `Instruction_Memory` | Always Enabled | instance 不接 `.ena` |
| `Data_mem` port A | Use ENA Pin | `.ena(1'b1)` |
| `Data_mem` port B | Use ENB Pin | `.enb(cnn_enb)` |

這裡保留 `Data_mem` 的 `.ena(1'b1)` 是正確的，因為 `Data_mem` 本來就要求 ENA pin。相反地，`Instruction_Memory` 不應再接 `.ena`，因為它必須是 Always Enabled。

## Simple_CPU

位置：`RISCV_CNN.v:120-276`

`Simple_CPU` 是一個很小的 multi-cycle RV32 CPU，只實作本專案 machine code 需要的 instruction subset。它的目的不是跑完整 RISC-V 程式，而是用 CPU 方式完成助教要求的 bias/start setup。

### 支援的指令

位置：`RISCV_CNN.v:199-249`

| Opcode | 指令類型 | 實作功能 |
|---|---|---|
| `0110011` | R-type | `add`, `sub` |
| `0010011` | I-type | `addi` |
| `0000011` | load | `lw` |
| `0100011` | store | `sw` |
| `1100011` | branch | `beq`, `blt` |
| default | unknown | 當作 NOP-like，`pc += 4` |

### Register File 與 x0 保護

位置：`RISCV_CNN.v:140`、`RISCV_CNN.v:273`

```verilog
reg [31:0] regs [0:31];
...
regs[0] <= 32'd0;
```

RISC-V 的 `x0` 永遠是 0。這份 CPU 在每個 cycle 結尾強制 `regs[0] <= 0`，並且在寫回時也檢查 `rd != 0`。

這能避免 machine code 中任何意外寫 x0 的情況污染後續計算，是一個低成本的 correctness guard。

### Instruction Fetch Timing 修正

位置：`RISCV_CNN.v:129-135`、`RISCV_CNN.v:185-197`

目前 fetch 流程是：

```text
S_FETCH_ADDR -> S_FETCH_WAIT -> S_FETCH_CAP -> S_DECODE
```

各 state 的責任：

| State | 功能 |
|---|---|
| `S_FETCH_ADDR` | 把 `pc[9:2]` 放到 `Instruction_Memory.addra` |
| `S_FETCH_WAIT` | 等 BRAM output 穩定 |
| `S_FETCH_CAP` | 將 `instr` capture 到 `instr_reg` |
| `S_DECODE` | 從 `instr_reg` decode opcode/rd/rs/imm |

關鍵技巧是 decode 不直接使用 `instr`，而是使用 registered 的 `instr_reg`：

```verilog
wire [6:0] opcode = instr_reg[6:0];
```

這樣做的原因：

1. `Instruction_Memory` 是 block memory IP，output 不是適合在同一 cycle 直接走完整 decode/execute 的短路徑。
2. post-synth/post-impl timing simulation 會把 BRAM 與 routing delay 模擬出來，直接 decode raw `instr` 容易產生邊界錯誤。
3. 多加 `S_FETCH_CAP` 會增加少量 cycle，但大幅降低 timing 風險。

這是 #3/#5 timing simulation 從不穩定到 clean pass 的核心修正之一。

### Load/Store Addressing

位置：`RISCV_CNN.v:158-159`、`RISCV_CNN.v:220-231`

RISC-V instruction 使用 byte address，但 `Data_mem` 是 32-bit word address。因此 CPU 會取 byte address 的 `[11:2]`：

```verilog
dmem_addr <= load_byte_addr[11:2];
dmem_addr <= store_byte_addr[11:2];
```

這個轉換很重要，因為助教 memory map 以 word index 表示，例如 `Data_mem[11]`、`Data_mem[12]`、`Data_mem[13]`。若忘記右移兩位，CPU 會讀寫錯位地址。

### Store 後清 bus

位置：`RISCV_CNN.v:263-266`

```verilog
S_STORE: begin
    dmem_addr <= 10'd0;
    dmem_wdata <= 32'd0;
    state <= S_FETCH_ADDR;
end
```

`dmem_we` 只在 `state == S_STORE` 時為 1。store 完後將 address/data 清回 0，可以避免 simulation wave 或 test circuit 觀察到舊資料長時間掛在 bus 上。

這不是功能上必要的最小實作，但有助於讓 write pulse 乾淨、行為容易判讀。

## CNN Module

位置：`RISCV_CNN.v:278-915`

CNN 是此檔案的主要 datapath。它使用 `Data_mem` port B 讀取資料、計算兩層 convolution、寫回 output，最後寫 done word 並 assert `done`。

### CNN Port

```verilog
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
```

| Signal | 方向 | 說明 |
|---|---|---|
| `start` | input | 由 top latch 後提供，表示 CPU 已清 start bit，可以開始 CNN |
| `doutb` | input | `Data_mem` port B read data |
| `web` | output reg | port B write enable，registered pulse |
| `enb` | output | port B enable，目前為 `rstn` |
| `dinb` | output reg | port B write data |
| `addr` | output reg | port B address |
| `done` | output reg | CNN 完成訊號，給 top/test circuit |

`web` 與 `done` 都是 register，這是為了避免 post-impl timing simulation 中以組合邏輯偵測完成或寫入時出現 race。

### Data_mem Layout

CNN 假設 `Data_mem` 內資料配置如下：

| Word address | 內容 |
|---:|---|
| `0` 到 `5` | 18 個 8-bit signed weights，四個一包，最後 word 只取高 byte |
| `11` | start command word，由 CPU 偵測並清 bit0 |
| `12` | fmap size/config，CNN 使用 `doutb[6:1]` |
| `13` | done/status word，CNN 完成後寫 `32'd1025` |
| `14` | layer 0 bias，取 `doutb[7:0]` |
| `15` | layer 1 bias，取 `doutb[7:0]` |
| `16` 起 | input feature map |
| `272` 起 | layer 0 output，也作為 layer 1 input |
| `512` 起 | final output |

每個 32-bit word 打包 4 個 signed int8 feature/output value：

| Lane | Bits |
|---:|---|
| 0 | `[31:24]` |
| 1 | `[23:16]` |
| 2 | `[15:8]` |
| 3 | `[7:0]` |

### State Machine Overview

位置：`RISCV_CNN.v:289-317`、`RISCV_CNN.v:554-912`

主要 FSM 可分成五段：

| 階段 | State | 功能 |
|---|---|---|
| idle/start | `C_IDLE`, `C_CLEAR_CMD` | 等待 top latched start |
| load config | `C_LOAD_CFG_*`, `C_LOAD_B0_*`, `C_LOAD_B1_*`, `C_LOAD_W_*` | 讀 fmap size、bias、weights |
| per-pixel compute | `C_PIXEL_START`, `C_ROW_*`, `C_MAC`, `C_ACCUM_ROW`, `C_FINISH_PIXEL` | 計算一個 output pixel |
| write/advance | `C_WRITE_OUT`, `C_LAYER_NEXT` | 寫回 packed output，切換 layer |
| done | `C_WRITE_DONE`, `C_FINISHED` | 寫 status word，assert `done` |

`C_POLL_WAIT` 與 `C_POLL_CHECK` 目前只保留 state 編號，active path 沒有進入。現在的 start 流程由 top-level `cnn_start_latched` 負責，因此 CNN 不再自行 poll `Data_mem[11]`。

### BRAM Read Protocol

CNN 對 `Data_mem` port B 的所有 read 都採用 address/wait/capture 分離：

```text
ADDR -> WAIT -> CAP
```

例子：

```text
C_LOAD_CFG_ADDR -> C_LOAD_CFG_WAIT -> C_LOAD_CFG_CAP
C_ROW_WAIT_A -> C_ROW_CAP_A
C_ROW_WAIT_B -> C_ROW_CAP_B
```

這個寫法比「address 改變同一 cycle 直接使用 `doutb`」慢一點，但對 Vivado BRAM IP timing simulation 更安全。post-impl netlist 會有實際 routing delay，等待一拍再 capture 能避免讀到舊資料或不穩定資料。

### Helper Functions

位置：`RISCV_CNN.v:391-541`

#### `lane_value`

`lane_value(word, lane)` 根據 lane 取出 32-bit word 中的 signed 8-bit value。

技巧：

| lane | 回傳 |
|---:|---|
| 0 | `word[31:24]` |
| 1 | `word[23:16]` |
| 2 | `word[15:8]` |
| 3 | `word[7:0]` |

這把 endian/lane 規則集中在一個 function，避免散在 FSM 裡重複寫 bit slicing。

#### `put_lane`

`put_lane(word, lane, value)` 將一個 8-bit output 放回 32-bit packed word 的指定 lane。

這用於 output packing。CNN 每算出一個 pixel 不一定馬上寫 memory，而是先放進 `pack_word`，集滿四個 lane 或遇到最後一個 pixel 才寫回。這能減少 memory write 次數。

#### `get_feature0/1/2`

每次 convolution row 需要連續三個 feature：

```text
feature[col + 0], feature[col + 1], feature[col + 2]
```

若 `col` 對應的 lane 是 0 或 1，三個 value 都在同一個 32-bit word 內。若 lane 是 2 或 3，第三個或第二個 value 會跨到下一個 word，因此 `get_feature1/2` 會視情況從 `word1` 取值。

這個 function 避免了常見錯誤：

| 問題 | 避免方式 |
|---|---|
| lane 2 時第三個 feature 跨 word | `get_feature2` 從 `word1[31:24]` 取 |
| lane 3 時第二、三個 feature 跨 word | `get_feature1/2` 從 `word1` 取 |
| 多處手寫 bit slicing 容易錯 | 集中在 function |

#### `round_sat_q12_to_q6`

位置：`RISCV_CNN.v:472-503`

CNN 乘法累加使用較寬的 signed accumulator。最後需要回到 signed int8 Q1.6，因此此 function 做兩件事：

1. `value >>> 6`：把乘法後的 fractional bits 縮回 Q1.6。
2. round-to-nearest-even：餘數小於 32 不進位，大於 32 進位，等於 32 時看 base parity。
3. saturation：結果限制在 `[-128, 127]`。

round-to-nearest-even 的好處是 half case 不會永遠往同一方向偏，能更貼近 golden result。

#### `selected_weight`

位置：`RISCV_CNN.v:532-541`

兩層 convolution 各有 9 個 3x3 weights，總共 18 個 signed int8 weights。

```verilog
idx = (layer_sel ? 5'd9 : 5'd0) + row_sel * 3 + col_sel;
```

這樣可以用同一套 compute FSM 跑 layer 0 和 layer 1，只透過 `layer` 決定 weight base index。

### Weight/Bias/Config Loading

位置：`RISCV_CNN.v:618-723`

CNN 開始後先讀：

1. `Data_mem[12]` 取得 `fmap_size`。
2. `Data_mem[14]` 取得 layer 0 bias。
3. `Data_mem[15]` 取得 layer 1 bias。
4. `Data_mem[0]` 到 `Data_mem[5]` 取得 18 個 weights。

Weights 以 4 bytes per word 打包。第 0 層使用 `weights[0:8]`，第 1 層使用 `weights[9:17]`。

此段使用 `load_idx` 依序讀 `addr = load_idx`，並在 `C_LOAD_W_CAP` 中 unpack 對應 bytes。

### Layer 設定

位置：`RISCV_CNN.v:704-718`、`RISCV_CNN.v:876-897`

Layer 0：

| 參數 | 值 |
|---|---|
| `layer` | `0` |
| `in_w` | `fmap_size` |
| `out_w` | `fmap_size - 2` |
| `base_in` | `16` |
| `base_out` | `272` |

Layer 1：

| 參數 | 值 |
|---|---|
| `layer` | `1` |
| `in_w` | `fmap_size - 2` |
| `out_w` | `fmap_size - 4` |
| `base_in` | `272` |
| `base_out` | `512` |

兩層都使用 valid 3x3 convolution，所以每過一層 width 會少 2。

### Per-Pixel Compute Flow

一個 output pixel 的計算流程如下：

```text
C_PIXEL_START
  -> C_ROW_WAIT_A / C_ROW_CAP_A
  -> optionally C_ROW_WAIT_B / C_ROW_CAP_B
  -> C_MAC
  -> C_ACCUM_ROW
  -> repeat for 3 kernel rows
  -> C_FINISH_PIXEL
```

#### `C_PIXEL_START`

位置：`RISCV_CNN.v:725-748`

此 state 做三件事：

1. 將 accumulator 初始化成 bias 左移 6 bits：

   ```verilog
   accum <= {{18{bias[7]}}, bias, 6'd0};
   ```

   因為 feature/weight 是 Q1.6，乘法後需要用較高 precision 累加。bias 也要對齊同樣的小數位。

2. 設定第一個 kernel row 的 address/lane。
3. 設定第一列 3 個 weights。

#### `C_ROW_CAP_A` 與 `C_ROW_CAP_B`

位置：`RISCV_CNN.v:764-782`

讀取目前 row 的 packed word：

| 條件 | 動作 |
|---|---|
| `req_lane < 2` | 三個 feature 都在 `word0`，不讀 `word1` |
| `req_lane >= 2` | 需要多讀下一個 word 到 `word1` |

這是減少 BRAM read 的小優化：只有真的跨 word 時才讀 B word。

#### `C_MAC`

位置：`RISCV_CNN.v:785-812`

```verilog
prod0_reg <= prod0_next;
prod1_reg <= prod1_next;
prod2_reg <= prod2_next;
```

`prod*_next` 是三個 `int8 * int8` 的乘法結果。這裡不直接把三個乘法結果加進 accumulator，而是先 register 起來。

這樣切開 timing path：

```text
原本可能的長路徑：
feature select -> multiply -> add three products -> add accumulator -> register

目前路徑：
cycle N: feature select -> multiply -> prod register
cycle N+1: prod register -> row_sum -> accumulator
```

代價是多 state，但 post-route timing 更容易過。

#### `C_ACCUM_ROW`

位置：`RISCV_CNN.v:814-831`

```verilog
accum <= acc_next;
```

每個 kernel row 會加三個 product。三列加完後，一個 3x3 convolution pixel 完成。

#### `C_FINISH_PIXEL`

位置：`RISCV_CNN.v:833-855`

此 state 做 rounding、saturation、packing，以及必要時寫回 memory：

| 條件 | 動作 |
|---|---|
| `flush_word == 0` | 把 output byte 放進 `pack_word`，繼續下一個 pixel |
| `flush_word == 1` | 把 `pack_finished_accum` 寫到 `Data_mem[base_out + out_index[11:2]]` |

`flush_word` 在兩種情況為 true：

1. `out_index[1:0] == 3`，表示已經集滿四個 output byte。
2. `last_pixel`，避免 output 總數不是 4 的倍數時最後殘留在 `pack_word`。

### Output Packing 降低 Memory Write 次數

CNN output 是 int8，但 `Data_mem` 寬度是 32-bit。若每個 output pixel 都寫一次 memory，會浪費 75% bandwidth。

目前做法：

```text
pixel 0 -> pack lane 0
pixel 1 -> pack lane 1
pixel 2 -> pack lane 2
pixel 3 -> pack lane 3 -> write one 32-bit word
```

好處：

| 項目 | 影響 |
|---|---|
| memory write 次數 | 約降為 1/4 |
| write enable pulse | 較少，較容易觀察與驗證 |
| AT product | processing time 下降 |

這是保留下來的有效 cycle reduction 技巧之一。

### Layer Transition 與 Done

位置：`RISCV_CNN.v:876-907`

第一層算完後：

```verilog
layer <= 1'b1;
base_in <= 10'd272;
base_out <= 10'd512;
```

第二層算完後：

```verilog
addr <= 10'd13;
dinb <= 32'd1025;
web <= 1'b1;
state <= C_WRITE_DONE;
```

下一拍：

```verilog
done <= 1'b1;
state <= C_FINISHED;
```

這裡刻意讓「寫 status word」和「assert done」分成相鄰的 registered steps。這可以避免 test circuit 看到 done 時，memory write 還在 timing netlist 中尚未穩定。

## Time Reduction Techniques

此版本保留的時間壓縮方式如下。

### 1. 用 machine code 取代 RTL host setup

早期版本曾在 RTL 中加入 host-like state 去處理 bias/start。現在改由 `Instruction_Memory` 內的 machine code 讓 `Simple_CPU` 完成。

好處：

| 項目 | 說明 |
|---|---|
| 符合作業要求 | start bit 由 CPU 偵測並清回 0 |
| RTL top 較乾淨 | top 不再硬寫特定 testcase setup |
| 避免特判 | 不依 testcase number 走不同 RTL shortcut |

### 2. Output packing

四個 int8 output 合成一個 32-bit word 才寫回，減少 memory write cycles。

### 3. 跨 word 時才讀第二個 word

`req_lane < 2` 時，3 個 horizontal feature 都在同一 word，CNN 不讀 `word1`。只有 `req_lane >= 2` 才多讀下一個 word。

這是安全的小型 memory bandwidth optimization，因為它只依資料 lane 判斷，不依 testcase 或 golden result 判斷。

### 4. MAC 與 accumulation pipeline

把 multiply 和 accumulation 分成兩個 state，換取更好的 timing slack。

這不是直接減 cycle，但它避免為了追求低 cycle 而讓 WNS 變負。對最終 AT product 來說，timing 不通過的低 cycle 沒有意義。

### 5. 合併 finish/pack 流程

`C_FINISH_PIXEL` 同時處理 rounding、saturation、packing、是否 flush memory。這比每個動作拆成更多 state 更省 cycle。

### 6. 停用不穩定 row-cache reuse fast path

位置：`RISCV_CNN.v:385-388`

```verilog
wire first_cache_read_b = 1'b0;
wire first_cache_no_read = 1'b0;
wire next_cache_read_b = 1'b0;
wire next_cache_no_read = 1'b0;
```

`cache_word0/cache_word1/cache_lane/cache_valid` 仍存在，FSM 也仍會更新 cache register，但 reuse 判斷被固定為 false。因此目前實際執行時一定走穩定 BRAM read path。

這是 deliberate tradeoff：

| 版本方向 | cycle | post-impl timing correctness |
|---|---:|---|
| row-cache reuse enabled | 較快 | focused post-impl 會出現 CNN mismatch |
| row-cache reuse disabled | `25746` | full #5 post-impl timing clean PASS |

停用 cache reuse 不是針對某個 testcase 特判，而是移除一條在 timing netlist 中不可靠的通用 fast path。

## Error Avoidance Techniques

### 1. 不修改 TA test circuit

此 RTL 不依賴修改 `助教給的檔案/test_circuit_bram_ip.v`。Top module 只使用 TA test circuit 提供的正式 interface：

```verilog
.mem_addr(...)
.mem_wdata(...)
.mem_rdata(...)
.mem_we(...)
.cpu_addr(...)
.cpu_wdata(...)
.cpu_rdata(...)
.cpu_we(...)
.system_done(...)
```

這避免了「改 testbench 才 pass」的問題。

### 2. 不用 testcase 特判

CNN datapath 不使用 `tc` 判斷結果，也不針對特定 testcase 直接寫答案。`tc` 只進入 `test_circuit`，DUT 內的 CPU/CNN 只看 memory data。

### 3. BRAM output 一律 wait/capture

CPU instruction fetch 與 CNN data read 都用 wait/capture state，避免 post-synth/post-impl timing simulation 中直接使用尚未穩定的 BRAM output。

### 4. `web` 是 registered pulse

位置：`RISCV_CNN.v:599`、`RISCV_CNN.v:833-837`、`RISCV_CNN.v:893-896`

```verilog
web <= 1'b0;
...
web <= 1'b1;
```

每個 clock cycle 預設把 `web` 清成 0，只有真正寫 memory 的 state 才 pulse 1。這避免了 write enable 長時間保持或組合邏輯 glitch。

### 5. `done` 是 registered state

位置：`RISCV_CNN.v:900-907`

`done` 只在 `C_WRITE_DONE` 後 assert，並在 `C_FINISHED` 保持。Top module 再將 `cnn_done` 送給 test circuit。

這讓 finish protocol 不依賴 write bus 的 instantaneous value。

### 6. Word boundary 集中處理

跨 32-bit word 的 feature extraction 只在 `get_feature1/2` 中處理，避免在 FSM 各處分散寫 lane 判斷。

這能降低 off-by-one、byte lane endian、row boundary 等錯誤。

### 7. Row boundary 清 cache valid

雖然目前 cache reuse 被停用，FSM 仍在 row/layer boundary 清 `cache_valid`：

```verilog
cache_valid <= 3'd0;
```

這保留了安全邏輯。如果之後要重新啟用 cache reuse，至少不會跨 row 或跨 layer 重用舊 word。

### 8. 移除 debug-only synthesis attributes

目前 `RISCV_CNN.v` 沒有使用 `(* keep_hierarchy = "yes", dont_touch = "true" *)` 這類 debug-only workaround。

這類 attribute 適合短期定位問題，但不適合作為正式修正，因為它會干擾 synthesis/implementation optimizer。正式版應靠 register boundary、FSM timing、memory protocol 修正問題。

## Memory Setting 對齊

此 RTL 必須配合 `MEMORY_SETTING.md`：

| IP | 設定要求 | RTL 注意事項 |
|---|---|---|
| `Instruction_Memory` | Single Port ROM, Always Enabled | `Simple_CPU` instance 不接 `.ena` |
| `Data_mem` | True Dual Port RAM, Use ENA/ENB Pin | Top instance 接 `.ena(1'b1)` 與 `.enb(cnn_enb)` |
| `init_rom`, `golden_rom` | TA/test circuit 用 | 不在 `RISCV_CNN.v` 內直接 instance |

若 GUI 重新產生 IP，要以 `MEMORY_SETTING.md` 為準。尤其 `Instruction_Memory` 若被建成有 ENA pin，但 RTL instance 沒有 `.ena`，Vivado elaborate 會失敗；若 RTL 強接 `.ena`，又會違反 Always Enabled 設定。

## 為什麼 post-impl timing 會比 RTL simulation 更容易錯

RTL simulation 通常把 register-to-register 或 memory output 視為理想化行為。Post-implementation timing simulation 則會包含：

| 差異 | 可能影響 |
|---|---|
| BRAM primitive delay | 同 cycle 讀取/使用資料可能讀到舊值或不穩定值 |
| routing delay | address/data/write-enable 不一定同時到達 |
| setup/hold timing check | EN、CLK、address 附近的轉換可能產生 warning 或 X |
| optimized net names | testbench 若讀內部階層，GUI timing elaborate 可能找不到 |

因此本檔案用以下方式收斂：

1. CPU fetch 加 `S_FETCH_CAP`。
2. CNN read 加 WAIT/CAP。
3. CNN write enable 改為 registered pulse。
4. Finish event 改用 registered `done`。
5. 停用 post-impl 不穩定的 row-cache reuse path。

## 修改這份 RTL 時的注意事項

若之後要繼續優化，建議遵守以下規則：

| 想改的地方 | 注意事項 |
|---|---|
| CPU fetch | 不要拿掉 `S_FETCH_CAP`，除非 #3/#5 timing 都重新驗證 |
| CNN memory read | 不要把 address 設定與 `doutb` 使用合併在同一 cycle |
| CNN `web` | 維持 registered one-cycle pulse |
| CNN `done` | 維持 registered done，不用 combinational write-detect |
| row-cache reuse | 若重新啟用，必須用 focused post-impl mismatch test 逐 testcase 驗證 |
| memory IP | 不要違反 `MEMORY_SETTING.md` |
| TA files/testcase/golden | 不要修改，也不要用 RTL 特判繞過 |

## 總結

`RISCV_CNN.v` 目前的設計重點不是追求最低 RTL cycle count，而是讓完整 Vivado flow 尤其 #5 post-implementation timing simulation 能 clean pass。

核心策略是：

1. 用 `Simple_CPU` 執行 machine code，讓 start/bias setup 符合作業規格。
2. CNN 以穩定的 BRAM wait/capture protocol 讀資料。
3. 用 registered `web` 與 `done` 避免 timing netlist 中的 bus race。
4. 保留 output packing、必要時才讀第二個 word、MAC/accumulation pipeline 等安全優化。
5. 捨棄 post-impl 不可靠的 row-cache reuse fast path，換取 `post_impl_score_bcd = 0100`。

因此此版雖然 AT product 不如 cache reuse 版本漂亮，但它是目前 clean post-impl timing PASS 的可交付版本。
