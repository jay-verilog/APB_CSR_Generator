//----------------------------------------------------------------------
// spi Register Map - Auto-generated Verilog Defines
//----------------------------------------------------------------------

`define SPI_DATA_WIDTH   8
`define SPI_ADDR_WIDTH   3
`define SPI_REG_WIDTH    8

//----------------------------------------------------------------------
// Extra port widths
//----------------------------------------------------------------------
// === AUTOGEN:BEGIN DEFINES_EXTRA_WIDTHS ===
`define SPI_SPPR_O_WIDTH        3
`define SPI_SPR_O_WIDTH         3
`define SPI_SPI_MODE_O_WIDTH    2
// === AUTOGEN:END DEFINES_EXTRA_WIDTHS ===

//----------------------------------------------------------------------
// Registers
//----------------------------------------------------------------------
// === AUTOGEN:BEGIN DEFINES_REGISTERS ===
// Register Addresses
`define SPI_CONTROL_REGISTER1_ADDR     3'h0
`define SPI_CONTROL_REGISTER2_ADDR     3'h1
`define SPI_BAUD_RATE_REGISTER_ADDR    3'h2
`define SPI_STATUS_REGISTER_ADDR       3'h3
`define SPI_DATA_REGISTER_ADDR         3'h4
`define SPI_WRDATA_ADDR                3'h4
`define SPI_RDDATA_ADDR                3'h4

// Register Reset Values
`define SPI_CONTROL_REGISTER1_RST     8'h04
`define SPI_CONTROL_REGISTER2_RST     8'h00
`define SPI_BAUD_RATE_REGISTER_RST    8'h00
`define SPI_STATUS_REGISTER_RST       8'h20
`define SPI_DATA_REGISTER_RST         8'h00
`define SPI_WRDATA_RST                8'h00
`define SPI_RDDATA_RST                8'h00

// Field Bit Positions
// --- SPI_CONTROL_REGISTER1 ---
`define SPI_CONTROL_REGISTER1_SPIE_POS     3'h7
`define SPI_CONTROL_REGISTER1_SPE_POS      3'h6
`define SPI_CONTROL_REGISTER1_SPTIE_POS    3'h5
`define SPI_CONTROL_REGISTER1_MSTR_POS     3'h4
`define SPI_CONTROL_REGISTER1_CPOL_POS     3'h3
`define SPI_CONTROL_REGISTER1_CPHA_POS     3'h2
`define SPI_CONTROL_REGISTER1_SSOE_POS     3'h1
`define SPI_CONTROL_REGISTER1_LSBFE_POS    3'h0

// --- SPI_CONTROL_REGISTER2 ---
`define SPI_CONTROL_REGISTER2_MODFEN_POS     3'h4
`define SPI_CONTROL_REGISTER2_BIDIROE_POS    3'h3
`define SPI_CONTROL_REGISTER2_SPISWAI_POS    3'h1
`define SPI_CONTROL_REGISTER2_SPC0_POS       3'h0

// --- SPI_BAUD_RATE_REGISTER ---
`define SPI_BAUD_RATE_REGISTER_SPPR2_POS    3'h6
`define SPI_BAUD_RATE_REGISTER_SPPR1_POS    3'h5
`define SPI_BAUD_RATE_REGISTER_SPPR0_POS    3'h4
`define SPI_BAUD_RATE_REGISTER_SPR2_POS     3'h2
`define SPI_BAUD_RATE_REGISTER_SPR1_POS     3'h1
`define SPI_BAUD_RATE_REGISTER_SPR0_POS     3'h0

// --- SPI_STATUS_REGISTER ---
`define SPI_STATUS_REGISTER_SPIF_POS     3'h7
`define SPI_STATUS_REGISTER_SPTEF_POS    3'h5
`define SPI_STATUS_REGISTER_MODF_POS     3'h4

// --- SPI_DATA_REGISTER ---
`define SPI_DATA_REGISTER_BIT7_POS    3'h7
`define SPI_DATA_REGISTER_BIT6_POS    3'h6
`define SPI_DATA_REGISTER_BIT5_POS    3'h5
`define SPI_DATA_REGISTER_BIT4_POS    3'h4
`define SPI_DATA_REGISTER_BIT3_POS    3'h3
`define SPI_DATA_REGISTER_BIT2_POS    3'h2
`define SPI_DATA_REGISTER_BIT1_POS    3'h1
`define SPI_DATA_REGISTER_BIT0_POS    3'h0

// --- SPI_WRDATA ---
`define SPI_WRDATA_BIT7_POS    3'h7
`define SPI_WRDATA_BIT6_POS    3'h6
`define SPI_WRDATA_BIT5_POS    3'h5
`define SPI_WRDATA_BIT4_POS    3'h4
`define SPI_WRDATA_BIT3_POS    3'h3
`define SPI_WRDATA_BIT2_POS    3'h2
`define SPI_WRDATA_BIT1_POS    3'h1
`define SPI_WRDATA_BIT0_POS    3'h0

// --- SPI_RDDATA ---
`define SPI_RDDATA_BIT7_POS    3'h7
`define SPI_RDDATA_BIT6_POS    3'h6
`define SPI_RDDATA_BIT5_POS    3'h5
`define SPI_RDDATA_BIT4_POS    3'h4
`define SPI_RDDATA_BIT3_POS    3'h3
`define SPI_RDDATA_BIT2_POS    3'h2
`define SPI_RDDATA_BIT1_POS    3'h1
`define SPI_RDDATA_BIT0_POS    3'h0
// === AUTOGEN:END DEFINES_REGISTERS ===

