# Memory Setting

Source: `Memory_setting.pdf`

The PDF is a 5-page screenshot document for Vivado Block Memory Generator
settings. The `Other Options` and `Summary` tabs are not shown, so this file
records only the visible settings.

## Instruction_Memory

Component/module name: `Instruction_Memory`

### Basic

| Setting | Value |
|---|---|
| Interface Type | Native |
| Memory Type | Single Port ROM |
| Generate address interface with 32 bits | Unchecked |
| Common Clock | Unchecked / disabled |
| ECC Type | No ECC |
| Error Injection Pins | Unchecked |
| Error Injection Type | Single Bit Error Injection |
| Byte Write Enable | Unchecked / disabled |
| Byte Size (bits) | 9 |
| Algorithm | Minimum Area |
| Primitive | 8kx2 |

### Port A Options

| Setting | Value |
|---|---|
| Port A Width | 32 |
| Port A Depth | 1024 |
| Operating Mode | Write First |
| Enable Port Type | Always Enabled |
| Primitives Output Register | Unchecked |
| Core Output Register | Unchecked |
| RSTA Pin | Unchecked |
| Output Reset Value (Hex) | 0 |
| Reset Priority | CE (Latch or Register Enable) |
| Read Address Change A | Unchecked |

## Data_mem

### Basic

| Setting | Value |
|---|---|
| Component Name | Data_mem |
| Interface Type | Native |
| Memory Type | True Dual Port RAM |
| Generate address interface with 32 bits | Unchecked |
| Common Clock | Unchecked |
| ECC Type | No ECC |
| Error Injection Pins | Unchecked |
| Error Injection Type | Single Bit Error Injection |
| Byte Write Enable | Unchecked |
| Byte Size (bits) | 9 |
| Algorithm | Minimum Area |
| Primitive | 8kx2 |

### Port A Options

| Setting | Value |
|---|---|
| Write Width | 32 |
| Read Width | 32 |
| Write Depth | 1024 |
| Read Depth | 1024 |
| Operating Mode | Read First |
| Enable Port Type | Use ENA Pin |
| Primitives Output Register | Unchecked |
| Core Output Register | Unchecked |
| RSTA Pin | Unchecked |
| Output Reset Value (Hex) | 0 |
| Reset Priority | CE (Latch or Register Enable) |
| Read Address Change A | Unchecked |

### Port B Options

| Setting | Value |
|---|---|
| Write Width | 32 |
| Read Width | 32 |
| Write Depth | 1024 |
| Read Depth | 1024 |
| Operating Mode | Read First |
| Enable Port Type | Use ENB Pin |
| Primitives Output Register | Unchecked |
| Core Output Register | Unchecked |
| RSTB Pin | Unchecked |
| Output Reset Value (Hex) | 0 |
| Reset Priority | CE (Latch or Register Enable) |
| Read Address Change B | Unchecked |

## init_rom

### Basic

| Setting | Value |
|---|---|
| Component Name | init_rom |
| Interface Type | Native |
| Memory Type | Single Port ROM |
| Generate address interface with 32 bits | Unchecked |
| Common Clock | Unchecked / disabled |
| ECC Type | No ECC |
| Error Injection Pins | Unchecked |
| Error Injection Type | Single Bit Error Injection |
| Byte Write Enable | Unchecked / disabled |
| Byte Size (bits) | 9 |
| Algorithm | Minimum Area |
| Primitive | 8kx2 |

### Port A Options

| Setting | Value |
|---|---|
| Port A Width | 32 |
| Port A Depth | 10240 |
| Operating Mode | Write First |
| Enable Port Type | Use ENA Pin |
| Primitives Output Register | Unchecked |
| Core Output Register | Unchecked |
| RSTA Pin | Unchecked |
| Output Reset Value (Hex) | 0 |
| Reset Priority | CE (Latch or Register Enable) |
| Read Address Change A | Unchecked |

## golden_rom

### Basic

| Setting | Value |
|---|---|
| Component Name | golden_rom |
| Interface Type | Native |
| Memory Type | Single Port ROM |
| Generate address interface with 32 bits | Unchecked |
| Common Clock | Unchecked / disabled |
| ECC Type | No ECC |
| Error Injection Pins | Unchecked |
| Error Injection Type | Single Bit Error Injection |
| Byte Write Enable | Unchecked / disabled |
| Byte Size (bits) | 9 |
| Algorithm | Minimum Area |
| Primitive | 8kx2 |

### Port A Options

| Setting | Value |
|---|---|
| Port A Width | 32 |
| Port A Depth | 2156 |
| Operating Mode | Write First |
| Enable Port Type | Use ENA Pin |
| Primitives Output Register | Unchecked |
| Core Output Register | Unchecked |
| RSTA Pin | Unchecked |
| Output Reset Value (Hex) | 0 |
| Reset Priority | CE (Latch or Register Enable) |
| Read Address Change A | Unchecked |
