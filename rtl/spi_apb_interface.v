//----------------------------------------------------------------------
// spi APB slave register interface - auto-generated
//----------------------------------------------------------------------
`include "spi_defines.v"

module spi_apb_interface
(
input                              pclk,
input                              preset_n,
input                              psel_i,
input                              pwrite_i,
input                              penable_i,
input [`SPI_ADDR_WIDTH-1:0]        paddr_i,
input [`SPI_DATA_WIDTH-1:0]        pwdata_i,
output reg [`SPI_DATA_WIDTH-1:0]   prdata_o,
output reg                         pready_o,
output reg                         pslverr_o,
input                              ss_i,
input                              miso_data_i,
input                              receive_data_,
input                              tip_i,
output                             mstr_o,
output                             cpol_o,
output                             cpha_o,
output                             lsbfe_o,
output                             spiswai_o,
output [`SPI_SPPR_O_WIDTH-1:0]     sppr_o,
output [`SPI_SPR_O_WIDTH-1:0]      spr_o,
output                             spi_interrupt_request_o,
output                             send_data_o,
output                             mosi_data_o,
output [`SPI_SPI_MODE_O_WIDTH-1:0] spi_mode_o,
output                             spe_o
);

wire wr_enb;
wire rd_enb;
wire addr_valid;

localparam APB_IDLE   = 2'b00;
localparam APB_SETUP  = 2'b01;
localparam APB_ENABLE = 2'b10;
reg [1:0] apb_present_state, apb_next_state;

// === AUTOGEN:BEGIN APB_REG_DECLS ===
reg [`SPI_REG_WIDTH-1:0] spi_control_register1_reg;
reg [`SPI_REG_WIDTH-1:0] spi_control_register2_reg;
reg [`SPI_REG_WIDTH-1:0] spi_baud_rate_register_reg;
reg [`SPI_REG_WIDTH-1:0] spi_status_register_reg;  // read-only over APB: drive from datapath logic below
reg [`SPI_REG_WIDTH-1:0] spi_data_register_reg;
reg [`SPI_REG_WIDTH-1:0] spi_wrdata_reg;
reg [`SPI_REG_WIDTH-1:0] spi_rddata_reg;
// === AUTOGEN:END APB_REG_DECLS ===

assign wr_enb = psel_i && penable_i && pwrite_i;
assign rd_enb = psel_i && penable_i && !pwrite_i;

