//----------------------------------------------------------------------
// SPI Top-level wrapper - auto-generated
//----------------------------------------------------------------------
`include "spi_defines.v"

module spi_top_block
(
input                        pclk,
input                        preset_n,
input                        psel_i,
input                        pwrite_i,
input                        penable_i,
input [`SPI_ADDR_WIDTH-1:0]  paddr_i,
input [`SPI_DATA_WIDTH-1:0]  pwdata_i,
output [`SPI_DATA_WIDTH-1:0] prdata_o,
output                       pready_o,
output                       pslverr_o,
input                        ss_in,
output                       spi_interrupt_request
);

// These are NOT top-level ports -- connect them to your datapath.
wire                             ss_i_w;
wire                             miso_data_i_w;
wire                             receive_data__w;
wire                             tip_i_w;
wire                             mstr_o_w;
wire                             cpol_o_w;
wire                             cpha_o_w;
wire                             lsbfe_o_w;
wire                             spiswai_o_w;
wire [`SPI_SPPR_O_WIDTH-1:0]     sppr_o_w;
wire [`SPI_SPR_O_WIDTH-1:0]      spr_o_w;
wire                             spi_interrupt_request_o_w;
wire                             send_data_o_w;
wire                             mosi_data_o_w;
wire [`SPI_SPI_MODE_O_WIDTH-1:0] spi_mode_o_w;
wire                             spe_o_w;

spi_apb_interface spi_apb_interface_block
(
.pclk                    (pclk),
.preset_n                (preset_n),
.psel_i                  (psel_i),
.pwrite_i                (pwrite_i),
.penable_i               (penable_i),
.paddr_i                 (paddr_i),
.pwdata_i                (pwdata_i),
.prdata_o                (prdata_o),
.pready_o                (pready_o),
.pslverr_o               (pslverr_o),
.ss_i                    (ss_i_w),
.miso_data_i             (miso_data_i_w),
.receive_data_           (receive_data__w),
.tip_i                   (tip_i_w),
.mstr_o                  (mstr_o_w),
.cpol_o                  (cpol_o_w),
.cpha_o                  (cpha_o_w),
.lsbfe_o                 (lsbfe_o_w),
.spiswai_o               (spiswai_o_w),
.sppr_o                  (sppr_o_w),
.spr_o                   (spr_o_w),
.spi_interrupt_request_o (spi_interrupt_request_o_w),
.send_data_o             (send_data_o_w),
.mosi_data_o             (mosi_data_o_w),
.spi_mode_o              (spi_mode_o_w),
.spe_o                   (spe_o_w)
);

// TODO: instantiate your datapath submodules here and connect

endmodule
