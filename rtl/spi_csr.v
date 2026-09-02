`include "spi_defines.v"

module spi_csr
(

input                                                      pclk,
input                                                      preset_n,
input                                                      psel_i,
input                                                      pwrite_i,
input                                                      penable_i,
input        [`SPI_ADDR_WIDTH-1:0]                         paddr_i,
input        [`SPI_DATA_WIDTH-1:0]                         pwdata_i,
output reg   [`SPI_DATA_WIDTH-1:0]                         prdata_o,
output reg                                                 pready_o,
output reg                                                 pslverr_o,
output                                                     spie_o,
output                                                     spe_o,
output                                                     sptie_o,
output                                                     mstr_o,
output                                                     cpol_o,
output                                                     cpha_o,
output                                                     ssoe_o,
output                                                     lsbfe_o,
output                                                     modfen_o,
output                                                     bidiroe_o,
output                                                     spiswai_o,
output                                                     spc0_o,
output       [`SPI_SPPR_O_WIDTH-1:0]                       sppr_o,
output       [`SPI_SPR_O_WIDTH-1:0]                        spr_o,
input                                                      spif_i,
input                                                      sptef_i,
input                                                      modf_i,
output       [`SPI_DATA_O_WIDTH-1:0]                       data_o
);

wire wr_enb;
wire rd_enb;
wire addr_valid;

localparam APB_IDLE   = 2'b00;
localparam APB_SETUP  = 2'b01;
localparam APB_ENABLE = 2'b10;

reg [1:0] apb_present_state;
reg [1:0] apb_next_state;

reg  [`SPI_REG_WIDTH-1:0] control_register1_reg;
reg  [`SPI_REG_WIDTH-1:0] control_register2_reg;
reg  [`SPI_REG_WIDTH-1:0] baud_rate_register_reg;
reg  [`SPI_REG_WIDTH-1:0] status_register_reg;
reg  [`SPI_REG_WIDTH-1:0] data_register_reg;

assign wr_enb = psel_i && penable_i && pwrite_i;
assign rd_enb = psel_i && penable_i && !pwrite_i;

