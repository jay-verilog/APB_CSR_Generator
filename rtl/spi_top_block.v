`include "spi_defines.v"

module spi_top_block
(

input                                                 pclk,
input                                                 preset_n,
input                                                 psel,
input                                                 pwrite,
input                                                 penable,
input   [`SPI_ADDR_WIDTH-1:0]                         paddr,
input   [`SPI_DATA_WIDTH-1:0]                         pwdata,
output  [`SPI_DATA_WIDTH-1:0]                         prdata,
output                                                pready,
output                                                pslvrr,
output                                                spie,
output                                                spe,
output                                                sptie,
output                                                mstr,
output                                                cpol,
output                                                cpha,
output                                                ssoe,
output                                                lsbfe,
output                                                modfen,
output                                                bidiroe,
output                                                spiswai,
output                                                spc0,
output  [`SPI_SPPR_O_WIDTH-1:0]                       sppr,
output  [`SPI_SPR_O_WIDTH-1:0]                        spr,
input                                                 spif,
input                                                 sptef,
input                                                 modf,
output  [`SPI_DATA_O_WIDTH-1:0]                       data
);

wire                                                  spie_w;
wire                                                  spe_w;
wire                                                  sptie_w;
wire                                                  mstr_w;
wire                                                  cpol_w;
wire                                                  cpha_w;
wire                                                  ssoe_w;
wire                                                  lsbfe_w;
wire                                                  modfen_w;
wire                                                  bidiroe_w;
wire                                                  spiswai_w;
wire                                                  spc0_w;
wire    [`SPI_SPPR_O_WIDTH-1:0]                       sppr_w;
wire    [`SPI_SPR_O_WIDTH-1:0]                        spr_w;
wire    [`SPI_DATA_O_WIDTH-1:0]                       data_w;


spi_csr    spi_csr_block
(
.pclk        (pclk),
.preset_n    (preset_n),
.psel_i      (psel),
.pwrite_i    (pwrite),
.penable_i   (penable),
.paddr_i     (paddr),
.pwdata_i    (pwdata),
.prdata_o    (prdata),
.pready_o    (pready),
.pslverr_o   (pslvrr),
.spie_o      (spie_w),
.spe_o       (spe_w),
.sptie_o     (sptie_w),
.mstr_o      (mstr_w),
.cpol_o      (cpol_w),
.cpha_o      (cpha_w),
.ssoe_o      (ssoe_w),
.lsbfe_o     (lsbfe_w),
.modfen_o    (modfen_w),
.bidiroe_o   (bidiroe_w),
.spiswai_o   (spiswai_w),
.spc0_o      (spc0_w),
.sppr_o      (sppr_w),
.spr_o       (spr_w),
.spif_i      (spif_w),
.sptef_i     (sptef_w),
.modf_i      (modf_w),
.data_o      (data_w)
);

endmodule