// === AUTOGEN:BEGIN APB_ADDR_VALID ===
assign addr_valid = (paddr_i == `SPI_CONTROL_REGISTER1_ADDR) ||
                    (paddr_i == `SPI_CONTROL_REGISTER2_ADDR) ||
                    (paddr_i == `SPI_BAUD_RATE_REGISTER_ADDR) ||
                    (paddr_i == `SPI_STATUS_REGISTER_ADDR) ||
                    (paddr_i == `SPI_DATA_REGISTER_ADDR) ||
                    (paddr_i == `SPI_WRDATA_ADDR) ||
                    (paddr_i == `SPI_RDDATA_ADDR);
// === AUTOGEN:END APB_ADDR_VALID ===

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
      // === AUTOGEN:BEGIN APB_RESET_ASSIGNS ===
      spi_control_register1_reg <= `SPI_CONTROL_REGISTER1_RST;
      spi_control_register2_reg <= `SPI_CONTROL_REGISTER2_RST;
      spi_baud_rate_register_reg <= `SPI_BAUD_RATE_REGISTER_RST;
      spi_status_register_reg <= `SPI_STATUS_REGISTER_RST;
      spi_data_register_reg <= `SPI_DATA_REGISTER_RST;
      spi_wrdata_reg <= `SPI_WRDATA_RST;
      spi_rddata_reg <= `SPI_RDDATA_RST;
      // === AUTOGEN:END APB_RESET_ASSIGNS ===
   end
   
   else if (wr_enb)
   begin
      // === AUTOGEN:BEGIN APB_WRITE_DISPATCH ===
      if (paddr_i == `SPI_CONTROL_REGISTER1_ADDR)
      begin
         spi_control_register1_reg <= pwdata_i;
      end

      else if (paddr_i == `SPI_CONTROL_REGISTER2_ADDR)
      begin
         spi_control_register2_reg <= pwdata_i;
      end

      else if (paddr_i == `SPI_BAUD_RATE_REGISTER_ADDR)
      begin
         spi_baud_rate_register_reg <= pwdata_i;
      end

      else if (paddr_i == `SPI_DATA_REGISTER_ADDR)
      begin
         spi_data_register_reg <= pwdata_i;
      end

      else if (paddr_i == `SPI_WRDATA_ADDR)
      begin
         spi_wrdata_reg <= pwdata_i;
      end

      else if (paddr_i == `SPI_RDDATA_ADDR)
      begin
         spi_rddata_reg <= pwdata_i;
      end
      // === AUTOGEN:END APB_WRITE_DISPATCH ===
   end
end

//----------------------------------------------------------------------
// Register reads (reg -> APB)
//----------------------------------------------------------------------
always @(*)
begin
   if (rd_enb)
   begin
      // === AUTOGEN:BEGIN APB_READ_DISPATCH ===
      if (paddr_i == `SPI_CONTROL_REGISTER1_ADDR)
      begin
         prdata_o = spi_control_register1_reg;
      end

      else if (paddr_i == `SPI_CONTROL_REGISTER2_ADDR)
      begin
         prdata_o = spi_control_register2_reg;
      end

      else if (paddr_i == `SPI_BAUD_RATE_REGISTER_ADDR)
      begin
         prdata_o = spi_baud_rate_register_reg;
      end

      else if (paddr_i == `SPI_STATUS_REGISTER_ADDR)
      begin
         prdata_o = spi_status_register_reg;
      end

      else if (paddr_i == `SPI_DATA_REGISTER_ADDR)
      begin
         prdata_o = spi_data_register_reg;
      end

      else if (paddr_i == `SPI_WRDATA_ADDR)
      begin
         prdata_o = spi_wrdata_reg;
      end

      else if (paddr_i == `SPI_RDDATA_ADDR)
      begin
         prdata_o = spi_rddata_reg;
      end

      else
      begin
         prdata_o = {`SPI_DATA_WIDTH{1'b0}};
      end
      // === AUTOGEN:END APB_READ_DISPATCH ===
   end
   
   else
   begin
      prdata_o = {`SPI_DATA_WIDTH{1'b0}};
   end
end

//----------------------------------------------------------------------
// Status/read-only registers
//----------------------------------------------------------------------
//   assign spi_status_register_reg[`SPI_STATUS_REGISTER_SPIF_POS] = some_flag;

//----------------------------------------------------------------------
// Extra output wiring
//----------------------------------------------------------------------

// === AUTOGEN:BEGIN APB_EXTRA_OUTPUT_WIRING ===
assign mstr_o                  = spi_control_register1_reg[`SPI_CONTROL_REGISTER1_MSTR_POS];
assign cpol_o                  = spi_control_register1_reg[`SPI_CONTROL_REGISTER1_CPOL_POS];
assign cpha_o                  = spi_control_register1_reg[`SPI_CONTROL_REGISTER1_CPHA_POS];
assign lsbfe_o                 = spi_control_register1_reg[`SPI_CONTROL_REGISTER1_LSBFE_POS];
assign spiswai_o               = spi_control_register2_reg[`SPI_CONTROL_REGISTER2_SPISWAI_POS];
assign sppr_o                  = {spi_baud_rate_register_reg[`SPI_BAUD_RATE_REGISTER_SPPR2_POS], spi_baud_rate_register_reg[`SPI_BAUD_RATE_REGISTER_SPPR1_POS], spi_baud_rate_register_reg[`SPI_BAUD_RATE_REGISTER_SPPR0_POS]};
assign spr_o                   = {spi_baud_rate_register_reg[`SPI_BAUD_RATE_REGISTER_SPR2_POS], spi_baud_rate_register_reg[`SPI_BAUD_RATE_REGISTER_SPR1_POS], spi_baud_rate_register_reg[`SPI_BAUD_RATE_REGISTER_SPR0_POS]};
assign spi_interrupt_request_o = 1'b0; // TODO: wire this up (no matching field found)
assign send_data_o             = 1'b0; // TODO: wire this up (no matching field found)
assign mosi_data_o             = 1'b0; // TODO: wire this up (no matching field found)
assign spi_mode_o              = {`SPI_SPI_MODE_O_WIDTH{1'b0}}; // TODO: wire this up (no matching SPI_MODE0..SPI_MODE1 fields found)
assign spe_o                   = spi_control_register1_reg[`SPI_CONTROL_REGISTER1_SPE_POS];
// === AUTOGEN:END APB_EXTRA_OUTPUT_WIRING ===

endmodule