assign addr_valid = ((paddr_i == `SPI_CONTROL_REGISTER1_ADDR) ||
                    (paddr_i == `SPI_CONTROL_REGISTER2_ADDR) ||
                    (paddr_i == `SPI_BAUD_RATE_REGISTER_ADDR) ||
                    (paddr_i == `SPI_STATUS_REGISTER_ADDR) ||
                    (paddr_i == `SPI_DATA_REGISTER_ADDR));

//----------------------------------------------------------------------
// APB state machine
//----------------------------------------------------------------------
always @(posedge pclk or negedge preset_n)
begin
   if (preset_n == 1'b0)
   begin
      apb_present_state <= APB_IDLE;
   end

   else
   begin
      apb_present_state <= apb_next_state;
   end
end

always @(*)
begin
// APB IDLE PHASE
   if (apb_present_state == APB_IDLE)
   begin
      if (!psel_i)
      begin
         apb_next_state = APB_IDLE;
      end

      else
      begin
         apb_next_state = APB_SETUP;
      end
   end
// APB SETUP PHASE
   else if (apb_present_state == APB_SETUP)
   begin
      if (psel_i && !penable_i)
      begin
         apb_next_state = APB_SETUP;
      end

      else if (psel_i && penable_i)
      begin
         apb_next_state = APB_ENABLE;
      end

      else
      begin
         apb_next_state = APB_IDLE;
      end
   end
// APB ENABLE PHASE
   else if (apb_present_state == APB_ENABLE)
   begin
      if (psel_i && penable_i)
      begin
         apb_next_state = APB_ENABLE;
      end

      else if (psel_i && !penable_i)
      begin
         apb_next_state = APB_SETUP;
      end

      else
      begin
         apb_next_state = APB_IDLE;
      end
   end
   
   else
   begin
      apb_next_state = APB_IDLE;
   end
end

always @(*)
begin
   if (apb_present_state == APB_ENABLE)
   begin
      pready_o = 1'b1;
   end

   else
   begin
      pready_o = 1'b0;
   end
end


always @(*)
begin
   if (apb_present_state == APB_ENABLE)
   begin
      pslverr_o = ~addr_valid;
   end

   else
   begin
      pslverr_o = 1'b0;
   end
end


//----------------------------------------------------------------------
// Register writes (APB -> reg)
//----------------------------------------------------------------------
always @(posedge pclk or negedge preset_n)
begin
   if (preset_n == 1'b0)
   begin
      control_register1_reg <= `SPI_CONTROL_REGISTER1_RST;
      control_register2_reg <= `SPI_CONTROL_REGISTER2_RST;
      baud_rate_register_reg <= `SPI_BAUD_RATE_REGISTER_RST;
      data_register_reg <= `SPI_DATA_REGISTER_RST;
   end
   
   else
   begin
      if (wr_enb)
      begin
         if (paddr_i == `SPI_CONTROL_REGISTER1_ADDR)
         begin
            control_register1_reg <= pwdata_i;
         end
         else if (paddr_i == `SPI_CONTROL_REGISTER2_ADDR)
         begin
            control_register2_reg <= pwdata_i;
         end
         else if (paddr_i == `SPI_BAUD_RATE_REGISTER_ADDR)
         begin
            baud_rate_register_reg <= pwdata_i;
         end
         else if (paddr_i == `SPI_DATA_REGISTER_ADDR)
         begin
            data_register_reg <= pwdata_i;
         end
      end
   end
end

//----------------------------------------------------------------------
// Read-only register  (inputs -> reg)
//----------------------------------------------------------------------
always @(*)
begin
   status_register_reg = {`SPI_REG_WIDTH{1'b0}};
   status_register_reg[`SPI_STATUS_REGISTER_SPIF_POS] = spif_i;
   status_register_reg[`SPI_STATUS_REGISTER_SPTEF_POS] = sptef_i;
   status_register_reg[`SPI_STATUS_REGISTER_MODF_POS] = modf_i;
end

//----------------------------------------------------------------------
// Register reads (reg -> APB)
//----------------------------------------------------------------------
always @(*)
begin
   if (rd_enb && (paddr_i == `SPI_CONTROL_REGISTER1_ADDR))
   begin
      prdata_o = control_register1_reg;
   end
   else if (rd_enb && (paddr_i == `SPI_CONTROL_REGISTER2_ADDR))
   begin
      prdata_o = control_register2_reg;
   end
   else if (rd_enb && (paddr_i == `SPI_BAUD_RATE_REGISTER_ADDR))
   begin
      prdata_o = baud_rate_register_reg;
   end
   else if (rd_enb && (paddr_i == `SPI_STATUS_REGISTER_ADDR))
   begin
      prdata_o = status_register_reg;
   end
   else if (rd_enb && (paddr_i == `SPI_DATA_REGISTER_ADDR))
   begin
      prdata_o = data_register_reg;
   end
   else
   begin
      prdata_o = {`SPI_DATA_WIDTH{1'b0}};
   end
end


//----------------------------------------------------------------------
// Field assignments
//----------------------------------------------------------------------
assign spie_o = control_register1_reg[`SPI_CONTROL_REGISTER1_SPIE_POS];
assign spe_o = control_register1_reg[`SPI_CONTROL_REGISTER1_SPE_POS];
assign sptie_o = control_register1_reg[`SPI_CONTROL_REGISTER1_SPTIE_POS];
assign mstr_o = control_register1_reg[`SPI_CONTROL_REGISTER1_MSTR_POS];
assign cpol_o = control_register1_reg[`SPI_CONTROL_REGISTER1_CPOL_POS];
assign cpha_o = control_register1_reg[`SPI_CONTROL_REGISTER1_CPHA_POS];
assign ssoe_o = control_register1_reg[`SPI_CONTROL_REGISTER1_SSOE_POS];
assign lsbfe_o = control_register1_reg[`SPI_CONTROL_REGISTER1_LSBFE_POS];
assign modfen_o = control_register2_reg[`SPI_CONTROL_REGISTER2_MODFEN_POS];
assign bidiroe_o = control_register2_reg[`SPI_CONTROL_REGISTER2_BIDIROE_POS];
assign spiswai_o = control_register2_reg[`SPI_CONTROL_REGISTER2_SPISWAI_POS];
assign spc0_o = control_register2_reg[`SPI_CONTROL_REGISTER2_SPC0_POS];
assign sppr_o = {baud_rate_register_reg[`SPI_BAUD_RATE_REGISTER_SPPR2_POS], baud_rate_register_reg[`SPI_BAUD_RATE_REGISTER_SPPR1_POS], baud_rate_register_reg[`SPI_BAUD_RATE_REGISTER_SPPR0_POS]};
assign spr_o = {baud_rate_register_reg[`SPI_BAUD_RATE_REGISTER_SPR2_POS], baud_rate_register_reg[`SPI_BAUD_RATE_REGISTER_SPR1_POS], baud_rate_register_reg[`SPI_BAUD_RATE_REGISTER_SPR0_POS]};
assign data_o = {data_register_reg[`SPI_DATA_REGISTER_DATA31_POS], data_register_reg[`SPI_DATA_REGISTER_DATA30_POS], data_register_reg[`SPI_DATA_REGISTER_DATA29_POS], data_register_reg[`SPI_DATA_REGISTER_DATA28_POS], data_register_reg[`SPI_DATA_REGISTER_DATA27_POS], data_register_reg[`SPI_DATA_REGISTER_DATA26_POS], data_register_reg[`SPI_DATA_REGISTER_DATA25_POS], data_register_reg[`SPI_DATA_REGISTER_DATA24_POS], data_register_reg[`SPI_DATA_REGISTER_DATA23_POS], data_register_reg[`SPI_DATA_REGISTER_DATA22_POS], data_register_reg[`SPI_DATA_REGISTER_DATA21_POS], data_register_reg[`SPI_DATA_REGISTER_DATA20_POS], data_register_reg[`SPI_DATA_REGISTER_DATA19_POS], data_register_reg[`SPI_DATA_REGISTER_DATA18_POS], data_register_reg[`SPI_DATA_REGISTER_DATA17_POS], data_register_reg[`SPI_DATA_REGISTER_DATA16_POS], data_register_reg[`SPI_DATA_REGISTER_DATA15_POS], data_register_reg[`SPI_DATA_REGISTER_DATA14_POS], data_register_reg[`SPI_DATA_REGISTER_DATA13_POS], data_register_reg[`SPI_DATA_REGISTER_DATA12_POS], data_register_reg[`SPI_DATA_REGISTER_DATA11_POS], data_register_reg[`SPI_DATA_REGISTER_DATA10_POS], data_register_reg[`SPI_DATA_REGISTER_DATA09_POS], data_register_reg[`SPI_DATA_REGISTER_DATA08_POS], data_register_reg[`SPI_DATA_REGISTER_DATA07_POS], data_register_reg[`SPI_DATA_REGISTER_DATA06_POS], data_register_reg[`SPI_DATA_REGISTER_DATA05_POS], data_register_reg[`SPI_DATA_REGISTER_DATA04_POS], data_register_reg[`SPI_DATA_REGISTER_DATA03_POS], data_register_reg[`SPI_DATA_REGISTER_DATA02_POS], data_register_reg[`SPI_DATA_REGISTER_DATA01_POS], data_register_reg[`SPI_DATA_REGISTER_DATA00_POS]};

endmodule
