`include "spi2_define.v"

module spi2_csr
(

input                                                      pclk,
input                                                      preset_n,
input                                                      psel_i,
input                                                      pwrite_i,
input                                                      penable_i,
input        [`SPI2_ADDR_WIDTH-1:0]                        paddr_i,
input        [`SPI2_DATA_WIDTH-1:0]                        pwdata_i,
output reg   [`SPI2_DATA_WIDTH-1:0]                        prdata_o,
output reg                                                 pready_o,
output reg                                                 pslverr_o,
output       [`SPI2_SPI_CONTROL_CONTROL_O_WIDTH-1:0]       spi_control_control_o,
output       [`SPI2_SPI_CONTROL_CONFIG_O_WIDTH-1:0]        spi_control_config_o,
output       [`SPI2_SPI_CONTROL_VALUE_O_WIDTH-1:0]         spi_control_value_o,
output       [`SPI2_SPI_CONTROL_FLAG_O_WIDTH-1:0]          spi_control_flag_o,
output       [`SPI2_SPI_CONFIG_CONTROL_O_WIDTH-1:0]        spi_config_control_o,
output       [`SPI2_SPI_CONFIG_CONFIG_O_WIDTH-1:0]         spi_config_config_o,
output       [`SPI2_SPI_CONFIG_VALUE_O_WIDTH-1:0]          spi_config_value_o,
output       [`SPI2_SPI_CONFIG_FLAG_O_WIDTH-1:0]           spi_config_flag_o,
output       [`SPI2_SPI_CLOCK_CONTROL_O_WIDTH-1:0]         spi_clock_control_o,
output       [`SPI2_SPI_CLOCK_CONFIG_O_WIDTH-1:0]          spi_clock_config_o,
output       [`SPI2_SPI_CLOCK_VALUE_O_WIDTH-1:0]           spi_clock_value_o,
output       [`SPI2_SPI_CLOCK_FLAG_O_WIDTH-1:0]            spi_clock_flag_o,
output       [`SPI2_SPI_STATUS_CONTROL_O_WIDTH-1:0]        spi_status_control_o,
output       [`SPI2_SPI_STATUS_CONFIG_O_WIDTH-1:0]         spi_status_config_o,
output       [`SPI2_SPI_STATUS_VALUE_O_WIDTH-1:0]          spi_status_value_o,
output       [`SPI2_SPI_STATUS_FLAG_O_WIDTH-1:0]           spi_status_flag_o,
output       [`SPI2_SPI_INTERRUPT_CONTROL_O_WIDTH-1:0]     spi_interrupt_control_o,
output       [`SPI2_SPI_INTERRUPT_CONFIG_O_WIDTH-1:0]      spi_interrupt_config_o,
output       [`SPI2_SPI_INTERRUPT_VALUE_O_WIDTH-1:0]       spi_interrupt_value_o,
output       [`SPI2_SPI_INTERRUPT_FLAG_O_WIDTH-1:0]        spi_interrupt_flag_o,
output       [`SPI2_SPI_FIFO_CONTROL_O_WIDTH-1:0]          spi_fifo_control_o,
output       [`SPI2_SPI_FIFO_CONFIG_O_WIDTH-1:0]           spi_fifo_config_o,
output       [`SPI2_SPI_FIFO_VALUE_O_WIDTH-1:0]            spi_fifo_value_o,
output       [`SPI2_SPI_FIFO_FLAG_O_WIDTH-1:0]             spi_fifo_flag_o,
output       [`SPI2_SPI_TX_CONFIG_CONTROL_O_WIDTH-1:0]     spi_tx_config_control_o,
output       [`SPI2_SPI_TX_CONFIG_CONFIG_O_WIDTH-1:0]      spi_tx_config_config_o,
output       [`SPI2_SPI_TX_CONFIG_VALUE_O_WIDTH-1:0]       spi_tx_config_value_o,
output       [`SPI2_SPI_TX_CONFIG_FLAG_O_WIDTH-1:0]        spi_tx_config_flag_o,
output       [`SPI2_SPI_RX_CONFIG_CONTROL_O_WIDTH-1:0]     spi_rx_config_control_o,
output       [`SPI2_SPI_RX_CONFIG_CONFIG_O_WIDTH-1:0]      spi_rx_config_config_o,
output       [`SPI2_SPI_RX_CONFIG_VALUE_O_WIDTH-1:0]       spi_rx_config_value_o,
output       [`SPI2_SPI_RX_CONFIG_FLAG_O_WIDTH-1:0]        spi_rx_config_flag_o,
output       [`SPI2_SPI_FRAME_CONFIG_CONTROL_O_WIDTH-1:0]  spi_frame_config_control_o,
output       [`SPI2_SPI_FRAME_CONFIG_CONFIG_O_WIDTH-1:0]   spi_frame_config_config_o,
output       [`SPI2_SPI_FRAME_CONFIG_VALUE_O_WIDTH-1:0]    spi_frame_config_value_o,
output       [`SPI2_SPI_FRAME_CONFIG_FLAG_O_WIDTH-1:0]     spi_frame_config_flag_o,
output       [`SPI2_SPI_MODE_CONTROL_O_WIDTH-1:0]          spi_mode_control_o,
output       [`SPI2_SPI_MODE_CONFIG_O_WIDTH-1:0]           spi_mode_config_o,
output       [`SPI2_SPI_MODE_VALUE_O_WIDTH-1:0]            spi_mode_value_o,
output       [`SPI2_SPI_MODE_FLAG_O_WIDTH-1:0]             spi_mode_flag_o,
output       [`SPI2_SPI_TIMING_CONTROL_O_WIDTH-1:0]        spi_timing_control_o,
output       [`SPI2_SPI_TIMING_CONFIG_O_WIDTH-1:0]         spi_timing_config_o,
output       [`SPI2_SPI_TIMING_VALUE_O_WIDTH-1:0]          spi_timing_value_o,
output       [`SPI2_SPI_TIMING_FLAG_O_WIDTH-1:0]           spi_timing_flag_o,
output       [`SPI2_SPI_BAUD_CONTROL_O_WIDTH-1:0]          spi_baud_control_o,
output       [`SPI2_SPI_BAUD_CONFIG_O_WIDTH-1:0]           spi_baud_config_o,
output       [`SPI2_SPI_BAUD_VALUE_O_WIDTH-1:0]            spi_baud_value_o,
output       [`SPI2_SPI_BAUD_FLAG_O_WIDTH-1:0]             spi_baud_flag_o,
output       [`SPI2_SPI_PRESCALER_CONTROL_O_WIDTH-1:0]     spi_prescaler_control_o,
output       [`SPI2_SPI_PRESCALER_CONFIG_O_WIDTH-1:0]      spi_prescaler_config_o,
output       [`SPI2_SPI_PRESCALER_VALUE_O_WIDTH-1:0]       spi_prescaler_value_o,
output       [`SPI2_SPI_PRESCALER_FLAG_O_WIDTH-1:0]        spi_prescaler_flag_o,
output       [`SPI2_SPI_CHIP_SELECT_CONTROL_O_WIDTH-1:0]   spi_chip_select_control_o,
output       [`SPI2_SPI_CHIP_SELECT_CONFIG_O_WIDTH-1:0]    spi_chip_select_config_o,
output       [`SPI2_SPI_CHIP_SELECT_VALUE_O_WIDTH-1:0]     spi_chip_select_value_o,
output       [`SPI2_SPI_CHIP_SELECT_FLAG_O_WIDTH-1:0]      spi_chip_select_flag_o,
output       [`SPI2_SPI_DATA_FORMAT_CONTROL_O_WIDTH-1:0]   spi_data_format_control_o,
output       [`SPI2_SPI_DATA_FORMAT_CONFIG_O_WIDTH-1:0]    spi_data_format_config_o,
output       [`SPI2_SPI_DATA_FORMAT_VALUE_O_WIDTH-1:0]     spi_data_format_value_o,
output       [`SPI2_SPI_DATA_FORMAT_FLAG_O_WIDTH-1:0]      spi_data_format_flag_o,
output       [`SPI2_SPI_TRANSFER_CONTROL_O_WIDTH-1:0]      spi_transfer_control_o,
output       [`SPI2_SPI_TRANSFER_CONFIG_O_WIDTH-1:0]       spi_transfer_config_o,
output       [`SPI2_SPI_TRANSFER_VALUE_O_WIDTH-1:0]        spi_transfer_value_o,
output       [`SPI2_SPI_TRANSFER_FLAG_O_WIDTH-1:0]         spi_transfer_flag_o,
output       [`SPI2_SPI_COMMAND_CONTROL_O_WIDTH-1:0]       spi_command_control_o,
output       [`SPI2_SPI_COMMAND_CONFIG_O_WIDTH-1:0]        spi_command_config_o,
output       [`SPI2_SPI_COMMAND_VALUE_O_WIDTH-1:0]         spi_command_value_o,
output       [`SPI2_SPI_COMMAND_FLAG_O_WIDTH-1:0]          spi_command_flag_o,
output       [`SPI2_SPI_RESPONSE_CONTROL_O_WIDTH-1:0]      spi_response_control_o,
output       [`SPI2_SPI_RESPONSE_CONFIG_O_WIDTH-1:0]       spi_response_config_o,
output       [`SPI2_SPI_RESPONSE_VALUE_O_WIDTH-1:0]        spi_response_value_o,
output       [`SPI2_SPI_RESPONSE_FLAG_O_WIDTH-1:0]         spi_response_flag_o,
output       [`SPI2_SPI_ERROR_CONTROL_O_WIDTH-1:0]         spi_error_control_o,
output       [`SPI2_SPI_ERROR_CONFIG_O_WIDTH-1:0]          spi_error_config_o,
output       [`SPI2_SPI_ERROR_VALUE_O_WIDTH-1:0]           spi_error_value_o,
output       [`SPI2_SPI_ERROR_FLAG_O_WIDTH-1:0]            spi_error_flag_o,
output       [`SPI2_SPI_TIMEOUT_CONTROL_O_WIDTH-1:0]       spi_timeout_control_o,
output       [`SPI2_SPI_TIMEOUT_CONFIG_O_WIDTH-1:0]        spi_timeout_config_o,
output       [`SPI2_SPI_TIMEOUT_VALUE_O_WIDTH-1:0]         spi_timeout_value_o,
output       [`SPI2_SPI_TIMEOUT_FLAG_O_WIDTH-1:0]          spi_timeout_flag_o,
output       [`SPI2_SPI_DMA_CONFIG_CONTROL_O_WIDTH-1:0]    spi_dma_config_control_o,
output       [`SPI2_SPI_DMA_CONFIG_CONFIG_O_WIDTH-1:0]     spi_dma_config_config_o,
output       [`SPI2_SPI_DMA_CONFIG_VALUE_O_WIDTH-1:0]      spi_dma_config_value_o,
output       [`SPI2_SPI_DMA_CONFIG_FLAG_O_WIDTH-1:0]       spi_dma_config_flag_o,
output       [`SPI2_SPI_DMA_STATUS_CONTROL_O_WIDTH-1:0]    spi_dma_status_control_o,
output       [`SPI2_SPI_DMA_STATUS_CONFIG_O_WIDTH-1:0]     spi_dma_status_config_o,
output       [`SPI2_SPI_DMA_STATUS_VALUE_O_WIDTH-1:0]      spi_dma_status_value_o,
output       [`SPI2_SPI_DMA_STATUS_FLAG_O_WIDTH-1:0]       spi_dma_status_flag_o,
output       [`SPI2_SPI_TX_DATA_CONTROL_O_WIDTH-1:0]       spi_tx_data_control_o,
output       [`SPI2_SPI_TX_DATA_CONFIG_O_WIDTH-1:0]        spi_tx_data_config_o,
output       [`SPI2_SPI_TX_DATA_VALUE_O_WIDTH-1:0]         spi_tx_data_value_o,
output       [`SPI2_SPI_TX_DATA_FLAG_O_WIDTH-1:0]          spi_tx_data_flag_o,
output       [`SPI2_SPI_RX_DATA_CONTROL_O_WIDTH-1:0]       spi_rx_data_control_o,
output       [`SPI2_SPI_RX_DATA_CONFIG_O_WIDTH-1:0]        spi_rx_data_config_o,
output       [`SPI2_SPI_RX_DATA_VALUE_O_WIDTH-1:0]         spi_rx_data_value_o,
output       [`SPI2_SPI_RX_DATA_FLAG_O_WIDTH-1:0]          spi_rx_data_flag_o,
output       [`SPI2_SPI_TX_STATUS_CONTROL_O_WIDTH-1:0]     spi_tx_status_control_o,
output       [`SPI2_SPI_TX_STATUS_CONFIG_O_WIDTH-1:0]      spi_tx_status_config_o,
output       [`SPI2_SPI_TX_STATUS_VALUE_O_WIDTH-1:0]       spi_tx_status_value_o,
output       [`SPI2_SPI_TX_STATUS_FLAG_O_WIDTH-1:0]        spi_tx_status_flag_o,
output       [`SPI2_SPI_RX_STATUS_CONTROL_O_WIDTH-1:0]     spi_rx_status_control_o,
output       [`SPI2_SPI_RX_STATUS_CONFIG_O_WIDTH-1:0]      spi_rx_status_config_o,
output       [`SPI2_SPI_RX_STATUS_VALUE_O_WIDTH-1:0]       spi_rx_status_value_o,
output       [`SPI2_SPI_RX_STATUS_FLAG_O_WIDTH-1:0]        spi_rx_status_flag_o,
output       [`SPI2_SPI_FIFO_CONTROL_CONTROL_O_WIDTH-1:0]  spi_fifo_control_control_o,
output       [`SPI2_SPI_FIFO_CONTROL_CONFIG_O_WIDTH-1:0]   spi_fifo_control_config_o,
output       [`SPI2_SPI_FIFO_CONTROL_VALUE_O_WIDTH-1:0]    spi_fifo_control_value_o,
output       [`SPI2_SPI_FIFO_CONTROL_FLAG_O_WIDTH-1:0]     spi_fifo_control_flag_o,
output       [`SPI2_SPI_FIFO_STATUS_CONTROL_O_WIDTH-1:0]   spi_fifo_status_control_o,
output       [`SPI2_SPI_FIFO_STATUS_CONFIG_O_WIDTH-1:0]    spi_fifo_status_config_o,
output       [`SPI2_SPI_FIFO_STATUS_VALUE_O_WIDTH-1:0]     spi_fifo_status_value_o,
output       [`SPI2_SPI_FIFO_STATUS_FLAG_O_WIDTH-1:0]      spi_fifo_status_flag_o,
output       [`SPI2_SPI_TX_THRESHOLD_CONTROL_O_WIDTH-1:0]  spi_tx_threshold_control_o,
output       [`SPI2_SPI_TX_THRESHOLD_CONFIG_O_WIDTH-1:0]   spi_tx_threshold_config_o,
output       [`SPI2_SPI_TX_THRESHOLD_VALUE_O_WIDTH-1:0]    spi_tx_threshold_value_o,
output       [`SPI2_SPI_TX_THRESHOLD_FLAG_O_WIDTH-1:0]     spi_tx_threshold_flag_o,
output       [`SPI2_SPI_RX_THRESHOLD_CONTROL_O_WIDTH-1:0]  spi_rx_threshold_control_o,
output       [`SPI2_SPI_RX_THRESHOLD_CONFIG_O_WIDTH-1:0]   spi_rx_threshold_config_o,
output       [`SPI2_SPI_RX_THRESHOLD_VALUE_O_WIDTH-1:0]    spi_rx_threshold_value_o,
output       [`SPI2_SPI_RX_THRESHOLD_FLAG_O_WIDTH-1:0]     spi_rx_threshold_flag_o,
output       [`SPI2_SPI_INTERRUPT_MASK_CONTROL_O_WIDTH-1:0] spi_interrupt_mask_control_o,
output       [`SPI2_SPI_INTERRUPT_MASK_CONFIG_O_WIDTH-1:0] spi_interrupt_mask_config_o,
output       [`SPI2_SPI_INTERRUPT_MASK_VALUE_O_WIDTH-1:0]  spi_interrupt_mask_value_o,
output       [`SPI2_SPI_INTERRUPT_MASK_FLAG_O_WIDTH-1:0]   spi_interrupt_mask_flag_o,
output       [`SPI2_SPI_INTERRUPT_STATUS_CONTROL_O_WIDTH-1:0] spi_interrupt_status_control_o,
output       [`SPI2_SPI_INTERRUPT_STATUS_CONFIG_O_WIDTH-1:0] spi_interrupt_status_config_o,
output       [`SPI2_SPI_INTERRUPT_STATUS_VALUE_O_WIDTH-1:0] spi_interrupt_status_value_o,
output       [`SPI2_SPI_INTERRUPT_STATUS_FLAG_O_WIDTH-1:0] spi_interrupt_status_flag_o,
output       [`SPI2_SPI_INTERRUPT_CLEAR_CONTROL_O_WIDTH-1:0] spi_interrupt_clear_control_o,
output       [`SPI2_SPI_INTERRUPT_CLEAR_CONFIG_O_WIDTH-1:0] spi_interrupt_clear_config_o,
output       [`SPI2_SPI_INTERRUPT_CLEAR_VALUE_O_WIDTH-1:0] spi_interrupt_clear_value_o,
output       [`SPI2_SPI_INTERRUPT_CLEAR_FLAG_O_WIDTH-1:0]  spi_interrupt_clear_flag_o,
output       [`SPI2_SPI_IRQ_CONFIG_CONTROL_O_WIDTH-1:0]    spi_irq_config_control_o,
output       [`SPI2_SPI_IRQ_CONFIG_CONFIG_O_WIDTH-1:0]     spi_irq_config_config_o,
output       [`SPI2_SPI_IRQ_CONFIG_VALUE_O_WIDTH-1:0]      spi_irq_config_value_o,
output       [`SPI2_SPI_IRQ_CONFIG_FLAG_O_WIDTH-1:0]       spi_irq_config_flag_o,
output       [`SPI2_SPI_EVENT_STATUS_CONTROL_O_WIDTH-1:0]  spi_event_status_control_o,
output       [`SPI2_SPI_EVENT_STATUS_CONFIG_O_WIDTH-1:0]   spi_event_status_config_o,
output       [`SPI2_SPI_EVENT_STATUS_VALUE_O_WIDTH-1:0]    spi_event_status_value_o,
output       [`SPI2_SPI_EVENT_STATUS_FLAG_O_WIDTH-1:0]     spi_event_status_flag_o,
output       [`SPI2_SPI_ERROR_STATUS_CONTROL_O_WIDTH-1:0]  spi_error_status_control_o,
output       [`SPI2_SPI_ERROR_STATUS_CONFIG_O_WIDTH-1:0]   spi_error_status_config_o,
output       [`SPI2_SPI_ERROR_STATUS_VALUE_O_WIDTH-1:0]    spi_error_status_value_o,
output       [`SPI2_SPI_ERROR_STATUS_FLAG_O_WIDTH-1:0]     spi_error_status_flag_o,
output       [`SPI2_SPI_ERROR_CLEAR_CONTROL_O_WIDTH-1:0]   spi_error_clear_control_o,
output       [`SPI2_SPI_ERROR_CLEAR_CONFIG_O_WIDTH-1:0]    spi_error_clear_config_o,
output       [`SPI2_SPI_ERROR_CLEAR_VALUE_O_WIDTH-1:0]     spi_error_clear_value_o,
output       [`SPI2_SPI_ERROR_CLEAR_FLAG_O_WIDTH-1:0]      spi_error_clear_flag_o,
output       [`SPI2_SPI_DEBUG_CONTROL_O_WIDTH-1:0]         spi_debug_control_o,
output       [`SPI2_SPI_DEBUG_CONFIG_O_WIDTH-1:0]          spi_debug_config_o,
output       [`SPI2_SPI_DEBUG_VALUE_O_WIDTH-1:0]           spi_debug_value_o,
output       [`SPI2_SPI_DEBUG_FLAG_O_WIDTH-1:0]            spi_debug_flag_o,
output       [`SPI2_SPI_DEBUG_CONTROL_CONTROL_O_WIDTH-1:0] spi_debug_control_control_o,
output       [`SPI2_SPI_DEBUG_CONTROL_CONFIG_O_WIDTH-1:0]  spi_debug_control_config_o,
output       [`SPI2_SPI_DEBUG_CONTROL_VALUE_O_WIDTH-1:0]   spi_debug_control_value_o,
output       [`SPI2_SPI_DEBUG_CONTROL_FLAG_O_WIDTH-1:0]    spi_debug_control_flag_o,
output       [`SPI2_SPI_LOOPBACK_CONTROL_O_WIDTH-1:0]      spi_loopback_control_o,
output       [`SPI2_SPI_LOOPBACK_CONFIG_O_WIDTH-1:0]       spi_loopback_config_o,
output       [`SPI2_SPI_LOOPBACK_VALUE_O_WIDTH-1:0]        spi_loopback_value_o,
output       [`SPI2_SPI_LOOPBACK_FLAG_O_WIDTH-1:0]         spi_loopback_flag_o,
output       [`SPI2_SPI_TEST_MODE_CONTROL_O_WIDTH-1:0]     spi_test_mode_control_o,
output       [`SPI2_SPI_TEST_MODE_CONFIG_O_WIDTH-1:0]      spi_test_mode_config_o,
output       [`SPI2_SPI_TEST_MODE_VALUE_O_WIDTH-1:0]       spi_test_mode_value_o,
output       [`SPI2_SPI_TEST_MODE_FLAG_O_WIDTH-1:0]        spi_test_mode_flag_o,
output       [`SPI2_SPI_TEST_CONTROL_CONTROL_O_WIDTH-1:0]  spi_test_control_control_o,
output       [`SPI2_SPI_TEST_CONTROL_CONFIG_O_WIDTH-1:0]   spi_test_control_config_o,
output       [`SPI2_SPI_TEST_CONTROL_VALUE_O_WIDTH-1:0]    spi_test_control_value_o,
output       [`SPI2_SPI_TEST_CONTROL_FLAG_O_WIDTH-1:0]     spi_test_control_flag_o,
output       [`SPI2_SPI_TEST_STATUS_CONTROL_O_WIDTH-1:0]   spi_test_status_control_o,
output       [`SPI2_SPI_TEST_STATUS_CONFIG_O_WIDTH-1:0]    spi_test_status_config_o,
output       [`SPI2_SPI_TEST_STATUS_VALUE_O_WIDTH-1:0]     spi_test_status_value_o,
output       [`SPI2_SPI_TEST_STATUS_FLAG_O_WIDTH-1:0]      spi_test_status_flag_o,
output       [`SPI2_SPI_PATTERN_CONFIG_CONTROL_O_WIDTH-1:0] spi_pattern_config_control_o,
output       [`SPI2_SPI_PATTERN_CONFIG_CONFIG_O_WIDTH-1:0] spi_pattern_config_config_o,
output       [`SPI2_SPI_PATTERN_CONFIG_VALUE_O_WIDTH-1:0]  spi_pattern_config_value_o,
output       [`SPI2_SPI_PATTERN_CONFIG_FLAG_O_WIDTH-1:0]   spi_pattern_config_flag_o,
output       [`SPI2_SPI_PATTERN_STATUS_CONTROL_O_WIDTH-1:0] spi_pattern_status_control_o,
output       [`SPI2_SPI_PATTERN_STATUS_CONFIG_O_WIDTH-1:0] spi_pattern_status_config_o,
output       [`SPI2_SPI_PATTERN_STATUS_VALUE_O_WIDTH-1:0]  spi_pattern_status_value_o,
output       [`SPI2_SPI_PATTERN_STATUS_FLAG_O_WIDTH-1:0]   spi_pattern_status_flag_o,
output       [`SPI2_SPI_SYNC_CONFIG_CONTROL_O_WIDTH-1:0]   spi_sync_config_control_o,
output       [`SPI2_SPI_SYNC_CONFIG_CONFIG_O_WIDTH-1:0]    spi_sync_config_config_o,
output       [`SPI2_SPI_SYNC_CONFIG_VALUE_O_WIDTH-1:0]     spi_sync_config_value_o,
output       [`SPI2_SPI_SYNC_CONFIG_FLAG_O_WIDTH-1:0]      spi_sync_config_flag_o,
output       [`SPI2_SPI_SYNC_STATUS_CONTROL_O_WIDTH-1:0]   spi_sync_status_control_o,
output       [`SPI2_SPI_SYNC_STATUS_CONFIG_O_WIDTH-1:0]    spi_sync_status_config_o,
output       [`SPI2_SPI_SYNC_STATUS_VALUE_O_WIDTH-1:0]     spi_sync_status_value_o,
output       [`SPI2_SPI_SYNC_STATUS_FLAG_O_WIDTH-1:0]      spi_sync_status_flag_o,
output       [`SPI2_SPI_FILTER_CONFIG_CONTROL_O_WIDTH-1:0] spi_filter_config_control_o,
output       [`SPI2_SPI_FILTER_CONFIG_CONFIG_O_WIDTH-1:0]  spi_filter_config_config_o,
output       [`SPI2_SPI_FILTER_CONFIG_VALUE_O_WIDTH-1:0]   spi_filter_config_value_o,
output       [`SPI2_SPI_FILTER_CONFIG_FLAG_O_WIDTH-1:0]    spi_filter_config_flag_o,
output       [`SPI2_SPI_FILTER_STATUS_CONTROL_O_WIDTH-1:0] spi_filter_status_control_o,
output       [`SPI2_SPI_FILTER_STATUS_CONFIG_O_WIDTH-1:0]  spi_filter_status_config_o,
output       [`SPI2_SPI_FILTER_STATUS_VALUE_O_WIDTH-1:0]   spi_filter_status_value_o,
output       [`SPI2_SPI_FILTER_STATUS_FLAG_O_WIDTH-1:0]    spi_filter_status_flag_o,
output       [`SPI2_SPI_SAMPLE_CONFIG_CONTROL_O_WIDTH-1:0] spi_sample_config_control_o,
output       [`SPI2_SPI_SAMPLE_CONFIG_CONFIG_O_WIDTH-1:0]  spi_sample_config_config_o,
output       [`SPI2_SPI_SAMPLE_CONFIG_VALUE_O_WIDTH-1:0]   spi_sample_config_value_o,
output       [`SPI2_SPI_SAMPLE_CONFIG_FLAG_O_WIDTH-1:0]    spi_sample_config_flag_o,
output       [`SPI2_SPI_SAMPLE_STATUS_CONTROL_O_WIDTH-1:0] spi_sample_status_control_o,
output       [`SPI2_SPI_SAMPLE_STATUS_CONFIG_O_WIDTH-1:0]  spi_sample_status_config_o,
output       [`SPI2_SPI_SAMPLE_STATUS_VALUE_O_WIDTH-1:0]   spi_sample_status_value_o,
output       [`SPI2_SPI_SAMPLE_STATUS_FLAG_O_WIDTH-1:0]    spi_sample_status_flag_o,
output       [`SPI2_SPI_DRIVE_CONFIG_CONTROL_O_WIDTH-1:0]  spi_drive_config_control_o,
output       [`SPI2_SPI_DRIVE_CONFIG_CONFIG_O_WIDTH-1:0]   spi_drive_config_config_o,
output       [`SPI2_SPI_DRIVE_CONFIG_VALUE_O_WIDTH-1:0]    spi_drive_config_value_o,
output       [`SPI2_SPI_DRIVE_CONFIG_FLAG_O_WIDTH-1:0]     spi_drive_config_flag_o,
output       [`SPI2_SPI_DRIVE_STATUS_CONTROL_O_WIDTH-1:0]  spi_drive_status_control_o,
output       [`SPI2_SPI_DRIVE_STATUS_CONFIG_O_WIDTH-1:0]   spi_drive_status_config_o,
output       [`SPI2_SPI_DRIVE_STATUS_VALUE_O_WIDTH-1:0]    spi_drive_status_value_o,
output       [`SPI2_SPI_DRIVE_STATUS_FLAG_O_WIDTH-1:0]     spi_drive_status_flag_o,
output       [`SPI2_SPI_POLARITY_CONFIG_CONTROL_O_WIDTH-1:0] spi_polarity_config_control_o,
output       [`SPI2_SPI_POLARITY_CONFIG_CONFIG_O_WIDTH-1:0] spi_polarity_config_config_o,
output       [`SPI2_SPI_POLARITY_CONFIG_VALUE_O_WIDTH-1:0] spi_polarity_config_value_o,
output       [`SPI2_SPI_POLARITY_CONFIG_FLAG_O_WIDTH-1:0]  spi_polarity_config_flag_o,
output       [`SPI2_SPI_PHASE_CONFIG_CONTROL_O_WIDTH-1:0]  spi_phase_config_control_o,
output       [`SPI2_SPI_PHASE_CONFIG_CONFIG_O_WIDTH-1:0]   spi_phase_config_config_o,
output       [`SPI2_SPI_PHASE_CONFIG_VALUE_O_WIDTH-1:0]    spi_phase_config_value_o,
output       [`SPI2_SPI_PHASE_CONFIG_FLAG_O_WIDTH-1:0]     spi_phase_config_flag_o,
output       [`SPI2_SPI_EDGE_CONFIG_CONTROL_O_WIDTH-1:0]   spi_edge_config_control_o,
output       [`SPI2_SPI_EDGE_CONFIG_CONFIG_O_WIDTH-1:0]    spi_edge_config_config_o,
output       [`SPI2_SPI_EDGE_CONFIG_VALUE_O_WIDTH-1:0]     spi_edge_config_value_o,
output       [`SPI2_SPI_EDGE_CONFIG_FLAG_O_WIDTH-1:0]      spi_edge_config_flag_o,
output       [`SPI2_SPI_CLOCK_GATE_CONTROL_O_WIDTH-1:0]    spi_clock_gate_control_o,
output       [`SPI2_SPI_CLOCK_GATE_CONFIG_O_WIDTH-1:0]     spi_clock_gate_config_o,
output       [`SPI2_SPI_CLOCK_GATE_VALUE_O_WIDTH-1:0]      spi_clock_gate_value_o,
output       [`SPI2_SPI_CLOCK_GATE_FLAG_O_WIDTH-1:0]       spi_clock_gate_flag_o,
output       [`SPI2_SPI_POWER_CONTROL_CONTROL_O_WIDTH-1:0] spi_power_control_control_o,
output       [`SPI2_SPI_POWER_CONTROL_CONFIG_O_WIDTH-1:0]  spi_power_control_config_o,
output       [`SPI2_SPI_POWER_CONTROL_VALUE_O_WIDTH-1:0]   spi_power_control_value_o,
output       [`SPI2_SPI_POWER_CONTROL_FLAG_O_WIDTH-1:0]    spi_power_control_flag_o,
output       [`SPI2_SPI_POWER_STATUS_CONTROL_O_WIDTH-1:0]  spi_power_status_control_o,
output       [`SPI2_SPI_POWER_STATUS_CONFIG_O_WIDTH-1:0]   spi_power_status_config_o,
output       [`SPI2_SPI_POWER_STATUS_VALUE_O_WIDTH-1:0]    spi_power_status_value_o,
output       [`SPI2_SPI_POWER_STATUS_FLAG_O_WIDTH-1:0]     spi_power_status_flag_o,
output       [`SPI2_SPI_RESET_CONTROL_CONTROL_O_WIDTH-1:0] spi_reset_control_control_o,
output       [`SPI2_SPI_RESET_CONTROL_CONFIG_O_WIDTH-1:0]  spi_reset_control_config_o,
output       [`SPI2_SPI_RESET_CONTROL_VALUE_O_WIDTH-1:0]   spi_reset_control_value_o,
output       [`SPI2_SPI_RESET_CONTROL_FLAG_O_WIDTH-1:0]    spi_reset_control_flag_o,
output       [`SPI2_SPI_RESET_STATUS_CONTROL_O_WIDTH-1:0]  spi_reset_status_control_o,
output       [`SPI2_SPI_RESET_STATUS_CONFIG_O_WIDTH-1:0]   spi_reset_status_config_o,
output       [`SPI2_SPI_RESET_STATUS_VALUE_O_WIDTH-1:0]    spi_reset_status_value_o,
output       [`SPI2_SPI_RESET_STATUS_FLAG_O_WIDTH-1:0]     spi_reset_status_flag_o,
output       [`SPI2_SPI_SLEEP_CONFIG_CONTROL_O_WIDTH-1:0]  spi_sleep_config_control_o,
output       [`SPI2_SPI_SLEEP_CONFIG_CONFIG_O_WIDTH-1:0]   spi_sleep_config_config_o,
output       [`SPI2_SPI_SLEEP_CONFIG_VALUE_O_WIDTH-1:0]    spi_sleep_config_value_o,
output       [`SPI2_SPI_SLEEP_CONFIG_FLAG_O_WIDTH-1:0]     spi_sleep_config_flag_o,
output       [`SPI2_SPI_WAKE_STATUS_CONTROL_O_WIDTH-1:0]   spi_wake_status_control_o,
output       [`SPI2_SPI_WAKE_STATUS_CONFIG_O_WIDTH-1:0]    spi_wake_status_config_o,
output       [`SPI2_SPI_WAKE_STATUS_VALUE_O_WIDTH-1:0]     spi_wake_status_value_o,
output       [`SPI2_SPI_WAKE_STATUS_FLAG_O_WIDTH-1:0]      spi_wake_status_flag_o,
output       [`SPI2_SPI_WAIT_CONFIG_CONTROL_O_WIDTH-1:0]   spi_wait_config_control_o,
output       [`SPI2_SPI_WAIT_CONFIG_CONFIG_O_WIDTH-1:0]    spi_wait_config_config_o,
output       [`SPI2_SPI_WAIT_CONFIG_VALUE_O_WIDTH-1:0]     spi_wait_config_value_o,
output       [`SPI2_SPI_WAIT_CONFIG_FLAG_O_WIDTH-1:0]      spi_wait_config_flag_o,
output       [`SPI2_SPI_WAIT_STATUS_CONTROL_O_WIDTH-1:0]   spi_wait_status_control_o,
output       [`SPI2_SPI_WAIT_STATUS_CONFIG_O_WIDTH-1:0]    spi_wait_status_config_o,
output       [`SPI2_SPI_WAIT_STATUS_VALUE_O_WIDTH-1:0]     spi_wait_status_value_o,
output       [`SPI2_SPI_WAIT_STATUS_FLAG_O_WIDTH-1:0]      spi_wait_status_flag_o,
output       [`SPI2_SPI_FRAME_COUNT_CONTROL_O_WIDTH-1:0]   spi_frame_count_control_o,
output       [`SPI2_SPI_FRAME_COUNT_CONFIG_O_WIDTH-1:0]    spi_frame_count_config_o,
output       [`SPI2_SPI_FRAME_COUNT_VALUE_O_WIDTH-1:0]     spi_frame_count_value_o,
output       [`SPI2_SPI_FRAME_COUNT_FLAG_O_WIDTH-1:0]      spi_frame_count_flag_o,
output       [`SPI2_SPI_BYTE_COUNT_CONTROL_O_WIDTH-1:0]    spi_byte_count_control_o,
output       [`SPI2_SPI_BYTE_COUNT_CONFIG_O_WIDTH-1:0]     spi_byte_count_config_o,
output       [`SPI2_SPI_BYTE_COUNT_VALUE_O_WIDTH-1:0]      spi_byte_count_value_o,
output       [`SPI2_SPI_BYTE_COUNT_FLAG_O_WIDTH-1:0]       spi_byte_count_flag_o,
output       [`SPI2_SPI_BIT_COUNT_CONTROL_O_WIDTH-1:0]     spi_bit_count_control_o,
output       [`SPI2_SPI_BIT_COUNT_CONFIG_O_WIDTH-1:0]      spi_bit_count_config_o,
output       [`SPI2_SPI_BIT_COUNT_VALUE_O_WIDTH-1:0]       spi_bit_count_value_o,
output       [`SPI2_SPI_BIT_COUNT_FLAG_O_WIDTH-1:0]        spi_bit_count_flag_o,
output       [`SPI2_SPI_TRANSFER_COUNT_CONTROL_O_WIDTH-1:0] spi_transfer_count_control_o,
output       [`SPI2_SPI_TRANSFER_COUNT_CONFIG_O_WIDTH-1:0] spi_transfer_count_config_o,
output       [`SPI2_SPI_TRANSFER_COUNT_VALUE_O_WIDTH-1:0]  spi_transfer_count_value_o,
output       [`SPI2_SPI_TRANSFER_COUNT_FLAG_O_WIDTH-1:0]   spi_transfer_count_flag_o,
output       [`SPI2_SPI_ERROR_COUNT_CONTROL_O_WIDTH-1:0]   spi_error_count_control_o,
output       [`SPI2_SPI_ERROR_COUNT_CONFIG_O_WIDTH-1:0]    spi_error_count_config_o,
output       [`SPI2_SPI_ERROR_COUNT_VALUE_O_WIDTH-1:0]     spi_error_count_value_o,
output       [`SPI2_SPI_ERROR_COUNT_FLAG_O_WIDTH-1:0]      spi_error_count_flag_o,
output       [`SPI2_SPI_RETRY_CONFIG_CONTROL_O_WIDTH-1:0]  spi_retry_config_control_o,
output       [`SPI2_SPI_RETRY_CONFIG_CONFIG_O_WIDTH-1:0]   spi_retry_config_config_o,
output       [`SPI2_SPI_RETRY_CONFIG_VALUE_O_WIDTH-1:0]    spi_retry_config_value_o,
output       [`SPI2_SPI_RETRY_CONFIG_FLAG_O_WIDTH-1:0]     spi_retry_config_flag_o,
output       [`SPI2_SPI_RETRY_STATUS_CONTROL_O_WIDTH-1:0]  spi_retry_status_control_o,
output       [`SPI2_SPI_RETRY_STATUS_CONFIG_O_WIDTH-1:0]   spi_retry_status_config_o,
output       [`SPI2_SPI_RETRY_STATUS_VALUE_O_WIDTH-1:0]    spi_retry_status_value_o,
output       [`SPI2_SPI_RETRY_STATUS_FLAG_O_WIDTH-1:0]     spi_retry_status_flag_o,
output       [`SPI2_SPI_RETRY_COUNT_CONTROL_O_WIDTH-1:0]   spi_retry_count_control_o,
output       [`SPI2_SPI_RETRY_COUNT_CONFIG_O_WIDTH-1:0]    spi_retry_count_config_o,
output       [`SPI2_SPI_RETRY_COUNT_VALUE_O_WIDTH-1:0]     spi_retry_count_value_o,
output       [`SPI2_SPI_RETRY_COUNT_FLAG_O_WIDTH-1:0]      spi_retry_count_flag_o,
output       [`SPI2_SPI_PACKET_CONFIG_CONTROL_O_WIDTH-1:0] spi_packet_config_control_o,
output       [`SPI2_SPI_PACKET_CONFIG_CONFIG_O_WIDTH-1:0]  spi_packet_config_config_o,
output       [`SPI2_SPI_PACKET_CONFIG_VALUE_O_WIDTH-1:0]   spi_packet_config_value_o,
output       [`SPI2_SPI_PACKET_CONFIG_FLAG_O_WIDTH-1:0]    spi_packet_config_flag_o,
output       [`SPI2_SPI_PACKET_STATUS_CONTROL_O_WIDTH-1:0] spi_packet_status_control_o,
output       [`SPI2_SPI_PACKET_STATUS_CONFIG_O_WIDTH-1:0]  spi_packet_status_config_o,
output       [`SPI2_SPI_PACKET_STATUS_VALUE_O_WIDTH-1:0]   spi_packet_status_value_o,
output       [`SPI2_SPI_PACKET_STATUS_FLAG_O_WIDTH-1:0]    spi_packet_status_flag_o,
output       [`SPI2_SPI_HEADER_CONFIG_CONTROL_O_WIDTH-1:0] spi_header_config_control_o,
output       [`SPI2_SPI_HEADER_CONFIG_CONFIG_O_WIDTH-1:0]  spi_header_config_config_o,
output       [`SPI2_SPI_HEADER_CONFIG_VALUE_O_WIDTH-1:0]   spi_header_config_value_o,
output       [`SPI2_SPI_HEADER_CONFIG_FLAG_O_WIDTH-1:0]    spi_header_config_flag_o,
output       [`SPI2_SPI_HEADER_STATUS_CONTROL_O_WIDTH-1:0] spi_header_status_control_o,
output       [`SPI2_SPI_HEADER_STATUS_CONFIG_O_WIDTH-1:0]  spi_header_status_config_o,
output       [`SPI2_SPI_HEADER_STATUS_VALUE_O_WIDTH-1:0]   spi_header_status_value_o,
output       [`SPI2_SPI_HEADER_STATUS_FLAG_O_WIDTH-1:0]    spi_header_status_flag_o,
output       [`SPI2_SPI_CRC_CONFIG_CONTROL_O_WIDTH-1:0]    spi_crc_config_control_o,
output       [`SPI2_SPI_CRC_CONFIG_CONFIG_O_WIDTH-1:0]     spi_crc_config_config_o,
output       [`SPI2_SPI_CRC_CONFIG_VALUE_O_WIDTH-1:0]      spi_crc_config_value_o,
output       [`SPI2_SPI_CRC_CONFIG_FLAG_O_WIDTH-1:0]       spi_crc_config_flag_o,
output       [`SPI2_SPI_CRC_STATUS_CONTROL_O_WIDTH-1:0]    spi_crc_status_control_o,
output       [`SPI2_SPI_CRC_STATUS_CONFIG_O_WIDTH-1:0]     spi_crc_status_config_o,
output       [`SPI2_SPI_CRC_STATUS_VALUE_O_WIDTH-1:0]      spi_crc_status_value_o,
output       [`SPI2_SPI_CRC_STATUS_FLAG_O_WIDTH-1:0]       spi_crc_status_flag_o,
output       [`SPI2_SPI_CRC_RESULT_CONTROL_O_WIDTH-1:0]    spi_crc_result_control_o,
output       [`SPI2_SPI_CRC_RESULT_CONFIG_O_WIDTH-1:0]     spi_crc_result_config_o,
output       [`SPI2_SPI_CRC_RESULT_VALUE_O_WIDTH-1:0]      spi_crc_result_value_o,
output       [`SPI2_SPI_CRC_RESULT_FLAG_O_WIDTH-1:0]       spi_crc_result_flag_o,
output       [`SPI2_SPI_CHECKSUM_CONFIG_CONTROL_O_WIDTH-1:0] spi_checksum_config_control_o,
output       [`SPI2_SPI_CHECKSUM_CONFIG_CONFIG_O_WIDTH-1:0] spi_checksum_config_config_o,
output       [`SPI2_SPI_CHECKSUM_CONFIG_VALUE_O_WIDTH-1:0] spi_checksum_config_value_o,
output       [`SPI2_SPI_CHECKSUM_CONFIG_FLAG_O_WIDTH-1:0]  spi_checksum_config_flag_o,
output       [`SPI2_SPI_CHECKSUM_STATUS_CONTROL_O_WIDTH-1:0] spi_checksum_status_control_o,
output       [`SPI2_SPI_CHECKSUM_STATUS_CONFIG_O_WIDTH-1:0] spi_checksum_status_config_o,
output       [`SPI2_SPI_CHECKSUM_STATUS_VALUE_O_WIDTH-1:0] spi_checksum_status_value_o,
output       [`SPI2_SPI_CHECKSUM_STATUS_FLAG_O_WIDTH-1:0]  spi_checksum_status_flag_o,
output       [`SPI2_SPI_CHECKSUM_RESULT_CONTROL_O_WIDTH-1:0] spi_checksum_result_control_o,
output       [`SPI2_SPI_CHECKSUM_RESULT_CONFIG_O_WIDTH-1:0] spi_checksum_result_config_o,
output       [`SPI2_SPI_CHECKSUM_RESULT_VALUE_O_WIDTH-1:0] spi_checksum_result_value_o,
output       [`SPI2_SPI_CHECKSUM_RESULT_FLAG_O_WIDTH-1:0]  spi_checksum_result_flag_o,
output       [`SPI2_SPI_SEQUENCE_CONFIG_CONTROL_O_WIDTH-1:0] spi_sequence_config_control_o,
output       [`SPI2_SPI_SEQUENCE_CONFIG_CONFIG_O_WIDTH-1:0] spi_sequence_config_config_o,
output       [`SPI2_SPI_SEQUENCE_CONFIG_VALUE_O_WIDTH-1:0] spi_sequence_config_value_o,
output       [`SPI2_SPI_SEQUENCE_CONFIG_FLAG_O_WIDTH-1:0]  spi_sequence_config_flag_o,
output       [`SPI2_SPI_SEQUENCE_STATUS_CONTROL_O_WIDTH-1:0] spi_sequence_status_control_o,
output       [`SPI2_SPI_SEQUENCE_STATUS_CONFIG_O_WIDTH-1:0] spi_sequence_status_config_o,
output       [`SPI2_SPI_SEQUENCE_STATUS_VALUE_O_WIDTH-1:0] spi_sequence_status_value_o,
output       [`SPI2_SPI_SEQUENCE_STATUS_FLAG_O_WIDTH-1:0]  spi_sequence_status_flag_o,
output       [`SPI2_SPI_BUFFER_CONFIG_CONTROL_O_WIDTH-1:0] spi_buffer_config_control_o,
output       [`SPI2_SPI_BUFFER_CONFIG_CONFIG_O_WIDTH-1:0]  spi_buffer_config_config_o,
output       [`SPI2_SPI_BUFFER_CONFIG_VALUE_O_WIDTH-1:0]   spi_buffer_config_value_o,
output       [`SPI2_SPI_BUFFER_CONFIG_FLAG_O_WIDTH-1:0]    spi_buffer_config_flag_o,
output       [`SPI2_SPI_BUFFER_STATUS_CONTROL_O_WIDTH-1:0] spi_buffer_status_control_o,
output       [`SPI2_SPI_BUFFER_STATUS_CONFIG_O_WIDTH-1:0]  spi_buffer_status_config_o,
output       [`SPI2_SPI_BUFFER_STATUS_VALUE_O_WIDTH-1:0]   spi_buffer_status_value_o,
output       [`SPI2_SPI_BUFFER_STATUS_FLAG_O_WIDTH-1:0]    spi_buffer_status_flag_o,
output       [`SPI2_SPI_QUEUE_CONTROL_CONTROL_O_WIDTH-1:0] spi_queue_control_control_o,
output       [`SPI2_SPI_QUEUE_CONTROL_CONFIG_O_WIDTH-1:0]  spi_queue_control_config_o,
output       [`SPI2_SPI_QUEUE_CONTROL_VALUE_O_WIDTH-1:0]   spi_queue_control_value_o,
output       [`SPI2_SPI_QUEUE_CONTROL_FLAG_O_WIDTH-1:0]    spi_queue_control_flag_o,
output       [`SPI2_SPI_QUEUE_STATUS_CONTROL_O_WIDTH-1:0]  spi_queue_status_control_o,
output       [`SPI2_SPI_QUEUE_STATUS_CONFIG_O_WIDTH-1:0]   spi_queue_status_config_o,
output       [`SPI2_SPI_QUEUE_STATUS_VALUE_O_WIDTH-1:0]    spi_queue_status_value_o,
output       [`SPI2_SPI_QUEUE_STATUS_FLAG_O_WIDTH-1:0]     spi_queue_status_flag_o,
output       [`SPI2_SPI_ARBITRATION_CONTROL_O_WIDTH-1:0]   spi_arbitration_control_o,
output       [`SPI2_SPI_ARBITRATION_CONFIG_O_WIDTH-1:0]    spi_arbitration_config_o,
output       [`SPI2_SPI_ARBITRATION_VALUE_O_WIDTH-1:0]     spi_arbitration_value_o,
output       [`SPI2_SPI_ARBITRATION_FLAG_O_WIDTH-1:0]      spi_arbitration_flag_o,
output       [`SPI2_SPI_ARBITRATION_STATUS_CONTROL_O_WIDTH-1:0] spi_arbitration_status_control_o,
output       [`SPI2_SPI_ARBITRATION_STATUS_CONFIG_O_WIDTH-1:0] spi_arbitration_status_config_o,
output       [`SPI2_SPI_ARBITRATION_STATUS_VALUE_O_WIDTH-1:0] spi_arbitration_status_value_o,
output       [`SPI2_SPI_ARBITRATION_STATUS_FLAG_O_WIDTH-1:0] spi_arbitration_status_flag_o,
output       [`SPI2_SPI_SLAVE_CONFIG_CONTROL_O_WIDTH-1:0]  spi_slave_config_control_o,
output       [`SPI2_SPI_SLAVE_CONFIG_CONFIG_O_WIDTH-1:0]   spi_slave_config_config_o,
output       [`SPI2_SPI_SLAVE_CONFIG_VALUE_O_WIDTH-1:0]    spi_slave_config_value_o,
output       [`SPI2_SPI_SLAVE_CONFIG_FLAG_O_WIDTH-1:0]     spi_slave_config_flag_o,
output       [`SPI2_SPI_SLAVE_STATUS_CONTROL_O_WIDTH-1:0]  spi_slave_status_control_o,
output       [`SPI2_SPI_SLAVE_STATUS_CONFIG_O_WIDTH-1:0]   spi_slave_status_config_o,
output       [`SPI2_SPI_SLAVE_STATUS_VALUE_O_WIDTH-1:0]    spi_slave_status_value_o,
output       [`SPI2_SPI_SLAVE_STATUS_FLAG_O_WIDTH-1:0]     spi_slave_status_flag_o,
output       [`SPI2_SPI_MASTER_CONFIG_CONTROL_O_WIDTH-1:0] spi_master_config_control_o,
output       [`SPI2_SPI_MASTER_CONFIG_CONFIG_O_WIDTH-1:0]  spi_master_config_config_o,
output       [`SPI2_SPI_MASTER_CONFIG_VALUE_O_WIDTH-1:0]   spi_master_config_value_o,
output       [`SPI2_SPI_MASTER_CONFIG_FLAG_O_WIDTH-1:0]    spi_master_config_flag_o,
output       [`SPI2_SPI_MASTER_STATUS_CONTROL_O_WIDTH-1:0] spi_master_status_control_o,
output       [`SPI2_SPI_MASTER_STATUS_CONFIG_O_WIDTH-1:0]  spi_master_status_config_o,
output       [`SPI2_SPI_MASTER_STATUS_VALUE_O_WIDTH-1:0]   spi_master_status_value_o,
output       [`SPI2_SPI_MASTER_STATUS_FLAG_O_WIDTH-1:0]    spi_master_status_flag_o,
output       [`SPI2_SPI_BUS_CONFIG_CONTROL_O_WIDTH-1:0]    spi_bus_config_control_o,
output       [`SPI2_SPI_BUS_CONFIG_CONFIG_O_WIDTH-1:0]     spi_bus_config_config_o,
output       [`SPI2_SPI_BUS_CONFIG_VALUE_O_WIDTH-1:0]      spi_bus_config_value_o,
output       [`SPI2_SPI_BUS_CONFIG_FLAG_O_WIDTH-1:0]       spi_bus_config_flag_o,
output       [`SPI2_SPI_BUS_STATUS_CONTROL_O_WIDTH-1:0]    spi_bus_status_control_o,
output       [`SPI2_SPI_BUS_STATUS_CONFIG_O_WIDTH-1:0]     spi_bus_status_config_o,
output       [`SPI2_SPI_BUS_STATUS_VALUE_O_WIDTH-1:0]      spi_bus_status_value_o,
output       [`SPI2_SPI_BUS_STATUS_FLAG_O_WIDTH-1:0]       spi_bus_status_flag_o,
output       [`SPI2_SPI_INTERFACE_CONFIG_CONTROL_O_WIDTH-1:0] spi_interface_config_control_o,
output       [`SPI2_SPI_INTERFACE_CONFIG_CONFIG_O_WIDTH-1:0] spi_interface_config_config_o,
output       [`SPI2_SPI_INTERFACE_CONFIG_VALUE_O_WIDTH-1:0] spi_interface_config_value_o,
output       [`SPI2_SPI_INTERFACE_CONFIG_FLAG_O_WIDTH-1:0] spi_interface_config_flag_o,
output       [`SPI2_SPI_INTERFACE_STATUS_CONTROL_O_WIDTH-1:0] spi_interface_status_control_o,
output       [`SPI2_SPI_INTERFACE_STATUS_CONFIG_O_WIDTH-1:0] spi_interface_status_config_o,
output       [`SPI2_SPI_INTERFACE_STATUS_VALUE_O_WIDTH-1:0] spi_interface_status_value_o,
output       [`SPI2_SPI_INTERFACE_STATUS_FLAG_O_WIDTH-1:0] spi_interface_status_flag_o,
output       [`SPI2_SPI_VERSION_CONTROL_O_WIDTH-1:0]       spi_version_control_o,
output       [`SPI2_SPI_VERSION_CONFIG_O_WIDTH-1:0]        spi_version_config_o,
output       [`SPI2_SPI_VERSION_VALUE_O_WIDTH-1:0]         spi_version_value_o,
output       [`SPI2_SPI_VERSION_FLAG_O_WIDTH-1:0]          spi_version_flag_o
);

wire wr_enb;
wire rd_enb;
wire addr_valid;

localparam APB_IDLE   = 2'b00;
localparam APB_SETUP  = 2'b01;
localparam APB_ENABLE = 2'b10;

reg [1:0] apb_present_state;
reg [1:0] apb_next_state;

reg  [`SPI2_REG_WIDTH-1:0] spi_control_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_config_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_clock_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_status_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_interrupt_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_fifo_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_tx_config_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_rx_config_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_frame_config_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_mode_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_timing_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_baud_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_prescaler_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_chip_select_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_data_format_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_transfer_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_command_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_response_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_error_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_timeout_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_dma_config_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_dma_status_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_tx_data_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_rx_data_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_tx_status_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_rx_status_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_fifo_control_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_fifo_status_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_tx_threshold_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_rx_threshold_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_interrupt_mask_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_interrupt_status_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_interrupt_clear_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_irq_config_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_event_status_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_error_status_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_error_clear_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_debug_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_debug_control_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_loopback_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_test_mode_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_test_control_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_test_status_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_pattern_config_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_pattern_status_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_sync_config_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_sync_status_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_filter_config_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_filter_status_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_sample_config_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_sample_status_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_drive_config_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_drive_status_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_polarity_config_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_phase_config_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_edge_config_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_clock_gate_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_power_control_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_power_status_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_reset_control_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_reset_status_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_sleep_config_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_wake_status_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_wait_config_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_wait_status_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_frame_count_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_byte_count_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_bit_count_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_transfer_count_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_error_count_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_retry_config_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_retry_status_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_retry_count_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_packet_config_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_packet_status_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_header_config_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_header_status_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_crc_config_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_crc_status_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_crc_result_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_checksum_config_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_checksum_status_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_checksum_result_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_sequence_config_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_sequence_status_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_buffer_config_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_buffer_status_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_queue_control_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_queue_status_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_arbitration_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_arbitration_status_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_slave_config_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_slave_status_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_master_config_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_master_status_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_bus_config_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_bus_status_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_interface_config_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_interface_status_reg;
reg  [`SPI2_REG_WIDTH-1:0] spi_version_reg;

assign wr_enb = psel_i && penable_i && pwrite_i;
assign rd_enb = psel_i && penable_i && !pwrite_i;

assign addr_valid = ((paddr_i == `SPI2_SPI_CONTROL_ADDR) ||
                    (paddr_i == `SPI2_SPI_CONFIG_ADDR) ||
                    (paddr_i == `SPI2_SPI_CLOCK_ADDR) ||
                    (paddr_i == `SPI2_SPI_STATUS_ADDR) ||
                    (paddr_i == `SPI2_SPI_INTERRUPT_ADDR) ||
                    (paddr_i == `SPI2_SPI_FIFO_ADDR) ||
                    (paddr_i == `SPI2_SPI_TX_CONFIG_ADDR) ||
                    (paddr_i == `SPI2_SPI_RX_CONFIG_ADDR) ||
                    (paddr_i == `SPI2_SPI_FRAME_CONFIG_ADDR) ||
                    (paddr_i == `SPI2_SPI_MODE_ADDR) ||
                    (paddr_i == `SPI2_SPI_TIMING_ADDR) ||
                    (paddr_i == `SPI2_SPI_BAUD_ADDR) ||
                    (paddr_i == `SPI2_SPI_PRESCALER_ADDR) ||
                    (paddr_i == `SPI2_SPI_CHIP_SELECT_ADDR) ||
                    (paddr_i == `SPI2_SPI_DATA_FORMAT_ADDR) ||
                    (paddr_i == `SPI2_SPI_TRANSFER_ADDR) ||
                    (paddr_i == `SPI2_SPI_COMMAND_ADDR) ||
                    (paddr_i == `SPI2_SPI_RESPONSE_ADDR) ||
                    (paddr_i == `SPI2_SPI_ERROR_ADDR) ||
                    (paddr_i == `SPI2_SPI_TIMEOUT_ADDR) ||
                    (paddr_i == `SPI2_SPI_DMA_CONFIG_ADDR) ||
                    (paddr_i == `SPI2_SPI_DMA_STATUS_ADDR) ||
                    (paddr_i == `SPI2_SPI_TX_DATA_ADDR) ||
                    (paddr_i == `SPI2_SPI_RX_DATA_ADDR) ||
                    (paddr_i == `SPI2_SPI_TX_STATUS_ADDR) ||
                    (paddr_i == `SPI2_SPI_RX_STATUS_ADDR) ||
                    (paddr_i == `SPI2_SPI_FIFO_CONTROL_ADDR) ||
                    (paddr_i == `SPI2_SPI_FIFO_STATUS_ADDR) ||
                    (paddr_i == `SPI2_SPI_TX_THRESHOLD_ADDR) ||
                    (paddr_i == `SPI2_SPI_RX_THRESHOLD_ADDR) ||
                    (paddr_i == `SPI2_SPI_INTERRUPT_MASK_ADDR) ||
                    (paddr_i == `SPI2_SPI_INTERRUPT_STATUS_ADDR) ||
                    (paddr_i == `SPI2_SPI_INTERRUPT_CLEAR_ADDR) ||
                    (paddr_i == `SPI2_SPI_IRQ_CONFIG_ADDR) ||
                    (paddr_i == `SPI2_SPI_EVENT_STATUS_ADDR) ||
                    (paddr_i == `SPI2_SPI_ERROR_STATUS_ADDR) ||
                    (paddr_i == `SPI2_SPI_ERROR_CLEAR_ADDR) ||
                    (paddr_i == `SPI2_SPI_DEBUG_ADDR) ||
                    (paddr_i == `SPI2_SPI_DEBUG_CONTROL_ADDR) ||
                    (paddr_i == `SPI2_SPI_LOOPBACK_ADDR) ||
                    (paddr_i == `SPI2_SPI_TEST_MODE_ADDR) ||
                    (paddr_i == `SPI2_SPI_TEST_CONTROL_ADDR) ||
                    (paddr_i == `SPI2_SPI_TEST_STATUS_ADDR) ||
                    (paddr_i == `SPI2_SPI_PATTERN_CONFIG_ADDR) ||
                    (paddr_i == `SPI2_SPI_PATTERN_STATUS_ADDR) ||
                    (paddr_i == `SPI2_SPI_SYNC_CONFIG_ADDR) ||
                    (paddr_i == `SPI2_SPI_SYNC_STATUS_ADDR) ||
                    (paddr_i == `SPI2_SPI_FILTER_CONFIG_ADDR) ||
                    (paddr_i == `SPI2_SPI_FILTER_STATUS_ADDR) ||
                    (paddr_i == `SPI2_SPI_SAMPLE_CONFIG_ADDR) ||
                    (paddr_i == `SPI2_SPI_SAMPLE_STATUS_ADDR) ||
                    (paddr_i == `SPI2_SPI_DRIVE_CONFIG_ADDR) ||
                    (paddr_i == `SPI2_SPI_DRIVE_STATUS_ADDR) ||
                    (paddr_i == `SPI2_SPI_POLARITY_CONFIG_ADDR) ||
                    (paddr_i == `SPI2_SPI_PHASE_CONFIG_ADDR) ||
                    (paddr_i == `SPI2_SPI_EDGE_CONFIG_ADDR) ||
                    (paddr_i == `SPI2_SPI_CLOCK_GATE_ADDR) ||
                    (paddr_i == `SPI2_SPI_POWER_CONTROL_ADDR) ||
                    (paddr_i == `SPI2_SPI_POWER_STATUS_ADDR) ||
                    (paddr_i == `SPI2_SPI_RESET_CONTROL_ADDR) ||
                    (paddr_i == `SPI2_SPI_RESET_STATUS_ADDR) ||
                    (paddr_i == `SPI2_SPI_SLEEP_CONFIG_ADDR) ||
                    (paddr_i == `SPI2_SPI_WAKE_STATUS_ADDR) ||
                    (paddr_i == `SPI2_SPI_WAIT_CONFIG_ADDR) ||
                    (paddr_i == `SPI2_SPI_WAIT_STATUS_ADDR) ||
                    (paddr_i == `SPI2_SPI_FRAME_COUNT_ADDR) ||
                    (paddr_i == `SPI2_SPI_BYTE_COUNT_ADDR) ||
                    (paddr_i == `SPI2_SPI_BIT_COUNT_ADDR) ||
                    (paddr_i == `SPI2_SPI_TRANSFER_COUNT_ADDR) ||
                    (paddr_i == `SPI2_SPI_ERROR_COUNT_ADDR) ||
                    (paddr_i == `SPI2_SPI_RETRY_CONFIG_ADDR) ||
                    (paddr_i == `SPI2_SPI_RETRY_STATUS_ADDR) ||
                    (paddr_i == `SPI2_SPI_RETRY_COUNT_ADDR) ||
                    (paddr_i == `SPI2_SPI_PACKET_CONFIG_ADDR) ||
                    (paddr_i == `SPI2_SPI_PACKET_STATUS_ADDR) ||
                    (paddr_i == `SPI2_SPI_HEADER_CONFIG_ADDR) ||
                    (paddr_i == `SPI2_SPI_HEADER_STATUS_ADDR) ||
                    (paddr_i == `SPI2_SPI_CRC_CONFIG_ADDR) ||
                    (paddr_i == `SPI2_SPI_CRC_STATUS_ADDR) ||
                    (paddr_i == `SPI2_SPI_CRC_RESULT_ADDR) ||
                    (paddr_i == `SPI2_SPI_CHECKSUM_CONFIG_ADDR) ||
                    (paddr_i == `SPI2_SPI_CHECKSUM_STATUS_ADDR) ||
                    (paddr_i == `SPI2_SPI_CHECKSUM_RESULT_ADDR) ||
                    (paddr_i == `SPI2_SPI_SEQUENCE_CONFIG_ADDR) ||
                    (paddr_i == `SPI2_SPI_SEQUENCE_STATUS_ADDR) ||
                    (paddr_i == `SPI2_SPI_BUFFER_CONFIG_ADDR) ||
                    (paddr_i == `SPI2_SPI_BUFFER_STATUS_ADDR) ||
                    (paddr_i == `SPI2_SPI_QUEUE_CONTROL_ADDR) ||
                    (paddr_i == `SPI2_SPI_QUEUE_STATUS_ADDR) ||
                    (paddr_i == `SPI2_SPI_ARBITRATION_ADDR) ||
                    (paddr_i == `SPI2_SPI_ARBITRATION_STATUS_ADDR) ||
                    (paddr_i == `SPI2_SPI_SLAVE_CONFIG_ADDR) ||
                    (paddr_i == `SPI2_SPI_SLAVE_STATUS_ADDR) ||
                    (paddr_i == `SPI2_SPI_MASTER_CONFIG_ADDR) ||
                    (paddr_i == `SPI2_SPI_MASTER_STATUS_ADDR) ||
                    (paddr_i == `SPI2_SPI_BUS_CONFIG_ADDR) ||
                    (paddr_i == `SPI2_SPI_BUS_STATUS_ADDR) ||
                    (paddr_i == `SPI2_SPI_INTERFACE_CONFIG_ADDR) ||
                    (paddr_i == `SPI2_SPI_INTERFACE_STATUS_ADDR) ||
                    (paddr_i == `SPI2_SPI_VERSION_ADDR));

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
// Register writes 
//----------------------------------------------------------------------
always @(posedge pclk or negedge preset_n)
begin
   if (preset_n == 1'b0)
   begin
      spi_control_reg <= `SPI2_SPI_CONTROL_RST;
      spi_config_reg <= `SPI2_SPI_CONFIG_RST;
      spi_clock_reg <= `SPI2_SPI_CLOCK_RST;
      spi_status_reg <= `SPI2_SPI_STATUS_RST;
      spi_interrupt_reg <= `SPI2_SPI_INTERRUPT_RST;
      spi_fifo_reg <= `SPI2_SPI_FIFO_RST;
      spi_tx_config_reg <= `SPI2_SPI_TX_CONFIG_RST;
      spi_rx_config_reg <= `SPI2_SPI_RX_CONFIG_RST;
      spi_frame_config_reg <= `SPI2_SPI_FRAME_CONFIG_RST;
      spi_mode_reg <= `SPI2_SPI_MODE_RST;
      spi_timing_reg <= `SPI2_SPI_TIMING_RST;
      spi_baud_reg <= `SPI2_SPI_BAUD_RST;
      spi_prescaler_reg <= `SPI2_SPI_PRESCALER_RST;
      spi_chip_select_reg <= `SPI2_SPI_CHIP_SELECT_RST;
      spi_data_format_reg <= `SPI2_SPI_DATA_FORMAT_RST;
      spi_transfer_reg <= `SPI2_SPI_TRANSFER_RST;
      spi_command_reg <= `SPI2_SPI_COMMAND_RST;
      spi_response_reg <= `SPI2_SPI_RESPONSE_RST;
      spi_error_reg <= `SPI2_SPI_ERROR_RST;
      spi_timeout_reg <= `SPI2_SPI_TIMEOUT_RST;
      spi_dma_config_reg <= `SPI2_SPI_DMA_CONFIG_RST;
      spi_dma_status_reg <= `SPI2_SPI_DMA_STATUS_RST;
      spi_tx_data_reg <= `SPI2_SPI_TX_DATA_RST;
      spi_rx_data_reg <= `SPI2_SPI_RX_DATA_RST;
      spi_tx_status_reg <= `SPI2_SPI_TX_STATUS_RST;
      spi_rx_status_reg <= `SPI2_SPI_RX_STATUS_RST;
      spi_fifo_control_reg <= `SPI2_SPI_FIFO_CONTROL_RST;
      spi_fifo_status_reg <= `SPI2_SPI_FIFO_STATUS_RST;
      spi_tx_threshold_reg <= `SPI2_SPI_TX_THRESHOLD_RST;
      spi_rx_threshold_reg <= `SPI2_SPI_RX_THRESHOLD_RST;
      spi_interrupt_mask_reg <= `SPI2_SPI_INTERRUPT_MASK_RST;
      spi_interrupt_status_reg <= `SPI2_SPI_INTERRUPT_STATUS_RST;
      spi_interrupt_clear_reg <= `SPI2_SPI_INTERRUPT_CLEAR_RST;
      spi_irq_config_reg <= `SPI2_SPI_IRQ_CONFIG_RST;
      spi_event_status_reg <= `SPI2_SPI_EVENT_STATUS_RST;
      spi_error_status_reg <= `SPI2_SPI_ERROR_STATUS_RST;
      spi_error_clear_reg <= `SPI2_SPI_ERROR_CLEAR_RST;
      spi_debug_reg <= `SPI2_SPI_DEBUG_RST;
      spi_debug_control_reg <= `SPI2_SPI_DEBUG_CONTROL_RST;
      spi_loopback_reg <= `SPI2_SPI_LOOPBACK_RST;
      spi_test_mode_reg <= `SPI2_SPI_TEST_MODE_RST;
      spi_test_control_reg <= `SPI2_SPI_TEST_CONTROL_RST;
      spi_test_status_reg <= `SPI2_SPI_TEST_STATUS_RST;
      spi_pattern_config_reg <= `SPI2_SPI_PATTERN_CONFIG_RST;
      spi_pattern_status_reg <= `SPI2_SPI_PATTERN_STATUS_RST;
      spi_sync_config_reg <= `SPI2_SPI_SYNC_CONFIG_RST;
      spi_sync_status_reg <= `SPI2_SPI_SYNC_STATUS_RST;
      spi_filter_config_reg <= `SPI2_SPI_FILTER_CONFIG_RST;
      spi_filter_status_reg <= `SPI2_SPI_FILTER_STATUS_RST;
      spi_sample_config_reg <= `SPI2_SPI_SAMPLE_CONFIG_RST;
      spi_sample_status_reg <= `SPI2_SPI_SAMPLE_STATUS_RST;
      spi_drive_config_reg <= `SPI2_SPI_DRIVE_CONFIG_RST;
      spi_drive_status_reg <= `SPI2_SPI_DRIVE_STATUS_RST;
      spi_polarity_config_reg <= `SPI2_SPI_POLARITY_CONFIG_RST;
      spi_phase_config_reg <= `SPI2_SPI_PHASE_CONFIG_RST;
      spi_edge_config_reg <= `SPI2_SPI_EDGE_CONFIG_RST;
      spi_clock_gate_reg <= `SPI2_SPI_CLOCK_GATE_RST;
      spi_power_control_reg <= `SPI2_SPI_POWER_CONTROL_RST;
      spi_power_status_reg <= `SPI2_SPI_POWER_STATUS_RST;
      spi_reset_control_reg <= `SPI2_SPI_RESET_CONTROL_RST;
      spi_reset_status_reg <= `SPI2_SPI_RESET_STATUS_RST;
      spi_sleep_config_reg <= `SPI2_SPI_SLEEP_CONFIG_RST;
      spi_wake_status_reg <= `SPI2_SPI_WAKE_STATUS_RST;
      spi_wait_config_reg <= `SPI2_SPI_WAIT_CONFIG_RST;
      spi_wait_status_reg <= `SPI2_SPI_WAIT_STATUS_RST;
      spi_frame_count_reg <= `SPI2_SPI_FRAME_COUNT_RST;
      spi_byte_count_reg <= `SPI2_SPI_BYTE_COUNT_RST;
      spi_bit_count_reg <= `SPI2_SPI_BIT_COUNT_RST;
      spi_transfer_count_reg <= `SPI2_SPI_TRANSFER_COUNT_RST;
      spi_error_count_reg <= `SPI2_SPI_ERROR_COUNT_RST;
      spi_retry_config_reg <= `SPI2_SPI_RETRY_CONFIG_RST;
      spi_retry_status_reg <= `SPI2_SPI_RETRY_STATUS_RST;
      spi_retry_count_reg <= `SPI2_SPI_RETRY_COUNT_RST;
      spi_packet_config_reg <= `SPI2_SPI_PACKET_CONFIG_RST;
      spi_packet_status_reg <= `SPI2_SPI_PACKET_STATUS_RST;
      spi_header_config_reg <= `SPI2_SPI_HEADER_CONFIG_RST;
      spi_header_status_reg <= `SPI2_SPI_HEADER_STATUS_RST;
      spi_crc_config_reg <= `SPI2_SPI_CRC_CONFIG_RST;
      spi_crc_status_reg <= `SPI2_SPI_CRC_STATUS_RST;
      spi_crc_result_reg <= `SPI2_SPI_CRC_RESULT_RST;
      spi_checksum_config_reg <= `SPI2_SPI_CHECKSUM_CONFIG_RST;
      spi_checksum_status_reg <= `SPI2_SPI_CHECKSUM_STATUS_RST;
      spi_checksum_result_reg <= `SPI2_SPI_CHECKSUM_RESULT_RST;
      spi_sequence_config_reg <= `SPI2_SPI_SEQUENCE_CONFIG_RST;
      spi_sequence_status_reg <= `SPI2_SPI_SEQUENCE_STATUS_RST;
      spi_buffer_config_reg <= `SPI2_SPI_BUFFER_CONFIG_RST;
      spi_buffer_status_reg <= `SPI2_SPI_BUFFER_STATUS_RST;
      spi_queue_control_reg <= `SPI2_SPI_QUEUE_CONTROL_RST;
      spi_queue_status_reg <= `SPI2_SPI_QUEUE_STATUS_RST;
      spi_arbitration_reg <= `SPI2_SPI_ARBITRATION_RST;
      spi_arbitration_status_reg <= `SPI2_SPI_ARBITRATION_STATUS_RST;
      spi_slave_config_reg <= `SPI2_SPI_SLAVE_CONFIG_RST;
      spi_slave_status_reg <= `SPI2_SPI_SLAVE_STATUS_RST;
      spi_master_config_reg <= `SPI2_SPI_MASTER_CONFIG_RST;
      spi_master_status_reg <= `SPI2_SPI_MASTER_STATUS_RST;
      spi_bus_config_reg <= `SPI2_SPI_BUS_CONFIG_RST;
      spi_bus_status_reg <= `SPI2_SPI_BUS_STATUS_RST;
      spi_interface_config_reg <= `SPI2_SPI_INTERFACE_CONFIG_RST;
      spi_interface_status_reg <= `SPI2_SPI_INTERFACE_STATUS_RST;
      spi_version_reg <= `SPI2_SPI_VERSION_RST;
   end
   
   else
   begin
      if (wr_enb && (paddr_i == `SPI2_SPI_CONTROL_ADDR))
      begin
         spi_control_reg <= pwdata_i & `SPI2_SPI_CONTROL_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_CONFIG_ADDR))
      begin
         spi_config_reg <= pwdata_i & `SPI2_SPI_CONFIG_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_CLOCK_ADDR))
      begin
         spi_clock_reg <= pwdata_i & `SPI2_SPI_CLOCK_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_STATUS_ADDR))
      begin
         spi_status_reg <= pwdata_i & `SPI2_SPI_STATUS_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_INTERRUPT_ADDR))
      begin
         spi_interrupt_reg <= pwdata_i & `SPI2_SPI_INTERRUPT_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_FIFO_ADDR))
      begin
         spi_fifo_reg <= pwdata_i & `SPI2_SPI_FIFO_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_TX_CONFIG_ADDR))
      begin
         spi_tx_config_reg <= pwdata_i & `SPI2_SPI_TX_CONFIG_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_RX_CONFIG_ADDR))
      begin
         spi_rx_config_reg <= pwdata_i & `SPI2_SPI_RX_CONFIG_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_FRAME_CONFIG_ADDR))
      begin
         spi_frame_config_reg <= pwdata_i & `SPI2_SPI_FRAME_CONFIG_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_MODE_ADDR))
      begin
         spi_mode_reg <= pwdata_i & `SPI2_SPI_MODE_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_TIMING_ADDR))
      begin
         spi_timing_reg <= pwdata_i & `SPI2_SPI_TIMING_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_BAUD_ADDR))
      begin
         spi_baud_reg <= pwdata_i & `SPI2_SPI_BAUD_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_PRESCALER_ADDR))
      begin
         spi_prescaler_reg <= pwdata_i & `SPI2_SPI_PRESCALER_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_CHIP_SELECT_ADDR))
      begin
         spi_chip_select_reg <= pwdata_i & `SPI2_SPI_CHIP_SELECT_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_DATA_FORMAT_ADDR))
      begin
         spi_data_format_reg <= pwdata_i & `SPI2_SPI_DATA_FORMAT_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_TRANSFER_ADDR))
      begin
         spi_transfer_reg <= pwdata_i & `SPI2_SPI_TRANSFER_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_COMMAND_ADDR))
      begin
         spi_command_reg <= pwdata_i & `SPI2_SPI_COMMAND_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_RESPONSE_ADDR))
      begin
         spi_response_reg <= pwdata_i & `SPI2_SPI_RESPONSE_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_ERROR_ADDR))
      begin
         spi_error_reg <= pwdata_i & `SPI2_SPI_ERROR_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_TIMEOUT_ADDR))
      begin
         spi_timeout_reg <= pwdata_i & `SPI2_SPI_TIMEOUT_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_DMA_CONFIG_ADDR))
      begin
         spi_dma_config_reg <= pwdata_i & `SPI2_SPI_DMA_CONFIG_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_DMA_STATUS_ADDR))
      begin
         spi_dma_status_reg <= pwdata_i & `SPI2_SPI_DMA_STATUS_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_TX_DATA_ADDR))
      begin
         spi_tx_data_reg <= pwdata_i & `SPI2_SPI_TX_DATA_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_RX_DATA_ADDR))
      begin
         spi_rx_data_reg <= pwdata_i & `SPI2_SPI_RX_DATA_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_TX_STATUS_ADDR))
      begin
         spi_tx_status_reg <= pwdata_i & `SPI2_SPI_TX_STATUS_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_RX_STATUS_ADDR))
      begin
         spi_rx_status_reg <= pwdata_i & `SPI2_SPI_RX_STATUS_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_FIFO_CONTROL_ADDR))
      begin
         spi_fifo_control_reg <= pwdata_i & `SPI2_SPI_FIFO_CONTROL_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_FIFO_STATUS_ADDR))
      begin
         spi_fifo_status_reg <= pwdata_i & `SPI2_SPI_FIFO_STATUS_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_TX_THRESHOLD_ADDR))
      begin
         spi_tx_threshold_reg <= pwdata_i & `SPI2_SPI_TX_THRESHOLD_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_RX_THRESHOLD_ADDR))
      begin
         spi_rx_threshold_reg <= pwdata_i & `SPI2_SPI_RX_THRESHOLD_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_INTERRUPT_MASK_ADDR))
      begin
         spi_interrupt_mask_reg <= pwdata_i & `SPI2_SPI_INTERRUPT_MASK_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_INTERRUPT_STATUS_ADDR))
      begin
         spi_interrupt_status_reg <= pwdata_i & `SPI2_SPI_INTERRUPT_STATUS_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_INTERRUPT_CLEAR_ADDR))
      begin
         spi_interrupt_clear_reg <= pwdata_i & `SPI2_SPI_INTERRUPT_CLEAR_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_IRQ_CONFIG_ADDR))
      begin
         spi_irq_config_reg <= pwdata_i & `SPI2_SPI_IRQ_CONFIG_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_EVENT_STATUS_ADDR))
      begin
         spi_event_status_reg <= pwdata_i & `SPI2_SPI_EVENT_STATUS_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_ERROR_STATUS_ADDR))
      begin
         spi_error_status_reg <= pwdata_i & `SPI2_SPI_ERROR_STATUS_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_ERROR_CLEAR_ADDR))
      begin
         spi_error_clear_reg <= pwdata_i & `SPI2_SPI_ERROR_CLEAR_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_DEBUG_ADDR))
      begin
         spi_debug_reg <= pwdata_i & `SPI2_SPI_DEBUG_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_DEBUG_CONTROL_ADDR))
      begin
         spi_debug_control_reg <= pwdata_i & `SPI2_SPI_DEBUG_CONTROL_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_LOOPBACK_ADDR))
      begin
         spi_loopback_reg <= pwdata_i & `SPI2_SPI_LOOPBACK_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_TEST_MODE_ADDR))
      begin
         spi_test_mode_reg <= pwdata_i & `SPI2_SPI_TEST_MODE_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_TEST_CONTROL_ADDR))
      begin
         spi_test_control_reg <= pwdata_i & `SPI2_SPI_TEST_CONTROL_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_TEST_STATUS_ADDR))
      begin
         spi_test_status_reg <= pwdata_i & `SPI2_SPI_TEST_STATUS_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_PATTERN_CONFIG_ADDR))
      begin
         spi_pattern_config_reg <= pwdata_i & `SPI2_SPI_PATTERN_CONFIG_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_PATTERN_STATUS_ADDR))
      begin
         spi_pattern_status_reg <= pwdata_i & `SPI2_SPI_PATTERN_STATUS_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_SYNC_CONFIG_ADDR))
      begin
         spi_sync_config_reg <= pwdata_i & `SPI2_SPI_SYNC_CONFIG_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_SYNC_STATUS_ADDR))
      begin
         spi_sync_status_reg <= pwdata_i & `SPI2_SPI_SYNC_STATUS_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_FILTER_CONFIG_ADDR))
      begin
         spi_filter_config_reg <= pwdata_i & `SPI2_SPI_FILTER_CONFIG_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_FILTER_STATUS_ADDR))
      begin
         spi_filter_status_reg <= pwdata_i & `SPI2_SPI_FILTER_STATUS_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_SAMPLE_CONFIG_ADDR))
      begin
         spi_sample_config_reg <= pwdata_i & `SPI2_SPI_SAMPLE_CONFIG_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_SAMPLE_STATUS_ADDR))
      begin
         spi_sample_status_reg <= pwdata_i & `SPI2_SPI_SAMPLE_STATUS_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_DRIVE_CONFIG_ADDR))
      begin
         spi_drive_config_reg <= pwdata_i & `SPI2_SPI_DRIVE_CONFIG_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_DRIVE_STATUS_ADDR))
      begin
         spi_drive_status_reg <= pwdata_i & `SPI2_SPI_DRIVE_STATUS_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_POLARITY_CONFIG_ADDR))
      begin
         spi_polarity_config_reg <= pwdata_i & `SPI2_SPI_POLARITY_CONFIG_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_PHASE_CONFIG_ADDR))
      begin
         spi_phase_config_reg <= pwdata_i & `SPI2_SPI_PHASE_CONFIG_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_EDGE_CONFIG_ADDR))
      begin
         spi_edge_config_reg <= pwdata_i & `SPI2_SPI_EDGE_CONFIG_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_CLOCK_GATE_ADDR))
      begin
         spi_clock_gate_reg <= pwdata_i & `SPI2_SPI_CLOCK_GATE_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_POWER_CONTROL_ADDR))
      begin
         spi_power_control_reg <= pwdata_i & `SPI2_SPI_POWER_CONTROL_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_POWER_STATUS_ADDR))
      begin
         spi_power_status_reg <= pwdata_i & `SPI2_SPI_POWER_STATUS_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_RESET_CONTROL_ADDR))
      begin
         spi_reset_control_reg <= pwdata_i & `SPI2_SPI_RESET_CONTROL_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_RESET_STATUS_ADDR))
      begin
         spi_reset_status_reg <= pwdata_i & `SPI2_SPI_RESET_STATUS_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_SLEEP_CONFIG_ADDR))
      begin
         spi_sleep_config_reg <= pwdata_i & `SPI2_SPI_SLEEP_CONFIG_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_WAKE_STATUS_ADDR))
      begin
         spi_wake_status_reg <= pwdata_i & `SPI2_SPI_WAKE_STATUS_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_WAIT_CONFIG_ADDR))
      begin
         spi_wait_config_reg <= pwdata_i & `SPI2_SPI_WAIT_CONFIG_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_WAIT_STATUS_ADDR))
      begin
         spi_wait_status_reg <= pwdata_i & `SPI2_SPI_WAIT_STATUS_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_FRAME_COUNT_ADDR))
      begin
         spi_frame_count_reg <= pwdata_i & `SPI2_SPI_FRAME_COUNT_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_BYTE_COUNT_ADDR))
      begin
         spi_byte_count_reg <= pwdata_i & `SPI2_SPI_BYTE_COUNT_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_BIT_COUNT_ADDR))
      begin
         spi_bit_count_reg <= pwdata_i & `SPI2_SPI_BIT_COUNT_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_TRANSFER_COUNT_ADDR))
      begin
         spi_transfer_count_reg <= pwdata_i & `SPI2_SPI_TRANSFER_COUNT_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_ERROR_COUNT_ADDR))
      begin
         spi_error_count_reg <= pwdata_i & `SPI2_SPI_ERROR_COUNT_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_RETRY_CONFIG_ADDR))
      begin
         spi_retry_config_reg <= pwdata_i & `SPI2_SPI_RETRY_CONFIG_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_RETRY_STATUS_ADDR))
      begin
         spi_retry_status_reg <= pwdata_i & `SPI2_SPI_RETRY_STATUS_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_RETRY_COUNT_ADDR))
      begin
         spi_retry_count_reg <= pwdata_i & `SPI2_SPI_RETRY_COUNT_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_PACKET_CONFIG_ADDR))
      begin
         spi_packet_config_reg <= pwdata_i & `SPI2_SPI_PACKET_CONFIG_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_PACKET_STATUS_ADDR))
      begin
         spi_packet_status_reg <= pwdata_i & `SPI2_SPI_PACKET_STATUS_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_HEADER_CONFIG_ADDR))
      begin
         spi_header_config_reg <= pwdata_i & `SPI2_SPI_HEADER_CONFIG_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_HEADER_STATUS_ADDR))
      begin
         spi_header_status_reg <= pwdata_i & `SPI2_SPI_HEADER_STATUS_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_CRC_CONFIG_ADDR))
      begin
         spi_crc_config_reg <= pwdata_i & `SPI2_SPI_CRC_CONFIG_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_CRC_STATUS_ADDR))
      begin
         spi_crc_status_reg <= pwdata_i & `SPI2_SPI_CRC_STATUS_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_CRC_RESULT_ADDR))
      begin
         spi_crc_result_reg <= pwdata_i & `SPI2_SPI_CRC_RESULT_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_CHECKSUM_CONFIG_ADDR))
      begin
         spi_checksum_config_reg <= pwdata_i & `SPI2_SPI_CHECKSUM_CONFIG_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_CHECKSUM_STATUS_ADDR))
      begin
         spi_checksum_status_reg <= pwdata_i & `SPI2_SPI_CHECKSUM_STATUS_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_CHECKSUM_RESULT_ADDR))
      begin
         spi_checksum_result_reg <= pwdata_i & `SPI2_SPI_CHECKSUM_RESULT_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_SEQUENCE_CONFIG_ADDR))
      begin
         spi_sequence_config_reg <= pwdata_i & `SPI2_SPI_SEQUENCE_CONFIG_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_SEQUENCE_STATUS_ADDR))
      begin
         spi_sequence_status_reg <= pwdata_i & `SPI2_SPI_SEQUENCE_STATUS_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_BUFFER_CONFIG_ADDR))
      begin
         spi_buffer_config_reg <= pwdata_i & `SPI2_SPI_BUFFER_CONFIG_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_BUFFER_STATUS_ADDR))
      begin
         spi_buffer_status_reg <= pwdata_i & `SPI2_SPI_BUFFER_STATUS_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_QUEUE_CONTROL_ADDR))
      begin
         spi_queue_control_reg <= pwdata_i & `SPI2_SPI_QUEUE_CONTROL_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_QUEUE_STATUS_ADDR))
      begin
         spi_queue_status_reg <= pwdata_i & `SPI2_SPI_QUEUE_STATUS_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_ARBITRATION_ADDR))
      begin
         spi_arbitration_reg <= pwdata_i & `SPI2_SPI_ARBITRATION_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_ARBITRATION_STATUS_ADDR))
      begin
         spi_arbitration_status_reg <= pwdata_i & `SPI2_SPI_ARBITRATION_STATUS_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_SLAVE_CONFIG_ADDR))
      begin
         spi_slave_config_reg <= pwdata_i & `SPI2_SPI_SLAVE_CONFIG_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_SLAVE_STATUS_ADDR))
      begin
         spi_slave_status_reg <= pwdata_i & `SPI2_SPI_SLAVE_STATUS_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_MASTER_CONFIG_ADDR))
      begin
         spi_master_config_reg <= pwdata_i & `SPI2_SPI_MASTER_CONFIG_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_MASTER_STATUS_ADDR))
      begin
         spi_master_status_reg <= pwdata_i & `SPI2_SPI_MASTER_STATUS_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_BUS_CONFIG_ADDR))
      begin
         spi_bus_config_reg <= pwdata_i & `SPI2_SPI_BUS_CONFIG_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_BUS_STATUS_ADDR))
      begin
         spi_bus_status_reg <= pwdata_i & `SPI2_SPI_BUS_STATUS_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_INTERFACE_CONFIG_ADDR))
      begin
         spi_interface_config_reg <= pwdata_i & `SPI2_SPI_INTERFACE_CONFIG_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_INTERFACE_STATUS_ADDR))
      begin
         spi_interface_status_reg <= pwdata_i & `SPI2_SPI_INTERFACE_STATUS_MASK;
      end

      else if (wr_enb && (paddr_i == `SPI2_SPI_VERSION_ADDR))
      begin
         spi_version_reg <= pwdata_i & `SPI2_SPI_VERSION_MASK;
      end

   end
end

//----------------------------------------------------------------------
// Read-only register  
//----------------------------------------------------------------------
//----------------------------------------------------------------------
// Register reads 
//----------------------------------------------------------------------
always @(*)
begin
   if (rd_enb && (paddr_i == `SPI2_SPI_CONTROL_ADDR))
   begin
      prdata_o = spi_control_reg & `SPI2_SPI_CONTROL_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_CONFIG_ADDR))
   begin
      prdata_o = spi_config_reg & `SPI2_SPI_CONFIG_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_CLOCK_ADDR))
   begin
      prdata_o = spi_clock_reg & `SPI2_SPI_CLOCK_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_STATUS_ADDR))
   begin
      prdata_o = spi_status_reg & `SPI2_SPI_STATUS_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_INTERRUPT_ADDR))
   begin
      prdata_o = spi_interrupt_reg & `SPI2_SPI_INTERRUPT_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_FIFO_ADDR))
   begin
      prdata_o = spi_fifo_reg & `SPI2_SPI_FIFO_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_TX_CONFIG_ADDR))
   begin
      prdata_o = spi_tx_config_reg & `SPI2_SPI_TX_CONFIG_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_RX_CONFIG_ADDR))
   begin
      prdata_o = spi_rx_config_reg & `SPI2_SPI_RX_CONFIG_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_FRAME_CONFIG_ADDR))
   begin
      prdata_o = spi_frame_config_reg & `SPI2_SPI_FRAME_CONFIG_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_MODE_ADDR))
   begin
      prdata_o = spi_mode_reg & `SPI2_SPI_MODE_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_TIMING_ADDR))
   begin
      prdata_o = spi_timing_reg & `SPI2_SPI_TIMING_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_BAUD_ADDR))
   begin
      prdata_o = spi_baud_reg & `SPI2_SPI_BAUD_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_PRESCALER_ADDR))
   begin
      prdata_o = spi_prescaler_reg & `SPI2_SPI_PRESCALER_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_CHIP_SELECT_ADDR))
   begin
      prdata_o = spi_chip_select_reg & `SPI2_SPI_CHIP_SELECT_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_DATA_FORMAT_ADDR))
   begin
      prdata_o = spi_data_format_reg & `SPI2_SPI_DATA_FORMAT_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_TRANSFER_ADDR))
   begin
      prdata_o = spi_transfer_reg & `SPI2_SPI_TRANSFER_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_COMMAND_ADDR))
   begin
      prdata_o = spi_command_reg & `SPI2_SPI_COMMAND_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_RESPONSE_ADDR))
   begin
      prdata_o = spi_response_reg & `SPI2_SPI_RESPONSE_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_ERROR_ADDR))
   begin
      prdata_o = spi_error_reg & `SPI2_SPI_ERROR_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_TIMEOUT_ADDR))
   begin
      prdata_o = spi_timeout_reg & `SPI2_SPI_TIMEOUT_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_DMA_CONFIG_ADDR))
   begin
      prdata_o = spi_dma_config_reg & `SPI2_SPI_DMA_CONFIG_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_DMA_STATUS_ADDR))
   begin
      prdata_o = spi_dma_status_reg & `SPI2_SPI_DMA_STATUS_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_TX_DATA_ADDR))
   begin
      prdata_o = spi_tx_data_reg & `SPI2_SPI_TX_DATA_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_RX_DATA_ADDR))
   begin
      prdata_o = spi_rx_data_reg & `SPI2_SPI_RX_DATA_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_TX_STATUS_ADDR))
   begin
      prdata_o = spi_tx_status_reg & `SPI2_SPI_TX_STATUS_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_RX_STATUS_ADDR))
   begin
      prdata_o = spi_rx_status_reg & `SPI2_SPI_RX_STATUS_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_FIFO_CONTROL_ADDR))
   begin
      prdata_o = spi_fifo_control_reg & `SPI2_SPI_FIFO_CONTROL_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_FIFO_STATUS_ADDR))
   begin
      prdata_o = spi_fifo_status_reg & `SPI2_SPI_FIFO_STATUS_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_TX_THRESHOLD_ADDR))
   begin
      prdata_o = spi_tx_threshold_reg & `SPI2_SPI_TX_THRESHOLD_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_RX_THRESHOLD_ADDR))
   begin
      prdata_o = spi_rx_threshold_reg & `SPI2_SPI_RX_THRESHOLD_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_INTERRUPT_MASK_ADDR))
   begin
      prdata_o = spi_interrupt_mask_reg & `SPI2_SPI_INTERRUPT_MASK_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_INTERRUPT_STATUS_ADDR))
   begin
      prdata_o = spi_interrupt_status_reg & `SPI2_SPI_INTERRUPT_STATUS_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_INTERRUPT_CLEAR_ADDR))
   begin
      prdata_o = spi_interrupt_clear_reg & `SPI2_SPI_INTERRUPT_CLEAR_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_IRQ_CONFIG_ADDR))
   begin
      prdata_o = spi_irq_config_reg & `SPI2_SPI_IRQ_CONFIG_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_EVENT_STATUS_ADDR))
   begin
      prdata_o = spi_event_status_reg & `SPI2_SPI_EVENT_STATUS_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_ERROR_STATUS_ADDR))
   begin
      prdata_o = spi_error_status_reg & `SPI2_SPI_ERROR_STATUS_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_ERROR_CLEAR_ADDR))
   begin
      prdata_o = spi_error_clear_reg & `SPI2_SPI_ERROR_CLEAR_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_DEBUG_ADDR))
   begin
      prdata_o = spi_debug_reg & `SPI2_SPI_DEBUG_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_DEBUG_CONTROL_ADDR))
   begin
      prdata_o = spi_debug_control_reg & `SPI2_SPI_DEBUG_CONTROL_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_LOOPBACK_ADDR))
   begin
      prdata_o = spi_loopback_reg & `SPI2_SPI_LOOPBACK_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_TEST_MODE_ADDR))
   begin
      prdata_o = spi_test_mode_reg & `SPI2_SPI_TEST_MODE_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_TEST_CONTROL_ADDR))
   begin
      prdata_o = spi_test_control_reg & `SPI2_SPI_TEST_CONTROL_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_TEST_STATUS_ADDR))
   begin
      prdata_o = spi_test_status_reg & `SPI2_SPI_TEST_STATUS_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_PATTERN_CONFIG_ADDR))
   begin
      prdata_o = spi_pattern_config_reg & `SPI2_SPI_PATTERN_CONFIG_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_PATTERN_STATUS_ADDR))
   begin
      prdata_o = spi_pattern_status_reg & `SPI2_SPI_PATTERN_STATUS_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_SYNC_CONFIG_ADDR))
   begin
      prdata_o = spi_sync_config_reg & `SPI2_SPI_SYNC_CONFIG_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_SYNC_STATUS_ADDR))
   begin
      prdata_o = spi_sync_status_reg & `SPI2_SPI_SYNC_STATUS_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_FILTER_CONFIG_ADDR))
   begin
      prdata_o = spi_filter_config_reg & `SPI2_SPI_FILTER_CONFIG_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_FILTER_STATUS_ADDR))
   begin
      prdata_o = spi_filter_status_reg & `SPI2_SPI_FILTER_STATUS_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_SAMPLE_CONFIG_ADDR))
   begin
      prdata_o = spi_sample_config_reg & `SPI2_SPI_SAMPLE_CONFIG_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_SAMPLE_STATUS_ADDR))
   begin
      prdata_o = spi_sample_status_reg & `SPI2_SPI_SAMPLE_STATUS_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_DRIVE_CONFIG_ADDR))
   begin
      prdata_o = spi_drive_config_reg & `SPI2_SPI_DRIVE_CONFIG_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_DRIVE_STATUS_ADDR))
   begin
      prdata_o = spi_drive_status_reg & `SPI2_SPI_DRIVE_STATUS_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_POLARITY_CONFIG_ADDR))
   begin
      prdata_o = spi_polarity_config_reg & `SPI2_SPI_POLARITY_CONFIG_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_PHASE_CONFIG_ADDR))
   begin
      prdata_o = spi_phase_config_reg & `SPI2_SPI_PHASE_CONFIG_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_EDGE_CONFIG_ADDR))
   begin
      prdata_o = spi_edge_config_reg & `SPI2_SPI_EDGE_CONFIG_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_CLOCK_GATE_ADDR))
   begin
      prdata_o = spi_clock_gate_reg & `SPI2_SPI_CLOCK_GATE_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_POWER_CONTROL_ADDR))
   begin
      prdata_o = spi_power_control_reg & `SPI2_SPI_POWER_CONTROL_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_POWER_STATUS_ADDR))
   begin
      prdata_o = spi_power_status_reg & `SPI2_SPI_POWER_STATUS_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_RESET_CONTROL_ADDR))
   begin
      prdata_o = spi_reset_control_reg & `SPI2_SPI_RESET_CONTROL_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_RESET_STATUS_ADDR))
   begin
      prdata_o = spi_reset_status_reg & `SPI2_SPI_RESET_STATUS_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_SLEEP_CONFIG_ADDR))
   begin
      prdata_o = spi_sleep_config_reg & `SPI2_SPI_SLEEP_CONFIG_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_WAKE_STATUS_ADDR))
   begin
      prdata_o = spi_wake_status_reg & `SPI2_SPI_WAKE_STATUS_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_WAIT_CONFIG_ADDR))
   begin
      prdata_o = spi_wait_config_reg & `SPI2_SPI_WAIT_CONFIG_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_WAIT_STATUS_ADDR))
   begin
      prdata_o = spi_wait_status_reg & `SPI2_SPI_WAIT_STATUS_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_FRAME_COUNT_ADDR))
   begin
      prdata_o = spi_frame_count_reg & `SPI2_SPI_FRAME_COUNT_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_BYTE_COUNT_ADDR))
   begin
      prdata_o = spi_byte_count_reg & `SPI2_SPI_BYTE_COUNT_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_BIT_COUNT_ADDR))
   begin
      prdata_o = spi_bit_count_reg & `SPI2_SPI_BIT_COUNT_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_TRANSFER_COUNT_ADDR))
   begin
      prdata_o = spi_transfer_count_reg & `SPI2_SPI_TRANSFER_COUNT_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_ERROR_COUNT_ADDR))
   begin
      prdata_o = spi_error_count_reg & `SPI2_SPI_ERROR_COUNT_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_RETRY_CONFIG_ADDR))
   begin
      prdata_o = spi_retry_config_reg & `SPI2_SPI_RETRY_CONFIG_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_RETRY_STATUS_ADDR))
   begin
      prdata_o = spi_retry_status_reg & `SPI2_SPI_RETRY_STATUS_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_RETRY_COUNT_ADDR))
   begin
      prdata_o = spi_retry_count_reg & `SPI2_SPI_RETRY_COUNT_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_PACKET_CONFIG_ADDR))
   begin
      prdata_o = spi_packet_config_reg & `SPI2_SPI_PACKET_CONFIG_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_PACKET_STATUS_ADDR))
   begin
      prdata_o = spi_packet_status_reg & `SPI2_SPI_PACKET_STATUS_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_HEADER_CONFIG_ADDR))
   begin
      prdata_o = spi_header_config_reg & `SPI2_SPI_HEADER_CONFIG_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_HEADER_STATUS_ADDR))
   begin
      prdata_o = spi_header_status_reg & `SPI2_SPI_HEADER_STATUS_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_CRC_CONFIG_ADDR))
   begin
      prdata_o = spi_crc_config_reg & `SPI2_SPI_CRC_CONFIG_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_CRC_STATUS_ADDR))
   begin
      prdata_o = spi_crc_status_reg & `SPI2_SPI_CRC_STATUS_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_CRC_RESULT_ADDR))
   begin
      prdata_o = spi_crc_result_reg & `SPI2_SPI_CRC_RESULT_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_CHECKSUM_CONFIG_ADDR))
   begin
      prdata_o = spi_checksum_config_reg & `SPI2_SPI_CHECKSUM_CONFIG_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_CHECKSUM_STATUS_ADDR))
   begin
      prdata_o = spi_checksum_status_reg & `SPI2_SPI_CHECKSUM_STATUS_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_CHECKSUM_RESULT_ADDR))
   begin
      prdata_o = spi_checksum_result_reg & `SPI2_SPI_CHECKSUM_RESULT_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_SEQUENCE_CONFIG_ADDR))
   begin
      prdata_o = spi_sequence_config_reg & `SPI2_SPI_SEQUENCE_CONFIG_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_SEQUENCE_STATUS_ADDR))
   begin
      prdata_o = spi_sequence_status_reg & `SPI2_SPI_SEQUENCE_STATUS_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_BUFFER_CONFIG_ADDR))
   begin
      prdata_o = spi_buffer_config_reg & `SPI2_SPI_BUFFER_CONFIG_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_BUFFER_STATUS_ADDR))
   begin
      prdata_o = spi_buffer_status_reg & `SPI2_SPI_BUFFER_STATUS_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_QUEUE_CONTROL_ADDR))
   begin
      prdata_o = spi_queue_control_reg & `SPI2_SPI_QUEUE_CONTROL_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_QUEUE_STATUS_ADDR))
   begin
      prdata_o = spi_queue_status_reg & `SPI2_SPI_QUEUE_STATUS_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_ARBITRATION_ADDR))
   begin
      prdata_o = spi_arbitration_reg & `SPI2_SPI_ARBITRATION_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_ARBITRATION_STATUS_ADDR))
   begin
      prdata_o = spi_arbitration_status_reg & `SPI2_SPI_ARBITRATION_STATUS_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_SLAVE_CONFIG_ADDR))
   begin
      prdata_o = spi_slave_config_reg & `SPI2_SPI_SLAVE_CONFIG_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_SLAVE_STATUS_ADDR))
   begin
      prdata_o = spi_slave_status_reg & `SPI2_SPI_SLAVE_STATUS_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_MASTER_CONFIG_ADDR))
   begin
      prdata_o = spi_master_config_reg & `SPI2_SPI_MASTER_CONFIG_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_MASTER_STATUS_ADDR))
   begin
      prdata_o = spi_master_status_reg & `SPI2_SPI_MASTER_STATUS_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_BUS_CONFIG_ADDR))
   begin
      prdata_o = spi_bus_config_reg & `SPI2_SPI_BUS_CONFIG_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_BUS_STATUS_ADDR))
   begin
      prdata_o = spi_bus_status_reg & `SPI2_SPI_BUS_STATUS_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_INTERFACE_CONFIG_ADDR))
   begin
      prdata_o = spi_interface_config_reg & `SPI2_SPI_INTERFACE_CONFIG_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_INTERFACE_STATUS_ADDR))
   begin
      prdata_o = spi_interface_status_reg & `SPI2_SPI_INTERFACE_STATUS_MASK;
   end

   else if (rd_enb && (paddr_i == `SPI2_SPI_VERSION_ADDR))
   begin
      prdata_o = spi_version_reg & `SPI2_SPI_VERSION_MASK;
   end

   else
   begin
      prdata_o = {`SPI2_DATA_WIDTH{1'b0}};
   end
end


//----------------------------------------------------------------------
// Field assignments
//----------------------------------------------------------------------
assign spi_control_control_o = {spi_control_reg[`SPI2_SPI_CONTROL_SPI_CONTROL_CONTROL7_POS], spi_control_reg[`SPI2_SPI_CONTROL_SPI_CONTROL_CONTROL6_POS], spi_control_reg[`SPI2_SPI_CONTROL_SPI_CONTROL_CONTROL5_POS], spi_control_reg[`SPI2_SPI_CONTROL_SPI_CONTROL_CONTROL4_POS], spi_control_reg[`SPI2_SPI_CONTROL_SPI_CONTROL_CONTROL3_POS], spi_control_reg[`SPI2_SPI_CONTROL_SPI_CONTROL_CONTROL2_POS], spi_control_reg[`SPI2_SPI_CONTROL_SPI_CONTROL_CONTROL1_POS], spi_control_reg[`SPI2_SPI_CONTROL_SPI_CONTROL_CONTROL0_POS]};
assign spi_control_config_o = {spi_control_reg[`SPI2_SPI_CONTROL_SPI_CONTROL_CONFIG7_POS], spi_control_reg[`SPI2_SPI_CONTROL_SPI_CONTROL_CONFIG6_POS], spi_control_reg[`SPI2_SPI_CONTROL_SPI_CONTROL_CONFIG5_POS], spi_control_reg[`SPI2_SPI_CONTROL_SPI_CONTROL_CONFIG4_POS], spi_control_reg[`SPI2_SPI_CONTROL_SPI_CONTROL_CONFIG3_POS], spi_control_reg[`SPI2_SPI_CONTROL_SPI_CONTROL_CONFIG2_POS], spi_control_reg[`SPI2_SPI_CONTROL_SPI_CONTROL_CONFIG1_POS], spi_control_reg[`SPI2_SPI_CONTROL_SPI_CONTROL_CONFIG0_POS]};
assign spi_control_value_o = {spi_control_reg[`SPI2_SPI_CONTROL_SPI_CONTROL_VALUE7_POS], spi_control_reg[`SPI2_SPI_CONTROL_SPI_CONTROL_VALUE6_POS], spi_control_reg[`SPI2_SPI_CONTROL_SPI_CONTROL_VALUE5_POS], spi_control_reg[`SPI2_SPI_CONTROL_SPI_CONTROL_VALUE4_POS], spi_control_reg[`SPI2_SPI_CONTROL_SPI_CONTROL_VALUE3_POS], spi_control_reg[`SPI2_SPI_CONTROL_SPI_CONTROL_VALUE2_POS], spi_control_reg[`SPI2_SPI_CONTROL_SPI_CONTROL_VALUE1_POS], spi_control_reg[`SPI2_SPI_CONTROL_SPI_CONTROL_VALUE0_POS]};
assign spi_control_flag_o = {spi_control_reg[`SPI2_SPI_CONTROL_SPI_CONTROL_FLAG7_POS], spi_control_reg[`SPI2_SPI_CONTROL_SPI_CONTROL_FLAG6_POS], spi_control_reg[`SPI2_SPI_CONTROL_SPI_CONTROL_FLAG5_POS], spi_control_reg[`SPI2_SPI_CONTROL_SPI_CONTROL_FLAG4_POS], spi_control_reg[`SPI2_SPI_CONTROL_SPI_CONTROL_FLAG3_POS], spi_control_reg[`SPI2_SPI_CONTROL_SPI_CONTROL_FLAG2_POS], spi_control_reg[`SPI2_SPI_CONTROL_SPI_CONTROL_FLAG1_POS], spi_control_reg[`SPI2_SPI_CONTROL_SPI_CONTROL_FLAG0_POS]};
assign spi_config_control_o = {spi_config_reg[`SPI2_SPI_CONFIG_SPI_CONFIG_CONTROL7_POS], spi_config_reg[`SPI2_SPI_CONFIG_SPI_CONFIG_CONTROL6_POS], spi_config_reg[`SPI2_SPI_CONFIG_SPI_CONFIG_CONTROL5_POS], spi_config_reg[`SPI2_SPI_CONFIG_SPI_CONFIG_CONTROL4_POS], spi_config_reg[`SPI2_SPI_CONFIG_SPI_CONFIG_CONTROL3_POS], spi_config_reg[`SPI2_SPI_CONFIG_SPI_CONFIG_CONTROL2_POS], spi_config_reg[`SPI2_SPI_CONFIG_SPI_CONFIG_CONTROL1_POS], spi_config_reg[`SPI2_SPI_CONFIG_SPI_CONFIG_CONTROL0_POS]};
assign spi_config_config_o = {spi_config_reg[`SPI2_SPI_CONFIG_SPI_CONFIG_CONFIG7_POS], spi_config_reg[`SPI2_SPI_CONFIG_SPI_CONFIG_CONFIG6_POS], spi_config_reg[`SPI2_SPI_CONFIG_SPI_CONFIG_CONFIG5_POS], spi_config_reg[`SPI2_SPI_CONFIG_SPI_CONFIG_CONFIG4_POS], spi_config_reg[`SPI2_SPI_CONFIG_SPI_CONFIG_CONFIG3_POS], spi_config_reg[`SPI2_SPI_CONFIG_SPI_CONFIG_CONFIG2_POS], spi_config_reg[`SPI2_SPI_CONFIG_SPI_CONFIG_CONFIG1_POS], spi_config_reg[`SPI2_SPI_CONFIG_SPI_CONFIG_CONFIG0_POS]};
assign spi_config_value_o = {spi_config_reg[`SPI2_SPI_CONFIG_SPI_CONFIG_VALUE7_POS], spi_config_reg[`SPI2_SPI_CONFIG_SPI_CONFIG_VALUE6_POS], spi_config_reg[`SPI2_SPI_CONFIG_SPI_CONFIG_VALUE5_POS], spi_config_reg[`SPI2_SPI_CONFIG_SPI_CONFIG_VALUE4_POS], spi_config_reg[`SPI2_SPI_CONFIG_SPI_CONFIG_VALUE3_POS], spi_config_reg[`SPI2_SPI_CONFIG_SPI_CONFIG_VALUE2_POS], spi_config_reg[`SPI2_SPI_CONFIG_SPI_CONFIG_VALUE1_POS], spi_config_reg[`SPI2_SPI_CONFIG_SPI_CONFIG_VALUE0_POS]};
assign spi_config_flag_o = {spi_config_reg[`SPI2_SPI_CONFIG_SPI_CONFIG_FLAG7_POS], spi_config_reg[`SPI2_SPI_CONFIG_SPI_CONFIG_FLAG6_POS], spi_config_reg[`SPI2_SPI_CONFIG_SPI_CONFIG_FLAG5_POS], spi_config_reg[`SPI2_SPI_CONFIG_SPI_CONFIG_FLAG4_POS], spi_config_reg[`SPI2_SPI_CONFIG_SPI_CONFIG_FLAG3_POS], spi_config_reg[`SPI2_SPI_CONFIG_SPI_CONFIG_FLAG2_POS], spi_config_reg[`SPI2_SPI_CONFIG_SPI_CONFIG_FLAG1_POS], spi_config_reg[`SPI2_SPI_CONFIG_SPI_CONFIG_FLAG0_POS]};
assign spi_clock_control_o = {spi_clock_reg[`SPI2_SPI_CLOCK_SPI_CLOCK_CONTROL7_POS], spi_clock_reg[`SPI2_SPI_CLOCK_SPI_CLOCK_CONTROL6_POS], spi_clock_reg[`SPI2_SPI_CLOCK_SPI_CLOCK_CONTROL5_POS], spi_clock_reg[`SPI2_SPI_CLOCK_SPI_CLOCK_CONTROL4_POS], spi_clock_reg[`SPI2_SPI_CLOCK_SPI_CLOCK_CONTROL3_POS], spi_clock_reg[`SPI2_SPI_CLOCK_SPI_CLOCK_CONTROL2_POS], spi_clock_reg[`SPI2_SPI_CLOCK_SPI_CLOCK_CONTROL1_POS], spi_clock_reg[`SPI2_SPI_CLOCK_SPI_CLOCK_CONTROL0_POS]};
assign spi_clock_config_o = {spi_clock_reg[`SPI2_SPI_CLOCK_SPI_CLOCK_CONFIG7_POS], spi_clock_reg[`SPI2_SPI_CLOCK_SPI_CLOCK_CONFIG6_POS], spi_clock_reg[`SPI2_SPI_CLOCK_SPI_CLOCK_CONFIG5_POS], spi_clock_reg[`SPI2_SPI_CLOCK_SPI_CLOCK_CONFIG4_POS], spi_clock_reg[`SPI2_SPI_CLOCK_SPI_CLOCK_CONFIG3_POS], spi_clock_reg[`SPI2_SPI_CLOCK_SPI_CLOCK_CONFIG2_POS], spi_clock_reg[`SPI2_SPI_CLOCK_SPI_CLOCK_CONFIG1_POS], spi_clock_reg[`SPI2_SPI_CLOCK_SPI_CLOCK_CONFIG0_POS]};
assign spi_clock_value_o = {spi_clock_reg[`SPI2_SPI_CLOCK_SPI_CLOCK_VALUE7_POS], spi_clock_reg[`SPI2_SPI_CLOCK_SPI_CLOCK_VALUE6_POS], spi_clock_reg[`SPI2_SPI_CLOCK_SPI_CLOCK_VALUE5_POS], spi_clock_reg[`SPI2_SPI_CLOCK_SPI_CLOCK_VALUE4_POS], spi_clock_reg[`SPI2_SPI_CLOCK_SPI_CLOCK_VALUE3_POS], spi_clock_reg[`SPI2_SPI_CLOCK_SPI_CLOCK_VALUE2_POS], spi_clock_reg[`SPI2_SPI_CLOCK_SPI_CLOCK_VALUE1_POS], spi_clock_reg[`SPI2_SPI_CLOCK_SPI_CLOCK_VALUE0_POS]};
assign spi_clock_flag_o = {spi_clock_reg[`SPI2_SPI_CLOCK_SPI_CLOCK_FLAG7_POS], spi_clock_reg[`SPI2_SPI_CLOCK_SPI_CLOCK_FLAG6_POS], spi_clock_reg[`SPI2_SPI_CLOCK_SPI_CLOCK_FLAG5_POS], spi_clock_reg[`SPI2_SPI_CLOCK_SPI_CLOCK_FLAG4_POS], spi_clock_reg[`SPI2_SPI_CLOCK_SPI_CLOCK_FLAG3_POS], spi_clock_reg[`SPI2_SPI_CLOCK_SPI_CLOCK_FLAG2_POS], spi_clock_reg[`SPI2_SPI_CLOCK_SPI_CLOCK_FLAG1_POS], spi_clock_reg[`SPI2_SPI_CLOCK_SPI_CLOCK_FLAG0_POS]};
assign spi_status_control_o = {spi_status_reg[`SPI2_SPI_STATUS_SPI_STATUS_CONTROL7_POS], spi_status_reg[`SPI2_SPI_STATUS_SPI_STATUS_CONTROL6_POS], spi_status_reg[`SPI2_SPI_STATUS_SPI_STATUS_CONTROL5_POS], spi_status_reg[`SPI2_SPI_STATUS_SPI_STATUS_CONTROL4_POS], spi_status_reg[`SPI2_SPI_STATUS_SPI_STATUS_CONTROL3_POS], spi_status_reg[`SPI2_SPI_STATUS_SPI_STATUS_CONTROL2_POS], spi_status_reg[`SPI2_SPI_STATUS_SPI_STATUS_CONTROL1_POS], spi_status_reg[`SPI2_SPI_STATUS_SPI_STATUS_CONTROL0_POS]};
assign spi_status_config_o = {spi_status_reg[`SPI2_SPI_STATUS_SPI_STATUS_CONFIG7_POS], spi_status_reg[`SPI2_SPI_STATUS_SPI_STATUS_CONFIG6_POS], spi_status_reg[`SPI2_SPI_STATUS_SPI_STATUS_CONFIG5_POS], spi_status_reg[`SPI2_SPI_STATUS_SPI_STATUS_CONFIG4_POS], spi_status_reg[`SPI2_SPI_STATUS_SPI_STATUS_CONFIG3_POS], spi_status_reg[`SPI2_SPI_STATUS_SPI_STATUS_CONFIG2_POS], spi_status_reg[`SPI2_SPI_STATUS_SPI_STATUS_CONFIG1_POS], spi_status_reg[`SPI2_SPI_STATUS_SPI_STATUS_CONFIG0_POS]};
assign spi_status_value_o = {spi_status_reg[`SPI2_SPI_STATUS_SPI_STATUS_VALUE7_POS], spi_status_reg[`SPI2_SPI_STATUS_SPI_STATUS_VALUE6_POS], spi_status_reg[`SPI2_SPI_STATUS_SPI_STATUS_VALUE5_POS], spi_status_reg[`SPI2_SPI_STATUS_SPI_STATUS_VALUE4_POS], spi_status_reg[`SPI2_SPI_STATUS_SPI_STATUS_VALUE3_POS], spi_status_reg[`SPI2_SPI_STATUS_SPI_STATUS_VALUE2_POS], spi_status_reg[`SPI2_SPI_STATUS_SPI_STATUS_VALUE1_POS], spi_status_reg[`SPI2_SPI_STATUS_SPI_STATUS_VALUE0_POS]};
assign spi_status_flag_o = {spi_status_reg[`SPI2_SPI_STATUS_SPI_STATUS_FLAG7_POS], spi_status_reg[`SPI2_SPI_STATUS_SPI_STATUS_FLAG6_POS], spi_status_reg[`SPI2_SPI_STATUS_SPI_STATUS_FLAG5_POS], spi_status_reg[`SPI2_SPI_STATUS_SPI_STATUS_FLAG4_POS], spi_status_reg[`SPI2_SPI_STATUS_SPI_STATUS_FLAG3_POS], spi_status_reg[`SPI2_SPI_STATUS_SPI_STATUS_FLAG2_POS], spi_status_reg[`SPI2_SPI_STATUS_SPI_STATUS_FLAG1_POS], spi_status_reg[`SPI2_SPI_STATUS_SPI_STATUS_FLAG0_POS]};
assign spi_interrupt_control_o = {spi_interrupt_reg[`SPI2_SPI_INTERRUPT_SPI_INTERRUPT_CONTROL7_POS], spi_interrupt_reg[`SPI2_SPI_INTERRUPT_SPI_INTERRUPT_CONTROL6_POS], spi_interrupt_reg[`SPI2_SPI_INTERRUPT_SPI_INTERRUPT_CONTROL5_POS], spi_interrupt_reg[`SPI2_SPI_INTERRUPT_SPI_INTERRUPT_CONTROL4_POS], spi_interrupt_reg[`SPI2_SPI_INTERRUPT_SPI_INTERRUPT_CONTROL3_POS], spi_interrupt_reg[`SPI2_SPI_INTERRUPT_SPI_INTERRUPT_CONTROL2_POS], spi_interrupt_reg[`SPI2_SPI_INTERRUPT_SPI_INTERRUPT_CONTROL1_POS], spi_interrupt_reg[`SPI2_SPI_INTERRUPT_SPI_INTERRUPT_CONTROL0_POS]};
assign spi_interrupt_config_o = {spi_interrupt_reg[`SPI2_SPI_INTERRUPT_SPI_INTERRUPT_CONFIG7_POS], spi_interrupt_reg[`SPI2_SPI_INTERRUPT_SPI_INTERRUPT_CONFIG6_POS], spi_interrupt_reg[`SPI2_SPI_INTERRUPT_SPI_INTERRUPT_CONFIG5_POS], spi_interrupt_reg[`SPI2_SPI_INTERRUPT_SPI_INTERRUPT_CONFIG4_POS], spi_interrupt_reg[`SPI2_SPI_INTERRUPT_SPI_INTERRUPT_CONFIG3_POS], spi_interrupt_reg[`SPI2_SPI_INTERRUPT_SPI_INTERRUPT_CONFIG2_POS], spi_interrupt_reg[`SPI2_SPI_INTERRUPT_SPI_INTERRUPT_CONFIG1_POS], spi_interrupt_reg[`SPI2_SPI_INTERRUPT_SPI_INTERRUPT_CONFIG0_POS]};
assign spi_interrupt_value_o = {spi_interrupt_reg[`SPI2_SPI_INTERRUPT_SPI_INTERRUPT_VALUE7_POS], spi_interrupt_reg[`SPI2_SPI_INTERRUPT_SPI_INTERRUPT_VALUE6_POS], spi_interrupt_reg[`SPI2_SPI_INTERRUPT_SPI_INTERRUPT_VALUE5_POS], spi_interrupt_reg[`SPI2_SPI_INTERRUPT_SPI_INTERRUPT_VALUE4_POS], spi_interrupt_reg[`SPI2_SPI_INTERRUPT_SPI_INTERRUPT_VALUE3_POS], spi_interrupt_reg[`SPI2_SPI_INTERRUPT_SPI_INTERRUPT_VALUE2_POS], spi_interrupt_reg[`SPI2_SPI_INTERRUPT_SPI_INTERRUPT_VALUE1_POS], spi_interrupt_reg[`SPI2_SPI_INTERRUPT_SPI_INTERRUPT_VALUE0_POS]};
assign spi_interrupt_flag_o = {spi_interrupt_reg[`SPI2_SPI_INTERRUPT_SPI_INTERRUPT_FLAG7_POS], spi_interrupt_reg[`SPI2_SPI_INTERRUPT_SPI_INTERRUPT_FLAG6_POS], spi_interrupt_reg[`SPI2_SPI_INTERRUPT_SPI_INTERRUPT_FLAG5_POS], spi_interrupt_reg[`SPI2_SPI_INTERRUPT_SPI_INTERRUPT_FLAG4_POS], spi_interrupt_reg[`SPI2_SPI_INTERRUPT_SPI_INTERRUPT_FLAG3_POS], spi_interrupt_reg[`SPI2_SPI_INTERRUPT_SPI_INTERRUPT_FLAG2_POS], spi_interrupt_reg[`SPI2_SPI_INTERRUPT_SPI_INTERRUPT_FLAG1_POS], spi_interrupt_reg[`SPI2_SPI_INTERRUPT_SPI_INTERRUPT_FLAG0_POS]};
assign spi_fifo_control_o = {spi_fifo_reg[`SPI2_SPI_FIFO_SPI_FIFO_CONTROL7_POS], spi_fifo_reg[`SPI2_SPI_FIFO_SPI_FIFO_CONTROL6_POS], spi_fifo_reg[`SPI2_SPI_FIFO_SPI_FIFO_CONTROL5_POS], spi_fifo_reg[`SPI2_SPI_FIFO_SPI_FIFO_CONTROL4_POS], spi_fifo_reg[`SPI2_SPI_FIFO_SPI_FIFO_CONTROL3_POS], spi_fifo_reg[`SPI2_SPI_FIFO_SPI_FIFO_CONTROL2_POS], spi_fifo_reg[`SPI2_SPI_FIFO_SPI_FIFO_CONTROL1_POS], spi_fifo_reg[`SPI2_SPI_FIFO_SPI_FIFO_CONTROL0_POS]};
assign spi_fifo_config_o = {spi_fifo_reg[`SPI2_SPI_FIFO_SPI_FIFO_CONFIG7_POS], spi_fifo_reg[`SPI2_SPI_FIFO_SPI_FIFO_CONFIG6_POS], spi_fifo_reg[`SPI2_SPI_FIFO_SPI_FIFO_CONFIG5_POS], spi_fifo_reg[`SPI2_SPI_FIFO_SPI_FIFO_CONFIG4_POS], spi_fifo_reg[`SPI2_SPI_FIFO_SPI_FIFO_CONFIG3_POS], spi_fifo_reg[`SPI2_SPI_FIFO_SPI_FIFO_CONFIG2_POS], spi_fifo_reg[`SPI2_SPI_FIFO_SPI_FIFO_CONFIG1_POS], spi_fifo_reg[`SPI2_SPI_FIFO_SPI_FIFO_CONFIG0_POS]};
assign spi_fifo_value_o = {spi_fifo_reg[`SPI2_SPI_FIFO_SPI_FIFO_VALUE7_POS], spi_fifo_reg[`SPI2_SPI_FIFO_SPI_FIFO_VALUE6_POS], spi_fifo_reg[`SPI2_SPI_FIFO_SPI_FIFO_VALUE5_POS], spi_fifo_reg[`SPI2_SPI_FIFO_SPI_FIFO_VALUE4_POS], spi_fifo_reg[`SPI2_SPI_FIFO_SPI_FIFO_VALUE3_POS], spi_fifo_reg[`SPI2_SPI_FIFO_SPI_FIFO_VALUE2_POS], spi_fifo_reg[`SPI2_SPI_FIFO_SPI_FIFO_VALUE1_POS], spi_fifo_reg[`SPI2_SPI_FIFO_SPI_FIFO_VALUE0_POS]};
assign spi_fifo_flag_o = {spi_fifo_reg[`SPI2_SPI_FIFO_SPI_FIFO_FLAG7_POS], spi_fifo_reg[`SPI2_SPI_FIFO_SPI_FIFO_FLAG6_POS], spi_fifo_reg[`SPI2_SPI_FIFO_SPI_FIFO_FLAG5_POS], spi_fifo_reg[`SPI2_SPI_FIFO_SPI_FIFO_FLAG4_POS], spi_fifo_reg[`SPI2_SPI_FIFO_SPI_FIFO_FLAG3_POS], spi_fifo_reg[`SPI2_SPI_FIFO_SPI_FIFO_FLAG2_POS], spi_fifo_reg[`SPI2_SPI_FIFO_SPI_FIFO_FLAG1_POS], spi_fifo_reg[`SPI2_SPI_FIFO_SPI_FIFO_FLAG0_POS]};
assign spi_tx_config_control_o = {spi_tx_config_reg[`SPI2_SPI_TX_CONFIG_SPI_TX_CONFIG_CONTROL7_POS], spi_tx_config_reg[`SPI2_SPI_TX_CONFIG_SPI_TX_CONFIG_CONTROL6_POS], spi_tx_config_reg[`SPI2_SPI_TX_CONFIG_SPI_TX_CONFIG_CONTROL5_POS], spi_tx_config_reg[`SPI2_SPI_TX_CONFIG_SPI_TX_CONFIG_CONTROL4_POS], spi_tx_config_reg[`SPI2_SPI_TX_CONFIG_SPI_TX_CONFIG_CONTROL3_POS], spi_tx_config_reg[`SPI2_SPI_TX_CONFIG_SPI_TX_CONFIG_CONTROL2_POS], spi_tx_config_reg[`SPI2_SPI_TX_CONFIG_SPI_TX_CONFIG_CONTROL1_POS], spi_tx_config_reg[`SPI2_SPI_TX_CONFIG_SPI_TX_CONFIG_CONTROL0_POS]};
assign spi_tx_config_config_o = {spi_tx_config_reg[`SPI2_SPI_TX_CONFIG_SPI_TX_CONFIG_CONFIG7_POS], spi_tx_config_reg[`SPI2_SPI_TX_CONFIG_SPI_TX_CONFIG_CONFIG6_POS], spi_tx_config_reg[`SPI2_SPI_TX_CONFIG_SPI_TX_CONFIG_CONFIG5_POS], spi_tx_config_reg[`SPI2_SPI_TX_CONFIG_SPI_TX_CONFIG_CONFIG4_POS], spi_tx_config_reg[`SPI2_SPI_TX_CONFIG_SPI_TX_CONFIG_CONFIG3_POS], spi_tx_config_reg[`SPI2_SPI_TX_CONFIG_SPI_TX_CONFIG_CONFIG2_POS], spi_tx_config_reg[`SPI2_SPI_TX_CONFIG_SPI_TX_CONFIG_CONFIG1_POS], spi_tx_config_reg[`SPI2_SPI_TX_CONFIG_SPI_TX_CONFIG_CONFIG0_POS]};
assign spi_tx_config_value_o = {spi_tx_config_reg[`SPI2_SPI_TX_CONFIG_SPI_TX_CONFIG_VALUE7_POS], spi_tx_config_reg[`SPI2_SPI_TX_CONFIG_SPI_TX_CONFIG_VALUE6_POS], spi_tx_config_reg[`SPI2_SPI_TX_CONFIG_SPI_TX_CONFIG_VALUE5_POS], spi_tx_config_reg[`SPI2_SPI_TX_CONFIG_SPI_TX_CONFIG_VALUE4_POS], spi_tx_config_reg[`SPI2_SPI_TX_CONFIG_SPI_TX_CONFIG_VALUE3_POS], spi_tx_config_reg[`SPI2_SPI_TX_CONFIG_SPI_TX_CONFIG_VALUE2_POS], spi_tx_config_reg[`SPI2_SPI_TX_CONFIG_SPI_TX_CONFIG_VALUE1_POS], spi_tx_config_reg[`SPI2_SPI_TX_CONFIG_SPI_TX_CONFIG_VALUE0_POS]};
assign spi_tx_config_flag_o = {spi_tx_config_reg[`SPI2_SPI_TX_CONFIG_SPI_TX_CONFIG_FLAG7_POS], spi_tx_config_reg[`SPI2_SPI_TX_CONFIG_SPI_TX_CONFIG_FLAG6_POS], spi_tx_config_reg[`SPI2_SPI_TX_CONFIG_SPI_TX_CONFIG_FLAG5_POS], spi_tx_config_reg[`SPI2_SPI_TX_CONFIG_SPI_TX_CONFIG_FLAG4_POS], spi_tx_config_reg[`SPI2_SPI_TX_CONFIG_SPI_TX_CONFIG_FLAG3_POS], spi_tx_config_reg[`SPI2_SPI_TX_CONFIG_SPI_TX_CONFIG_FLAG2_POS], spi_tx_config_reg[`SPI2_SPI_TX_CONFIG_SPI_TX_CONFIG_FLAG1_POS], spi_tx_config_reg[`SPI2_SPI_TX_CONFIG_SPI_TX_CONFIG_FLAG0_POS]};
assign spi_rx_config_control_o = {spi_rx_config_reg[`SPI2_SPI_RX_CONFIG_SPI_RX_CONFIG_CONTROL7_POS], spi_rx_config_reg[`SPI2_SPI_RX_CONFIG_SPI_RX_CONFIG_CONTROL6_POS], spi_rx_config_reg[`SPI2_SPI_RX_CONFIG_SPI_RX_CONFIG_CONTROL5_POS], spi_rx_config_reg[`SPI2_SPI_RX_CONFIG_SPI_RX_CONFIG_CONTROL4_POS], spi_rx_config_reg[`SPI2_SPI_RX_CONFIG_SPI_RX_CONFIG_CONTROL3_POS], spi_rx_config_reg[`SPI2_SPI_RX_CONFIG_SPI_RX_CONFIG_CONTROL2_POS], spi_rx_config_reg[`SPI2_SPI_RX_CONFIG_SPI_RX_CONFIG_CONTROL1_POS], spi_rx_config_reg[`SPI2_SPI_RX_CONFIG_SPI_RX_CONFIG_CONTROL0_POS]};
assign spi_rx_config_config_o = {spi_rx_config_reg[`SPI2_SPI_RX_CONFIG_SPI_RX_CONFIG_CONFIG7_POS], spi_rx_config_reg[`SPI2_SPI_RX_CONFIG_SPI_RX_CONFIG_CONFIG6_POS], spi_rx_config_reg[`SPI2_SPI_RX_CONFIG_SPI_RX_CONFIG_CONFIG5_POS], spi_rx_config_reg[`SPI2_SPI_RX_CONFIG_SPI_RX_CONFIG_CONFIG4_POS], spi_rx_config_reg[`SPI2_SPI_RX_CONFIG_SPI_RX_CONFIG_CONFIG3_POS], spi_rx_config_reg[`SPI2_SPI_RX_CONFIG_SPI_RX_CONFIG_CONFIG2_POS], spi_rx_config_reg[`SPI2_SPI_RX_CONFIG_SPI_RX_CONFIG_CONFIG1_POS], spi_rx_config_reg[`SPI2_SPI_RX_CONFIG_SPI_RX_CONFIG_CONFIG0_POS]};
assign spi_rx_config_value_o = {spi_rx_config_reg[`SPI2_SPI_RX_CONFIG_SPI_RX_CONFIG_VALUE7_POS], spi_rx_config_reg[`SPI2_SPI_RX_CONFIG_SPI_RX_CONFIG_VALUE6_POS], spi_rx_config_reg[`SPI2_SPI_RX_CONFIG_SPI_RX_CONFIG_VALUE5_POS], spi_rx_config_reg[`SPI2_SPI_RX_CONFIG_SPI_RX_CONFIG_VALUE4_POS], spi_rx_config_reg[`SPI2_SPI_RX_CONFIG_SPI_RX_CONFIG_VALUE3_POS], spi_rx_config_reg[`SPI2_SPI_RX_CONFIG_SPI_RX_CONFIG_VALUE2_POS], spi_rx_config_reg[`SPI2_SPI_RX_CONFIG_SPI_RX_CONFIG_VALUE1_POS], spi_rx_config_reg[`SPI2_SPI_RX_CONFIG_SPI_RX_CONFIG_VALUE0_POS]};
assign spi_rx_config_flag_o = {spi_rx_config_reg[`SPI2_SPI_RX_CONFIG_SPI_RX_CONFIG_FLAG7_POS], spi_rx_config_reg[`SPI2_SPI_RX_CONFIG_SPI_RX_CONFIG_FLAG6_POS], spi_rx_config_reg[`SPI2_SPI_RX_CONFIG_SPI_RX_CONFIG_FLAG5_POS], spi_rx_config_reg[`SPI2_SPI_RX_CONFIG_SPI_RX_CONFIG_FLAG4_POS], spi_rx_config_reg[`SPI2_SPI_RX_CONFIG_SPI_RX_CONFIG_FLAG3_POS], spi_rx_config_reg[`SPI2_SPI_RX_CONFIG_SPI_RX_CONFIG_FLAG2_POS], spi_rx_config_reg[`SPI2_SPI_RX_CONFIG_SPI_RX_CONFIG_FLAG1_POS], spi_rx_config_reg[`SPI2_SPI_RX_CONFIG_SPI_RX_CONFIG_FLAG0_POS]};
assign spi_frame_config_control_o = {spi_frame_config_reg[`SPI2_SPI_FRAME_CONFIG_SPI_FRAME_CONFIG_CONTROL7_POS], spi_frame_config_reg[`SPI2_SPI_FRAME_CONFIG_SPI_FRAME_CONFIG_CONTROL6_POS], spi_frame_config_reg[`SPI2_SPI_FRAME_CONFIG_SPI_FRAME_CONFIG_CONTROL5_POS], spi_frame_config_reg[`SPI2_SPI_FRAME_CONFIG_SPI_FRAME_CONFIG_CONTROL4_POS], spi_frame_config_reg[`SPI2_SPI_FRAME_CONFIG_SPI_FRAME_CONFIG_CONTROL3_POS], spi_frame_config_reg[`SPI2_SPI_FRAME_CONFIG_SPI_FRAME_CONFIG_CONTROL2_POS], spi_frame_config_reg[`SPI2_SPI_FRAME_CONFIG_SPI_FRAME_CONFIG_CONTROL1_POS], spi_frame_config_reg[`SPI2_SPI_FRAME_CONFIG_SPI_FRAME_CONFIG_CONTROL0_POS]};
assign spi_frame_config_config_o = {spi_frame_config_reg[`SPI2_SPI_FRAME_CONFIG_SPI_FRAME_CONFIG_CONFIG7_POS], spi_frame_config_reg[`SPI2_SPI_FRAME_CONFIG_SPI_FRAME_CONFIG_CONFIG6_POS], spi_frame_config_reg[`SPI2_SPI_FRAME_CONFIG_SPI_FRAME_CONFIG_CONFIG5_POS], spi_frame_config_reg[`SPI2_SPI_FRAME_CONFIG_SPI_FRAME_CONFIG_CONFIG4_POS], spi_frame_config_reg[`SPI2_SPI_FRAME_CONFIG_SPI_FRAME_CONFIG_CONFIG3_POS], spi_frame_config_reg[`SPI2_SPI_FRAME_CONFIG_SPI_FRAME_CONFIG_CONFIG2_POS], spi_frame_config_reg[`SPI2_SPI_FRAME_CONFIG_SPI_FRAME_CONFIG_CONFIG1_POS], spi_frame_config_reg[`SPI2_SPI_FRAME_CONFIG_SPI_FRAME_CONFIG_CONFIG0_POS]};
assign spi_frame_config_value_o = {spi_frame_config_reg[`SPI2_SPI_FRAME_CONFIG_SPI_FRAME_CONFIG_VALUE7_POS], spi_frame_config_reg[`SPI2_SPI_FRAME_CONFIG_SPI_FRAME_CONFIG_VALUE6_POS], spi_frame_config_reg[`SPI2_SPI_FRAME_CONFIG_SPI_FRAME_CONFIG_VALUE5_POS], spi_frame_config_reg[`SPI2_SPI_FRAME_CONFIG_SPI_FRAME_CONFIG_VALUE4_POS], spi_frame_config_reg[`SPI2_SPI_FRAME_CONFIG_SPI_FRAME_CONFIG_VALUE3_POS], spi_frame_config_reg[`SPI2_SPI_FRAME_CONFIG_SPI_FRAME_CONFIG_VALUE2_POS], spi_frame_config_reg[`SPI2_SPI_FRAME_CONFIG_SPI_FRAME_CONFIG_VALUE1_POS], spi_frame_config_reg[`SPI2_SPI_FRAME_CONFIG_SPI_FRAME_CONFIG_VALUE0_POS]};
assign spi_frame_config_flag_o = {spi_frame_config_reg[`SPI2_SPI_FRAME_CONFIG_SPI_FRAME_CONFIG_FLAG7_POS], spi_frame_config_reg[`SPI2_SPI_FRAME_CONFIG_SPI_FRAME_CONFIG_FLAG6_POS], spi_frame_config_reg[`SPI2_SPI_FRAME_CONFIG_SPI_FRAME_CONFIG_FLAG5_POS], spi_frame_config_reg[`SPI2_SPI_FRAME_CONFIG_SPI_FRAME_CONFIG_FLAG4_POS], spi_frame_config_reg[`SPI2_SPI_FRAME_CONFIG_SPI_FRAME_CONFIG_FLAG3_POS], spi_frame_config_reg[`SPI2_SPI_FRAME_CONFIG_SPI_FRAME_CONFIG_FLAG2_POS], spi_frame_config_reg[`SPI2_SPI_FRAME_CONFIG_SPI_FRAME_CONFIG_FLAG1_POS], spi_frame_config_reg[`SPI2_SPI_FRAME_CONFIG_SPI_FRAME_CONFIG_FLAG0_POS]};
assign spi_mode_control_o = {spi_mode_reg[`SPI2_SPI_MODE_SPI_MODE_CONTROL7_POS], spi_mode_reg[`SPI2_SPI_MODE_SPI_MODE_CONTROL6_POS], spi_mode_reg[`SPI2_SPI_MODE_SPI_MODE_CONTROL5_POS], spi_mode_reg[`SPI2_SPI_MODE_SPI_MODE_CONTROL4_POS], spi_mode_reg[`SPI2_SPI_MODE_SPI_MODE_CONTROL3_POS], spi_mode_reg[`SPI2_SPI_MODE_SPI_MODE_CONTROL2_POS], spi_mode_reg[`SPI2_SPI_MODE_SPI_MODE_CONTROL1_POS], spi_mode_reg[`SPI2_SPI_MODE_SPI_MODE_CONTROL0_POS]};
assign spi_mode_config_o = {spi_mode_reg[`SPI2_SPI_MODE_SPI_MODE_CONFIG7_POS], spi_mode_reg[`SPI2_SPI_MODE_SPI_MODE_CONFIG6_POS], spi_mode_reg[`SPI2_SPI_MODE_SPI_MODE_CONFIG5_POS], spi_mode_reg[`SPI2_SPI_MODE_SPI_MODE_CONFIG4_POS], spi_mode_reg[`SPI2_SPI_MODE_SPI_MODE_CONFIG3_POS], spi_mode_reg[`SPI2_SPI_MODE_SPI_MODE_CONFIG2_POS], spi_mode_reg[`SPI2_SPI_MODE_SPI_MODE_CONFIG1_POS], spi_mode_reg[`SPI2_SPI_MODE_SPI_MODE_CONFIG0_POS]};
assign spi_mode_value_o = {spi_mode_reg[`SPI2_SPI_MODE_SPI_MODE_VALUE7_POS], spi_mode_reg[`SPI2_SPI_MODE_SPI_MODE_VALUE6_POS], spi_mode_reg[`SPI2_SPI_MODE_SPI_MODE_VALUE5_POS], spi_mode_reg[`SPI2_SPI_MODE_SPI_MODE_VALUE4_POS], spi_mode_reg[`SPI2_SPI_MODE_SPI_MODE_VALUE3_POS], spi_mode_reg[`SPI2_SPI_MODE_SPI_MODE_VALUE2_POS], spi_mode_reg[`SPI2_SPI_MODE_SPI_MODE_VALUE1_POS], spi_mode_reg[`SPI2_SPI_MODE_SPI_MODE_VALUE0_POS]};
assign spi_mode_flag_o = {spi_mode_reg[`SPI2_SPI_MODE_SPI_MODE_FLAG7_POS], spi_mode_reg[`SPI2_SPI_MODE_SPI_MODE_FLAG6_POS], spi_mode_reg[`SPI2_SPI_MODE_SPI_MODE_FLAG5_POS], spi_mode_reg[`SPI2_SPI_MODE_SPI_MODE_FLAG4_POS], spi_mode_reg[`SPI2_SPI_MODE_SPI_MODE_FLAG3_POS], spi_mode_reg[`SPI2_SPI_MODE_SPI_MODE_FLAG2_POS], spi_mode_reg[`SPI2_SPI_MODE_SPI_MODE_FLAG1_POS], spi_mode_reg[`SPI2_SPI_MODE_SPI_MODE_FLAG0_POS]};
assign spi_timing_control_o = {spi_timing_reg[`SPI2_SPI_TIMING_SPI_TIMING_CONTROL7_POS], spi_timing_reg[`SPI2_SPI_TIMING_SPI_TIMING_CONTROL6_POS], spi_timing_reg[`SPI2_SPI_TIMING_SPI_TIMING_CONTROL5_POS], spi_timing_reg[`SPI2_SPI_TIMING_SPI_TIMING_CONTROL4_POS], spi_timing_reg[`SPI2_SPI_TIMING_SPI_TIMING_CONTROL3_POS], spi_timing_reg[`SPI2_SPI_TIMING_SPI_TIMING_CONTROL2_POS], spi_timing_reg[`SPI2_SPI_TIMING_SPI_TIMING_CONTROL1_POS], spi_timing_reg[`SPI2_SPI_TIMING_SPI_TIMING_CONTROL0_POS]};
assign spi_timing_config_o = {spi_timing_reg[`SPI2_SPI_TIMING_SPI_TIMING_CONFIG7_POS], spi_timing_reg[`SPI2_SPI_TIMING_SPI_TIMING_CONFIG6_POS], spi_timing_reg[`SPI2_SPI_TIMING_SPI_TIMING_CONFIG5_POS], spi_timing_reg[`SPI2_SPI_TIMING_SPI_TIMING_CONFIG4_POS], spi_timing_reg[`SPI2_SPI_TIMING_SPI_TIMING_CONFIG3_POS], spi_timing_reg[`SPI2_SPI_TIMING_SPI_TIMING_CONFIG2_POS], spi_timing_reg[`SPI2_SPI_TIMING_SPI_TIMING_CONFIG1_POS], spi_timing_reg[`SPI2_SPI_TIMING_SPI_TIMING_CONFIG0_POS]};
assign spi_timing_value_o = {spi_timing_reg[`SPI2_SPI_TIMING_SPI_TIMING_VALUE7_POS], spi_timing_reg[`SPI2_SPI_TIMING_SPI_TIMING_VALUE6_POS], spi_timing_reg[`SPI2_SPI_TIMING_SPI_TIMING_VALUE5_POS], spi_timing_reg[`SPI2_SPI_TIMING_SPI_TIMING_VALUE4_POS], spi_timing_reg[`SPI2_SPI_TIMING_SPI_TIMING_VALUE3_POS], spi_timing_reg[`SPI2_SPI_TIMING_SPI_TIMING_VALUE2_POS], spi_timing_reg[`SPI2_SPI_TIMING_SPI_TIMING_VALUE1_POS], spi_timing_reg[`SPI2_SPI_TIMING_SPI_TIMING_VALUE0_POS]};
assign spi_timing_flag_o = {spi_timing_reg[`SPI2_SPI_TIMING_SPI_TIMING_FLAG7_POS], spi_timing_reg[`SPI2_SPI_TIMING_SPI_TIMING_FLAG6_POS], spi_timing_reg[`SPI2_SPI_TIMING_SPI_TIMING_FLAG5_POS], spi_timing_reg[`SPI2_SPI_TIMING_SPI_TIMING_FLAG4_POS], spi_timing_reg[`SPI2_SPI_TIMING_SPI_TIMING_FLAG3_POS], spi_timing_reg[`SPI2_SPI_TIMING_SPI_TIMING_FLAG2_POS], spi_timing_reg[`SPI2_SPI_TIMING_SPI_TIMING_FLAG1_POS], spi_timing_reg[`SPI2_SPI_TIMING_SPI_TIMING_FLAG0_POS]};
assign spi_baud_control_o = {spi_baud_reg[`SPI2_SPI_BAUD_SPI_BAUD_CONTROL7_POS], spi_baud_reg[`SPI2_SPI_BAUD_SPI_BAUD_CONTROL6_POS], spi_baud_reg[`SPI2_SPI_BAUD_SPI_BAUD_CONTROL5_POS], spi_baud_reg[`SPI2_SPI_BAUD_SPI_BAUD_CONTROL4_POS], spi_baud_reg[`SPI2_SPI_BAUD_SPI_BAUD_CONTROL3_POS], spi_baud_reg[`SPI2_SPI_BAUD_SPI_BAUD_CONTROL2_POS], spi_baud_reg[`SPI2_SPI_BAUD_SPI_BAUD_CONTROL1_POS], spi_baud_reg[`SPI2_SPI_BAUD_SPI_BAUD_CONTROL0_POS]};
assign spi_baud_config_o = {spi_baud_reg[`SPI2_SPI_BAUD_SPI_BAUD_CONFIG7_POS], spi_baud_reg[`SPI2_SPI_BAUD_SPI_BAUD_CONFIG6_POS], spi_baud_reg[`SPI2_SPI_BAUD_SPI_BAUD_CONFIG5_POS], spi_baud_reg[`SPI2_SPI_BAUD_SPI_BAUD_CONFIG4_POS], spi_baud_reg[`SPI2_SPI_BAUD_SPI_BAUD_CONFIG3_POS], spi_baud_reg[`SPI2_SPI_BAUD_SPI_BAUD_CONFIG2_POS], spi_baud_reg[`SPI2_SPI_BAUD_SPI_BAUD_CONFIG1_POS], spi_baud_reg[`SPI2_SPI_BAUD_SPI_BAUD_CONFIG0_POS]};
assign spi_baud_value_o = {spi_baud_reg[`SPI2_SPI_BAUD_SPI_BAUD_VALUE7_POS], spi_baud_reg[`SPI2_SPI_BAUD_SPI_BAUD_VALUE6_POS], spi_baud_reg[`SPI2_SPI_BAUD_SPI_BAUD_VALUE5_POS], spi_baud_reg[`SPI2_SPI_BAUD_SPI_BAUD_VALUE4_POS], spi_baud_reg[`SPI2_SPI_BAUD_SPI_BAUD_VALUE3_POS], spi_baud_reg[`SPI2_SPI_BAUD_SPI_BAUD_VALUE2_POS], spi_baud_reg[`SPI2_SPI_BAUD_SPI_BAUD_VALUE1_POS], spi_baud_reg[`SPI2_SPI_BAUD_SPI_BAUD_VALUE0_POS]};
assign spi_baud_flag_o = {spi_baud_reg[`SPI2_SPI_BAUD_SPI_BAUD_FLAG7_POS], spi_baud_reg[`SPI2_SPI_BAUD_SPI_BAUD_FLAG6_POS], spi_baud_reg[`SPI2_SPI_BAUD_SPI_BAUD_FLAG5_POS], spi_baud_reg[`SPI2_SPI_BAUD_SPI_BAUD_FLAG4_POS], spi_baud_reg[`SPI2_SPI_BAUD_SPI_BAUD_FLAG3_POS], spi_baud_reg[`SPI2_SPI_BAUD_SPI_BAUD_FLAG2_POS], spi_baud_reg[`SPI2_SPI_BAUD_SPI_BAUD_FLAG1_POS], spi_baud_reg[`SPI2_SPI_BAUD_SPI_BAUD_FLAG0_POS]};
assign spi_prescaler_control_o = {spi_prescaler_reg[`SPI2_SPI_PRESCALER_SPI_PRESCALER_CONTROL7_POS], spi_prescaler_reg[`SPI2_SPI_PRESCALER_SPI_PRESCALER_CONTROL6_POS], spi_prescaler_reg[`SPI2_SPI_PRESCALER_SPI_PRESCALER_CONTROL5_POS], spi_prescaler_reg[`SPI2_SPI_PRESCALER_SPI_PRESCALER_CONTROL4_POS], spi_prescaler_reg[`SPI2_SPI_PRESCALER_SPI_PRESCALER_CONTROL3_POS], spi_prescaler_reg[`SPI2_SPI_PRESCALER_SPI_PRESCALER_CONTROL2_POS], spi_prescaler_reg[`SPI2_SPI_PRESCALER_SPI_PRESCALER_CONTROL1_POS], spi_prescaler_reg[`SPI2_SPI_PRESCALER_SPI_PRESCALER_CONTROL0_POS]};
assign spi_prescaler_config_o = {spi_prescaler_reg[`SPI2_SPI_PRESCALER_SPI_PRESCALER_CONFIG7_POS], spi_prescaler_reg[`SPI2_SPI_PRESCALER_SPI_PRESCALER_CONFIG6_POS], spi_prescaler_reg[`SPI2_SPI_PRESCALER_SPI_PRESCALER_CONFIG5_POS], spi_prescaler_reg[`SPI2_SPI_PRESCALER_SPI_PRESCALER_CONFIG4_POS], spi_prescaler_reg[`SPI2_SPI_PRESCALER_SPI_PRESCALER_CONFIG3_POS], spi_prescaler_reg[`SPI2_SPI_PRESCALER_SPI_PRESCALER_CONFIG2_POS], spi_prescaler_reg[`SPI2_SPI_PRESCALER_SPI_PRESCALER_CONFIG1_POS], spi_prescaler_reg[`SPI2_SPI_PRESCALER_SPI_PRESCALER_CONFIG0_POS]};
assign spi_prescaler_value_o = {spi_prescaler_reg[`SPI2_SPI_PRESCALER_SPI_PRESCALER_VALUE7_POS], spi_prescaler_reg[`SPI2_SPI_PRESCALER_SPI_PRESCALER_VALUE6_POS], spi_prescaler_reg[`SPI2_SPI_PRESCALER_SPI_PRESCALER_VALUE5_POS], spi_prescaler_reg[`SPI2_SPI_PRESCALER_SPI_PRESCALER_VALUE4_POS], spi_prescaler_reg[`SPI2_SPI_PRESCALER_SPI_PRESCALER_VALUE3_POS], spi_prescaler_reg[`SPI2_SPI_PRESCALER_SPI_PRESCALER_VALUE2_POS], spi_prescaler_reg[`SPI2_SPI_PRESCALER_SPI_PRESCALER_VALUE1_POS], spi_prescaler_reg[`SPI2_SPI_PRESCALER_SPI_PRESCALER_VALUE0_POS]};
assign spi_prescaler_flag_o = {spi_prescaler_reg[`SPI2_SPI_PRESCALER_SPI_PRESCALER_FLAG7_POS], spi_prescaler_reg[`SPI2_SPI_PRESCALER_SPI_PRESCALER_FLAG6_POS], spi_prescaler_reg[`SPI2_SPI_PRESCALER_SPI_PRESCALER_FLAG5_POS], spi_prescaler_reg[`SPI2_SPI_PRESCALER_SPI_PRESCALER_FLAG4_POS], spi_prescaler_reg[`SPI2_SPI_PRESCALER_SPI_PRESCALER_FLAG3_POS], spi_prescaler_reg[`SPI2_SPI_PRESCALER_SPI_PRESCALER_FLAG2_POS], spi_prescaler_reg[`SPI2_SPI_PRESCALER_SPI_PRESCALER_FLAG1_POS], spi_prescaler_reg[`SPI2_SPI_PRESCALER_SPI_PRESCALER_FLAG0_POS]};
assign spi_chip_select_control_o = {spi_chip_select_reg[`SPI2_SPI_CHIP_SELECT_SPI_CHIP_SELECT_CONTROL7_POS], spi_chip_select_reg[`SPI2_SPI_CHIP_SELECT_SPI_CHIP_SELECT_CONTROL6_POS], spi_chip_select_reg[`SPI2_SPI_CHIP_SELECT_SPI_CHIP_SELECT_CONTROL5_POS], spi_chip_select_reg[`SPI2_SPI_CHIP_SELECT_SPI_CHIP_SELECT_CONTROL4_POS], spi_chip_select_reg[`SPI2_SPI_CHIP_SELECT_SPI_CHIP_SELECT_CONTROL3_POS], spi_chip_select_reg[`SPI2_SPI_CHIP_SELECT_SPI_CHIP_SELECT_CONTROL2_POS], spi_chip_select_reg[`SPI2_SPI_CHIP_SELECT_SPI_CHIP_SELECT_CONTROL1_POS], spi_chip_select_reg[`SPI2_SPI_CHIP_SELECT_SPI_CHIP_SELECT_CONTROL0_POS]};
assign spi_chip_select_config_o = {spi_chip_select_reg[`SPI2_SPI_CHIP_SELECT_SPI_CHIP_SELECT_CONFIG7_POS], spi_chip_select_reg[`SPI2_SPI_CHIP_SELECT_SPI_CHIP_SELECT_CONFIG6_POS], spi_chip_select_reg[`SPI2_SPI_CHIP_SELECT_SPI_CHIP_SELECT_CONFIG5_POS], spi_chip_select_reg[`SPI2_SPI_CHIP_SELECT_SPI_CHIP_SELECT_CONFIG4_POS], spi_chip_select_reg[`SPI2_SPI_CHIP_SELECT_SPI_CHIP_SELECT_CONFIG3_POS], spi_chip_select_reg[`SPI2_SPI_CHIP_SELECT_SPI_CHIP_SELECT_CONFIG2_POS], spi_chip_select_reg[`SPI2_SPI_CHIP_SELECT_SPI_CHIP_SELECT_CONFIG1_POS], spi_chip_select_reg[`SPI2_SPI_CHIP_SELECT_SPI_CHIP_SELECT_CONFIG0_POS]};
assign spi_chip_select_value_o = {spi_chip_select_reg[`SPI2_SPI_CHIP_SELECT_SPI_CHIP_SELECT_VALUE7_POS], spi_chip_select_reg[`SPI2_SPI_CHIP_SELECT_SPI_CHIP_SELECT_VALUE6_POS], spi_chip_select_reg[`SPI2_SPI_CHIP_SELECT_SPI_CHIP_SELECT_VALUE5_POS], spi_chip_select_reg[`SPI2_SPI_CHIP_SELECT_SPI_CHIP_SELECT_VALUE4_POS], spi_chip_select_reg[`SPI2_SPI_CHIP_SELECT_SPI_CHIP_SELECT_VALUE3_POS], spi_chip_select_reg[`SPI2_SPI_CHIP_SELECT_SPI_CHIP_SELECT_VALUE2_POS], spi_chip_select_reg[`SPI2_SPI_CHIP_SELECT_SPI_CHIP_SELECT_VALUE1_POS], spi_chip_select_reg[`SPI2_SPI_CHIP_SELECT_SPI_CHIP_SELECT_VALUE0_POS]};
assign spi_chip_select_flag_o = {spi_chip_select_reg[`SPI2_SPI_CHIP_SELECT_SPI_CHIP_SELECT_FLAG7_POS], spi_chip_select_reg[`SPI2_SPI_CHIP_SELECT_SPI_CHIP_SELECT_FLAG6_POS], spi_chip_select_reg[`SPI2_SPI_CHIP_SELECT_SPI_CHIP_SELECT_FLAG5_POS], spi_chip_select_reg[`SPI2_SPI_CHIP_SELECT_SPI_CHIP_SELECT_FLAG4_POS], spi_chip_select_reg[`SPI2_SPI_CHIP_SELECT_SPI_CHIP_SELECT_FLAG3_POS], spi_chip_select_reg[`SPI2_SPI_CHIP_SELECT_SPI_CHIP_SELECT_FLAG2_POS], spi_chip_select_reg[`SPI2_SPI_CHIP_SELECT_SPI_CHIP_SELECT_FLAG1_POS], spi_chip_select_reg[`SPI2_SPI_CHIP_SELECT_SPI_CHIP_SELECT_FLAG0_POS]};
assign spi_data_format_control_o = {spi_data_format_reg[`SPI2_SPI_DATA_FORMAT_SPI_DATA_FORMAT_CONTROL7_POS], spi_data_format_reg[`SPI2_SPI_DATA_FORMAT_SPI_DATA_FORMAT_CONTROL6_POS], spi_data_format_reg[`SPI2_SPI_DATA_FORMAT_SPI_DATA_FORMAT_CONTROL5_POS], spi_data_format_reg[`SPI2_SPI_DATA_FORMAT_SPI_DATA_FORMAT_CONTROL4_POS], spi_data_format_reg[`SPI2_SPI_DATA_FORMAT_SPI_DATA_FORMAT_CONTROL3_POS], spi_data_format_reg[`SPI2_SPI_DATA_FORMAT_SPI_DATA_FORMAT_CONTROL2_POS], spi_data_format_reg[`SPI2_SPI_DATA_FORMAT_SPI_DATA_FORMAT_CONTROL1_POS], spi_data_format_reg[`SPI2_SPI_DATA_FORMAT_SPI_DATA_FORMAT_CONTROL0_POS]};
assign spi_data_format_config_o = {spi_data_format_reg[`SPI2_SPI_DATA_FORMAT_SPI_DATA_FORMAT_CONFIG7_POS], spi_data_format_reg[`SPI2_SPI_DATA_FORMAT_SPI_DATA_FORMAT_CONFIG6_POS], spi_data_format_reg[`SPI2_SPI_DATA_FORMAT_SPI_DATA_FORMAT_CONFIG5_POS], spi_data_format_reg[`SPI2_SPI_DATA_FORMAT_SPI_DATA_FORMAT_CONFIG4_POS], spi_data_format_reg[`SPI2_SPI_DATA_FORMAT_SPI_DATA_FORMAT_CONFIG3_POS], spi_data_format_reg[`SPI2_SPI_DATA_FORMAT_SPI_DATA_FORMAT_CONFIG2_POS], spi_data_format_reg[`SPI2_SPI_DATA_FORMAT_SPI_DATA_FORMAT_CONFIG1_POS], spi_data_format_reg[`SPI2_SPI_DATA_FORMAT_SPI_DATA_FORMAT_CONFIG0_POS]};
assign spi_data_format_value_o = {spi_data_format_reg[`SPI2_SPI_DATA_FORMAT_SPI_DATA_FORMAT_VALUE7_POS], spi_data_format_reg[`SPI2_SPI_DATA_FORMAT_SPI_DATA_FORMAT_VALUE6_POS], spi_data_format_reg[`SPI2_SPI_DATA_FORMAT_SPI_DATA_FORMAT_VALUE5_POS], spi_data_format_reg[`SPI2_SPI_DATA_FORMAT_SPI_DATA_FORMAT_VALUE4_POS], spi_data_format_reg[`SPI2_SPI_DATA_FORMAT_SPI_DATA_FORMAT_VALUE3_POS], spi_data_format_reg[`SPI2_SPI_DATA_FORMAT_SPI_DATA_FORMAT_VALUE2_POS], spi_data_format_reg[`SPI2_SPI_DATA_FORMAT_SPI_DATA_FORMAT_VALUE1_POS], spi_data_format_reg[`SPI2_SPI_DATA_FORMAT_SPI_DATA_FORMAT_VALUE0_POS]};
assign spi_data_format_flag_o = {spi_data_format_reg[`SPI2_SPI_DATA_FORMAT_SPI_DATA_FORMAT_FLAG7_POS], spi_data_format_reg[`SPI2_SPI_DATA_FORMAT_SPI_DATA_FORMAT_FLAG6_POS], spi_data_format_reg[`SPI2_SPI_DATA_FORMAT_SPI_DATA_FORMAT_FLAG5_POS], spi_data_format_reg[`SPI2_SPI_DATA_FORMAT_SPI_DATA_FORMAT_FLAG4_POS], spi_data_format_reg[`SPI2_SPI_DATA_FORMAT_SPI_DATA_FORMAT_FLAG3_POS], spi_data_format_reg[`SPI2_SPI_DATA_FORMAT_SPI_DATA_FORMAT_FLAG2_POS], spi_data_format_reg[`SPI2_SPI_DATA_FORMAT_SPI_DATA_FORMAT_FLAG1_POS], spi_data_format_reg[`SPI2_SPI_DATA_FORMAT_SPI_DATA_FORMAT_FLAG0_POS]};
assign spi_transfer_control_o = {spi_transfer_reg[`SPI2_SPI_TRANSFER_SPI_TRANSFER_CONTROL7_POS], spi_transfer_reg[`SPI2_SPI_TRANSFER_SPI_TRANSFER_CONTROL6_POS], spi_transfer_reg[`SPI2_SPI_TRANSFER_SPI_TRANSFER_CONTROL5_POS], spi_transfer_reg[`SPI2_SPI_TRANSFER_SPI_TRANSFER_CONTROL4_POS], spi_transfer_reg[`SPI2_SPI_TRANSFER_SPI_TRANSFER_CONTROL3_POS], spi_transfer_reg[`SPI2_SPI_TRANSFER_SPI_TRANSFER_CONTROL2_POS], spi_transfer_reg[`SPI2_SPI_TRANSFER_SPI_TRANSFER_CONTROL1_POS], spi_transfer_reg[`SPI2_SPI_TRANSFER_SPI_TRANSFER_CONTROL0_POS]};
assign spi_transfer_config_o = {spi_transfer_reg[`SPI2_SPI_TRANSFER_SPI_TRANSFER_CONFIG7_POS], spi_transfer_reg[`SPI2_SPI_TRANSFER_SPI_TRANSFER_CONFIG6_POS], spi_transfer_reg[`SPI2_SPI_TRANSFER_SPI_TRANSFER_CONFIG5_POS], spi_transfer_reg[`SPI2_SPI_TRANSFER_SPI_TRANSFER_CONFIG4_POS], spi_transfer_reg[`SPI2_SPI_TRANSFER_SPI_TRANSFER_CONFIG3_POS], spi_transfer_reg[`SPI2_SPI_TRANSFER_SPI_TRANSFER_CONFIG2_POS], spi_transfer_reg[`SPI2_SPI_TRANSFER_SPI_TRANSFER_CONFIG1_POS], spi_transfer_reg[`SPI2_SPI_TRANSFER_SPI_TRANSFER_CONFIG0_POS]};
assign spi_transfer_value_o = {spi_transfer_reg[`SPI2_SPI_TRANSFER_SPI_TRANSFER_VALUE7_POS], spi_transfer_reg[`SPI2_SPI_TRANSFER_SPI_TRANSFER_VALUE6_POS], spi_transfer_reg[`SPI2_SPI_TRANSFER_SPI_TRANSFER_VALUE5_POS], spi_transfer_reg[`SPI2_SPI_TRANSFER_SPI_TRANSFER_VALUE4_POS], spi_transfer_reg[`SPI2_SPI_TRANSFER_SPI_TRANSFER_VALUE3_POS], spi_transfer_reg[`SPI2_SPI_TRANSFER_SPI_TRANSFER_VALUE2_POS], spi_transfer_reg[`SPI2_SPI_TRANSFER_SPI_TRANSFER_VALUE1_POS], spi_transfer_reg[`SPI2_SPI_TRANSFER_SPI_TRANSFER_VALUE0_POS]};
assign spi_transfer_flag_o = {spi_transfer_reg[`SPI2_SPI_TRANSFER_SPI_TRANSFER_FLAG7_POS], spi_transfer_reg[`SPI2_SPI_TRANSFER_SPI_TRANSFER_FLAG6_POS], spi_transfer_reg[`SPI2_SPI_TRANSFER_SPI_TRANSFER_FLAG5_POS], spi_transfer_reg[`SPI2_SPI_TRANSFER_SPI_TRANSFER_FLAG4_POS], spi_transfer_reg[`SPI2_SPI_TRANSFER_SPI_TRANSFER_FLAG3_POS], spi_transfer_reg[`SPI2_SPI_TRANSFER_SPI_TRANSFER_FLAG2_POS], spi_transfer_reg[`SPI2_SPI_TRANSFER_SPI_TRANSFER_FLAG1_POS], spi_transfer_reg[`SPI2_SPI_TRANSFER_SPI_TRANSFER_FLAG0_POS]};
assign spi_command_control_o = {spi_command_reg[`SPI2_SPI_COMMAND_SPI_COMMAND_CONTROL7_POS], spi_command_reg[`SPI2_SPI_COMMAND_SPI_COMMAND_CONTROL6_POS], spi_command_reg[`SPI2_SPI_COMMAND_SPI_COMMAND_CONTROL5_POS], spi_command_reg[`SPI2_SPI_COMMAND_SPI_COMMAND_CONTROL4_POS], spi_command_reg[`SPI2_SPI_COMMAND_SPI_COMMAND_CONTROL3_POS], spi_command_reg[`SPI2_SPI_COMMAND_SPI_COMMAND_CONTROL2_POS], spi_command_reg[`SPI2_SPI_COMMAND_SPI_COMMAND_CONTROL1_POS], spi_command_reg[`SPI2_SPI_COMMAND_SPI_COMMAND_CONTROL0_POS]};
assign spi_command_config_o = {spi_command_reg[`SPI2_SPI_COMMAND_SPI_COMMAND_CONFIG7_POS], spi_command_reg[`SPI2_SPI_COMMAND_SPI_COMMAND_CONFIG6_POS], spi_command_reg[`SPI2_SPI_COMMAND_SPI_COMMAND_CONFIG5_POS], spi_command_reg[`SPI2_SPI_COMMAND_SPI_COMMAND_CONFIG4_POS], spi_command_reg[`SPI2_SPI_COMMAND_SPI_COMMAND_CONFIG3_POS], spi_command_reg[`SPI2_SPI_COMMAND_SPI_COMMAND_CONFIG2_POS], spi_command_reg[`SPI2_SPI_COMMAND_SPI_COMMAND_CONFIG1_POS], spi_command_reg[`SPI2_SPI_COMMAND_SPI_COMMAND_CONFIG0_POS]};
assign spi_command_value_o = {spi_command_reg[`SPI2_SPI_COMMAND_SPI_COMMAND_VALUE7_POS], spi_command_reg[`SPI2_SPI_COMMAND_SPI_COMMAND_VALUE6_POS], spi_command_reg[`SPI2_SPI_COMMAND_SPI_COMMAND_VALUE5_POS], spi_command_reg[`SPI2_SPI_COMMAND_SPI_COMMAND_VALUE4_POS], spi_command_reg[`SPI2_SPI_COMMAND_SPI_COMMAND_VALUE3_POS], spi_command_reg[`SPI2_SPI_COMMAND_SPI_COMMAND_VALUE2_POS], spi_command_reg[`SPI2_SPI_COMMAND_SPI_COMMAND_VALUE1_POS], spi_command_reg[`SPI2_SPI_COMMAND_SPI_COMMAND_VALUE0_POS]};
assign spi_command_flag_o = {spi_command_reg[`SPI2_SPI_COMMAND_SPI_COMMAND_FLAG7_POS], spi_command_reg[`SPI2_SPI_COMMAND_SPI_COMMAND_FLAG6_POS], spi_command_reg[`SPI2_SPI_COMMAND_SPI_COMMAND_FLAG5_POS], spi_command_reg[`SPI2_SPI_COMMAND_SPI_COMMAND_FLAG4_POS], spi_command_reg[`SPI2_SPI_COMMAND_SPI_COMMAND_FLAG3_POS], spi_command_reg[`SPI2_SPI_COMMAND_SPI_COMMAND_FLAG2_POS], spi_command_reg[`SPI2_SPI_COMMAND_SPI_COMMAND_FLAG1_POS], spi_command_reg[`SPI2_SPI_COMMAND_SPI_COMMAND_FLAG0_POS]};
assign spi_response_control_o = {spi_response_reg[`SPI2_SPI_RESPONSE_SPI_RESPONSE_CONTROL7_POS], spi_response_reg[`SPI2_SPI_RESPONSE_SPI_RESPONSE_CONTROL6_POS], spi_response_reg[`SPI2_SPI_RESPONSE_SPI_RESPONSE_CONTROL5_POS], spi_response_reg[`SPI2_SPI_RESPONSE_SPI_RESPONSE_CONTROL4_POS], spi_response_reg[`SPI2_SPI_RESPONSE_SPI_RESPONSE_CONTROL3_POS], spi_response_reg[`SPI2_SPI_RESPONSE_SPI_RESPONSE_CONTROL2_POS], spi_response_reg[`SPI2_SPI_RESPONSE_SPI_RESPONSE_CONTROL1_POS], spi_response_reg[`SPI2_SPI_RESPONSE_SPI_RESPONSE_CONTROL0_POS]};
assign spi_response_config_o = {spi_response_reg[`SPI2_SPI_RESPONSE_SPI_RESPONSE_CONFIG7_POS], spi_response_reg[`SPI2_SPI_RESPONSE_SPI_RESPONSE_CONFIG6_POS], spi_response_reg[`SPI2_SPI_RESPONSE_SPI_RESPONSE_CONFIG5_POS], spi_response_reg[`SPI2_SPI_RESPONSE_SPI_RESPONSE_CONFIG4_POS], spi_response_reg[`SPI2_SPI_RESPONSE_SPI_RESPONSE_CONFIG3_POS], spi_response_reg[`SPI2_SPI_RESPONSE_SPI_RESPONSE_CONFIG2_POS], spi_response_reg[`SPI2_SPI_RESPONSE_SPI_RESPONSE_CONFIG1_POS], spi_response_reg[`SPI2_SPI_RESPONSE_SPI_RESPONSE_CONFIG0_POS]};
assign spi_response_value_o = {spi_response_reg[`SPI2_SPI_RESPONSE_SPI_RESPONSE_VALUE7_POS], spi_response_reg[`SPI2_SPI_RESPONSE_SPI_RESPONSE_VALUE6_POS], spi_response_reg[`SPI2_SPI_RESPONSE_SPI_RESPONSE_VALUE5_POS], spi_response_reg[`SPI2_SPI_RESPONSE_SPI_RESPONSE_VALUE4_POS], spi_response_reg[`SPI2_SPI_RESPONSE_SPI_RESPONSE_VALUE3_POS], spi_response_reg[`SPI2_SPI_RESPONSE_SPI_RESPONSE_VALUE2_POS], spi_response_reg[`SPI2_SPI_RESPONSE_SPI_RESPONSE_VALUE1_POS], spi_response_reg[`SPI2_SPI_RESPONSE_SPI_RESPONSE_VALUE0_POS]};
assign spi_response_flag_o = {spi_response_reg[`SPI2_SPI_RESPONSE_SPI_RESPONSE_FLAG7_POS], spi_response_reg[`SPI2_SPI_RESPONSE_SPI_RESPONSE_FLAG6_POS], spi_response_reg[`SPI2_SPI_RESPONSE_SPI_RESPONSE_FLAG5_POS], spi_response_reg[`SPI2_SPI_RESPONSE_SPI_RESPONSE_FLAG4_POS], spi_response_reg[`SPI2_SPI_RESPONSE_SPI_RESPONSE_FLAG3_POS], spi_response_reg[`SPI2_SPI_RESPONSE_SPI_RESPONSE_FLAG2_POS], spi_response_reg[`SPI2_SPI_RESPONSE_SPI_RESPONSE_FLAG1_POS], spi_response_reg[`SPI2_SPI_RESPONSE_SPI_RESPONSE_FLAG0_POS]};
assign spi_error_control_o = {spi_error_reg[`SPI2_SPI_ERROR_SPI_ERROR_CONTROL7_POS], spi_error_reg[`SPI2_SPI_ERROR_SPI_ERROR_CONTROL6_POS], spi_error_reg[`SPI2_SPI_ERROR_SPI_ERROR_CONTROL5_POS], spi_error_reg[`SPI2_SPI_ERROR_SPI_ERROR_CONTROL4_POS], spi_error_reg[`SPI2_SPI_ERROR_SPI_ERROR_CONTROL3_POS], spi_error_reg[`SPI2_SPI_ERROR_SPI_ERROR_CONTROL2_POS], spi_error_reg[`SPI2_SPI_ERROR_SPI_ERROR_CONTROL1_POS], spi_error_reg[`SPI2_SPI_ERROR_SPI_ERROR_CONTROL0_POS]};
assign spi_error_config_o = {spi_error_reg[`SPI2_SPI_ERROR_SPI_ERROR_CONFIG7_POS], spi_error_reg[`SPI2_SPI_ERROR_SPI_ERROR_CONFIG6_POS], spi_error_reg[`SPI2_SPI_ERROR_SPI_ERROR_CONFIG5_POS], spi_error_reg[`SPI2_SPI_ERROR_SPI_ERROR_CONFIG4_POS], spi_error_reg[`SPI2_SPI_ERROR_SPI_ERROR_CONFIG3_POS], spi_error_reg[`SPI2_SPI_ERROR_SPI_ERROR_CONFIG2_POS], spi_error_reg[`SPI2_SPI_ERROR_SPI_ERROR_CONFIG1_POS], spi_error_reg[`SPI2_SPI_ERROR_SPI_ERROR_CONFIG0_POS]};
assign spi_error_value_o = {spi_error_reg[`SPI2_SPI_ERROR_SPI_ERROR_VALUE7_POS], spi_error_reg[`SPI2_SPI_ERROR_SPI_ERROR_VALUE6_POS], spi_error_reg[`SPI2_SPI_ERROR_SPI_ERROR_VALUE5_POS], spi_error_reg[`SPI2_SPI_ERROR_SPI_ERROR_VALUE4_POS], spi_error_reg[`SPI2_SPI_ERROR_SPI_ERROR_VALUE3_POS], spi_error_reg[`SPI2_SPI_ERROR_SPI_ERROR_VALUE2_POS], spi_error_reg[`SPI2_SPI_ERROR_SPI_ERROR_VALUE1_POS], spi_error_reg[`SPI2_SPI_ERROR_SPI_ERROR_VALUE0_POS]};
assign spi_error_flag_o = {spi_error_reg[`SPI2_SPI_ERROR_SPI_ERROR_FLAG7_POS], spi_error_reg[`SPI2_SPI_ERROR_SPI_ERROR_FLAG6_POS], spi_error_reg[`SPI2_SPI_ERROR_SPI_ERROR_FLAG5_POS], spi_error_reg[`SPI2_SPI_ERROR_SPI_ERROR_FLAG4_POS], spi_error_reg[`SPI2_SPI_ERROR_SPI_ERROR_FLAG3_POS], spi_error_reg[`SPI2_SPI_ERROR_SPI_ERROR_FLAG2_POS], spi_error_reg[`SPI2_SPI_ERROR_SPI_ERROR_FLAG1_POS], spi_error_reg[`SPI2_SPI_ERROR_SPI_ERROR_FLAG0_POS]};
assign spi_timeout_control_o = {spi_timeout_reg[`SPI2_SPI_TIMEOUT_SPI_TIMEOUT_CONTROL7_POS], spi_timeout_reg[`SPI2_SPI_TIMEOUT_SPI_TIMEOUT_CONTROL6_POS], spi_timeout_reg[`SPI2_SPI_TIMEOUT_SPI_TIMEOUT_CONTROL5_POS], spi_timeout_reg[`SPI2_SPI_TIMEOUT_SPI_TIMEOUT_CONTROL4_POS], spi_timeout_reg[`SPI2_SPI_TIMEOUT_SPI_TIMEOUT_CONTROL3_POS], spi_timeout_reg[`SPI2_SPI_TIMEOUT_SPI_TIMEOUT_CONTROL2_POS], spi_timeout_reg[`SPI2_SPI_TIMEOUT_SPI_TIMEOUT_CONTROL1_POS], spi_timeout_reg[`SPI2_SPI_TIMEOUT_SPI_TIMEOUT_CONTROL0_POS]};
assign spi_timeout_config_o = {spi_timeout_reg[`SPI2_SPI_TIMEOUT_SPI_TIMEOUT_CONFIG7_POS], spi_timeout_reg[`SPI2_SPI_TIMEOUT_SPI_TIMEOUT_CONFIG6_POS], spi_timeout_reg[`SPI2_SPI_TIMEOUT_SPI_TIMEOUT_CONFIG5_POS], spi_timeout_reg[`SPI2_SPI_TIMEOUT_SPI_TIMEOUT_CONFIG4_POS], spi_timeout_reg[`SPI2_SPI_TIMEOUT_SPI_TIMEOUT_CONFIG3_POS], spi_timeout_reg[`SPI2_SPI_TIMEOUT_SPI_TIMEOUT_CONFIG2_POS], spi_timeout_reg[`SPI2_SPI_TIMEOUT_SPI_TIMEOUT_CONFIG1_POS], spi_timeout_reg[`SPI2_SPI_TIMEOUT_SPI_TIMEOUT_CONFIG0_POS]};
assign spi_timeout_value_o = {spi_timeout_reg[`SPI2_SPI_TIMEOUT_SPI_TIMEOUT_VALUE7_POS], spi_timeout_reg[`SPI2_SPI_TIMEOUT_SPI_TIMEOUT_VALUE6_POS], spi_timeout_reg[`SPI2_SPI_TIMEOUT_SPI_TIMEOUT_VALUE5_POS], spi_timeout_reg[`SPI2_SPI_TIMEOUT_SPI_TIMEOUT_VALUE4_POS], spi_timeout_reg[`SPI2_SPI_TIMEOUT_SPI_TIMEOUT_VALUE3_POS], spi_timeout_reg[`SPI2_SPI_TIMEOUT_SPI_TIMEOUT_VALUE2_POS], spi_timeout_reg[`SPI2_SPI_TIMEOUT_SPI_TIMEOUT_VALUE1_POS], spi_timeout_reg[`SPI2_SPI_TIMEOUT_SPI_TIMEOUT_VALUE0_POS]};
assign spi_timeout_flag_o = {spi_timeout_reg[`SPI2_SPI_TIMEOUT_SPI_TIMEOUT_FLAG7_POS], spi_timeout_reg[`SPI2_SPI_TIMEOUT_SPI_TIMEOUT_FLAG6_POS], spi_timeout_reg[`SPI2_SPI_TIMEOUT_SPI_TIMEOUT_FLAG5_POS], spi_timeout_reg[`SPI2_SPI_TIMEOUT_SPI_TIMEOUT_FLAG4_POS], spi_timeout_reg[`SPI2_SPI_TIMEOUT_SPI_TIMEOUT_FLAG3_POS], spi_timeout_reg[`SPI2_SPI_TIMEOUT_SPI_TIMEOUT_FLAG2_POS], spi_timeout_reg[`SPI2_SPI_TIMEOUT_SPI_TIMEOUT_FLAG1_POS], spi_timeout_reg[`SPI2_SPI_TIMEOUT_SPI_TIMEOUT_FLAG0_POS]};
assign spi_dma_config_control_o = {spi_dma_config_reg[`SPI2_SPI_DMA_CONFIG_SPI_DMA_CONFIG_CONTROL7_POS], spi_dma_config_reg[`SPI2_SPI_DMA_CONFIG_SPI_DMA_CONFIG_CONTROL6_POS], spi_dma_config_reg[`SPI2_SPI_DMA_CONFIG_SPI_DMA_CONFIG_CONTROL5_POS], spi_dma_config_reg[`SPI2_SPI_DMA_CONFIG_SPI_DMA_CONFIG_CONTROL4_POS], spi_dma_config_reg[`SPI2_SPI_DMA_CONFIG_SPI_DMA_CONFIG_CONTROL3_POS], spi_dma_config_reg[`SPI2_SPI_DMA_CONFIG_SPI_DMA_CONFIG_CONTROL2_POS], spi_dma_config_reg[`SPI2_SPI_DMA_CONFIG_SPI_DMA_CONFIG_CONTROL1_POS], spi_dma_config_reg[`SPI2_SPI_DMA_CONFIG_SPI_DMA_CONFIG_CONTROL0_POS]};
assign spi_dma_config_config_o = {spi_dma_config_reg[`SPI2_SPI_DMA_CONFIG_SPI_DMA_CONFIG_CONFIG7_POS], spi_dma_config_reg[`SPI2_SPI_DMA_CONFIG_SPI_DMA_CONFIG_CONFIG6_POS], spi_dma_config_reg[`SPI2_SPI_DMA_CONFIG_SPI_DMA_CONFIG_CONFIG5_POS], spi_dma_config_reg[`SPI2_SPI_DMA_CONFIG_SPI_DMA_CONFIG_CONFIG4_POS], spi_dma_config_reg[`SPI2_SPI_DMA_CONFIG_SPI_DMA_CONFIG_CONFIG3_POS], spi_dma_config_reg[`SPI2_SPI_DMA_CONFIG_SPI_DMA_CONFIG_CONFIG2_POS], spi_dma_config_reg[`SPI2_SPI_DMA_CONFIG_SPI_DMA_CONFIG_CONFIG1_POS], spi_dma_config_reg[`SPI2_SPI_DMA_CONFIG_SPI_DMA_CONFIG_CONFIG0_POS]};
assign spi_dma_config_value_o = {spi_dma_config_reg[`SPI2_SPI_DMA_CONFIG_SPI_DMA_CONFIG_VALUE7_POS], spi_dma_config_reg[`SPI2_SPI_DMA_CONFIG_SPI_DMA_CONFIG_VALUE6_POS], spi_dma_config_reg[`SPI2_SPI_DMA_CONFIG_SPI_DMA_CONFIG_VALUE5_POS], spi_dma_config_reg[`SPI2_SPI_DMA_CONFIG_SPI_DMA_CONFIG_VALUE4_POS], spi_dma_config_reg[`SPI2_SPI_DMA_CONFIG_SPI_DMA_CONFIG_VALUE3_POS], spi_dma_config_reg[`SPI2_SPI_DMA_CONFIG_SPI_DMA_CONFIG_VALUE2_POS], spi_dma_config_reg[`SPI2_SPI_DMA_CONFIG_SPI_DMA_CONFIG_VALUE1_POS], spi_dma_config_reg[`SPI2_SPI_DMA_CONFIG_SPI_DMA_CONFIG_VALUE0_POS]};
assign spi_dma_config_flag_o = {spi_dma_config_reg[`SPI2_SPI_DMA_CONFIG_SPI_DMA_CONFIG_FLAG7_POS], spi_dma_config_reg[`SPI2_SPI_DMA_CONFIG_SPI_DMA_CONFIG_FLAG6_POS], spi_dma_config_reg[`SPI2_SPI_DMA_CONFIG_SPI_DMA_CONFIG_FLAG5_POS], spi_dma_config_reg[`SPI2_SPI_DMA_CONFIG_SPI_DMA_CONFIG_FLAG4_POS], spi_dma_config_reg[`SPI2_SPI_DMA_CONFIG_SPI_DMA_CONFIG_FLAG3_POS], spi_dma_config_reg[`SPI2_SPI_DMA_CONFIG_SPI_DMA_CONFIG_FLAG2_POS], spi_dma_config_reg[`SPI2_SPI_DMA_CONFIG_SPI_DMA_CONFIG_FLAG1_POS], spi_dma_config_reg[`SPI2_SPI_DMA_CONFIG_SPI_DMA_CONFIG_FLAG0_POS]};
assign spi_dma_status_control_o = {spi_dma_status_reg[`SPI2_SPI_DMA_STATUS_SPI_DMA_STATUS_CONTROL7_POS], spi_dma_status_reg[`SPI2_SPI_DMA_STATUS_SPI_DMA_STATUS_CONTROL6_POS], spi_dma_status_reg[`SPI2_SPI_DMA_STATUS_SPI_DMA_STATUS_CONTROL5_POS], spi_dma_status_reg[`SPI2_SPI_DMA_STATUS_SPI_DMA_STATUS_CONTROL4_POS], spi_dma_status_reg[`SPI2_SPI_DMA_STATUS_SPI_DMA_STATUS_CONTROL3_POS], spi_dma_status_reg[`SPI2_SPI_DMA_STATUS_SPI_DMA_STATUS_CONTROL2_POS], spi_dma_status_reg[`SPI2_SPI_DMA_STATUS_SPI_DMA_STATUS_CONTROL1_POS], spi_dma_status_reg[`SPI2_SPI_DMA_STATUS_SPI_DMA_STATUS_CONTROL0_POS]};
assign spi_dma_status_config_o = {spi_dma_status_reg[`SPI2_SPI_DMA_STATUS_SPI_DMA_STATUS_CONFIG7_POS], spi_dma_status_reg[`SPI2_SPI_DMA_STATUS_SPI_DMA_STATUS_CONFIG6_POS], spi_dma_status_reg[`SPI2_SPI_DMA_STATUS_SPI_DMA_STATUS_CONFIG5_POS], spi_dma_status_reg[`SPI2_SPI_DMA_STATUS_SPI_DMA_STATUS_CONFIG4_POS], spi_dma_status_reg[`SPI2_SPI_DMA_STATUS_SPI_DMA_STATUS_CONFIG3_POS], spi_dma_status_reg[`SPI2_SPI_DMA_STATUS_SPI_DMA_STATUS_CONFIG2_POS], spi_dma_status_reg[`SPI2_SPI_DMA_STATUS_SPI_DMA_STATUS_CONFIG1_POS], spi_dma_status_reg[`SPI2_SPI_DMA_STATUS_SPI_DMA_STATUS_CONFIG0_POS]};
assign spi_dma_status_value_o = {spi_dma_status_reg[`SPI2_SPI_DMA_STATUS_SPI_DMA_STATUS_VALUE7_POS], spi_dma_status_reg[`SPI2_SPI_DMA_STATUS_SPI_DMA_STATUS_VALUE6_POS], spi_dma_status_reg[`SPI2_SPI_DMA_STATUS_SPI_DMA_STATUS_VALUE5_POS], spi_dma_status_reg[`SPI2_SPI_DMA_STATUS_SPI_DMA_STATUS_VALUE4_POS], spi_dma_status_reg[`SPI2_SPI_DMA_STATUS_SPI_DMA_STATUS_VALUE3_POS], spi_dma_status_reg[`SPI2_SPI_DMA_STATUS_SPI_DMA_STATUS_VALUE2_POS], spi_dma_status_reg[`SPI2_SPI_DMA_STATUS_SPI_DMA_STATUS_VALUE1_POS], spi_dma_status_reg[`SPI2_SPI_DMA_STATUS_SPI_DMA_STATUS_VALUE0_POS]};
assign spi_dma_status_flag_o = {spi_dma_status_reg[`SPI2_SPI_DMA_STATUS_SPI_DMA_STATUS_FLAG7_POS], spi_dma_status_reg[`SPI2_SPI_DMA_STATUS_SPI_DMA_STATUS_FLAG6_POS], spi_dma_status_reg[`SPI2_SPI_DMA_STATUS_SPI_DMA_STATUS_FLAG5_POS], spi_dma_status_reg[`SPI2_SPI_DMA_STATUS_SPI_DMA_STATUS_FLAG4_POS], spi_dma_status_reg[`SPI2_SPI_DMA_STATUS_SPI_DMA_STATUS_FLAG3_POS], spi_dma_status_reg[`SPI2_SPI_DMA_STATUS_SPI_DMA_STATUS_FLAG2_POS], spi_dma_status_reg[`SPI2_SPI_DMA_STATUS_SPI_DMA_STATUS_FLAG1_POS], spi_dma_status_reg[`SPI2_SPI_DMA_STATUS_SPI_DMA_STATUS_FLAG0_POS]};
assign spi_tx_data_control_o = {spi_tx_data_reg[`SPI2_SPI_TX_DATA_SPI_TX_DATA_CONTROL7_POS], spi_tx_data_reg[`SPI2_SPI_TX_DATA_SPI_TX_DATA_CONTROL6_POS], spi_tx_data_reg[`SPI2_SPI_TX_DATA_SPI_TX_DATA_CONTROL5_POS], spi_tx_data_reg[`SPI2_SPI_TX_DATA_SPI_TX_DATA_CONTROL4_POS], spi_tx_data_reg[`SPI2_SPI_TX_DATA_SPI_TX_DATA_CONTROL3_POS], spi_tx_data_reg[`SPI2_SPI_TX_DATA_SPI_TX_DATA_CONTROL2_POS], spi_tx_data_reg[`SPI2_SPI_TX_DATA_SPI_TX_DATA_CONTROL1_POS], spi_tx_data_reg[`SPI2_SPI_TX_DATA_SPI_TX_DATA_CONTROL0_POS]};
assign spi_tx_data_config_o = {spi_tx_data_reg[`SPI2_SPI_TX_DATA_SPI_TX_DATA_CONFIG7_POS], spi_tx_data_reg[`SPI2_SPI_TX_DATA_SPI_TX_DATA_CONFIG6_POS], spi_tx_data_reg[`SPI2_SPI_TX_DATA_SPI_TX_DATA_CONFIG5_POS], spi_tx_data_reg[`SPI2_SPI_TX_DATA_SPI_TX_DATA_CONFIG4_POS], spi_tx_data_reg[`SPI2_SPI_TX_DATA_SPI_TX_DATA_CONFIG3_POS], spi_tx_data_reg[`SPI2_SPI_TX_DATA_SPI_TX_DATA_CONFIG2_POS], spi_tx_data_reg[`SPI2_SPI_TX_DATA_SPI_TX_DATA_CONFIG1_POS], spi_tx_data_reg[`SPI2_SPI_TX_DATA_SPI_TX_DATA_CONFIG0_POS]};
assign spi_tx_data_value_o = {spi_tx_data_reg[`SPI2_SPI_TX_DATA_SPI_TX_DATA_VALUE7_POS], spi_tx_data_reg[`SPI2_SPI_TX_DATA_SPI_TX_DATA_VALUE6_POS], spi_tx_data_reg[`SPI2_SPI_TX_DATA_SPI_TX_DATA_VALUE5_POS], spi_tx_data_reg[`SPI2_SPI_TX_DATA_SPI_TX_DATA_VALUE4_POS], spi_tx_data_reg[`SPI2_SPI_TX_DATA_SPI_TX_DATA_VALUE3_POS], spi_tx_data_reg[`SPI2_SPI_TX_DATA_SPI_TX_DATA_VALUE2_POS], spi_tx_data_reg[`SPI2_SPI_TX_DATA_SPI_TX_DATA_VALUE1_POS], spi_tx_data_reg[`SPI2_SPI_TX_DATA_SPI_TX_DATA_VALUE0_POS]};
assign spi_tx_data_flag_o = {spi_tx_data_reg[`SPI2_SPI_TX_DATA_SPI_TX_DATA_FLAG7_POS], spi_tx_data_reg[`SPI2_SPI_TX_DATA_SPI_TX_DATA_FLAG6_POS], spi_tx_data_reg[`SPI2_SPI_TX_DATA_SPI_TX_DATA_FLAG5_POS], spi_tx_data_reg[`SPI2_SPI_TX_DATA_SPI_TX_DATA_FLAG4_POS], spi_tx_data_reg[`SPI2_SPI_TX_DATA_SPI_TX_DATA_FLAG3_POS], spi_tx_data_reg[`SPI2_SPI_TX_DATA_SPI_TX_DATA_FLAG2_POS], spi_tx_data_reg[`SPI2_SPI_TX_DATA_SPI_TX_DATA_FLAG1_POS], spi_tx_data_reg[`SPI2_SPI_TX_DATA_SPI_TX_DATA_FLAG0_POS]};
assign spi_rx_data_control_o = {spi_rx_data_reg[`SPI2_SPI_RX_DATA_SPI_RX_DATA_CONTROL7_POS], spi_rx_data_reg[`SPI2_SPI_RX_DATA_SPI_RX_DATA_CONTROL6_POS], spi_rx_data_reg[`SPI2_SPI_RX_DATA_SPI_RX_DATA_CONTROL5_POS], spi_rx_data_reg[`SPI2_SPI_RX_DATA_SPI_RX_DATA_CONTROL4_POS], spi_rx_data_reg[`SPI2_SPI_RX_DATA_SPI_RX_DATA_CONTROL3_POS], spi_rx_data_reg[`SPI2_SPI_RX_DATA_SPI_RX_DATA_CONTROL2_POS], spi_rx_data_reg[`SPI2_SPI_RX_DATA_SPI_RX_DATA_CONTROL1_POS], spi_rx_data_reg[`SPI2_SPI_RX_DATA_SPI_RX_DATA_CONTROL0_POS]};
assign spi_rx_data_config_o = {spi_rx_data_reg[`SPI2_SPI_RX_DATA_SPI_RX_DATA_CONFIG7_POS], spi_rx_data_reg[`SPI2_SPI_RX_DATA_SPI_RX_DATA_CONFIG6_POS], spi_rx_data_reg[`SPI2_SPI_RX_DATA_SPI_RX_DATA_CONFIG5_POS], spi_rx_data_reg[`SPI2_SPI_RX_DATA_SPI_RX_DATA_CONFIG4_POS], spi_rx_data_reg[`SPI2_SPI_RX_DATA_SPI_RX_DATA_CONFIG3_POS], spi_rx_data_reg[`SPI2_SPI_RX_DATA_SPI_RX_DATA_CONFIG2_POS], spi_rx_data_reg[`SPI2_SPI_RX_DATA_SPI_RX_DATA_CONFIG1_POS], spi_rx_data_reg[`SPI2_SPI_RX_DATA_SPI_RX_DATA_CONFIG0_POS]};
assign spi_rx_data_value_o = {spi_rx_data_reg[`SPI2_SPI_RX_DATA_SPI_RX_DATA_VALUE7_POS], spi_rx_data_reg[`SPI2_SPI_RX_DATA_SPI_RX_DATA_VALUE6_POS], spi_rx_data_reg[`SPI2_SPI_RX_DATA_SPI_RX_DATA_VALUE5_POS], spi_rx_data_reg[`SPI2_SPI_RX_DATA_SPI_RX_DATA_VALUE4_POS], spi_rx_data_reg[`SPI2_SPI_RX_DATA_SPI_RX_DATA_VALUE3_POS], spi_rx_data_reg[`SPI2_SPI_RX_DATA_SPI_RX_DATA_VALUE2_POS], spi_rx_data_reg[`SPI2_SPI_RX_DATA_SPI_RX_DATA_VALUE1_POS], spi_rx_data_reg[`SPI2_SPI_RX_DATA_SPI_RX_DATA_VALUE0_POS]};
assign spi_rx_data_flag_o = {spi_rx_data_reg[`SPI2_SPI_RX_DATA_SPI_RX_DATA_FLAG7_POS], spi_rx_data_reg[`SPI2_SPI_RX_DATA_SPI_RX_DATA_FLAG6_POS], spi_rx_data_reg[`SPI2_SPI_RX_DATA_SPI_RX_DATA_FLAG5_POS], spi_rx_data_reg[`SPI2_SPI_RX_DATA_SPI_RX_DATA_FLAG4_POS], spi_rx_data_reg[`SPI2_SPI_RX_DATA_SPI_RX_DATA_FLAG3_POS], spi_rx_data_reg[`SPI2_SPI_RX_DATA_SPI_RX_DATA_FLAG2_POS], spi_rx_data_reg[`SPI2_SPI_RX_DATA_SPI_RX_DATA_FLAG1_POS], spi_rx_data_reg[`SPI2_SPI_RX_DATA_SPI_RX_DATA_FLAG0_POS]};
assign spi_tx_status_control_o = {spi_tx_status_reg[`SPI2_SPI_TX_STATUS_SPI_TX_STATUS_CONTROL7_POS], spi_tx_status_reg[`SPI2_SPI_TX_STATUS_SPI_TX_STATUS_CONTROL6_POS], spi_tx_status_reg[`SPI2_SPI_TX_STATUS_SPI_TX_STATUS_CONTROL5_POS], spi_tx_status_reg[`SPI2_SPI_TX_STATUS_SPI_TX_STATUS_CONTROL4_POS], spi_tx_status_reg[`SPI2_SPI_TX_STATUS_SPI_TX_STATUS_CONTROL3_POS], spi_tx_status_reg[`SPI2_SPI_TX_STATUS_SPI_TX_STATUS_CONTROL2_POS], spi_tx_status_reg[`SPI2_SPI_TX_STATUS_SPI_TX_STATUS_CONTROL1_POS], spi_tx_status_reg[`SPI2_SPI_TX_STATUS_SPI_TX_STATUS_CONTROL0_POS]};
assign spi_tx_status_config_o = {spi_tx_status_reg[`SPI2_SPI_TX_STATUS_SPI_TX_STATUS_CONFIG7_POS], spi_tx_status_reg[`SPI2_SPI_TX_STATUS_SPI_TX_STATUS_CONFIG6_POS], spi_tx_status_reg[`SPI2_SPI_TX_STATUS_SPI_TX_STATUS_CONFIG5_POS], spi_tx_status_reg[`SPI2_SPI_TX_STATUS_SPI_TX_STATUS_CONFIG4_POS], spi_tx_status_reg[`SPI2_SPI_TX_STATUS_SPI_TX_STATUS_CONFIG3_POS], spi_tx_status_reg[`SPI2_SPI_TX_STATUS_SPI_TX_STATUS_CONFIG2_POS], spi_tx_status_reg[`SPI2_SPI_TX_STATUS_SPI_TX_STATUS_CONFIG1_POS], spi_tx_status_reg[`SPI2_SPI_TX_STATUS_SPI_TX_STATUS_CONFIG0_POS]};
assign spi_tx_status_value_o = {spi_tx_status_reg[`SPI2_SPI_TX_STATUS_SPI_TX_STATUS_VALUE7_POS], spi_tx_status_reg[`SPI2_SPI_TX_STATUS_SPI_TX_STATUS_VALUE6_POS], spi_tx_status_reg[`SPI2_SPI_TX_STATUS_SPI_TX_STATUS_VALUE5_POS], spi_tx_status_reg[`SPI2_SPI_TX_STATUS_SPI_TX_STATUS_VALUE4_POS], spi_tx_status_reg[`SPI2_SPI_TX_STATUS_SPI_TX_STATUS_VALUE3_POS], spi_tx_status_reg[`SPI2_SPI_TX_STATUS_SPI_TX_STATUS_VALUE2_POS], spi_tx_status_reg[`SPI2_SPI_TX_STATUS_SPI_TX_STATUS_VALUE1_POS], spi_tx_status_reg[`SPI2_SPI_TX_STATUS_SPI_TX_STATUS_VALUE0_POS]};
assign spi_tx_status_flag_o = {spi_tx_status_reg[`SPI2_SPI_TX_STATUS_SPI_TX_STATUS_FLAG7_POS], spi_tx_status_reg[`SPI2_SPI_TX_STATUS_SPI_TX_STATUS_FLAG6_POS], spi_tx_status_reg[`SPI2_SPI_TX_STATUS_SPI_TX_STATUS_FLAG5_POS], spi_tx_status_reg[`SPI2_SPI_TX_STATUS_SPI_TX_STATUS_FLAG4_POS], spi_tx_status_reg[`SPI2_SPI_TX_STATUS_SPI_TX_STATUS_FLAG3_POS], spi_tx_status_reg[`SPI2_SPI_TX_STATUS_SPI_TX_STATUS_FLAG2_POS], spi_tx_status_reg[`SPI2_SPI_TX_STATUS_SPI_TX_STATUS_FLAG1_POS], spi_tx_status_reg[`SPI2_SPI_TX_STATUS_SPI_TX_STATUS_FLAG0_POS]};
assign spi_rx_status_control_o = {spi_rx_status_reg[`SPI2_SPI_RX_STATUS_SPI_RX_STATUS_CONTROL7_POS], spi_rx_status_reg[`SPI2_SPI_RX_STATUS_SPI_RX_STATUS_CONTROL6_POS], spi_rx_status_reg[`SPI2_SPI_RX_STATUS_SPI_RX_STATUS_CONTROL5_POS], spi_rx_status_reg[`SPI2_SPI_RX_STATUS_SPI_RX_STATUS_CONTROL4_POS], spi_rx_status_reg[`SPI2_SPI_RX_STATUS_SPI_RX_STATUS_CONTROL3_POS], spi_rx_status_reg[`SPI2_SPI_RX_STATUS_SPI_RX_STATUS_CONTROL2_POS], spi_rx_status_reg[`SPI2_SPI_RX_STATUS_SPI_RX_STATUS_CONTROL1_POS], spi_rx_status_reg[`SPI2_SPI_RX_STATUS_SPI_RX_STATUS_CONTROL0_POS]};
assign spi_rx_status_config_o = {spi_rx_status_reg[`SPI2_SPI_RX_STATUS_SPI_RX_STATUS_CONFIG7_POS], spi_rx_status_reg[`SPI2_SPI_RX_STATUS_SPI_RX_STATUS_CONFIG6_POS], spi_rx_status_reg[`SPI2_SPI_RX_STATUS_SPI_RX_STATUS_CONFIG5_POS], spi_rx_status_reg[`SPI2_SPI_RX_STATUS_SPI_RX_STATUS_CONFIG4_POS], spi_rx_status_reg[`SPI2_SPI_RX_STATUS_SPI_RX_STATUS_CONFIG3_POS], spi_rx_status_reg[`SPI2_SPI_RX_STATUS_SPI_RX_STATUS_CONFIG2_POS], spi_rx_status_reg[`SPI2_SPI_RX_STATUS_SPI_RX_STATUS_CONFIG1_POS], spi_rx_status_reg[`SPI2_SPI_RX_STATUS_SPI_RX_STATUS_CONFIG0_POS]};
assign spi_rx_status_value_o = {spi_rx_status_reg[`SPI2_SPI_RX_STATUS_SPI_RX_STATUS_VALUE7_POS], spi_rx_status_reg[`SPI2_SPI_RX_STATUS_SPI_RX_STATUS_VALUE6_POS], spi_rx_status_reg[`SPI2_SPI_RX_STATUS_SPI_RX_STATUS_VALUE5_POS], spi_rx_status_reg[`SPI2_SPI_RX_STATUS_SPI_RX_STATUS_VALUE4_POS], spi_rx_status_reg[`SPI2_SPI_RX_STATUS_SPI_RX_STATUS_VALUE3_POS], spi_rx_status_reg[`SPI2_SPI_RX_STATUS_SPI_RX_STATUS_VALUE2_POS], spi_rx_status_reg[`SPI2_SPI_RX_STATUS_SPI_RX_STATUS_VALUE1_POS], spi_rx_status_reg[`SPI2_SPI_RX_STATUS_SPI_RX_STATUS_VALUE0_POS]};
assign spi_rx_status_flag_o = {spi_rx_status_reg[`SPI2_SPI_RX_STATUS_SPI_RX_STATUS_FLAG7_POS], spi_rx_status_reg[`SPI2_SPI_RX_STATUS_SPI_RX_STATUS_FLAG6_POS], spi_rx_status_reg[`SPI2_SPI_RX_STATUS_SPI_RX_STATUS_FLAG5_POS], spi_rx_status_reg[`SPI2_SPI_RX_STATUS_SPI_RX_STATUS_FLAG4_POS], spi_rx_status_reg[`SPI2_SPI_RX_STATUS_SPI_RX_STATUS_FLAG3_POS], spi_rx_status_reg[`SPI2_SPI_RX_STATUS_SPI_RX_STATUS_FLAG2_POS], spi_rx_status_reg[`SPI2_SPI_RX_STATUS_SPI_RX_STATUS_FLAG1_POS], spi_rx_status_reg[`SPI2_SPI_RX_STATUS_SPI_RX_STATUS_FLAG0_POS]};
assign spi_fifo_control_control_o = {spi_fifo_control_reg[`SPI2_SPI_FIFO_CONTROL_SPI_FIFO_CONTROL_CONTROL7_POS], spi_fifo_control_reg[`SPI2_SPI_FIFO_CONTROL_SPI_FIFO_CONTROL_CONTROL6_POS], spi_fifo_control_reg[`SPI2_SPI_FIFO_CONTROL_SPI_FIFO_CONTROL_CONTROL5_POS], spi_fifo_control_reg[`SPI2_SPI_FIFO_CONTROL_SPI_FIFO_CONTROL_CONTROL4_POS], spi_fifo_control_reg[`SPI2_SPI_FIFO_CONTROL_SPI_FIFO_CONTROL_CONTROL3_POS], spi_fifo_control_reg[`SPI2_SPI_FIFO_CONTROL_SPI_FIFO_CONTROL_CONTROL2_POS], spi_fifo_control_reg[`SPI2_SPI_FIFO_CONTROL_SPI_FIFO_CONTROL_CONTROL1_POS], spi_fifo_control_reg[`SPI2_SPI_FIFO_CONTROL_SPI_FIFO_CONTROL_CONTROL0_POS]};
assign spi_fifo_control_config_o = {spi_fifo_control_reg[`SPI2_SPI_FIFO_CONTROL_SPI_FIFO_CONTROL_CONFIG7_POS], spi_fifo_control_reg[`SPI2_SPI_FIFO_CONTROL_SPI_FIFO_CONTROL_CONFIG6_POS], spi_fifo_control_reg[`SPI2_SPI_FIFO_CONTROL_SPI_FIFO_CONTROL_CONFIG5_POS], spi_fifo_control_reg[`SPI2_SPI_FIFO_CONTROL_SPI_FIFO_CONTROL_CONFIG4_POS], spi_fifo_control_reg[`SPI2_SPI_FIFO_CONTROL_SPI_FIFO_CONTROL_CONFIG3_POS], spi_fifo_control_reg[`SPI2_SPI_FIFO_CONTROL_SPI_FIFO_CONTROL_CONFIG2_POS], spi_fifo_control_reg[`SPI2_SPI_FIFO_CONTROL_SPI_FIFO_CONTROL_CONFIG1_POS], spi_fifo_control_reg[`SPI2_SPI_FIFO_CONTROL_SPI_FIFO_CONTROL_CONFIG0_POS]};
assign spi_fifo_control_value_o = {spi_fifo_control_reg[`SPI2_SPI_FIFO_CONTROL_SPI_FIFO_CONTROL_VALUE7_POS], spi_fifo_control_reg[`SPI2_SPI_FIFO_CONTROL_SPI_FIFO_CONTROL_VALUE6_POS], spi_fifo_control_reg[`SPI2_SPI_FIFO_CONTROL_SPI_FIFO_CONTROL_VALUE5_POS], spi_fifo_control_reg[`SPI2_SPI_FIFO_CONTROL_SPI_FIFO_CONTROL_VALUE4_POS], spi_fifo_control_reg[`SPI2_SPI_FIFO_CONTROL_SPI_FIFO_CONTROL_VALUE3_POS], spi_fifo_control_reg[`SPI2_SPI_FIFO_CONTROL_SPI_FIFO_CONTROL_VALUE2_POS], spi_fifo_control_reg[`SPI2_SPI_FIFO_CONTROL_SPI_FIFO_CONTROL_VALUE1_POS], spi_fifo_control_reg[`SPI2_SPI_FIFO_CONTROL_SPI_FIFO_CONTROL_VALUE0_POS]};
assign spi_fifo_control_flag_o = {spi_fifo_control_reg[`SPI2_SPI_FIFO_CONTROL_SPI_FIFO_CONTROL_FLAG7_POS], spi_fifo_control_reg[`SPI2_SPI_FIFO_CONTROL_SPI_FIFO_CONTROL_FLAG6_POS], spi_fifo_control_reg[`SPI2_SPI_FIFO_CONTROL_SPI_FIFO_CONTROL_FLAG5_POS], spi_fifo_control_reg[`SPI2_SPI_FIFO_CONTROL_SPI_FIFO_CONTROL_FLAG4_POS], spi_fifo_control_reg[`SPI2_SPI_FIFO_CONTROL_SPI_FIFO_CONTROL_FLAG3_POS], spi_fifo_control_reg[`SPI2_SPI_FIFO_CONTROL_SPI_FIFO_CONTROL_FLAG2_POS], spi_fifo_control_reg[`SPI2_SPI_FIFO_CONTROL_SPI_FIFO_CONTROL_FLAG1_POS], spi_fifo_control_reg[`SPI2_SPI_FIFO_CONTROL_SPI_FIFO_CONTROL_FLAG0_POS]};
assign spi_fifo_status_control_o = {spi_fifo_status_reg[`SPI2_SPI_FIFO_STATUS_SPI_FIFO_STATUS_CONTROL7_POS], spi_fifo_status_reg[`SPI2_SPI_FIFO_STATUS_SPI_FIFO_STATUS_CONTROL6_POS], spi_fifo_status_reg[`SPI2_SPI_FIFO_STATUS_SPI_FIFO_STATUS_CONTROL5_POS], spi_fifo_status_reg[`SPI2_SPI_FIFO_STATUS_SPI_FIFO_STATUS_CONTROL4_POS], spi_fifo_status_reg[`SPI2_SPI_FIFO_STATUS_SPI_FIFO_STATUS_CONTROL3_POS], spi_fifo_status_reg[`SPI2_SPI_FIFO_STATUS_SPI_FIFO_STATUS_CONTROL2_POS], spi_fifo_status_reg[`SPI2_SPI_FIFO_STATUS_SPI_FIFO_STATUS_CONTROL1_POS], spi_fifo_status_reg[`SPI2_SPI_FIFO_STATUS_SPI_FIFO_STATUS_CONTROL0_POS]};
assign spi_fifo_status_config_o = {spi_fifo_status_reg[`SPI2_SPI_FIFO_STATUS_SPI_FIFO_STATUS_CONFIG7_POS], spi_fifo_status_reg[`SPI2_SPI_FIFO_STATUS_SPI_FIFO_STATUS_CONFIG6_POS], spi_fifo_status_reg[`SPI2_SPI_FIFO_STATUS_SPI_FIFO_STATUS_CONFIG5_POS], spi_fifo_status_reg[`SPI2_SPI_FIFO_STATUS_SPI_FIFO_STATUS_CONFIG4_POS], spi_fifo_status_reg[`SPI2_SPI_FIFO_STATUS_SPI_FIFO_STATUS_CONFIG3_POS], spi_fifo_status_reg[`SPI2_SPI_FIFO_STATUS_SPI_FIFO_STATUS_CONFIG2_POS], spi_fifo_status_reg[`SPI2_SPI_FIFO_STATUS_SPI_FIFO_STATUS_CONFIG1_POS], spi_fifo_status_reg[`SPI2_SPI_FIFO_STATUS_SPI_FIFO_STATUS_CONFIG0_POS]};
assign spi_fifo_status_value_o = {spi_fifo_status_reg[`SPI2_SPI_FIFO_STATUS_SPI_FIFO_STATUS_VALUE7_POS], spi_fifo_status_reg[`SPI2_SPI_FIFO_STATUS_SPI_FIFO_STATUS_VALUE6_POS], spi_fifo_status_reg[`SPI2_SPI_FIFO_STATUS_SPI_FIFO_STATUS_VALUE5_POS], spi_fifo_status_reg[`SPI2_SPI_FIFO_STATUS_SPI_FIFO_STATUS_VALUE4_POS], spi_fifo_status_reg[`SPI2_SPI_FIFO_STATUS_SPI_FIFO_STATUS_VALUE3_POS], spi_fifo_status_reg[`SPI2_SPI_FIFO_STATUS_SPI_FIFO_STATUS_VALUE2_POS], spi_fifo_status_reg[`SPI2_SPI_FIFO_STATUS_SPI_FIFO_STATUS_VALUE1_POS], spi_fifo_status_reg[`SPI2_SPI_FIFO_STATUS_SPI_FIFO_STATUS_VALUE0_POS]};
assign spi_fifo_status_flag_o = {spi_fifo_status_reg[`SPI2_SPI_FIFO_STATUS_SPI_FIFO_STATUS_FLAG7_POS], spi_fifo_status_reg[`SPI2_SPI_FIFO_STATUS_SPI_FIFO_STATUS_FLAG6_POS], spi_fifo_status_reg[`SPI2_SPI_FIFO_STATUS_SPI_FIFO_STATUS_FLAG5_POS], spi_fifo_status_reg[`SPI2_SPI_FIFO_STATUS_SPI_FIFO_STATUS_FLAG4_POS], spi_fifo_status_reg[`SPI2_SPI_FIFO_STATUS_SPI_FIFO_STATUS_FLAG3_POS], spi_fifo_status_reg[`SPI2_SPI_FIFO_STATUS_SPI_FIFO_STATUS_FLAG2_POS], spi_fifo_status_reg[`SPI2_SPI_FIFO_STATUS_SPI_FIFO_STATUS_FLAG1_POS], spi_fifo_status_reg[`SPI2_SPI_FIFO_STATUS_SPI_FIFO_STATUS_FLAG0_POS]};
assign spi_tx_threshold_control_o = {spi_tx_threshold_reg[`SPI2_SPI_TX_THRESHOLD_SPI_TX_THRESHOLD_CONTROL7_POS], spi_tx_threshold_reg[`SPI2_SPI_TX_THRESHOLD_SPI_TX_THRESHOLD_CONTROL6_POS], spi_tx_threshold_reg[`SPI2_SPI_TX_THRESHOLD_SPI_TX_THRESHOLD_CONTROL5_POS], spi_tx_threshold_reg[`SPI2_SPI_TX_THRESHOLD_SPI_TX_THRESHOLD_CONTROL4_POS], spi_tx_threshold_reg[`SPI2_SPI_TX_THRESHOLD_SPI_TX_THRESHOLD_CONTROL3_POS], spi_tx_threshold_reg[`SPI2_SPI_TX_THRESHOLD_SPI_TX_THRESHOLD_CONTROL2_POS], spi_tx_threshold_reg[`SPI2_SPI_TX_THRESHOLD_SPI_TX_THRESHOLD_CONTROL1_POS], spi_tx_threshold_reg[`SPI2_SPI_TX_THRESHOLD_SPI_TX_THRESHOLD_CONTROL0_POS]};
assign spi_tx_threshold_config_o = {spi_tx_threshold_reg[`SPI2_SPI_TX_THRESHOLD_SPI_TX_THRESHOLD_CONFIG7_POS], spi_tx_threshold_reg[`SPI2_SPI_TX_THRESHOLD_SPI_TX_THRESHOLD_CONFIG6_POS], spi_tx_threshold_reg[`SPI2_SPI_TX_THRESHOLD_SPI_TX_THRESHOLD_CONFIG5_POS], spi_tx_threshold_reg[`SPI2_SPI_TX_THRESHOLD_SPI_TX_THRESHOLD_CONFIG4_POS], spi_tx_threshold_reg[`SPI2_SPI_TX_THRESHOLD_SPI_TX_THRESHOLD_CONFIG3_POS], spi_tx_threshold_reg[`SPI2_SPI_TX_THRESHOLD_SPI_TX_THRESHOLD_CONFIG2_POS], spi_tx_threshold_reg[`SPI2_SPI_TX_THRESHOLD_SPI_TX_THRESHOLD_CONFIG1_POS], spi_tx_threshold_reg[`SPI2_SPI_TX_THRESHOLD_SPI_TX_THRESHOLD_CONFIG0_POS]};
assign spi_tx_threshold_value_o = {spi_tx_threshold_reg[`SPI2_SPI_TX_THRESHOLD_SPI_TX_THRESHOLD_VALUE7_POS], spi_tx_threshold_reg[`SPI2_SPI_TX_THRESHOLD_SPI_TX_THRESHOLD_VALUE6_POS], spi_tx_threshold_reg[`SPI2_SPI_TX_THRESHOLD_SPI_TX_THRESHOLD_VALUE5_POS], spi_tx_threshold_reg[`SPI2_SPI_TX_THRESHOLD_SPI_TX_THRESHOLD_VALUE4_POS], spi_tx_threshold_reg[`SPI2_SPI_TX_THRESHOLD_SPI_TX_THRESHOLD_VALUE3_POS], spi_tx_threshold_reg[`SPI2_SPI_TX_THRESHOLD_SPI_TX_THRESHOLD_VALUE2_POS], spi_tx_threshold_reg[`SPI2_SPI_TX_THRESHOLD_SPI_TX_THRESHOLD_VALUE1_POS], spi_tx_threshold_reg[`SPI2_SPI_TX_THRESHOLD_SPI_TX_THRESHOLD_VALUE0_POS]};
assign spi_tx_threshold_flag_o = {spi_tx_threshold_reg[`SPI2_SPI_TX_THRESHOLD_SPI_TX_THRESHOLD_FLAG7_POS], spi_tx_threshold_reg[`SPI2_SPI_TX_THRESHOLD_SPI_TX_THRESHOLD_FLAG6_POS], spi_tx_threshold_reg[`SPI2_SPI_TX_THRESHOLD_SPI_TX_THRESHOLD_FLAG5_POS], spi_tx_threshold_reg[`SPI2_SPI_TX_THRESHOLD_SPI_TX_THRESHOLD_FLAG4_POS], spi_tx_threshold_reg[`SPI2_SPI_TX_THRESHOLD_SPI_TX_THRESHOLD_FLAG3_POS], spi_tx_threshold_reg[`SPI2_SPI_TX_THRESHOLD_SPI_TX_THRESHOLD_FLAG2_POS], spi_tx_threshold_reg[`SPI2_SPI_TX_THRESHOLD_SPI_TX_THRESHOLD_FLAG1_POS], spi_tx_threshold_reg[`SPI2_SPI_TX_THRESHOLD_SPI_TX_THRESHOLD_FLAG0_POS]};
assign spi_rx_threshold_control_o = {spi_rx_threshold_reg[`SPI2_SPI_RX_THRESHOLD_SPI_RX_THRESHOLD_CONTROL7_POS], spi_rx_threshold_reg[`SPI2_SPI_RX_THRESHOLD_SPI_RX_THRESHOLD_CONTROL6_POS], spi_rx_threshold_reg[`SPI2_SPI_RX_THRESHOLD_SPI_RX_THRESHOLD_CONTROL5_POS], spi_rx_threshold_reg[`SPI2_SPI_RX_THRESHOLD_SPI_RX_THRESHOLD_CONTROL4_POS], spi_rx_threshold_reg[`SPI2_SPI_RX_THRESHOLD_SPI_RX_THRESHOLD_CONTROL3_POS], spi_rx_threshold_reg[`SPI2_SPI_RX_THRESHOLD_SPI_RX_THRESHOLD_CONTROL2_POS], spi_rx_threshold_reg[`SPI2_SPI_RX_THRESHOLD_SPI_RX_THRESHOLD_CONTROL1_POS], spi_rx_threshold_reg[`SPI2_SPI_RX_THRESHOLD_SPI_RX_THRESHOLD_CONTROL0_POS]};
assign spi_rx_threshold_config_o = {spi_rx_threshold_reg[`SPI2_SPI_RX_THRESHOLD_SPI_RX_THRESHOLD_CONFIG7_POS], spi_rx_threshold_reg[`SPI2_SPI_RX_THRESHOLD_SPI_RX_THRESHOLD_CONFIG6_POS], spi_rx_threshold_reg[`SPI2_SPI_RX_THRESHOLD_SPI_RX_THRESHOLD_CONFIG5_POS], spi_rx_threshold_reg[`SPI2_SPI_RX_THRESHOLD_SPI_RX_THRESHOLD_CONFIG4_POS], spi_rx_threshold_reg[`SPI2_SPI_RX_THRESHOLD_SPI_RX_THRESHOLD_CONFIG3_POS], spi_rx_threshold_reg[`SPI2_SPI_RX_THRESHOLD_SPI_RX_THRESHOLD_CONFIG2_POS], spi_rx_threshold_reg[`SPI2_SPI_RX_THRESHOLD_SPI_RX_THRESHOLD_CONFIG1_POS], spi_rx_threshold_reg[`SPI2_SPI_RX_THRESHOLD_SPI_RX_THRESHOLD_CONFIG0_POS]};
assign spi_rx_threshold_value_o = {spi_rx_threshold_reg[`SPI2_SPI_RX_THRESHOLD_SPI_RX_THRESHOLD_VALUE7_POS], spi_rx_threshold_reg[`SPI2_SPI_RX_THRESHOLD_SPI_RX_THRESHOLD_VALUE6_POS], spi_rx_threshold_reg[`SPI2_SPI_RX_THRESHOLD_SPI_RX_THRESHOLD_VALUE5_POS], spi_rx_threshold_reg[`SPI2_SPI_RX_THRESHOLD_SPI_RX_THRESHOLD_VALUE4_POS], spi_rx_threshold_reg[`SPI2_SPI_RX_THRESHOLD_SPI_RX_THRESHOLD_VALUE3_POS], spi_rx_threshold_reg[`SPI2_SPI_RX_THRESHOLD_SPI_RX_THRESHOLD_VALUE2_POS], spi_rx_threshold_reg[`SPI2_SPI_RX_THRESHOLD_SPI_RX_THRESHOLD_VALUE1_POS], spi_rx_threshold_reg[`SPI2_SPI_RX_THRESHOLD_SPI_RX_THRESHOLD_VALUE0_POS]};
assign spi_rx_threshold_flag_o = {spi_rx_threshold_reg[`SPI2_SPI_RX_THRESHOLD_SPI_RX_THRESHOLD_FLAG7_POS], spi_rx_threshold_reg[`SPI2_SPI_RX_THRESHOLD_SPI_RX_THRESHOLD_FLAG6_POS], spi_rx_threshold_reg[`SPI2_SPI_RX_THRESHOLD_SPI_RX_THRESHOLD_FLAG5_POS], spi_rx_threshold_reg[`SPI2_SPI_RX_THRESHOLD_SPI_RX_THRESHOLD_FLAG4_POS], spi_rx_threshold_reg[`SPI2_SPI_RX_THRESHOLD_SPI_RX_THRESHOLD_FLAG3_POS], spi_rx_threshold_reg[`SPI2_SPI_RX_THRESHOLD_SPI_RX_THRESHOLD_FLAG2_POS], spi_rx_threshold_reg[`SPI2_SPI_RX_THRESHOLD_SPI_RX_THRESHOLD_FLAG1_POS], spi_rx_threshold_reg[`SPI2_SPI_RX_THRESHOLD_SPI_RX_THRESHOLD_FLAG0_POS]};
assign spi_interrupt_mask_control_o = {spi_interrupt_mask_reg[`SPI2_SPI_INTERRUPT_MASK_SPI_INTERRUPT_MASK_CONTROL7_POS], spi_interrupt_mask_reg[`SPI2_SPI_INTERRUPT_MASK_SPI_INTERRUPT_MASK_CONTROL6_POS], spi_interrupt_mask_reg[`SPI2_SPI_INTERRUPT_MASK_SPI_INTERRUPT_MASK_CONTROL5_POS], spi_interrupt_mask_reg[`SPI2_SPI_INTERRUPT_MASK_SPI_INTERRUPT_MASK_CONTROL4_POS], spi_interrupt_mask_reg[`SPI2_SPI_INTERRUPT_MASK_SPI_INTERRUPT_MASK_CONTROL3_POS], spi_interrupt_mask_reg[`SPI2_SPI_INTERRUPT_MASK_SPI_INTERRUPT_MASK_CONTROL2_POS], spi_interrupt_mask_reg[`SPI2_SPI_INTERRUPT_MASK_SPI_INTERRUPT_MASK_CONTROL1_POS], spi_interrupt_mask_reg[`SPI2_SPI_INTERRUPT_MASK_SPI_INTERRUPT_MASK_CONTROL0_POS]};
assign spi_interrupt_mask_config_o = {spi_interrupt_mask_reg[`SPI2_SPI_INTERRUPT_MASK_SPI_INTERRUPT_MASK_CONFIG7_POS], spi_interrupt_mask_reg[`SPI2_SPI_INTERRUPT_MASK_SPI_INTERRUPT_MASK_CONFIG6_POS], spi_interrupt_mask_reg[`SPI2_SPI_INTERRUPT_MASK_SPI_INTERRUPT_MASK_CONFIG5_POS], spi_interrupt_mask_reg[`SPI2_SPI_INTERRUPT_MASK_SPI_INTERRUPT_MASK_CONFIG4_POS], spi_interrupt_mask_reg[`SPI2_SPI_INTERRUPT_MASK_SPI_INTERRUPT_MASK_CONFIG3_POS], spi_interrupt_mask_reg[`SPI2_SPI_INTERRUPT_MASK_SPI_INTERRUPT_MASK_CONFIG2_POS], spi_interrupt_mask_reg[`SPI2_SPI_INTERRUPT_MASK_SPI_INTERRUPT_MASK_CONFIG1_POS], spi_interrupt_mask_reg[`SPI2_SPI_INTERRUPT_MASK_SPI_INTERRUPT_MASK_CONFIG0_POS]};
assign spi_interrupt_mask_value_o = {spi_interrupt_mask_reg[`SPI2_SPI_INTERRUPT_MASK_SPI_INTERRUPT_MASK_VALUE7_POS], spi_interrupt_mask_reg[`SPI2_SPI_INTERRUPT_MASK_SPI_INTERRUPT_MASK_VALUE6_POS], spi_interrupt_mask_reg[`SPI2_SPI_INTERRUPT_MASK_SPI_INTERRUPT_MASK_VALUE5_POS], spi_interrupt_mask_reg[`SPI2_SPI_INTERRUPT_MASK_SPI_INTERRUPT_MASK_VALUE4_POS], spi_interrupt_mask_reg[`SPI2_SPI_INTERRUPT_MASK_SPI_INTERRUPT_MASK_VALUE3_POS], spi_interrupt_mask_reg[`SPI2_SPI_INTERRUPT_MASK_SPI_INTERRUPT_MASK_VALUE2_POS], spi_interrupt_mask_reg[`SPI2_SPI_INTERRUPT_MASK_SPI_INTERRUPT_MASK_VALUE1_POS], spi_interrupt_mask_reg[`SPI2_SPI_INTERRUPT_MASK_SPI_INTERRUPT_MASK_VALUE0_POS]};
assign spi_interrupt_mask_flag_o = {spi_interrupt_mask_reg[`SPI2_SPI_INTERRUPT_MASK_SPI_INTERRUPT_MASK_FLAG7_POS], spi_interrupt_mask_reg[`SPI2_SPI_INTERRUPT_MASK_SPI_INTERRUPT_MASK_FLAG6_POS], spi_interrupt_mask_reg[`SPI2_SPI_INTERRUPT_MASK_SPI_INTERRUPT_MASK_FLAG5_POS], spi_interrupt_mask_reg[`SPI2_SPI_INTERRUPT_MASK_SPI_INTERRUPT_MASK_FLAG4_POS], spi_interrupt_mask_reg[`SPI2_SPI_INTERRUPT_MASK_SPI_INTERRUPT_MASK_FLAG3_POS], spi_interrupt_mask_reg[`SPI2_SPI_INTERRUPT_MASK_SPI_INTERRUPT_MASK_FLAG2_POS], spi_interrupt_mask_reg[`SPI2_SPI_INTERRUPT_MASK_SPI_INTERRUPT_MASK_FLAG1_POS], spi_interrupt_mask_reg[`SPI2_SPI_INTERRUPT_MASK_SPI_INTERRUPT_MASK_FLAG0_POS]};
assign spi_interrupt_status_control_o = {spi_interrupt_status_reg[`SPI2_SPI_INTERRUPT_STATUS_SPI_INTERRUPT_STATUS_CONTROL7_POS], spi_interrupt_status_reg[`SPI2_SPI_INTERRUPT_STATUS_SPI_INTERRUPT_STATUS_CONTROL6_POS], spi_interrupt_status_reg[`SPI2_SPI_INTERRUPT_STATUS_SPI_INTERRUPT_STATUS_CONTROL5_POS], spi_interrupt_status_reg[`SPI2_SPI_INTERRUPT_STATUS_SPI_INTERRUPT_STATUS_CONTROL4_POS], spi_interrupt_status_reg[`SPI2_SPI_INTERRUPT_STATUS_SPI_INTERRUPT_STATUS_CONTROL3_POS], spi_interrupt_status_reg[`SPI2_SPI_INTERRUPT_STATUS_SPI_INTERRUPT_STATUS_CONTROL2_POS], spi_interrupt_status_reg[`SPI2_SPI_INTERRUPT_STATUS_SPI_INTERRUPT_STATUS_CONTROL1_POS], spi_interrupt_status_reg[`SPI2_SPI_INTERRUPT_STATUS_SPI_INTERRUPT_STATUS_CONTROL0_POS]};
assign spi_interrupt_status_config_o = {spi_interrupt_status_reg[`SPI2_SPI_INTERRUPT_STATUS_SPI_INTERRUPT_STATUS_CONFIG7_POS], spi_interrupt_status_reg[`SPI2_SPI_INTERRUPT_STATUS_SPI_INTERRUPT_STATUS_CONFIG6_POS], spi_interrupt_status_reg[`SPI2_SPI_INTERRUPT_STATUS_SPI_INTERRUPT_STATUS_CONFIG5_POS], spi_interrupt_status_reg[`SPI2_SPI_INTERRUPT_STATUS_SPI_INTERRUPT_STATUS_CONFIG4_POS], spi_interrupt_status_reg[`SPI2_SPI_INTERRUPT_STATUS_SPI_INTERRUPT_STATUS_CONFIG3_POS], spi_interrupt_status_reg[`SPI2_SPI_INTERRUPT_STATUS_SPI_INTERRUPT_STATUS_CONFIG2_POS], spi_interrupt_status_reg[`SPI2_SPI_INTERRUPT_STATUS_SPI_INTERRUPT_STATUS_CONFIG1_POS], spi_interrupt_status_reg[`SPI2_SPI_INTERRUPT_STATUS_SPI_INTERRUPT_STATUS_CONFIG0_POS]};
assign spi_interrupt_status_value_o = {spi_interrupt_status_reg[`SPI2_SPI_INTERRUPT_STATUS_SPI_INTERRUPT_STATUS_VALUE7_POS], spi_interrupt_status_reg[`SPI2_SPI_INTERRUPT_STATUS_SPI_INTERRUPT_STATUS_VALUE6_POS], spi_interrupt_status_reg[`SPI2_SPI_INTERRUPT_STATUS_SPI_INTERRUPT_STATUS_VALUE5_POS], spi_interrupt_status_reg[`SPI2_SPI_INTERRUPT_STATUS_SPI_INTERRUPT_STATUS_VALUE4_POS], spi_interrupt_status_reg[`SPI2_SPI_INTERRUPT_STATUS_SPI_INTERRUPT_STATUS_VALUE3_POS], spi_interrupt_status_reg[`SPI2_SPI_INTERRUPT_STATUS_SPI_INTERRUPT_STATUS_VALUE2_POS], spi_interrupt_status_reg[`SPI2_SPI_INTERRUPT_STATUS_SPI_INTERRUPT_STATUS_VALUE1_POS], spi_interrupt_status_reg[`SPI2_SPI_INTERRUPT_STATUS_SPI_INTERRUPT_STATUS_VALUE0_POS]};
assign spi_interrupt_status_flag_o = {spi_interrupt_status_reg[`SPI2_SPI_INTERRUPT_STATUS_SPI_INTERRUPT_STATUS_FLAG7_POS], spi_interrupt_status_reg[`SPI2_SPI_INTERRUPT_STATUS_SPI_INTERRUPT_STATUS_FLAG6_POS], spi_interrupt_status_reg[`SPI2_SPI_INTERRUPT_STATUS_SPI_INTERRUPT_STATUS_FLAG5_POS], spi_interrupt_status_reg[`SPI2_SPI_INTERRUPT_STATUS_SPI_INTERRUPT_STATUS_FLAG4_POS], spi_interrupt_status_reg[`SPI2_SPI_INTERRUPT_STATUS_SPI_INTERRUPT_STATUS_FLAG3_POS], spi_interrupt_status_reg[`SPI2_SPI_INTERRUPT_STATUS_SPI_INTERRUPT_STATUS_FLAG2_POS], spi_interrupt_status_reg[`SPI2_SPI_INTERRUPT_STATUS_SPI_INTERRUPT_STATUS_FLAG1_POS], spi_interrupt_status_reg[`SPI2_SPI_INTERRUPT_STATUS_SPI_INTERRUPT_STATUS_FLAG0_POS]};
assign spi_interrupt_clear_control_o = {spi_interrupt_clear_reg[`SPI2_SPI_INTERRUPT_CLEAR_SPI_INTERRUPT_CLEAR_CONTROL7_POS], spi_interrupt_clear_reg[`SPI2_SPI_INTERRUPT_CLEAR_SPI_INTERRUPT_CLEAR_CONTROL6_POS], spi_interrupt_clear_reg[`SPI2_SPI_INTERRUPT_CLEAR_SPI_INTERRUPT_CLEAR_CONTROL5_POS], spi_interrupt_clear_reg[`SPI2_SPI_INTERRUPT_CLEAR_SPI_INTERRUPT_CLEAR_CONTROL4_POS], spi_interrupt_clear_reg[`SPI2_SPI_INTERRUPT_CLEAR_SPI_INTERRUPT_CLEAR_CONTROL3_POS], spi_interrupt_clear_reg[`SPI2_SPI_INTERRUPT_CLEAR_SPI_INTERRUPT_CLEAR_CONTROL2_POS], spi_interrupt_clear_reg[`SPI2_SPI_INTERRUPT_CLEAR_SPI_INTERRUPT_CLEAR_CONTROL1_POS], spi_interrupt_clear_reg[`SPI2_SPI_INTERRUPT_CLEAR_SPI_INTERRUPT_CLEAR_CONTROL0_POS]};
assign spi_interrupt_clear_config_o = {spi_interrupt_clear_reg[`SPI2_SPI_INTERRUPT_CLEAR_SPI_INTERRUPT_CLEAR_CONFIG7_POS], spi_interrupt_clear_reg[`SPI2_SPI_INTERRUPT_CLEAR_SPI_INTERRUPT_CLEAR_CONFIG6_POS], spi_interrupt_clear_reg[`SPI2_SPI_INTERRUPT_CLEAR_SPI_INTERRUPT_CLEAR_CONFIG5_POS], spi_interrupt_clear_reg[`SPI2_SPI_INTERRUPT_CLEAR_SPI_INTERRUPT_CLEAR_CONFIG4_POS], spi_interrupt_clear_reg[`SPI2_SPI_INTERRUPT_CLEAR_SPI_INTERRUPT_CLEAR_CONFIG3_POS], spi_interrupt_clear_reg[`SPI2_SPI_INTERRUPT_CLEAR_SPI_INTERRUPT_CLEAR_CONFIG2_POS], spi_interrupt_clear_reg[`SPI2_SPI_INTERRUPT_CLEAR_SPI_INTERRUPT_CLEAR_CONFIG1_POS], spi_interrupt_clear_reg[`SPI2_SPI_INTERRUPT_CLEAR_SPI_INTERRUPT_CLEAR_CONFIG0_POS]};
assign spi_interrupt_clear_value_o = {spi_interrupt_clear_reg[`SPI2_SPI_INTERRUPT_CLEAR_SPI_INTERRUPT_CLEAR_VALUE7_POS], spi_interrupt_clear_reg[`SPI2_SPI_INTERRUPT_CLEAR_SPI_INTERRUPT_CLEAR_VALUE6_POS], spi_interrupt_clear_reg[`SPI2_SPI_INTERRUPT_CLEAR_SPI_INTERRUPT_CLEAR_VALUE5_POS], spi_interrupt_clear_reg[`SPI2_SPI_INTERRUPT_CLEAR_SPI_INTERRUPT_CLEAR_VALUE4_POS], spi_interrupt_clear_reg[`SPI2_SPI_INTERRUPT_CLEAR_SPI_INTERRUPT_CLEAR_VALUE3_POS], spi_interrupt_clear_reg[`SPI2_SPI_INTERRUPT_CLEAR_SPI_INTERRUPT_CLEAR_VALUE2_POS], spi_interrupt_clear_reg[`SPI2_SPI_INTERRUPT_CLEAR_SPI_INTERRUPT_CLEAR_VALUE1_POS], spi_interrupt_clear_reg[`SPI2_SPI_INTERRUPT_CLEAR_SPI_INTERRUPT_CLEAR_VALUE0_POS]};
assign spi_interrupt_clear_flag_o = {spi_interrupt_clear_reg[`SPI2_SPI_INTERRUPT_CLEAR_SPI_INTERRUPT_CLEAR_FLAG7_POS], spi_interrupt_clear_reg[`SPI2_SPI_INTERRUPT_CLEAR_SPI_INTERRUPT_CLEAR_FLAG6_POS], spi_interrupt_clear_reg[`SPI2_SPI_INTERRUPT_CLEAR_SPI_INTERRUPT_CLEAR_FLAG5_POS], spi_interrupt_clear_reg[`SPI2_SPI_INTERRUPT_CLEAR_SPI_INTERRUPT_CLEAR_FLAG4_POS], spi_interrupt_clear_reg[`SPI2_SPI_INTERRUPT_CLEAR_SPI_INTERRUPT_CLEAR_FLAG3_POS], spi_interrupt_clear_reg[`SPI2_SPI_INTERRUPT_CLEAR_SPI_INTERRUPT_CLEAR_FLAG2_POS], spi_interrupt_clear_reg[`SPI2_SPI_INTERRUPT_CLEAR_SPI_INTERRUPT_CLEAR_FLAG1_POS], spi_interrupt_clear_reg[`SPI2_SPI_INTERRUPT_CLEAR_SPI_INTERRUPT_CLEAR_FLAG0_POS]};
assign spi_irq_config_control_o = {spi_irq_config_reg[`SPI2_SPI_IRQ_CONFIG_SPI_IRQ_CONFIG_CONTROL7_POS], spi_irq_config_reg[`SPI2_SPI_IRQ_CONFIG_SPI_IRQ_CONFIG_CONTROL6_POS], spi_irq_config_reg[`SPI2_SPI_IRQ_CONFIG_SPI_IRQ_CONFIG_CONTROL5_POS], spi_irq_config_reg[`SPI2_SPI_IRQ_CONFIG_SPI_IRQ_CONFIG_CONTROL4_POS], spi_irq_config_reg[`SPI2_SPI_IRQ_CONFIG_SPI_IRQ_CONFIG_CONTROL3_POS], spi_irq_config_reg[`SPI2_SPI_IRQ_CONFIG_SPI_IRQ_CONFIG_CONTROL2_POS], spi_irq_config_reg[`SPI2_SPI_IRQ_CONFIG_SPI_IRQ_CONFIG_CONTROL1_POS], spi_irq_config_reg[`SPI2_SPI_IRQ_CONFIG_SPI_IRQ_CONFIG_CONTROL0_POS]};
assign spi_irq_config_config_o = {spi_irq_config_reg[`SPI2_SPI_IRQ_CONFIG_SPI_IRQ_CONFIG_CONFIG7_POS], spi_irq_config_reg[`SPI2_SPI_IRQ_CONFIG_SPI_IRQ_CONFIG_CONFIG6_POS], spi_irq_config_reg[`SPI2_SPI_IRQ_CONFIG_SPI_IRQ_CONFIG_CONFIG5_POS], spi_irq_config_reg[`SPI2_SPI_IRQ_CONFIG_SPI_IRQ_CONFIG_CONFIG4_POS], spi_irq_config_reg[`SPI2_SPI_IRQ_CONFIG_SPI_IRQ_CONFIG_CONFIG3_POS], spi_irq_config_reg[`SPI2_SPI_IRQ_CONFIG_SPI_IRQ_CONFIG_CONFIG2_POS], spi_irq_config_reg[`SPI2_SPI_IRQ_CONFIG_SPI_IRQ_CONFIG_CONFIG1_POS], spi_irq_config_reg[`SPI2_SPI_IRQ_CONFIG_SPI_IRQ_CONFIG_CONFIG0_POS]};
assign spi_irq_config_value_o = {spi_irq_config_reg[`SPI2_SPI_IRQ_CONFIG_SPI_IRQ_CONFIG_VALUE7_POS], spi_irq_config_reg[`SPI2_SPI_IRQ_CONFIG_SPI_IRQ_CONFIG_VALUE6_POS], spi_irq_config_reg[`SPI2_SPI_IRQ_CONFIG_SPI_IRQ_CONFIG_VALUE5_POS], spi_irq_config_reg[`SPI2_SPI_IRQ_CONFIG_SPI_IRQ_CONFIG_VALUE4_POS], spi_irq_config_reg[`SPI2_SPI_IRQ_CONFIG_SPI_IRQ_CONFIG_VALUE3_POS], spi_irq_config_reg[`SPI2_SPI_IRQ_CONFIG_SPI_IRQ_CONFIG_VALUE2_POS], spi_irq_config_reg[`SPI2_SPI_IRQ_CONFIG_SPI_IRQ_CONFIG_VALUE1_POS], spi_irq_config_reg[`SPI2_SPI_IRQ_CONFIG_SPI_IRQ_CONFIG_VALUE0_POS]};
assign spi_irq_config_flag_o = {spi_irq_config_reg[`SPI2_SPI_IRQ_CONFIG_SPI_IRQ_CONFIG_FLAG7_POS], spi_irq_config_reg[`SPI2_SPI_IRQ_CONFIG_SPI_IRQ_CONFIG_FLAG6_POS], spi_irq_config_reg[`SPI2_SPI_IRQ_CONFIG_SPI_IRQ_CONFIG_FLAG5_POS], spi_irq_config_reg[`SPI2_SPI_IRQ_CONFIG_SPI_IRQ_CONFIG_FLAG4_POS], spi_irq_config_reg[`SPI2_SPI_IRQ_CONFIG_SPI_IRQ_CONFIG_FLAG3_POS], spi_irq_config_reg[`SPI2_SPI_IRQ_CONFIG_SPI_IRQ_CONFIG_FLAG2_POS], spi_irq_config_reg[`SPI2_SPI_IRQ_CONFIG_SPI_IRQ_CONFIG_FLAG1_POS], spi_irq_config_reg[`SPI2_SPI_IRQ_CONFIG_SPI_IRQ_CONFIG_FLAG0_POS]};
assign spi_event_status_control_o = {spi_event_status_reg[`SPI2_SPI_EVENT_STATUS_SPI_EVENT_STATUS_CONTROL7_POS], spi_event_status_reg[`SPI2_SPI_EVENT_STATUS_SPI_EVENT_STATUS_CONTROL6_POS], spi_event_status_reg[`SPI2_SPI_EVENT_STATUS_SPI_EVENT_STATUS_CONTROL5_POS], spi_event_status_reg[`SPI2_SPI_EVENT_STATUS_SPI_EVENT_STATUS_CONTROL4_POS], spi_event_status_reg[`SPI2_SPI_EVENT_STATUS_SPI_EVENT_STATUS_CONTROL3_POS], spi_event_status_reg[`SPI2_SPI_EVENT_STATUS_SPI_EVENT_STATUS_CONTROL2_POS], spi_event_status_reg[`SPI2_SPI_EVENT_STATUS_SPI_EVENT_STATUS_CONTROL1_POS], spi_event_status_reg[`SPI2_SPI_EVENT_STATUS_SPI_EVENT_STATUS_CONTROL0_POS]};
assign spi_event_status_config_o = {spi_event_status_reg[`SPI2_SPI_EVENT_STATUS_SPI_EVENT_STATUS_CONFIG7_POS], spi_event_status_reg[`SPI2_SPI_EVENT_STATUS_SPI_EVENT_STATUS_CONFIG6_POS], spi_event_status_reg[`SPI2_SPI_EVENT_STATUS_SPI_EVENT_STATUS_CONFIG5_POS], spi_event_status_reg[`SPI2_SPI_EVENT_STATUS_SPI_EVENT_STATUS_CONFIG4_POS], spi_event_status_reg[`SPI2_SPI_EVENT_STATUS_SPI_EVENT_STATUS_CONFIG3_POS], spi_event_status_reg[`SPI2_SPI_EVENT_STATUS_SPI_EVENT_STATUS_CONFIG2_POS], spi_event_status_reg[`SPI2_SPI_EVENT_STATUS_SPI_EVENT_STATUS_CONFIG1_POS], spi_event_status_reg[`SPI2_SPI_EVENT_STATUS_SPI_EVENT_STATUS_CONFIG0_POS]};
assign spi_event_status_value_o = {spi_event_status_reg[`SPI2_SPI_EVENT_STATUS_SPI_EVENT_STATUS_VALUE7_POS], spi_event_status_reg[`SPI2_SPI_EVENT_STATUS_SPI_EVENT_STATUS_VALUE6_POS], spi_event_status_reg[`SPI2_SPI_EVENT_STATUS_SPI_EVENT_STATUS_VALUE5_POS], spi_event_status_reg[`SPI2_SPI_EVENT_STATUS_SPI_EVENT_STATUS_VALUE4_POS], spi_event_status_reg[`SPI2_SPI_EVENT_STATUS_SPI_EVENT_STATUS_VALUE3_POS], spi_event_status_reg[`SPI2_SPI_EVENT_STATUS_SPI_EVENT_STATUS_VALUE2_POS], spi_event_status_reg[`SPI2_SPI_EVENT_STATUS_SPI_EVENT_STATUS_VALUE1_POS], spi_event_status_reg[`SPI2_SPI_EVENT_STATUS_SPI_EVENT_STATUS_VALUE0_POS]};
assign spi_event_status_flag_o = {spi_event_status_reg[`SPI2_SPI_EVENT_STATUS_SPI_EVENT_STATUS_FLAG7_POS], spi_event_status_reg[`SPI2_SPI_EVENT_STATUS_SPI_EVENT_STATUS_FLAG6_POS], spi_event_status_reg[`SPI2_SPI_EVENT_STATUS_SPI_EVENT_STATUS_FLAG5_POS], spi_event_status_reg[`SPI2_SPI_EVENT_STATUS_SPI_EVENT_STATUS_FLAG4_POS], spi_event_status_reg[`SPI2_SPI_EVENT_STATUS_SPI_EVENT_STATUS_FLAG3_POS], spi_event_status_reg[`SPI2_SPI_EVENT_STATUS_SPI_EVENT_STATUS_FLAG2_POS], spi_event_status_reg[`SPI2_SPI_EVENT_STATUS_SPI_EVENT_STATUS_FLAG1_POS], spi_event_status_reg[`SPI2_SPI_EVENT_STATUS_SPI_EVENT_STATUS_FLAG0_POS]};
assign spi_error_status_control_o = {spi_error_status_reg[`SPI2_SPI_ERROR_STATUS_SPI_ERROR_STATUS_CONTROL7_POS], spi_error_status_reg[`SPI2_SPI_ERROR_STATUS_SPI_ERROR_STATUS_CONTROL6_POS], spi_error_status_reg[`SPI2_SPI_ERROR_STATUS_SPI_ERROR_STATUS_CONTROL5_POS], spi_error_status_reg[`SPI2_SPI_ERROR_STATUS_SPI_ERROR_STATUS_CONTROL4_POS], spi_error_status_reg[`SPI2_SPI_ERROR_STATUS_SPI_ERROR_STATUS_CONTROL3_POS], spi_error_status_reg[`SPI2_SPI_ERROR_STATUS_SPI_ERROR_STATUS_CONTROL2_POS], spi_error_status_reg[`SPI2_SPI_ERROR_STATUS_SPI_ERROR_STATUS_CONTROL1_POS], spi_error_status_reg[`SPI2_SPI_ERROR_STATUS_SPI_ERROR_STATUS_CONTROL0_POS]};
assign spi_error_status_config_o = {spi_error_status_reg[`SPI2_SPI_ERROR_STATUS_SPI_ERROR_STATUS_CONFIG7_POS], spi_error_status_reg[`SPI2_SPI_ERROR_STATUS_SPI_ERROR_STATUS_CONFIG6_POS], spi_error_status_reg[`SPI2_SPI_ERROR_STATUS_SPI_ERROR_STATUS_CONFIG5_POS], spi_error_status_reg[`SPI2_SPI_ERROR_STATUS_SPI_ERROR_STATUS_CONFIG4_POS], spi_error_status_reg[`SPI2_SPI_ERROR_STATUS_SPI_ERROR_STATUS_CONFIG3_POS], spi_error_status_reg[`SPI2_SPI_ERROR_STATUS_SPI_ERROR_STATUS_CONFIG2_POS], spi_error_status_reg[`SPI2_SPI_ERROR_STATUS_SPI_ERROR_STATUS_CONFIG1_POS], spi_error_status_reg[`SPI2_SPI_ERROR_STATUS_SPI_ERROR_STATUS_CONFIG0_POS]};
assign spi_error_status_value_o = {spi_error_status_reg[`SPI2_SPI_ERROR_STATUS_SPI_ERROR_STATUS_VALUE7_POS], spi_error_status_reg[`SPI2_SPI_ERROR_STATUS_SPI_ERROR_STATUS_VALUE6_POS], spi_error_status_reg[`SPI2_SPI_ERROR_STATUS_SPI_ERROR_STATUS_VALUE5_POS], spi_error_status_reg[`SPI2_SPI_ERROR_STATUS_SPI_ERROR_STATUS_VALUE4_POS], spi_error_status_reg[`SPI2_SPI_ERROR_STATUS_SPI_ERROR_STATUS_VALUE3_POS], spi_error_status_reg[`SPI2_SPI_ERROR_STATUS_SPI_ERROR_STATUS_VALUE2_POS], spi_error_status_reg[`SPI2_SPI_ERROR_STATUS_SPI_ERROR_STATUS_VALUE1_POS], spi_error_status_reg[`SPI2_SPI_ERROR_STATUS_SPI_ERROR_STATUS_VALUE0_POS]};
assign spi_error_status_flag_o = {spi_error_status_reg[`SPI2_SPI_ERROR_STATUS_SPI_ERROR_STATUS_FLAG7_POS], spi_error_status_reg[`SPI2_SPI_ERROR_STATUS_SPI_ERROR_STATUS_FLAG6_POS], spi_error_status_reg[`SPI2_SPI_ERROR_STATUS_SPI_ERROR_STATUS_FLAG5_POS], spi_error_status_reg[`SPI2_SPI_ERROR_STATUS_SPI_ERROR_STATUS_FLAG4_POS], spi_error_status_reg[`SPI2_SPI_ERROR_STATUS_SPI_ERROR_STATUS_FLAG3_POS], spi_error_status_reg[`SPI2_SPI_ERROR_STATUS_SPI_ERROR_STATUS_FLAG2_POS], spi_error_status_reg[`SPI2_SPI_ERROR_STATUS_SPI_ERROR_STATUS_FLAG1_POS], spi_error_status_reg[`SPI2_SPI_ERROR_STATUS_SPI_ERROR_STATUS_FLAG0_POS]};
assign spi_error_clear_control_o = {spi_error_clear_reg[`SPI2_SPI_ERROR_CLEAR_SPI_ERROR_CLEAR_CONTROL7_POS], spi_error_clear_reg[`SPI2_SPI_ERROR_CLEAR_SPI_ERROR_CLEAR_CONTROL6_POS], spi_error_clear_reg[`SPI2_SPI_ERROR_CLEAR_SPI_ERROR_CLEAR_CONTROL5_POS], spi_error_clear_reg[`SPI2_SPI_ERROR_CLEAR_SPI_ERROR_CLEAR_CONTROL4_POS], spi_error_clear_reg[`SPI2_SPI_ERROR_CLEAR_SPI_ERROR_CLEAR_CONTROL3_POS], spi_error_clear_reg[`SPI2_SPI_ERROR_CLEAR_SPI_ERROR_CLEAR_CONTROL2_POS], spi_error_clear_reg[`SPI2_SPI_ERROR_CLEAR_SPI_ERROR_CLEAR_CONTROL1_POS], spi_error_clear_reg[`SPI2_SPI_ERROR_CLEAR_SPI_ERROR_CLEAR_CONTROL0_POS]};
assign spi_error_clear_config_o = {spi_error_clear_reg[`SPI2_SPI_ERROR_CLEAR_SPI_ERROR_CLEAR_CONFIG7_POS], spi_error_clear_reg[`SPI2_SPI_ERROR_CLEAR_SPI_ERROR_CLEAR_CONFIG6_POS], spi_error_clear_reg[`SPI2_SPI_ERROR_CLEAR_SPI_ERROR_CLEAR_CONFIG5_POS], spi_error_clear_reg[`SPI2_SPI_ERROR_CLEAR_SPI_ERROR_CLEAR_CONFIG4_POS], spi_error_clear_reg[`SPI2_SPI_ERROR_CLEAR_SPI_ERROR_CLEAR_CONFIG3_POS], spi_error_clear_reg[`SPI2_SPI_ERROR_CLEAR_SPI_ERROR_CLEAR_CONFIG2_POS], spi_error_clear_reg[`SPI2_SPI_ERROR_CLEAR_SPI_ERROR_CLEAR_CONFIG1_POS], spi_error_clear_reg[`SPI2_SPI_ERROR_CLEAR_SPI_ERROR_CLEAR_CONFIG0_POS]};
assign spi_error_clear_value_o = {spi_error_clear_reg[`SPI2_SPI_ERROR_CLEAR_SPI_ERROR_CLEAR_VALUE7_POS], spi_error_clear_reg[`SPI2_SPI_ERROR_CLEAR_SPI_ERROR_CLEAR_VALUE6_POS], spi_error_clear_reg[`SPI2_SPI_ERROR_CLEAR_SPI_ERROR_CLEAR_VALUE5_POS], spi_error_clear_reg[`SPI2_SPI_ERROR_CLEAR_SPI_ERROR_CLEAR_VALUE4_POS], spi_error_clear_reg[`SPI2_SPI_ERROR_CLEAR_SPI_ERROR_CLEAR_VALUE3_POS], spi_error_clear_reg[`SPI2_SPI_ERROR_CLEAR_SPI_ERROR_CLEAR_VALUE2_POS], spi_error_clear_reg[`SPI2_SPI_ERROR_CLEAR_SPI_ERROR_CLEAR_VALUE1_POS], spi_error_clear_reg[`SPI2_SPI_ERROR_CLEAR_SPI_ERROR_CLEAR_VALUE0_POS]};
assign spi_error_clear_flag_o = {spi_error_clear_reg[`SPI2_SPI_ERROR_CLEAR_SPI_ERROR_CLEAR_FLAG7_POS], spi_error_clear_reg[`SPI2_SPI_ERROR_CLEAR_SPI_ERROR_CLEAR_FLAG6_POS], spi_error_clear_reg[`SPI2_SPI_ERROR_CLEAR_SPI_ERROR_CLEAR_FLAG5_POS], spi_error_clear_reg[`SPI2_SPI_ERROR_CLEAR_SPI_ERROR_CLEAR_FLAG4_POS], spi_error_clear_reg[`SPI2_SPI_ERROR_CLEAR_SPI_ERROR_CLEAR_FLAG3_POS], spi_error_clear_reg[`SPI2_SPI_ERROR_CLEAR_SPI_ERROR_CLEAR_FLAG2_POS], spi_error_clear_reg[`SPI2_SPI_ERROR_CLEAR_SPI_ERROR_CLEAR_FLAG1_POS], spi_error_clear_reg[`SPI2_SPI_ERROR_CLEAR_SPI_ERROR_CLEAR_FLAG0_POS]};
assign spi_debug_control_o = {spi_debug_reg[`SPI2_SPI_DEBUG_SPI_DEBUG_CONTROL7_POS], spi_debug_reg[`SPI2_SPI_DEBUG_SPI_DEBUG_CONTROL6_POS], spi_debug_reg[`SPI2_SPI_DEBUG_SPI_DEBUG_CONTROL5_POS], spi_debug_reg[`SPI2_SPI_DEBUG_SPI_DEBUG_CONTROL4_POS], spi_debug_reg[`SPI2_SPI_DEBUG_SPI_DEBUG_CONTROL3_POS], spi_debug_reg[`SPI2_SPI_DEBUG_SPI_DEBUG_CONTROL2_POS], spi_debug_reg[`SPI2_SPI_DEBUG_SPI_DEBUG_CONTROL1_POS], spi_debug_reg[`SPI2_SPI_DEBUG_SPI_DEBUG_CONTROL0_POS]};
assign spi_debug_config_o = {spi_debug_reg[`SPI2_SPI_DEBUG_SPI_DEBUG_CONFIG7_POS], spi_debug_reg[`SPI2_SPI_DEBUG_SPI_DEBUG_CONFIG6_POS], spi_debug_reg[`SPI2_SPI_DEBUG_SPI_DEBUG_CONFIG5_POS], spi_debug_reg[`SPI2_SPI_DEBUG_SPI_DEBUG_CONFIG4_POS], spi_debug_reg[`SPI2_SPI_DEBUG_SPI_DEBUG_CONFIG3_POS], spi_debug_reg[`SPI2_SPI_DEBUG_SPI_DEBUG_CONFIG2_POS], spi_debug_reg[`SPI2_SPI_DEBUG_SPI_DEBUG_CONFIG1_POS], spi_debug_reg[`SPI2_SPI_DEBUG_SPI_DEBUG_CONFIG0_POS]};
assign spi_debug_value_o = {spi_debug_reg[`SPI2_SPI_DEBUG_SPI_DEBUG_VALUE7_POS], spi_debug_reg[`SPI2_SPI_DEBUG_SPI_DEBUG_VALUE6_POS], spi_debug_reg[`SPI2_SPI_DEBUG_SPI_DEBUG_VALUE5_POS], spi_debug_reg[`SPI2_SPI_DEBUG_SPI_DEBUG_VALUE4_POS], spi_debug_reg[`SPI2_SPI_DEBUG_SPI_DEBUG_VALUE3_POS], spi_debug_reg[`SPI2_SPI_DEBUG_SPI_DEBUG_VALUE2_POS], spi_debug_reg[`SPI2_SPI_DEBUG_SPI_DEBUG_VALUE1_POS], spi_debug_reg[`SPI2_SPI_DEBUG_SPI_DEBUG_VALUE0_POS]};
assign spi_debug_flag_o = {spi_debug_reg[`SPI2_SPI_DEBUG_SPI_DEBUG_FLAG7_POS], spi_debug_reg[`SPI2_SPI_DEBUG_SPI_DEBUG_FLAG6_POS], spi_debug_reg[`SPI2_SPI_DEBUG_SPI_DEBUG_FLAG5_POS], spi_debug_reg[`SPI2_SPI_DEBUG_SPI_DEBUG_FLAG4_POS], spi_debug_reg[`SPI2_SPI_DEBUG_SPI_DEBUG_FLAG3_POS], spi_debug_reg[`SPI2_SPI_DEBUG_SPI_DEBUG_FLAG2_POS], spi_debug_reg[`SPI2_SPI_DEBUG_SPI_DEBUG_FLAG1_POS], spi_debug_reg[`SPI2_SPI_DEBUG_SPI_DEBUG_FLAG0_POS]};
assign spi_debug_control_control_o = {spi_debug_control_reg[`SPI2_SPI_DEBUG_CONTROL_SPI_DEBUG_CONTROL_CONTROL7_POS], spi_debug_control_reg[`SPI2_SPI_DEBUG_CONTROL_SPI_DEBUG_CONTROL_CONTROL6_POS], spi_debug_control_reg[`SPI2_SPI_DEBUG_CONTROL_SPI_DEBUG_CONTROL_CONTROL5_POS], spi_debug_control_reg[`SPI2_SPI_DEBUG_CONTROL_SPI_DEBUG_CONTROL_CONTROL4_POS], spi_debug_control_reg[`SPI2_SPI_DEBUG_CONTROL_SPI_DEBUG_CONTROL_CONTROL3_POS], spi_debug_control_reg[`SPI2_SPI_DEBUG_CONTROL_SPI_DEBUG_CONTROL_CONTROL2_POS], spi_debug_control_reg[`SPI2_SPI_DEBUG_CONTROL_SPI_DEBUG_CONTROL_CONTROL1_POS], spi_debug_control_reg[`SPI2_SPI_DEBUG_CONTROL_SPI_DEBUG_CONTROL_CONTROL0_POS]};
assign spi_debug_control_config_o = {spi_debug_control_reg[`SPI2_SPI_DEBUG_CONTROL_SPI_DEBUG_CONTROL_CONFIG7_POS], spi_debug_control_reg[`SPI2_SPI_DEBUG_CONTROL_SPI_DEBUG_CONTROL_CONFIG6_POS], spi_debug_control_reg[`SPI2_SPI_DEBUG_CONTROL_SPI_DEBUG_CONTROL_CONFIG5_POS], spi_debug_control_reg[`SPI2_SPI_DEBUG_CONTROL_SPI_DEBUG_CONTROL_CONFIG4_POS], spi_debug_control_reg[`SPI2_SPI_DEBUG_CONTROL_SPI_DEBUG_CONTROL_CONFIG3_POS], spi_debug_control_reg[`SPI2_SPI_DEBUG_CONTROL_SPI_DEBUG_CONTROL_CONFIG2_POS], spi_debug_control_reg[`SPI2_SPI_DEBUG_CONTROL_SPI_DEBUG_CONTROL_CONFIG1_POS], spi_debug_control_reg[`SPI2_SPI_DEBUG_CONTROL_SPI_DEBUG_CONTROL_CONFIG0_POS]};
assign spi_debug_control_value_o = {spi_debug_control_reg[`SPI2_SPI_DEBUG_CONTROL_SPI_DEBUG_CONTROL_VALUE7_POS], spi_debug_control_reg[`SPI2_SPI_DEBUG_CONTROL_SPI_DEBUG_CONTROL_VALUE6_POS], spi_debug_control_reg[`SPI2_SPI_DEBUG_CONTROL_SPI_DEBUG_CONTROL_VALUE5_POS], spi_debug_control_reg[`SPI2_SPI_DEBUG_CONTROL_SPI_DEBUG_CONTROL_VALUE4_POS], spi_debug_control_reg[`SPI2_SPI_DEBUG_CONTROL_SPI_DEBUG_CONTROL_VALUE3_POS], spi_debug_control_reg[`SPI2_SPI_DEBUG_CONTROL_SPI_DEBUG_CONTROL_VALUE2_POS], spi_debug_control_reg[`SPI2_SPI_DEBUG_CONTROL_SPI_DEBUG_CONTROL_VALUE1_POS], spi_debug_control_reg[`SPI2_SPI_DEBUG_CONTROL_SPI_DEBUG_CONTROL_VALUE0_POS]};
assign spi_debug_control_flag_o = {spi_debug_control_reg[`SPI2_SPI_DEBUG_CONTROL_SPI_DEBUG_CONTROL_FLAG7_POS], spi_debug_control_reg[`SPI2_SPI_DEBUG_CONTROL_SPI_DEBUG_CONTROL_FLAG6_POS], spi_debug_control_reg[`SPI2_SPI_DEBUG_CONTROL_SPI_DEBUG_CONTROL_FLAG5_POS], spi_debug_control_reg[`SPI2_SPI_DEBUG_CONTROL_SPI_DEBUG_CONTROL_FLAG4_POS], spi_debug_control_reg[`SPI2_SPI_DEBUG_CONTROL_SPI_DEBUG_CONTROL_FLAG3_POS], spi_debug_control_reg[`SPI2_SPI_DEBUG_CONTROL_SPI_DEBUG_CONTROL_FLAG2_POS], spi_debug_control_reg[`SPI2_SPI_DEBUG_CONTROL_SPI_DEBUG_CONTROL_FLAG1_POS], spi_debug_control_reg[`SPI2_SPI_DEBUG_CONTROL_SPI_DEBUG_CONTROL_FLAG0_POS]};
assign spi_loopback_control_o = {spi_loopback_reg[`SPI2_SPI_LOOPBACK_SPI_LOOPBACK_CONTROL7_POS], spi_loopback_reg[`SPI2_SPI_LOOPBACK_SPI_LOOPBACK_CONTROL6_POS], spi_loopback_reg[`SPI2_SPI_LOOPBACK_SPI_LOOPBACK_CONTROL5_POS], spi_loopback_reg[`SPI2_SPI_LOOPBACK_SPI_LOOPBACK_CONTROL4_POS], spi_loopback_reg[`SPI2_SPI_LOOPBACK_SPI_LOOPBACK_CONTROL3_POS], spi_loopback_reg[`SPI2_SPI_LOOPBACK_SPI_LOOPBACK_CONTROL2_POS], spi_loopback_reg[`SPI2_SPI_LOOPBACK_SPI_LOOPBACK_CONTROL1_POS], spi_loopback_reg[`SPI2_SPI_LOOPBACK_SPI_LOOPBACK_CONTROL0_POS]};
assign spi_loopback_config_o = {spi_loopback_reg[`SPI2_SPI_LOOPBACK_SPI_LOOPBACK_CONFIG7_POS], spi_loopback_reg[`SPI2_SPI_LOOPBACK_SPI_LOOPBACK_CONFIG6_POS], spi_loopback_reg[`SPI2_SPI_LOOPBACK_SPI_LOOPBACK_CONFIG5_POS], spi_loopback_reg[`SPI2_SPI_LOOPBACK_SPI_LOOPBACK_CONFIG4_POS], spi_loopback_reg[`SPI2_SPI_LOOPBACK_SPI_LOOPBACK_CONFIG3_POS], spi_loopback_reg[`SPI2_SPI_LOOPBACK_SPI_LOOPBACK_CONFIG2_POS], spi_loopback_reg[`SPI2_SPI_LOOPBACK_SPI_LOOPBACK_CONFIG1_POS], spi_loopback_reg[`SPI2_SPI_LOOPBACK_SPI_LOOPBACK_CONFIG0_POS]};
assign spi_loopback_value_o = {spi_loopback_reg[`SPI2_SPI_LOOPBACK_SPI_LOOPBACK_VALUE7_POS], spi_loopback_reg[`SPI2_SPI_LOOPBACK_SPI_LOOPBACK_VALUE6_POS], spi_loopback_reg[`SPI2_SPI_LOOPBACK_SPI_LOOPBACK_VALUE5_POS], spi_loopback_reg[`SPI2_SPI_LOOPBACK_SPI_LOOPBACK_VALUE4_POS], spi_loopback_reg[`SPI2_SPI_LOOPBACK_SPI_LOOPBACK_VALUE3_POS], spi_loopback_reg[`SPI2_SPI_LOOPBACK_SPI_LOOPBACK_VALUE2_POS], spi_loopback_reg[`SPI2_SPI_LOOPBACK_SPI_LOOPBACK_VALUE1_POS], spi_loopback_reg[`SPI2_SPI_LOOPBACK_SPI_LOOPBACK_VALUE0_POS]};
assign spi_loopback_flag_o = {spi_loopback_reg[`SPI2_SPI_LOOPBACK_SPI_LOOPBACK_FLAG7_POS], spi_loopback_reg[`SPI2_SPI_LOOPBACK_SPI_LOOPBACK_FLAG6_POS], spi_loopback_reg[`SPI2_SPI_LOOPBACK_SPI_LOOPBACK_FLAG5_POS], spi_loopback_reg[`SPI2_SPI_LOOPBACK_SPI_LOOPBACK_FLAG4_POS], spi_loopback_reg[`SPI2_SPI_LOOPBACK_SPI_LOOPBACK_FLAG3_POS], spi_loopback_reg[`SPI2_SPI_LOOPBACK_SPI_LOOPBACK_FLAG2_POS], spi_loopback_reg[`SPI2_SPI_LOOPBACK_SPI_LOOPBACK_FLAG1_POS], spi_loopback_reg[`SPI2_SPI_LOOPBACK_SPI_LOOPBACK_FLAG0_POS]};
assign spi_test_mode_control_o = {spi_test_mode_reg[`SPI2_SPI_TEST_MODE_SPI_TEST_MODE_CONTROL7_POS], spi_test_mode_reg[`SPI2_SPI_TEST_MODE_SPI_TEST_MODE_CONTROL6_POS], spi_test_mode_reg[`SPI2_SPI_TEST_MODE_SPI_TEST_MODE_CONTROL5_POS], spi_test_mode_reg[`SPI2_SPI_TEST_MODE_SPI_TEST_MODE_CONTROL4_POS], spi_test_mode_reg[`SPI2_SPI_TEST_MODE_SPI_TEST_MODE_CONTROL3_POS], spi_test_mode_reg[`SPI2_SPI_TEST_MODE_SPI_TEST_MODE_CONTROL2_POS], spi_test_mode_reg[`SPI2_SPI_TEST_MODE_SPI_TEST_MODE_CONTROL1_POS], spi_test_mode_reg[`SPI2_SPI_TEST_MODE_SPI_TEST_MODE_CONTROL0_POS]};
assign spi_test_mode_config_o = {spi_test_mode_reg[`SPI2_SPI_TEST_MODE_SPI_TEST_MODE_CONFIG7_POS], spi_test_mode_reg[`SPI2_SPI_TEST_MODE_SPI_TEST_MODE_CONFIG6_POS], spi_test_mode_reg[`SPI2_SPI_TEST_MODE_SPI_TEST_MODE_CONFIG5_POS], spi_test_mode_reg[`SPI2_SPI_TEST_MODE_SPI_TEST_MODE_CONFIG4_POS], spi_test_mode_reg[`SPI2_SPI_TEST_MODE_SPI_TEST_MODE_CONFIG3_POS], spi_test_mode_reg[`SPI2_SPI_TEST_MODE_SPI_TEST_MODE_CONFIG2_POS], spi_test_mode_reg[`SPI2_SPI_TEST_MODE_SPI_TEST_MODE_CONFIG1_POS], spi_test_mode_reg[`SPI2_SPI_TEST_MODE_SPI_TEST_MODE_CONFIG0_POS]};
assign spi_test_mode_value_o = {spi_test_mode_reg[`SPI2_SPI_TEST_MODE_SPI_TEST_MODE_VALUE7_POS], spi_test_mode_reg[`SPI2_SPI_TEST_MODE_SPI_TEST_MODE_VALUE6_POS], spi_test_mode_reg[`SPI2_SPI_TEST_MODE_SPI_TEST_MODE_VALUE5_POS], spi_test_mode_reg[`SPI2_SPI_TEST_MODE_SPI_TEST_MODE_VALUE4_POS], spi_test_mode_reg[`SPI2_SPI_TEST_MODE_SPI_TEST_MODE_VALUE3_POS], spi_test_mode_reg[`SPI2_SPI_TEST_MODE_SPI_TEST_MODE_VALUE2_POS], spi_test_mode_reg[`SPI2_SPI_TEST_MODE_SPI_TEST_MODE_VALUE1_POS], spi_test_mode_reg[`SPI2_SPI_TEST_MODE_SPI_TEST_MODE_VALUE0_POS]};
assign spi_test_mode_flag_o = {spi_test_mode_reg[`SPI2_SPI_TEST_MODE_SPI_TEST_MODE_FLAG7_POS], spi_test_mode_reg[`SPI2_SPI_TEST_MODE_SPI_TEST_MODE_FLAG6_POS], spi_test_mode_reg[`SPI2_SPI_TEST_MODE_SPI_TEST_MODE_FLAG5_POS], spi_test_mode_reg[`SPI2_SPI_TEST_MODE_SPI_TEST_MODE_FLAG4_POS], spi_test_mode_reg[`SPI2_SPI_TEST_MODE_SPI_TEST_MODE_FLAG3_POS], spi_test_mode_reg[`SPI2_SPI_TEST_MODE_SPI_TEST_MODE_FLAG2_POS], spi_test_mode_reg[`SPI2_SPI_TEST_MODE_SPI_TEST_MODE_FLAG1_POS], spi_test_mode_reg[`SPI2_SPI_TEST_MODE_SPI_TEST_MODE_FLAG0_POS]};
assign spi_test_control_control_o = {spi_test_control_reg[`SPI2_SPI_TEST_CONTROL_SPI_TEST_CONTROL_CONTROL7_POS], spi_test_control_reg[`SPI2_SPI_TEST_CONTROL_SPI_TEST_CONTROL_CONTROL6_POS], spi_test_control_reg[`SPI2_SPI_TEST_CONTROL_SPI_TEST_CONTROL_CONTROL5_POS], spi_test_control_reg[`SPI2_SPI_TEST_CONTROL_SPI_TEST_CONTROL_CONTROL4_POS], spi_test_control_reg[`SPI2_SPI_TEST_CONTROL_SPI_TEST_CONTROL_CONTROL3_POS], spi_test_control_reg[`SPI2_SPI_TEST_CONTROL_SPI_TEST_CONTROL_CONTROL2_POS], spi_test_control_reg[`SPI2_SPI_TEST_CONTROL_SPI_TEST_CONTROL_CONTROL1_POS], spi_test_control_reg[`SPI2_SPI_TEST_CONTROL_SPI_TEST_CONTROL_CONTROL0_POS]};
assign spi_test_control_config_o = {spi_test_control_reg[`SPI2_SPI_TEST_CONTROL_SPI_TEST_CONTROL_CONFIG7_POS], spi_test_control_reg[`SPI2_SPI_TEST_CONTROL_SPI_TEST_CONTROL_CONFIG6_POS], spi_test_control_reg[`SPI2_SPI_TEST_CONTROL_SPI_TEST_CONTROL_CONFIG5_POS], spi_test_control_reg[`SPI2_SPI_TEST_CONTROL_SPI_TEST_CONTROL_CONFIG4_POS], spi_test_control_reg[`SPI2_SPI_TEST_CONTROL_SPI_TEST_CONTROL_CONFIG3_POS], spi_test_control_reg[`SPI2_SPI_TEST_CONTROL_SPI_TEST_CONTROL_CONFIG2_POS], spi_test_control_reg[`SPI2_SPI_TEST_CONTROL_SPI_TEST_CONTROL_CONFIG1_POS], spi_test_control_reg[`SPI2_SPI_TEST_CONTROL_SPI_TEST_CONTROL_CONFIG0_POS]};
assign spi_test_control_value_o = {spi_test_control_reg[`SPI2_SPI_TEST_CONTROL_SPI_TEST_CONTROL_VALUE7_POS], spi_test_control_reg[`SPI2_SPI_TEST_CONTROL_SPI_TEST_CONTROL_VALUE6_POS], spi_test_control_reg[`SPI2_SPI_TEST_CONTROL_SPI_TEST_CONTROL_VALUE5_POS], spi_test_control_reg[`SPI2_SPI_TEST_CONTROL_SPI_TEST_CONTROL_VALUE4_POS], spi_test_control_reg[`SPI2_SPI_TEST_CONTROL_SPI_TEST_CONTROL_VALUE3_POS], spi_test_control_reg[`SPI2_SPI_TEST_CONTROL_SPI_TEST_CONTROL_VALUE2_POS], spi_test_control_reg[`SPI2_SPI_TEST_CONTROL_SPI_TEST_CONTROL_VALUE1_POS], spi_test_control_reg[`SPI2_SPI_TEST_CONTROL_SPI_TEST_CONTROL_VALUE0_POS]};
assign spi_test_control_flag_o = {spi_test_control_reg[`SPI2_SPI_TEST_CONTROL_SPI_TEST_CONTROL_FLAG7_POS], spi_test_control_reg[`SPI2_SPI_TEST_CONTROL_SPI_TEST_CONTROL_FLAG6_POS], spi_test_control_reg[`SPI2_SPI_TEST_CONTROL_SPI_TEST_CONTROL_FLAG5_POS], spi_test_control_reg[`SPI2_SPI_TEST_CONTROL_SPI_TEST_CONTROL_FLAG4_POS], spi_test_control_reg[`SPI2_SPI_TEST_CONTROL_SPI_TEST_CONTROL_FLAG3_POS], spi_test_control_reg[`SPI2_SPI_TEST_CONTROL_SPI_TEST_CONTROL_FLAG2_POS], spi_test_control_reg[`SPI2_SPI_TEST_CONTROL_SPI_TEST_CONTROL_FLAG1_POS], spi_test_control_reg[`SPI2_SPI_TEST_CONTROL_SPI_TEST_CONTROL_FLAG0_POS]};
assign spi_test_status_control_o = {spi_test_status_reg[`SPI2_SPI_TEST_STATUS_SPI_TEST_STATUS_CONTROL7_POS], spi_test_status_reg[`SPI2_SPI_TEST_STATUS_SPI_TEST_STATUS_CONTROL6_POS], spi_test_status_reg[`SPI2_SPI_TEST_STATUS_SPI_TEST_STATUS_CONTROL5_POS], spi_test_status_reg[`SPI2_SPI_TEST_STATUS_SPI_TEST_STATUS_CONTROL4_POS], spi_test_status_reg[`SPI2_SPI_TEST_STATUS_SPI_TEST_STATUS_CONTROL3_POS], spi_test_status_reg[`SPI2_SPI_TEST_STATUS_SPI_TEST_STATUS_CONTROL2_POS], spi_test_status_reg[`SPI2_SPI_TEST_STATUS_SPI_TEST_STATUS_CONTROL1_POS], spi_test_status_reg[`SPI2_SPI_TEST_STATUS_SPI_TEST_STATUS_CONTROL0_POS]};
assign spi_test_status_config_o = {spi_test_status_reg[`SPI2_SPI_TEST_STATUS_SPI_TEST_STATUS_CONFIG7_POS], spi_test_status_reg[`SPI2_SPI_TEST_STATUS_SPI_TEST_STATUS_CONFIG6_POS], spi_test_status_reg[`SPI2_SPI_TEST_STATUS_SPI_TEST_STATUS_CONFIG5_POS], spi_test_status_reg[`SPI2_SPI_TEST_STATUS_SPI_TEST_STATUS_CONFIG4_POS], spi_test_status_reg[`SPI2_SPI_TEST_STATUS_SPI_TEST_STATUS_CONFIG3_POS], spi_test_status_reg[`SPI2_SPI_TEST_STATUS_SPI_TEST_STATUS_CONFIG2_POS], spi_test_status_reg[`SPI2_SPI_TEST_STATUS_SPI_TEST_STATUS_CONFIG1_POS], spi_test_status_reg[`SPI2_SPI_TEST_STATUS_SPI_TEST_STATUS_CONFIG0_POS]};
assign spi_test_status_value_o = {spi_test_status_reg[`SPI2_SPI_TEST_STATUS_SPI_TEST_STATUS_VALUE7_POS], spi_test_status_reg[`SPI2_SPI_TEST_STATUS_SPI_TEST_STATUS_VALUE6_POS], spi_test_status_reg[`SPI2_SPI_TEST_STATUS_SPI_TEST_STATUS_VALUE5_POS], spi_test_status_reg[`SPI2_SPI_TEST_STATUS_SPI_TEST_STATUS_VALUE4_POS], spi_test_status_reg[`SPI2_SPI_TEST_STATUS_SPI_TEST_STATUS_VALUE3_POS], spi_test_status_reg[`SPI2_SPI_TEST_STATUS_SPI_TEST_STATUS_VALUE2_POS], spi_test_status_reg[`SPI2_SPI_TEST_STATUS_SPI_TEST_STATUS_VALUE1_POS], spi_test_status_reg[`SPI2_SPI_TEST_STATUS_SPI_TEST_STATUS_VALUE0_POS]};
assign spi_test_status_flag_o = {spi_test_status_reg[`SPI2_SPI_TEST_STATUS_SPI_TEST_STATUS_FLAG7_POS], spi_test_status_reg[`SPI2_SPI_TEST_STATUS_SPI_TEST_STATUS_FLAG6_POS], spi_test_status_reg[`SPI2_SPI_TEST_STATUS_SPI_TEST_STATUS_FLAG5_POS], spi_test_status_reg[`SPI2_SPI_TEST_STATUS_SPI_TEST_STATUS_FLAG4_POS], spi_test_status_reg[`SPI2_SPI_TEST_STATUS_SPI_TEST_STATUS_FLAG3_POS], spi_test_status_reg[`SPI2_SPI_TEST_STATUS_SPI_TEST_STATUS_FLAG2_POS], spi_test_status_reg[`SPI2_SPI_TEST_STATUS_SPI_TEST_STATUS_FLAG1_POS], spi_test_status_reg[`SPI2_SPI_TEST_STATUS_SPI_TEST_STATUS_FLAG0_POS]};
assign spi_pattern_config_control_o = {spi_pattern_config_reg[`SPI2_SPI_PATTERN_CONFIG_SPI_PATTERN_CONFIG_CONTROL7_POS], spi_pattern_config_reg[`SPI2_SPI_PATTERN_CONFIG_SPI_PATTERN_CONFIG_CONTROL6_POS], spi_pattern_config_reg[`SPI2_SPI_PATTERN_CONFIG_SPI_PATTERN_CONFIG_CONTROL5_POS], spi_pattern_config_reg[`SPI2_SPI_PATTERN_CONFIG_SPI_PATTERN_CONFIG_CONTROL4_POS], spi_pattern_config_reg[`SPI2_SPI_PATTERN_CONFIG_SPI_PATTERN_CONFIG_CONTROL3_POS], spi_pattern_config_reg[`SPI2_SPI_PATTERN_CONFIG_SPI_PATTERN_CONFIG_CONTROL2_POS], spi_pattern_config_reg[`SPI2_SPI_PATTERN_CONFIG_SPI_PATTERN_CONFIG_CONTROL1_POS], spi_pattern_config_reg[`SPI2_SPI_PATTERN_CONFIG_SPI_PATTERN_CONFIG_CONTROL0_POS]};
assign spi_pattern_config_config_o = {spi_pattern_config_reg[`SPI2_SPI_PATTERN_CONFIG_SPI_PATTERN_CONFIG_CONFIG7_POS], spi_pattern_config_reg[`SPI2_SPI_PATTERN_CONFIG_SPI_PATTERN_CONFIG_CONFIG6_POS], spi_pattern_config_reg[`SPI2_SPI_PATTERN_CONFIG_SPI_PATTERN_CONFIG_CONFIG5_POS], spi_pattern_config_reg[`SPI2_SPI_PATTERN_CONFIG_SPI_PATTERN_CONFIG_CONFIG4_POS], spi_pattern_config_reg[`SPI2_SPI_PATTERN_CONFIG_SPI_PATTERN_CONFIG_CONFIG3_POS], spi_pattern_config_reg[`SPI2_SPI_PATTERN_CONFIG_SPI_PATTERN_CONFIG_CONFIG2_POS], spi_pattern_config_reg[`SPI2_SPI_PATTERN_CONFIG_SPI_PATTERN_CONFIG_CONFIG1_POS], spi_pattern_config_reg[`SPI2_SPI_PATTERN_CONFIG_SPI_PATTERN_CONFIG_CONFIG0_POS]};
assign spi_pattern_config_value_o = {spi_pattern_config_reg[`SPI2_SPI_PATTERN_CONFIG_SPI_PATTERN_CONFIG_VALUE7_POS], spi_pattern_config_reg[`SPI2_SPI_PATTERN_CONFIG_SPI_PATTERN_CONFIG_VALUE6_POS], spi_pattern_config_reg[`SPI2_SPI_PATTERN_CONFIG_SPI_PATTERN_CONFIG_VALUE5_POS], spi_pattern_config_reg[`SPI2_SPI_PATTERN_CONFIG_SPI_PATTERN_CONFIG_VALUE4_POS], spi_pattern_config_reg[`SPI2_SPI_PATTERN_CONFIG_SPI_PATTERN_CONFIG_VALUE3_POS], spi_pattern_config_reg[`SPI2_SPI_PATTERN_CONFIG_SPI_PATTERN_CONFIG_VALUE2_POS], spi_pattern_config_reg[`SPI2_SPI_PATTERN_CONFIG_SPI_PATTERN_CONFIG_VALUE1_POS], spi_pattern_config_reg[`SPI2_SPI_PATTERN_CONFIG_SPI_PATTERN_CONFIG_VALUE0_POS]};
assign spi_pattern_config_flag_o = {spi_pattern_config_reg[`SPI2_SPI_PATTERN_CONFIG_SPI_PATTERN_CONFIG_FLAG7_POS], spi_pattern_config_reg[`SPI2_SPI_PATTERN_CONFIG_SPI_PATTERN_CONFIG_FLAG6_POS], spi_pattern_config_reg[`SPI2_SPI_PATTERN_CONFIG_SPI_PATTERN_CONFIG_FLAG5_POS], spi_pattern_config_reg[`SPI2_SPI_PATTERN_CONFIG_SPI_PATTERN_CONFIG_FLAG4_POS], spi_pattern_config_reg[`SPI2_SPI_PATTERN_CONFIG_SPI_PATTERN_CONFIG_FLAG3_POS], spi_pattern_config_reg[`SPI2_SPI_PATTERN_CONFIG_SPI_PATTERN_CONFIG_FLAG2_POS], spi_pattern_config_reg[`SPI2_SPI_PATTERN_CONFIG_SPI_PATTERN_CONFIG_FLAG1_POS], spi_pattern_config_reg[`SPI2_SPI_PATTERN_CONFIG_SPI_PATTERN_CONFIG_FLAG0_POS]};
assign spi_pattern_status_control_o = {spi_pattern_status_reg[`SPI2_SPI_PATTERN_STATUS_SPI_PATTERN_STATUS_CONTROL7_POS], spi_pattern_status_reg[`SPI2_SPI_PATTERN_STATUS_SPI_PATTERN_STATUS_CONTROL6_POS], spi_pattern_status_reg[`SPI2_SPI_PATTERN_STATUS_SPI_PATTERN_STATUS_CONTROL5_POS], spi_pattern_status_reg[`SPI2_SPI_PATTERN_STATUS_SPI_PATTERN_STATUS_CONTROL4_POS], spi_pattern_status_reg[`SPI2_SPI_PATTERN_STATUS_SPI_PATTERN_STATUS_CONTROL3_POS], spi_pattern_status_reg[`SPI2_SPI_PATTERN_STATUS_SPI_PATTERN_STATUS_CONTROL2_POS], spi_pattern_status_reg[`SPI2_SPI_PATTERN_STATUS_SPI_PATTERN_STATUS_CONTROL1_POS], spi_pattern_status_reg[`SPI2_SPI_PATTERN_STATUS_SPI_PATTERN_STATUS_CONTROL0_POS]};
assign spi_pattern_status_config_o = {spi_pattern_status_reg[`SPI2_SPI_PATTERN_STATUS_SPI_PATTERN_STATUS_CONFIG7_POS], spi_pattern_status_reg[`SPI2_SPI_PATTERN_STATUS_SPI_PATTERN_STATUS_CONFIG6_POS], spi_pattern_status_reg[`SPI2_SPI_PATTERN_STATUS_SPI_PATTERN_STATUS_CONFIG5_POS], spi_pattern_status_reg[`SPI2_SPI_PATTERN_STATUS_SPI_PATTERN_STATUS_CONFIG4_POS], spi_pattern_status_reg[`SPI2_SPI_PATTERN_STATUS_SPI_PATTERN_STATUS_CONFIG3_POS], spi_pattern_status_reg[`SPI2_SPI_PATTERN_STATUS_SPI_PATTERN_STATUS_CONFIG2_POS], spi_pattern_status_reg[`SPI2_SPI_PATTERN_STATUS_SPI_PATTERN_STATUS_CONFIG1_POS], spi_pattern_status_reg[`SPI2_SPI_PATTERN_STATUS_SPI_PATTERN_STATUS_CONFIG0_POS]};
assign spi_pattern_status_value_o = {spi_pattern_status_reg[`SPI2_SPI_PATTERN_STATUS_SPI_PATTERN_STATUS_VALUE7_POS], spi_pattern_status_reg[`SPI2_SPI_PATTERN_STATUS_SPI_PATTERN_STATUS_VALUE6_POS], spi_pattern_status_reg[`SPI2_SPI_PATTERN_STATUS_SPI_PATTERN_STATUS_VALUE5_POS], spi_pattern_status_reg[`SPI2_SPI_PATTERN_STATUS_SPI_PATTERN_STATUS_VALUE4_POS], spi_pattern_status_reg[`SPI2_SPI_PATTERN_STATUS_SPI_PATTERN_STATUS_VALUE3_POS], spi_pattern_status_reg[`SPI2_SPI_PATTERN_STATUS_SPI_PATTERN_STATUS_VALUE2_POS], spi_pattern_status_reg[`SPI2_SPI_PATTERN_STATUS_SPI_PATTERN_STATUS_VALUE1_POS], spi_pattern_status_reg[`SPI2_SPI_PATTERN_STATUS_SPI_PATTERN_STATUS_VALUE0_POS]};
assign spi_pattern_status_flag_o = {spi_pattern_status_reg[`SPI2_SPI_PATTERN_STATUS_SPI_PATTERN_STATUS_FLAG7_POS], spi_pattern_status_reg[`SPI2_SPI_PATTERN_STATUS_SPI_PATTERN_STATUS_FLAG6_POS], spi_pattern_status_reg[`SPI2_SPI_PATTERN_STATUS_SPI_PATTERN_STATUS_FLAG5_POS], spi_pattern_status_reg[`SPI2_SPI_PATTERN_STATUS_SPI_PATTERN_STATUS_FLAG4_POS], spi_pattern_status_reg[`SPI2_SPI_PATTERN_STATUS_SPI_PATTERN_STATUS_FLAG3_POS], spi_pattern_status_reg[`SPI2_SPI_PATTERN_STATUS_SPI_PATTERN_STATUS_FLAG2_POS], spi_pattern_status_reg[`SPI2_SPI_PATTERN_STATUS_SPI_PATTERN_STATUS_FLAG1_POS], spi_pattern_status_reg[`SPI2_SPI_PATTERN_STATUS_SPI_PATTERN_STATUS_FLAG0_POS]};
assign spi_sync_config_control_o = {spi_sync_config_reg[`SPI2_SPI_SYNC_CONFIG_SPI_SYNC_CONFIG_CONTROL7_POS], spi_sync_config_reg[`SPI2_SPI_SYNC_CONFIG_SPI_SYNC_CONFIG_CONTROL6_POS], spi_sync_config_reg[`SPI2_SPI_SYNC_CONFIG_SPI_SYNC_CONFIG_CONTROL5_POS], spi_sync_config_reg[`SPI2_SPI_SYNC_CONFIG_SPI_SYNC_CONFIG_CONTROL4_POS], spi_sync_config_reg[`SPI2_SPI_SYNC_CONFIG_SPI_SYNC_CONFIG_CONTROL3_POS], spi_sync_config_reg[`SPI2_SPI_SYNC_CONFIG_SPI_SYNC_CONFIG_CONTROL2_POS], spi_sync_config_reg[`SPI2_SPI_SYNC_CONFIG_SPI_SYNC_CONFIG_CONTROL1_POS], spi_sync_config_reg[`SPI2_SPI_SYNC_CONFIG_SPI_SYNC_CONFIG_CONTROL0_POS]};
assign spi_sync_config_config_o = {spi_sync_config_reg[`SPI2_SPI_SYNC_CONFIG_SPI_SYNC_CONFIG_CONFIG7_POS], spi_sync_config_reg[`SPI2_SPI_SYNC_CONFIG_SPI_SYNC_CONFIG_CONFIG6_POS], spi_sync_config_reg[`SPI2_SPI_SYNC_CONFIG_SPI_SYNC_CONFIG_CONFIG5_POS], spi_sync_config_reg[`SPI2_SPI_SYNC_CONFIG_SPI_SYNC_CONFIG_CONFIG4_POS], spi_sync_config_reg[`SPI2_SPI_SYNC_CONFIG_SPI_SYNC_CONFIG_CONFIG3_POS], spi_sync_config_reg[`SPI2_SPI_SYNC_CONFIG_SPI_SYNC_CONFIG_CONFIG2_POS], spi_sync_config_reg[`SPI2_SPI_SYNC_CONFIG_SPI_SYNC_CONFIG_CONFIG1_POS], spi_sync_config_reg[`SPI2_SPI_SYNC_CONFIG_SPI_SYNC_CONFIG_CONFIG0_POS]};
assign spi_sync_config_value_o = {spi_sync_config_reg[`SPI2_SPI_SYNC_CONFIG_SPI_SYNC_CONFIG_VALUE7_POS], spi_sync_config_reg[`SPI2_SPI_SYNC_CONFIG_SPI_SYNC_CONFIG_VALUE6_POS], spi_sync_config_reg[`SPI2_SPI_SYNC_CONFIG_SPI_SYNC_CONFIG_VALUE5_POS], spi_sync_config_reg[`SPI2_SPI_SYNC_CONFIG_SPI_SYNC_CONFIG_VALUE4_POS], spi_sync_config_reg[`SPI2_SPI_SYNC_CONFIG_SPI_SYNC_CONFIG_VALUE3_POS], spi_sync_config_reg[`SPI2_SPI_SYNC_CONFIG_SPI_SYNC_CONFIG_VALUE2_POS], spi_sync_config_reg[`SPI2_SPI_SYNC_CONFIG_SPI_SYNC_CONFIG_VALUE1_POS], spi_sync_config_reg[`SPI2_SPI_SYNC_CONFIG_SPI_SYNC_CONFIG_VALUE0_POS]};
assign spi_sync_config_flag_o = {spi_sync_config_reg[`SPI2_SPI_SYNC_CONFIG_SPI_SYNC_CONFIG_FLAG7_POS], spi_sync_config_reg[`SPI2_SPI_SYNC_CONFIG_SPI_SYNC_CONFIG_FLAG6_POS], spi_sync_config_reg[`SPI2_SPI_SYNC_CONFIG_SPI_SYNC_CONFIG_FLAG5_POS], spi_sync_config_reg[`SPI2_SPI_SYNC_CONFIG_SPI_SYNC_CONFIG_FLAG4_POS], spi_sync_config_reg[`SPI2_SPI_SYNC_CONFIG_SPI_SYNC_CONFIG_FLAG3_POS], spi_sync_config_reg[`SPI2_SPI_SYNC_CONFIG_SPI_SYNC_CONFIG_FLAG2_POS], spi_sync_config_reg[`SPI2_SPI_SYNC_CONFIG_SPI_SYNC_CONFIG_FLAG1_POS], spi_sync_config_reg[`SPI2_SPI_SYNC_CONFIG_SPI_SYNC_CONFIG_FLAG0_POS]};
assign spi_sync_status_control_o = {spi_sync_status_reg[`SPI2_SPI_SYNC_STATUS_SPI_SYNC_STATUS_CONTROL7_POS], spi_sync_status_reg[`SPI2_SPI_SYNC_STATUS_SPI_SYNC_STATUS_CONTROL6_POS], spi_sync_status_reg[`SPI2_SPI_SYNC_STATUS_SPI_SYNC_STATUS_CONTROL5_POS], spi_sync_status_reg[`SPI2_SPI_SYNC_STATUS_SPI_SYNC_STATUS_CONTROL4_POS], spi_sync_status_reg[`SPI2_SPI_SYNC_STATUS_SPI_SYNC_STATUS_CONTROL3_POS], spi_sync_status_reg[`SPI2_SPI_SYNC_STATUS_SPI_SYNC_STATUS_CONTROL2_POS], spi_sync_status_reg[`SPI2_SPI_SYNC_STATUS_SPI_SYNC_STATUS_CONTROL1_POS], spi_sync_status_reg[`SPI2_SPI_SYNC_STATUS_SPI_SYNC_STATUS_CONTROL0_POS]};
assign spi_sync_status_config_o = {spi_sync_status_reg[`SPI2_SPI_SYNC_STATUS_SPI_SYNC_STATUS_CONFIG7_POS], spi_sync_status_reg[`SPI2_SPI_SYNC_STATUS_SPI_SYNC_STATUS_CONFIG6_POS], spi_sync_status_reg[`SPI2_SPI_SYNC_STATUS_SPI_SYNC_STATUS_CONFIG5_POS], spi_sync_status_reg[`SPI2_SPI_SYNC_STATUS_SPI_SYNC_STATUS_CONFIG4_POS], spi_sync_status_reg[`SPI2_SPI_SYNC_STATUS_SPI_SYNC_STATUS_CONFIG3_POS], spi_sync_status_reg[`SPI2_SPI_SYNC_STATUS_SPI_SYNC_STATUS_CONFIG2_POS], spi_sync_status_reg[`SPI2_SPI_SYNC_STATUS_SPI_SYNC_STATUS_CONFIG1_POS], spi_sync_status_reg[`SPI2_SPI_SYNC_STATUS_SPI_SYNC_STATUS_CONFIG0_POS]};
assign spi_sync_status_value_o = {spi_sync_status_reg[`SPI2_SPI_SYNC_STATUS_SPI_SYNC_STATUS_VALUE7_POS], spi_sync_status_reg[`SPI2_SPI_SYNC_STATUS_SPI_SYNC_STATUS_VALUE6_POS], spi_sync_status_reg[`SPI2_SPI_SYNC_STATUS_SPI_SYNC_STATUS_VALUE5_POS], spi_sync_status_reg[`SPI2_SPI_SYNC_STATUS_SPI_SYNC_STATUS_VALUE4_POS], spi_sync_status_reg[`SPI2_SPI_SYNC_STATUS_SPI_SYNC_STATUS_VALUE3_POS], spi_sync_status_reg[`SPI2_SPI_SYNC_STATUS_SPI_SYNC_STATUS_VALUE2_POS], spi_sync_status_reg[`SPI2_SPI_SYNC_STATUS_SPI_SYNC_STATUS_VALUE1_POS], spi_sync_status_reg[`SPI2_SPI_SYNC_STATUS_SPI_SYNC_STATUS_VALUE0_POS]};
assign spi_sync_status_flag_o = {spi_sync_status_reg[`SPI2_SPI_SYNC_STATUS_SPI_SYNC_STATUS_FLAG7_POS], spi_sync_status_reg[`SPI2_SPI_SYNC_STATUS_SPI_SYNC_STATUS_FLAG6_POS], spi_sync_status_reg[`SPI2_SPI_SYNC_STATUS_SPI_SYNC_STATUS_FLAG5_POS], spi_sync_status_reg[`SPI2_SPI_SYNC_STATUS_SPI_SYNC_STATUS_FLAG4_POS], spi_sync_status_reg[`SPI2_SPI_SYNC_STATUS_SPI_SYNC_STATUS_FLAG3_POS], spi_sync_status_reg[`SPI2_SPI_SYNC_STATUS_SPI_SYNC_STATUS_FLAG2_POS], spi_sync_status_reg[`SPI2_SPI_SYNC_STATUS_SPI_SYNC_STATUS_FLAG1_POS], spi_sync_status_reg[`SPI2_SPI_SYNC_STATUS_SPI_SYNC_STATUS_FLAG0_POS]};
assign spi_filter_config_control_o = {spi_filter_config_reg[`SPI2_SPI_FILTER_CONFIG_SPI_FILTER_CONFIG_CONTROL7_POS], spi_filter_config_reg[`SPI2_SPI_FILTER_CONFIG_SPI_FILTER_CONFIG_CONTROL6_POS], spi_filter_config_reg[`SPI2_SPI_FILTER_CONFIG_SPI_FILTER_CONFIG_CONTROL5_POS], spi_filter_config_reg[`SPI2_SPI_FILTER_CONFIG_SPI_FILTER_CONFIG_CONTROL4_POS], spi_filter_config_reg[`SPI2_SPI_FILTER_CONFIG_SPI_FILTER_CONFIG_CONTROL3_POS], spi_filter_config_reg[`SPI2_SPI_FILTER_CONFIG_SPI_FILTER_CONFIG_CONTROL2_POS], spi_filter_config_reg[`SPI2_SPI_FILTER_CONFIG_SPI_FILTER_CONFIG_CONTROL1_POS], spi_filter_config_reg[`SPI2_SPI_FILTER_CONFIG_SPI_FILTER_CONFIG_CONTROL0_POS]};
assign spi_filter_config_config_o = {spi_filter_config_reg[`SPI2_SPI_FILTER_CONFIG_SPI_FILTER_CONFIG_CONFIG7_POS], spi_filter_config_reg[`SPI2_SPI_FILTER_CONFIG_SPI_FILTER_CONFIG_CONFIG6_POS], spi_filter_config_reg[`SPI2_SPI_FILTER_CONFIG_SPI_FILTER_CONFIG_CONFIG5_POS], spi_filter_config_reg[`SPI2_SPI_FILTER_CONFIG_SPI_FILTER_CONFIG_CONFIG4_POS], spi_filter_config_reg[`SPI2_SPI_FILTER_CONFIG_SPI_FILTER_CONFIG_CONFIG3_POS], spi_filter_config_reg[`SPI2_SPI_FILTER_CONFIG_SPI_FILTER_CONFIG_CONFIG2_POS], spi_filter_config_reg[`SPI2_SPI_FILTER_CONFIG_SPI_FILTER_CONFIG_CONFIG1_POS], spi_filter_config_reg[`SPI2_SPI_FILTER_CONFIG_SPI_FILTER_CONFIG_CONFIG0_POS]};
assign spi_filter_config_value_o = {spi_filter_config_reg[`SPI2_SPI_FILTER_CONFIG_SPI_FILTER_CONFIG_VALUE7_POS], spi_filter_config_reg[`SPI2_SPI_FILTER_CONFIG_SPI_FILTER_CONFIG_VALUE6_POS], spi_filter_config_reg[`SPI2_SPI_FILTER_CONFIG_SPI_FILTER_CONFIG_VALUE5_POS], spi_filter_config_reg[`SPI2_SPI_FILTER_CONFIG_SPI_FILTER_CONFIG_VALUE4_POS], spi_filter_config_reg[`SPI2_SPI_FILTER_CONFIG_SPI_FILTER_CONFIG_VALUE3_POS], spi_filter_config_reg[`SPI2_SPI_FILTER_CONFIG_SPI_FILTER_CONFIG_VALUE2_POS], spi_filter_config_reg[`SPI2_SPI_FILTER_CONFIG_SPI_FILTER_CONFIG_VALUE1_POS], spi_filter_config_reg[`SPI2_SPI_FILTER_CONFIG_SPI_FILTER_CONFIG_VALUE0_POS]};
assign spi_filter_config_flag_o = {spi_filter_config_reg[`SPI2_SPI_FILTER_CONFIG_SPI_FILTER_CONFIG_FLAG7_POS], spi_filter_config_reg[`SPI2_SPI_FILTER_CONFIG_SPI_FILTER_CONFIG_FLAG6_POS], spi_filter_config_reg[`SPI2_SPI_FILTER_CONFIG_SPI_FILTER_CONFIG_FLAG5_POS], spi_filter_config_reg[`SPI2_SPI_FILTER_CONFIG_SPI_FILTER_CONFIG_FLAG4_POS], spi_filter_config_reg[`SPI2_SPI_FILTER_CONFIG_SPI_FILTER_CONFIG_FLAG3_POS], spi_filter_config_reg[`SPI2_SPI_FILTER_CONFIG_SPI_FILTER_CONFIG_FLAG2_POS], spi_filter_config_reg[`SPI2_SPI_FILTER_CONFIG_SPI_FILTER_CONFIG_FLAG1_POS], spi_filter_config_reg[`SPI2_SPI_FILTER_CONFIG_SPI_FILTER_CONFIG_FLAG0_POS]};
assign spi_filter_status_control_o = {spi_filter_status_reg[`SPI2_SPI_FILTER_STATUS_SPI_FILTER_STATUS_CONTROL7_POS], spi_filter_status_reg[`SPI2_SPI_FILTER_STATUS_SPI_FILTER_STATUS_CONTROL6_POS], spi_filter_status_reg[`SPI2_SPI_FILTER_STATUS_SPI_FILTER_STATUS_CONTROL5_POS], spi_filter_status_reg[`SPI2_SPI_FILTER_STATUS_SPI_FILTER_STATUS_CONTROL4_POS], spi_filter_status_reg[`SPI2_SPI_FILTER_STATUS_SPI_FILTER_STATUS_CONTROL3_POS], spi_filter_status_reg[`SPI2_SPI_FILTER_STATUS_SPI_FILTER_STATUS_CONTROL2_POS], spi_filter_status_reg[`SPI2_SPI_FILTER_STATUS_SPI_FILTER_STATUS_CONTROL1_POS], spi_filter_status_reg[`SPI2_SPI_FILTER_STATUS_SPI_FILTER_STATUS_CONTROL0_POS]};
assign spi_filter_status_config_o = {spi_filter_status_reg[`SPI2_SPI_FILTER_STATUS_SPI_FILTER_STATUS_CONFIG7_POS], spi_filter_status_reg[`SPI2_SPI_FILTER_STATUS_SPI_FILTER_STATUS_CONFIG6_POS], spi_filter_status_reg[`SPI2_SPI_FILTER_STATUS_SPI_FILTER_STATUS_CONFIG5_POS], spi_filter_status_reg[`SPI2_SPI_FILTER_STATUS_SPI_FILTER_STATUS_CONFIG4_POS], spi_filter_status_reg[`SPI2_SPI_FILTER_STATUS_SPI_FILTER_STATUS_CONFIG3_POS], spi_filter_status_reg[`SPI2_SPI_FILTER_STATUS_SPI_FILTER_STATUS_CONFIG2_POS], spi_filter_status_reg[`SPI2_SPI_FILTER_STATUS_SPI_FILTER_STATUS_CONFIG1_POS], spi_filter_status_reg[`SPI2_SPI_FILTER_STATUS_SPI_FILTER_STATUS_CONFIG0_POS]};
assign spi_filter_status_value_o = {spi_filter_status_reg[`SPI2_SPI_FILTER_STATUS_SPI_FILTER_STATUS_VALUE7_POS], spi_filter_status_reg[`SPI2_SPI_FILTER_STATUS_SPI_FILTER_STATUS_VALUE6_POS], spi_filter_status_reg[`SPI2_SPI_FILTER_STATUS_SPI_FILTER_STATUS_VALUE5_POS], spi_filter_status_reg[`SPI2_SPI_FILTER_STATUS_SPI_FILTER_STATUS_VALUE4_POS], spi_filter_status_reg[`SPI2_SPI_FILTER_STATUS_SPI_FILTER_STATUS_VALUE3_POS], spi_filter_status_reg[`SPI2_SPI_FILTER_STATUS_SPI_FILTER_STATUS_VALUE2_POS], spi_filter_status_reg[`SPI2_SPI_FILTER_STATUS_SPI_FILTER_STATUS_VALUE1_POS], spi_filter_status_reg[`SPI2_SPI_FILTER_STATUS_SPI_FILTER_STATUS_VALUE0_POS]};
assign spi_filter_status_flag_o = {spi_filter_status_reg[`SPI2_SPI_FILTER_STATUS_SPI_FILTER_STATUS_FLAG7_POS], spi_filter_status_reg[`SPI2_SPI_FILTER_STATUS_SPI_FILTER_STATUS_FLAG6_POS], spi_filter_status_reg[`SPI2_SPI_FILTER_STATUS_SPI_FILTER_STATUS_FLAG5_POS], spi_filter_status_reg[`SPI2_SPI_FILTER_STATUS_SPI_FILTER_STATUS_FLAG4_POS], spi_filter_status_reg[`SPI2_SPI_FILTER_STATUS_SPI_FILTER_STATUS_FLAG3_POS], spi_filter_status_reg[`SPI2_SPI_FILTER_STATUS_SPI_FILTER_STATUS_FLAG2_POS], spi_filter_status_reg[`SPI2_SPI_FILTER_STATUS_SPI_FILTER_STATUS_FLAG1_POS], spi_filter_status_reg[`SPI2_SPI_FILTER_STATUS_SPI_FILTER_STATUS_FLAG0_POS]};
assign spi_sample_config_control_o = {spi_sample_config_reg[`SPI2_SPI_SAMPLE_CONFIG_SPI_SAMPLE_CONFIG_CONTROL7_POS], spi_sample_config_reg[`SPI2_SPI_SAMPLE_CONFIG_SPI_SAMPLE_CONFIG_CONTROL6_POS], spi_sample_config_reg[`SPI2_SPI_SAMPLE_CONFIG_SPI_SAMPLE_CONFIG_CONTROL5_POS], spi_sample_config_reg[`SPI2_SPI_SAMPLE_CONFIG_SPI_SAMPLE_CONFIG_CONTROL4_POS], spi_sample_config_reg[`SPI2_SPI_SAMPLE_CONFIG_SPI_SAMPLE_CONFIG_CONTROL3_POS], spi_sample_config_reg[`SPI2_SPI_SAMPLE_CONFIG_SPI_SAMPLE_CONFIG_CONTROL2_POS], spi_sample_config_reg[`SPI2_SPI_SAMPLE_CONFIG_SPI_SAMPLE_CONFIG_CONTROL1_POS], spi_sample_config_reg[`SPI2_SPI_SAMPLE_CONFIG_SPI_SAMPLE_CONFIG_CONTROL0_POS]};
assign spi_sample_config_config_o = {spi_sample_config_reg[`SPI2_SPI_SAMPLE_CONFIG_SPI_SAMPLE_CONFIG_CONFIG7_POS], spi_sample_config_reg[`SPI2_SPI_SAMPLE_CONFIG_SPI_SAMPLE_CONFIG_CONFIG6_POS], spi_sample_config_reg[`SPI2_SPI_SAMPLE_CONFIG_SPI_SAMPLE_CONFIG_CONFIG5_POS], spi_sample_config_reg[`SPI2_SPI_SAMPLE_CONFIG_SPI_SAMPLE_CONFIG_CONFIG4_POS], spi_sample_config_reg[`SPI2_SPI_SAMPLE_CONFIG_SPI_SAMPLE_CONFIG_CONFIG3_POS], spi_sample_config_reg[`SPI2_SPI_SAMPLE_CONFIG_SPI_SAMPLE_CONFIG_CONFIG2_POS], spi_sample_config_reg[`SPI2_SPI_SAMPLE_CONFIG_SPI_SAMPLE_CONFIG_CONFIG1_POS], spi_sample_config_reg[`SPI2_SPI_SAMPLE_CONFIG_SPI_SAMPLE_CONFIG_CONFIG0_POS]};
assign spi_sample_config_value_o = {spi_sample_config_reg[`SPI2_SPI_SAMPLE_CONFIG_SPI_SAMPLE_CONFIG_VALUE7_POS], spi_sample_config_reg[`SPI2_SPI_SAMPLE_CONFIG_SPI_SAMPLE_CONFIG_VALUE6_POS], spi_sample_config_reg[`SPI2_SPI_SAMPLE_CONFIG_SPI_SAMPLE_CONFIG_VALUE5_POS], spi_sample_config_reg[`SPI2_SPI_SAMPLE_CONFIG_SPI_SAMPLE_CONFIG_VALUE4_POS], spi_sample_config_reg[`SPI2_SPI_SAMPLE_CONFIG_SPI_SAMPLE_CONFIG_VALUE3_POS], spi_sample_config_reg[`SPI2_SPI_SAMPLE_CONFIG_SPI_SAMPLE_CONFIG_VALUE2_POS], spi_sample_config_reg[`SPI2_SPI_SAMPLE_CONFIG_SPI_SAMPLE_CONFIG_VALUE1_POS], spi_sample_config_reg[`SPI2_SPI_SAMPLE_CONFIG_SPI_SAMPLE_CONFIG_VALUE0_POS]};
assign spi_sample_config_flag_o = {spi_sample_config_reg[`SPI2_SPI_SAMPLE_CONFIG_SPI_SAMPLE_CONFIG_FLAG7_POS], spi_sample_config_reg[`SPI2_SPI_SAMPLE_CONFIG_SPI_SAMPLE_CONFIG_FLAG6_POS], spi_sample_config_reg[`SPI2_SPI_SAMPLE_CONFIG_SPI_SAMPLE_CONFIG_FLAG5_POS], spi_sample_config_reg[`SPI2_SPI_SAMPLE_CONFIG_SPI_SAMPLE_CONFIG_FLAG4_POS], spi_sample_config_reg[`SPI2_SPI_SAMPLE_CONFIG_SPI_SAMPLE_CONFIG_FLAG3_POS], spi_sample_config_reg[`SPI2_SPI_SAMPLE_CONFIG_SPI_SAMPLE_CONFIG_FLAG2_POS], spi_sample_config_reg[`SPI2_SPI_SAMPLE_CONFIG_SPI_SAMPLE_CONFIG_FLAG1_POS], spi_sample_config_reg[`SPI2_SPI_SAMPLE_CONFIG_SPI_SAMPLE_CONFIG_FLAG0_POS]};
assign spi_sample_status_control_o = {spi_sample_status_reg[`SPI2_SPI_SAMPLE_STATUS_SPI_SAMPLE_STATUS_CONTROL7_POS], spi_sample_status_reg[`SPI2_SPI_SAMPLE_STATUS_SPI_SAMPLE_STATUS_CONTROL6_POS], spi_sample_status_reg[`SPI2_SPI_SAMPLE_STATUS_SPI_SAMPLE_STATUS_CONTROL5_POS], spi_sample_status_reg[`SPI2_SPI_SAMPLE_STATUS_SPI_SAMPLE_STATUS_CONTROL4_POS], spi_sample_status_reg[`SPI2_SPI_SAMPLE_STATUS_SPI_SAMPLE_STATUS_CONTROL3_POS], spi_sample_status_reg[`SPI2_SPI_SAMPLE_STATUS_SPI_SAMPLE_STATUS_CONTROL2_POS], spi_sample_status_reg[`SPI2_SPI_SAMPLE_STATUS_SPI_SAMPLE_STATUS_CONTROL1_POS], spi_sample_status_reg[`SPI2_SPI_SAMPLE_STATUS_SPI_SAMPLE_STATUS_CONTROL0_POS]};
assign spi_sample_status_config_o = {spi_sample_status_reg[`SPI2_SPI_SAMPLE_STATUS_SPI_SAMPLE_STATUS_CONFIG7_POS], spi_sample_status_reg[`SPI2_SPI_SAMPLE_STATUS_SPI_SAMPLE_STATUS_CONFIG6_POS], spi_sample_status_reg[`SPI2_SPI_SAMPLE_STATUS_SPI_SAMPLE_STATUS_CONFIG5_POS], spi_sample_status_reg[`SPI2_SPI_SAMPLE_STATUS_SPI_SAMPLE_STATUS_CONFIG4_POS], spi_sample_status_reg[`SPI2_SPI_SAMPLE_STATUS_SPI_SAMPLE_STATUS_CONFIG3_POS], spi_sample_status_reg[`SPI2_SPI_SAMPLE_STATUS_SPI_SAMPLE_STATUS_CONFIG2_POS], spi_sample_status_reg[`SPI2_SPI_SAMPLE_STATUS_SPI_SAMPLE_STATUS_CONFIG1_POS], spi_sample_status_reg[`SPI2_SPI_SAMPLE_STATUS_SPI_SAMPLE_STATUS_CONFIG0_POS]};
assign spi_sample_status_value_o = {spi_sample_status_reg[`SPI2_SPI_SAMPLE_STATUS_SPI_SAMPLE_STATUS_VALUE7_POS], spi_sample_status_reg[`SPI2_SPI_SAMPLE_STATUS_SPI_SAMPLE_STATUS_VALUE6_POS], spi_sample_status_reg[`SPI2_SPI_SAMPLE_STATUS_SPI_SAMPLE_STATUS_VALUE5_POS], spi_sample_status_reg[`SPI2_SPI_SAMPLE_STATUS_SPI_SAMPLE_STATUS_VALUE4_POS], spi_sample_status_reg[`SPI2_SPI_SAMPLE_STATUS_SPI_SAMPLE_STATUS_VALUE3_POS], spi_sample_status_reg[`SPI2_SPI_SAMPLE_STATUS_SPI_SAMPLE_STATUS_VALUE2_POS], spi_sample_status_reg[`SPI2_SPI_SAMPLE_STATUS_SPI_SAMPLE_STATUS_VALUE1_POS], spi_sample_status_reg[`SPI2_SPI_SAMPLE_STATUS_SPI_SAMPLE_STATUS_VALUE0_POS]};
assign spi_sample_status_flag_o = {spi_sample_status_reg[`SPI2_SPI_SAMPLE_STATUS_SPI_SAMPLE_STATUS_FLAG7_POS], spi_sample_status_reg[`SPI2_SPI_SAMPLE_STATUS_SPI_SAMPLE_STATUS_FLAG6_POS], spi_sample_status_reg[`SPI2_SPI_SAMPLE_STATUS_SPI_SAMPLE_STATUS_FLAG5_POS], spi_sample_status_reg[`SPI2_SPI_SAMPLE_STATUS_SPI_SAMPLE_STATUS_FLAG4_POS], spi_sample_status_reg[`SPI2_SPI_SAMPLE_STATUS_SPI_SAMPLE_STATUS_FLAG3_POS], spi_sample_status_reg[`SPI2_SPI_SAMPLE_STATUS_SPI_SAMPLE_STATUS_FLAG2_POS], spi_sample_status_reg[`SPI2_SPI_SAMPLE_STATUS_SPI_SAMPLE_STATUS_FLAG1_POS], spi_sample_status_reg[`SPI2_SPI_SAMPLE_STATUS_SPI_SAMPLE_STATUS_FLAG0_POS]};
assign spi_drive_config_control_o = {spi_drive_config_reg[`SPI2_SPI_DRIVE_CONFIG_SPI_DRIVE_CONFIG_CONTROL7_POS], spi_drive_config_reg[`SPI2_SPI_DRIVE_CONFIG_SPI_DRIVE_CONFIG_CONTROL6_POS], spi_drive_config_reg[`SPI2_SPI_DRIVE_CONFIG_SPI_DRIVE_CONFIG_CONTROL5_POS], spi_drive_config_reg[`SPI2_SPI_DRIVE_CONFIG_SPI_DRIVE_CONFIG_CONTROL4_POS], spi_drive_config_reg[`SPI2_SPI_DRIVE_CONFIG_SPI_DRIVE_CONFIG_CONTROL3_POS], spi_drive_config_reg[`SPI2_SPI_DRIVE_CONFIG_SPI_DRIVE_CONFIG_CONTROL2_POS], spi_drive_config_reg[`SPI2_SPI_DRIVE_CONFIG_SPI_DRIVE_CONFIG_CONTROL1_POS], spi_drive_config_reg[`SPI2_SPI_DRIVE_CONFIG_SPI_DRIVE_CONFIG_CONTROL0_POS]};
assign spi_drive_config_config_o = {spi_drive_config_reg[`SPI2_SPI_DRIVE_CONFIG_SPI_DRIVE_CONFIG_CONFIG7_POS], spi_drive_config_reg[`SPI2_SPI_DRIVE_CONFIG_SPI_DRIVE_CONFIG_CONFIG6_POS], spi_drive_config_reg[`SPI2_SPI_DRIVE_CONFIG_SPI_DRIVE_CONFIG_CONFIG5_POS], spi_drive_config_reg[`SPI2_SPI_DRIVE_CONFIG_SPI_DRIVE_CONFIG_CONFIG4_POS], spi_drive_config_reg[`SPI2_SPI_DRIVE_CONFIG_SPI_DRIVE_CONFIG_CONFIG3_POS], spi_drive_config_reg[`SPI2_SPI_DRIVE_CONFIG_SPI_DRIVE_CONFIG_CONFIG2_POS], spi_drive_config_reg[`SPI2_SPI_DRIVE_CONFIG_SPI_DRIVE_CONFIG_CONFIG1_POS], spi_drive_config_reg[`SPI2_SPI_DRIVE_CONFIG_SPI_DRIVE_CONFIG_CONFIG0_POS]};
assign spi_drive_config_value_o = {spi_drive_config_reg[`SPI2_SPI_DRIVE_CONFIG_SPI_DRIVE_CONFIG_VALUE7_POS], spi_drive_config_reg[`SPI2_SPI_DRIVE_CONFIG_SPI_DRIVE_CONFIG_VALUE6_POS], spi_drive_config_reg[`SPI2_SPI_DRIVE_CONFIG_SPI_DRIVE_CONFIG_VALUE5_POS], spi_drive_config_reg[`SPI2_SPI_DRIVE_CONFIG_SPI_DRIVE_CONFIG_VALUE4_POS], spi_drive_config_reg[`SPI2_SPI_DRIVE_CONFIG_SPI_DRIVE_CONFIG_VALUE3_POS], spi_drive_config_reg[`SPI2_SPI_DRIVE_CONFIG_SPI_DRIVE_CONFIG_VALUE2_POS], spi_drive_config_reg[`SPI2_SPI_DRIVE_CONFIG_SPI_DRIVE_CONFIG_VALUE1_POS], spi_drive_config_reg[`SPI2_SPI_DRIVE_CONFIG_SPI_DRIVE_CONFIG_VALUE0_POS]};
assign spi_drive_config_flag_o = {spi_drive_config_reg[`SPI2_SPI_DRIVE_CONFIG_SPI_DRIVE_CONFIG_FLAG7_POS], spi_drive_config_reg[`SPI2_SPI_DRIVE_CONFIG_SPI_DRIVE_CONFIG_FLAG6_POS], spi_drive_config_reg[`SPI2_SPI_DRIVE_CONFIG_SPI_DRIVE_CONFIG_FLAG5_POS], spi_drive_config_reg[`SPI2_SPI_DRIVE_CONFIG_SPI_DRIVE_CONFIG_FLAG4_POS], spi_drive_config_reg[`SPI2_SPI_DRIVE_CONFIG_SPI_DRIVE_CONFIG_FLAG3_POS], spi_drive_config_reg[`SPI2_SPI_DRIVE_CONFIG_SPI_DRIVE_CONFIG_FLAG2_POS], spi_drive_config_reg[`SPI2_SPI_DRIVE_CONFIG_SPI_DRIVE_CONFIG_FLAG1_POS], spi_drive_config_reg[`SPI2_SPI_DRIVE_CONFIG_SPI_DRIVE_CONFIG_FLAG0_POS]};
assign spi_drive_status_control_o = {spi_drive_status_reg[`SPI2_SPI_DRIVE_STATUS_SPI_DRIVE_STATUS_CONTROL7_POS], spi_drive_status_reg[`SPI2_SPI_DRIVE_STATUS_SPI_DRIVE_STATUS_CONTROL6_POS], spi_drive_status_reg[`SPI2_SPI_DRIVE_STATUS_SPI_DRIVE_STATUS_CONTROL5_POS], spi_drive_status_reg[`SPI2_SPI_DRIVE_STATUS_SPI_DRIVE_STATUS_CONTROL4_POS], spi_drive_status_reg[`SPI2_SPI_DRIVE_STATUS_SPI_DRIVE_STATUS_CONTROL3_POS], spi_drive_status_reg[`SPI2_SPI_DRIVE_STATUS_SPI_DRIVE_STATUS_CONTROL2_POS], spi_drive_status_reg[`SPI2_SPI_DRIVE_STATUS_SPI_DRIVE_STATUS_CONTROL1_POS], spi_drive_status_reg[`SPI2_SPI_DRIVE_STATUS_SPI_DRIVE_STATUS_CONTROL0_POS]};
assign spi_drive_status_config_o = {spi_drive_status_reg[`SPI2_SPI_DRIVE_STATUS_SPI_DRIVE_STATUS_CONFIG7_POS], spi_drive_status_reg[`SPI2_SPI_DRIVE_STATUS_SPI_DRIVE_STATUS_CONFIG6_POS], spi_drive_status_reg[`SPI2_SPI_DRIVE_STATUS_SPI_DRIVE_STATUS_CONFIG5_POS], spi_drive_status_reg[`SPI2_SPI_DRIVE_STATUS_SPI_DRIVE_STATUS_CONFIG4_POS], spi_drive_status_reg[`SPI2_SPI_DRIVE_STATUS_SPI_DRIVE_STATUS_CONFIG3_POS], spi_drive_status_reg[`SPI2_SPI_DRIVE_STATUS_SPI_DRIVE_STATUS_CONFIG2_POS], spi_drive_status_reg[`SPI2_SPI_DRIVE_STATUS_SPI_DRIVE_STATUS_CONFIG1_POS], spi_drive_status_reg[`SPI2_SPI_DRIVE_STATUS_SPI_DRIVE_STATUS_CONFIG0_POS]};
assign spi_drive_status_value_o = {spi_drive_status_reg[`SPI2_SPI_DRIVE_STATUS_SPI_DRIVE_STATUS_VALUE7_POS], spi_drive_status_reg[`SPI2_SPI_DRIVE_STATUS_SPI_DRIVE_STATUS_VALUE6_POS], spi_drive_status_reg[`SPI2_SPI_DRIVE_STATUS_SPI_DRIVE_STATUS_VALUE5_POS], spi_drive_status_reg[`SPI2_SPI_DRIVE_STATUS_SPI_DRIVE_STATUS_VALUE4_POS], spi_drive_status_reg[`SPI2_SPI_DRIVE_STATUS_SPI_DRIVE_STATUS_VALUE3_POS], spi_drive_status_reg[`SPI2_SPI_DRIVE_STATUS_SPI_DRIVE_STATUS_VALUE2_POS], spi_drive_status_reg[`SPI2_SPI_DRIVE_STATUS_SPI_DRIVE_STATUS_VALUE1_POS], spi_drive_status_reg[`SPI2_SPI_DRIVE_STATUS_SPI_DRIVE_STATUS_VALUE0_POS]};
assign spi_drive_status_flag_o = {spi_drive_status_reg[`SPI2_SPI_DRIVE_STATUS_SPI_DRIVE_STATUS_FLAG7_POS], spi_drive_status_reg[`SPI2_SPI_DRIVE_STATUS_SPI_DRIVE_STATUS_FLAG6_POS], spi_drive_status_reg[`SPI2_SPI_DRIVE_STATUS_SPI_DRIVE_STATUS_FLAG5_POS], spi_drive_status_reg[`SPI2_SPI_DRIVE_STATUS_SPI_DRIVE_STATUS_FLAG4_POS], spi_drive_status_reg[`SPI2_SPI_DRIVE_STATUS_SPI_DRIVE_STATUS_FLAG3_POS], spi_drive_status_reg[`SPI2_SPI_DRIVE_STATUS_SPI_DRIVE_STATUS_FLAG2_POS], spi_drive_status_reg[`SPI2_SPI_DRIVE_STATUS_SPI_DRIVE_STATUS_FLAG1_POS], spi_drive_status_reg[`SPI2_SPI_DRIVE_STATUS_SPI_DRIVE_STATUS_FLAG0_POS]};
assign spi_polarity_config_control_o = {spi_polarity_config_reg[`SPI2_SPI_POLARITY_CONFIG_SPI_POLARITY_CONFIG_CONTROL7_POS], spi_polarity_config_reg[`SPI2_SPI_POLARITY_CONFIG_SPI_POLARITY_CONFIG_CONTROL6_POS], spi_polarity_config_reg[`SPI2_SPI_POLARITY_CONFIG_SPI_POLARITY_CONFIG_CONTROL5_POS], spi_polarity_config_reg[`SPI2_SPI_POLARITY_CONFIG_SPI_POLARITY_CONFIG_CONTROL4_POS], spi_polarity_config_reg[`SPI2_SPI_POLARITY_CONFIG_SPI_POLARITY_CONFIG_CONTROL3_POS], spi_polarity_config_reg[`SPI2_SPI_POLARITY_CONFIG_SPI_POLARITY_CONFIG_CONTROL2_POS], spi_polarity_config_reg[`SPI2_SPI_POLARITY_CONFIG_SPI_POLARITY_CONFIG_CONTROL1_POS], spi_polarity_config_reg[`SPI2_SPI_POLARITY_CONFIG_SPI_POLARITY_CONFIG_CONTROL0_POS]};
assign spi_polarity_config_config_o = {spi_polarity_config_reg[`SPI2_SPI_POLARITY_CONFIG_SPI_POLARITY_CONFIG_CONFIG7_POS], spi_polarity_config_reg[`SPI2_SPI_POLARITY_CONFIG_SPI_POLARITY_CONFIG_CONFIG6_POS], spi_polarity_config_reg[`SPI2_SPI_POLARITY_CONFIG_SPI_POLARITY_CONFIG_CONFIG5_POS], spi_polarity_config_reg[`SPI2_SPI_POLARITY_CONFIG_SPI_POLARITY_CONFIG_CONFIG4_POS], spi_polarity_config_reg[`SPI2_SPI_POLARITY_CONFIG_SPI_POLARITY_CONFIG_CONFIG3_POS], spi_polarity_config_reg[`SPI2_SPI_POLARITY_CONFIG_SPI_POLARITY_CONFIG_CONFIG2_POS], spi_polarity_config_reg[`SPI2_SPI_POLARITY_CONFIG_SPI_POLARITY_CONFIG_CONFIG1_POS], spi_polarity_config_reg[`SPI2_SPI_POLARITY_CONFIG_SPI_POLARITY_CONFIG_CONFIG0_POS]};
assign spi_polarity_config_value_o = {spi_polarity_config_reg[`SPI2_SPI_POLARITY_CONFIG_SPI_POLARITY_CONFIG_VALUE7_POS], spi_polarity_config_reg[`SPI2_SPI_POLARITY_CONFIG_SPI_POLARITY_CONFIG_VALUE6_POS], spi_polarity_config_reg[`SPI2_SPI_POLARITY_CONFIG_SPI_POLARITY_CONFIG_VALUE5_POS], spi_polarity_config_reg[`SPI2_SPI_POLARITY_CONFIG_SPI_POLARITY_CONFIG_VALUE4_POS], spi_polarity_config_reg[`SPI2_SPI_POLARITY_CONFIG_SPI_POLARITY_CONFIG_VALUE3_POS], spi_polarity_config_reg[`SPI2_SPI_POLARITY_CONFIG_SPI_POLARITY_CONFIG_VALUE2_POS], spi_polarity_config_reg[`SPI2_SPI_POLARITY_CONFIG_SPI_POLARITY_CONFIG_VALUE1_POS], spi_polarity_config_reg[`SPI2_SPI_POLARITY_CONFIG_SPI_POLARITY_CONFIG_VALUE0_POS]};
assign spi_polarity_config_flag_o = {spi_polarity_config_reg[`SPI2_SPI_POLARITY_CONFIG_SPI_POLARITY_CONFIG_FLAG7_POS], spi_polarity_config_reg[`SPI2_SPI_POLARITY_CONFIG_SPI_POLARITY_CONFIG_FLAG6_POS], spi_polarity_config_reg[`SPI2_SPI_POLARITY_CONFIG_SPI_POLARITY_CONFIG_FLAG5_POS], spi_polarity_config_reg[`SPI2_SPI_POLARITY_CONFIG_SPI_POLARITY_CONFIG_FLAG4_POS], spi_polarity_config_reg[`SPI2_SPI_POLARITY_CONFIG_SPI_POLARITY_CONFIG_FLAG3_POS], spi_polarity_config_reg[`SPI2_SPI_POLARITY_CONFIG_SPI_POLARITY_CONFIG_FLAG2_POS], spi_polarity_config_reg[`SPI2_SPI_POLARITY_CONFIG_SPI_POLARITY_CONFIG_FLAG1_POS], spi_polarity_config_reg[`SPI2_SPI_POLARITY_CONFIG_SPI_POLARITY_CONFIG_FLAG0_POS]};
assign spi_phase_config_control_o = {spi_phase_config_reg[`SPI2_SPI_PHASE_CONFIG_SPI_PHASE_CONFIG_CONTROL7_POS], spi_phase_config_reg[`SPI2_SPI_PHASE_CONFIG_SPI_PHASE_CONFIG_CONTROL6_POS], spi_phase_config_reg[`SPI2_SPI_PHASE_CONFIG_SPI_PHASE_CONFIG_CONTROL5_POS], spi_phase_config_reg[`SPI2_SPI_PHASE_CONFIG_SPI_PHASE_CONFIG_CONTROL4_POS], spi_phase_config_reg[`SPI2_SPI_PHASE_CONFIG_SPI_PHASE_CONFIG_CONTROL3_POS], spi_phase_config_reg[`SPI2_SPI_PHASE_CONFIG_SPI_PHASE_CONFIG_CONTROL2_POS], spi_phase_config_reg[`SPI2_SPI_PHASE_CONFIG_SPI_PHASE_CONFIG_CONTROL1_POS], spi_phase_config_reg[`SPI2_SPI_PHASE_CONFIG_SPI_PHASE_CONFIG_CONTROL0_POS]};
assign spi_phase_config_config_o = {spi_phase_config_reg[`SPI2_SPI_PHASE_CONFIG_SPI_PHASE_CONFIG_CONFIG7_POS], spi_phase_config_reg[`SPI2_SPI_PHASE_CONFIG_SPI_PHASE_CONFIG_CONFIG6_POS], spi_phase_config_reg[`SPI2_SPI_PHASE_CONFIG_SPI_PHASE_CONFIG_CONFIG5_POS], spi_phase_config_reg[`SPI2_SPI_PHASE_CONFIG_SPI_PHASE_CONFIG_CONFIG4_POS], spi_phase_config_reg[`SPI2_SPI_PHASE_CONFIG_SPI_PHASE_CONFIG_CONFIG3_POS], spi_phase_config_reg[`SPI2_SPI_PHASE_CONFIG_SPI_PHASE_CONFIG_CONFIG2_POS], spi_phase_config_reg[`SPI2_SPI_PHASE_CONFIG_SPI_PHASE_CONFIG_CONFIG1_POS], spi_phase_config_reg[`SPI2_SPI_PHASE_CONFIG_SPI_PHASE_CONFIG_CONFIG0_POS]};
assign spi_phase_config_value_o = {spi_phase_config_reg[`SPI2_SPI_PHASE_CONFIG_SPI_PHASE_CONFIG_VALUE7_POS], spi_phase_config_reg[`SPI2_SPI_PHASE_CONFIG_SPI_PHASE_CONFIG_VALUE6_POS], spi_phase_config_reg[`SPI2_SPI_PHASE_CONFIG_SPI_PHASE_CONFIG_VALUE5_POS], spi_phase_config_reg[`SPI2_SPI_PHASE_CONFIG_SPI_PHASE_CONFIG_VALUE4_POS], spi_phase_config_reg[`SPI2_SPI_PHASE_CONFIG_SPI_PHASE_CONFIG_VALUE3_POS], spi_phase_config_reg[`SPI2_SPI_PHASE_CONFIG_SPI_PHASE_CONFIG_VALUE2_POS], spi_phase_config_reg[`SPI2_SPI_PHASE_CONFIG_SPI_PHASE_CONFIG_VALUE1_POS], spi_phase_config_reg[`SPI2_SPI_PHASE_CONFIG_SPI_PHASE_CONFIG_VALUE0_POS]};
assign spi_phase_config_flag_o = {spi_phase_config_reg[`SPI2_SPI_PHASE_CONFIG_SPI_PHASE_CONFIG_FLAG7_POS], spi_phase_config_reg[`SPI2_SPI_PHASE_CONFIG_SPI_PHASE_CONFIG_FLAG6_POS], spi_phase_config_reg[`SPI2_SPI_PHASE_CONFIG_SPI_PHASE_CONFIG_FLAG5_POS], spi_phase_config_reg[`SPI2_SPI_PHASE_CONFIG_SPI_PHASE_CONFIG_FLAG4_POS], spi_phase_config_reg[`SPI2_SPI_PHASE_CONFIG_SPI_PHASE_CONFIG_FLAG3_POS], spi_phase_config_reg[`SPI2_SPI_PHASE_CONFIG_SPI_PHASE_CONFIG_FLAG2_POS], spi_phase_config_reg[`SPI2_SPI_PHASE_CONFIG_SPI_PHASE_CONFIG_FLAG1_POS], spi_phase_config_reg[`SPI2_SPI_PHASE_CONFIG_SPI_PHASE_CONFIG_FLAG0_POS]};
assign spi_edge_config_control_o = {spi_edge_config_reg[`SPI2_SPI_EDGE_CONFIG_SPI_EDGE_CONFIG_CONTROL7_POS], spi_edge_config_reg[`SPI2_SPI_EDGE_CONFIG_SPI_EDGE_CONFIG_CONTROL6_POS], spi_edge_config_reg[`SPI2_SPI_EDGE_CONFIG_SPI_EDGE_CONFIG_CONTROL5_POS], spi_edge_config_reg[`SPI2_SPI_EDGE_CONFIG_SPI_EDGE_CONFIG_CONTROL4_POS], spi_edge_config_reg[`SPI2_SPI_EDGE_CONFIG_SPI_EDGE_CONFIG_CONTROL3_POS], spi_edge_config_reg[`SPI2_SPI_EDGE_CONFIG_SPI_EDGE_CONFIG_CONTROL2_POS], spi_edge_config_reg[`SPI2_SPI_EDGE_CONFIG_SPI_EDGE_CONFIG_CONTROL1_POS], spi_edge_config_reg[`SPI2_SPI_EDGE_CONFIG_SPI_EDGE_CONFIG_CONTROL0_POS]};
assign spi_edge_config_config_o = {spi_edge_config_reg[`SPI2_SPI_EDGE_CONFIG_SPI_EDGE_CONFIG_CONFIG7_POS], spi_edge_config_reg[`SPI2_SPI_EDGE_CONFIG_SPI_EDGE_CONFIG_CONFIG6_POS], spi_edge_config_reg[`SPI2_SPI_EDGE_CONFIG_SPI_EDGE_CONFIG_CONFIG5_POS], spi_edge_config_reg[`SPI2_SPI_EDGE_CONFIG_SPI_EDGE_CONFIG_CONFIG4_POS], spi_edge_config_reg[`SPI2_SPI_EDGE_CONFIG_SPI_EDGE_CONFIG_CONFIG3_POS], spi_edge_config_reg[`SPI2_SPI_EDGE_CONFIG_SPI_EDGE_CONFIG_CONFIG2_POS], spi_edge_config_reg[`SPI2_SPI_EDGE_CONFIG_SPI_EDGE_CONFIG_CONFIG1_POS], spi_edge_config_reg[`SPI2_SPI_EDGE_CONFIG_SPI_EDGE_CONFIG_CONFIG0_POS]};
assign spi_edge_config_value_o = {spi_edge_config_reg[`SPI2_SPI_EDGE_CONFIG_SPI_EDGE_CONFIG_VALUE7_POS], spi_edge_config_reg[`SPI2_SPI_EDGE_CONFIG_SPI_EDGE_CONFIG_VALUE6_POS], spi_edge_config_reg[`SPI2_SPI_EDGE_CONFIG_SPI_EDGE_CONFIG_VALUE5_POS], spi_edge_config_reg[`SPI2_SPI_EDGE_CONFIG_SPI_EDGE_CONFIG_VALUE4_POS], spi_edge_config_reg[`SPI2_SPI_EDGE_CONFIG_SPI_EDGE_CONFIG_VALUE3_POS], spi_edge_config_reg[`SPI2_SPI_EDGE_CONFIG_SPI_EDGE_CONFIG_VALUE2_POS], spi_edge_config_reg[`SPI2_SPI_EDGE_CONFIG_SPI_EDGE_CONFIG_VALUE1_POS], spi_edge_config_reg[`SPI2_SPI_EDGE_CONFIG_SPI_EDGE_CONFIG_VALUE0_POS]};
assign spi_edge_config_flag_o = {spi_edge_config_reg[`SPI2_SPI_EDGE_CONFIG_SPI_EDGE_CONFIG_FLAG7_POS], spi_edge_config_reg[`SPI2_SPI_EDGE_CONFIG_SPI_EDGE_CONFIG_FLAG6_POS], spi_edge_config_reg[`SPI2_SPI_EDGE_CONFIG_SPI_EDGE_CONFIG_FLAG5_POS], spi_edge_config_reg[`SPI2_SPI_EDGE_CONFIG_SPI_EDGE_CONFIG_FLAG4_POS], spi_edge_config_reg[`SPI2_SPI_EDGE_CONFIG_SPI_EDGE_CONFIG_FLAG3_POS], spi_edge_config_reg[`SPI2_SPI_EDGE_CONFIG_SPI_EDGE_CONFIG_FLAG2_POS], spi_edge_config_reg[`SPI2_SPI_EDGE_CONFIG_SPI_EDGE_CONFIG_FLAG1_POS], spi_edge_config_reg[`SPI2_SPI_EDGE_CONFIG_SPI_EDGE_CONFIG_FLAG0_POS]};
assign spi_clock_gate_control_o = {spi_clock_gate_reg[`SPI2_SPI_CLOCK_GATE_SPI_CLOCK_GATE_CONTROL7_POS], spi_clock_gate_reg[`SPI2_SPI_CLOCK_GATE_SPI_CLOCK_GATE_CONTROL6_POS], spi_clock_gate_reg[`SPI2_SPI_CLOCK_GATE_SPI_CLOCK_GATE_CONTROL5_POS], spi_clock_gate_reg[`SPI2_SPI_CLOCK_GATE_SPI_CLOCK_GATE_CONTROL4_POS], spi_clock_gate_reg[`SPI2_SPI_CLOCK_GATE_SPI_CLOCK_GATE_CONTROL3_POS], spi_clock_gate_reg[`SPI2_SPI_CLOCK_GATE_SPI_CLOCK_GATE_CONTROL2_POS], spi_clock_gate_reg[`SPI2_SPI_CLOCK_GATE_SPI_CLOCK_GATE_CONTROL1_POS], spi_clock_gate_reg[`SPI2_SPI_CLOCK_GATE_SPI_CLOCK_GATE_CONTROL0_POS]};
assign spi_clock_gate_config_o = {spi_clock_gate_reg[`SPI2_SPI_CLOCK_GATE_SPI_CLOCK_GATE_CONFIG7_POS], spi_clock_gate_reg[`SPI2_SPI_CLOCK_GATE_SPI_CLOCK_GATE_CONFIG6_POS], spi_clock_gate_reg[`SPI2_SPI_CLOCK_GATE_SPI_CLOCK_GATE_CONFIG5_POS], spi_clock_gate_reg[`SPI2_SPI_CLOCK_GATE_SPI_CLOCK_GATE_CONFIG4_POS], spi_clock_gate_reg[`SPI2_SPI_CLOCK_GATE_SPI_CLOCK_GATE_CONFIG3_POS], spi_clock_gate_reg[`SPI2_SPI_CLOCK_GATE_SPI_CLOCK_GATE_CONFIG2_POS], spi_clock_gate_reg[`SPI2_SPI_CLOCK_GATE_SPI_CLOCK_GATE_CONFIG1_POS], spi_clock_gate_reg[`SPI2_SPI_CLOCK_GATE_SPI_CLOCK_GATE_CONFIG0_POS]};
assign spi_clock_gate_value_o = {spi_clock_gate_reg[`SPI2_SPI_CLOCK_GATE_SPI_CLOCK_GATE_VALUE7_POS], spi_clock_gate_reg[`SPI2_SPI_CLOCK_GATE_SPI_CLOCK_GATE_VALUE6_POS], spi_clock_gate_reg[`SPI2_SPI_CLOCK_GATE_SPI_CLOCK_GATE_VALUE5_POS], spi_clock_gate_reg[`SPI2_SPI_CLOCK_GATE_SPI_CLOCK_GATE_VALUE4_POS], spi_clock_gate_reg[`SPI2_SPI_CLOCK_GATE_SPI_CLOCK_GATE_VALUE3_POS], spi_clock_gate_reg[`SPI2_SPI_CLOCK_GATE_SPI_CLOCK_GATE_VALUE2_POS], spi_clock_gate_reg[`SPI2_SPI_CLOCK_GATE_SPI_CLOCK_GATE_VALUE1_POS], spi_clock_gate_reg[`SPI2_SPI_CLOCK_GATE_SPI_CLOCK_GATE_VALUE0_POS]};
assign spi_clock_gate_flag_o = {spi_clock_gate_reg[`SPI2_SPI_CLOCK_GATE_SPI_CLOCK_GATE_FLAG7_POS], spi_clock_gate_reg[`SPI2_SPI_CLOCK_GATE_SPI_CLOCK_GATE_FLAG6_POS], spi_clock_gate_reg[`SPI2_SPI_CLOCK_GATE_SPI_CLOCK_GATE_FLAG5_POS], spi_clock_gate_reg[`SPI2_SPI_CLOCK_GATE_SPI_CLOCK_GATE_FLAG4_POS], spi_clock_gate_reg[`SPI2_SPI_CLOCK_GATE_SPI_CLOCK_GATE_FLAG3_POS], spi_clock_gate_reg[`SPI2_SPI_CLOCK_GATE_SPI_CLOCK_GATE_FLAG2_POS], spi_clock_gate_reg[`SPI2_SPI_CLOCK_GATE_SPI_CLOCK_GATE_FLAG1_POS], spi_clock_gate_reg[`SPI2_SPI_CLOCK_GATE_SPI_CLOCK_GATE_FLAG0_POS]};
assign spi_power_control_control_o = {spi_power_control_reg[`SPI2_SPI_POWER_CONTROL_SPI_POWER_CONTROL_CONTROL7_POS], spi_power_control_reg[`SPI2_SPI_POWER_CONTROL_SPI_POWER_CONTROL_CONTROL6_POS], spi_power_control_reg[`SPI2_SPI_POWER_CONTROL_SPI_POWER_CONTROL_CONTROL5_POS], spi_power_control_reg[`SPI2_SPI_POWER_CONTROL_SPI_POWER_CONTROL_CONTROL4_POS], spi_power_control_reg[`SPI2_SPI_POWER_CONTROL_SPI_POWER_CONTROL_CONTROL3_POS], spi_power_control_reg[`SPI2_SPI_POWER_CONTROL_SPI_POWER_CONTROL_CONTROL2_POS], spi_power_control_reg[`SPI2_SPI_POWER_CONTROL_SPI_POWER_CONTROL_CONTROL1_POS], spi_power_control_reg[`SPI2_SPI_POWER_CONTROL_SPI_POWER_CONTROL_CONTROL0_POS]};
assign spi_power_control_config_o = {spi_power_control_reg[`SPI2_SPI_POWER_CONTROL_SPI_POWER_CONTROL_CONFIG7_POS], spi_power_control_reg[`SPI2_SPI_POWER_CONTROL_SPI_POWER_CONTROL_CONFIG6_POS], spi_power_control_reg[`SPI2_SPI_POWER_CONTROL_SPI_POWER_CONTROL_CONFIG5_POS], spi_power_control_reg[`SPI2_SPI_POWER_CONTROL_SPI_POWER_CONTROL_CONFIG4_POS], spi_power_control_reg[`SPI2_SPI_POWER_CONTROL_SPI_POWER_CONTROL_CONFIG3_POS], spi_power_control_reg[`SPI2_SPI_POWER_CONTROL_SPI_POWER_CONTROL_CONFIG2_POS], spi_power_control_reg[`SPI2_SPI_POWER_CONTROL_SPI_POWER_CONTROL_CONFIG1_POS], spi_power_control_reg[`SPI2_SPI_POWER_CONTROL_SPI_POWER_CONTROL_CONFIG0_POS]};
assign spi_power_control_value_o = {spi_power_control_reg[`SPI2_SPI_POWER_CONTROL_SPI_POWER_CONTROL_VALUE7_POS], spi_power_control_reg[`SPI2_SPI_POWER_CONTROL_SPI_POWER_CONTROL_VALUE6_POS], spi_power_control_reg[`SPI2_SPI_POWER_CONTROL_SPI_POWER_CONTROL_VALUE5_POS], spi_power_control_reg[`SPI2_SPI_POWER_CONTROL_SPI_POWER_CONTROL_VALUE4_POS], spi_power_control_reg[`SPI2_SPI_POWER_CONTROL_SPI_POWER_CONTROL_VALUE3_POS], spi_power_control_reg[`SPI2_SPI_POWER_CONTROL_SPI_POWER_CONTROL_VALUE2_POS], spi_power_control_reg[`SPI2_SPI_POWER_CONTROL_SPI_POWER_CONTROL_VALUE1_POS], spi_power_control_reg[`SPI2_SPI_POWER_CONTROL_SPI_POWER_CONTROL_VALUE0_POS]};
assign spi_power_control_flag_o = {spi_power_control_reg[`SPI2_SPI_POWER_CONTROL_SPI_POWER_CONTROL_FLAG7_POS], spi_power_control_reg[`SPI2_SPI_POWER_CONTROL_SPI_POWER_CONTROL_FLAG6_POS], spi_power_control_reg[`SPI2_SPI_POWER_CONTROL_SPI_POWER_CONTROL_FLAG5_POS], spi_power_control_reg[`SPI2_SPI_POWER_CONTROL_SPI_POWER_CONTROL_FLAG4_POS], spi_power_control_reg[`SPI2_SPI_POWER_CONTROL_SPI_POWER_CONTROL_FLAG3_POS], spi_power_control_reg[`SPI2_SPI_POWER_CONTROL_SPI_POWER_CONTROL_FLAG2_POS], spi_power_control_reg[`SPI2_SPI_POWER_CONTROL_SPI_POWER_CONTROL_FLAG1_POS], spi_power_control_reg[`SPI2_SPI_POWER_CONTROL_SPI_POWER_CONTROL_FLAG0_POS]};
assign spi_power_status_control_o = {spi_power_status_reg[`SPI2_SPI_POWER_STATUS_SPI_POWER_STATUS_CONTROL7_POS], spi_power_status_reg[`SPI2_SPI_POWER_STATUS_SPI_POWER_STATUS_CONTROL6_POS], spi_power_status_reg[`SPI2_SPI_POWER_STATUS_SPI_POWER_STATUS_CONTROL5_POS], spi_power_status_reg[`SPI2_SPI_POWER_STATUS_SPI_POWER_STATUS_CONTROL4_POS], spi_power_status_reg[`SPI2_SPI_POWER_STATUS_SPI_POWER_STATUS_CONTROL3_POS], spi_power_status_reg[`SPI2_SPI_POWER_STATUS_SPI_POWER_STATUS_CONTROL2_POS], spi_power_status_reg[`SPI2_SPI_POWER_STATUS_SPI_POWER_STATUS_CONTROL1_POS], spi_power_status_reg[`SPI2_SPI_POWER_STATUS_SPI_POWER_STATUS_CONTROL0_POS]};
assign spi_power_status_config_o = {spi_power_status_reg[`SPI2_SPI_POWER_STATUS_SPI_POWER_STATUS_CONFIG7_POS], spi_power_status_reg[`SPI2_SPI_POWER_STATUS_SPI_POWER_STATUS_CONFIG6_POS], spi_power_status_reg[`SPI2_SPI_POWER_STATUS_SPI_POWER_STATUS_CONFIG5_POS], spi_power_status_reg[`SPI2_SPI_POWER_STATUS_SPI_POWER_STATUS_CONFIG4_POS], spi_power_status_reg[`SPI2_SPI_POWER_STATUS_SPI_POWER_STATUS_CONFIG3_POS], spi_power_status_reg[`SPI2_SPI_POWER_STATUS_SPI_POWER_STATUS_CONFIG2_POS], spi_power_status_reg[`SPI2_SPI_POWER_STATUS_SPI_POWER_STATUS_CONFIG1_POS], spi_power_status_reg[`SPI2_SPI_POWER_STATUS_SPI_POWER_STATUS_CONFIG0_POS]};
assign spi_power_status_value_o = {spi_power_status_reg[`SPI2_SPI_POWER_STATUS_SPI_POWER_STATUS_VALUE7_POS], spi_power_status_reg[`SPI2_SPI_POWER_STATUS_SPI_POWER_STATUS_VALUE6_POS], spi_power_status_reg[`SPI2_SPI_POWER_STATUS_SPI_POWER_STATUS_VALUE5_POS], spi_power_status_reg[`SPI2_SPI_POWER_STATUS_SPI_POWER_STATUS_VALUE4_POS], spi_power_status_reg[`SPI2_SPI_POWER_STATUS_SPI_POWER_STATUS_VALUE3_POS], spi_power_status_reg[`SPI2_SPI_POWER_STATUS_SPI_POWER_STATUS_VALUE2_POS], spi_power_status_reg[`SPI2_SPI_POWER_STATUS_SPI_POWER_STATUS_VALUE1_POS], spi_power_status_reg[`SPI2_SPI_POWER_STATUS_SPI_POWER_STATUS_VALUE0_POS]};
assign spi_power_status_flag_o = {spi_power_status_reg[`SPI2_SPI_POWER_STATUS_SPI_POWER_STATUS_FLAG7_POS], spi_power_status_reg[`SPI2_SPI_POWER_STATUS_SPI_POWER_STATUS_FLAG6_POS], spi_power_status_reg[`SPI2_SPI_POWER_STATUS_SPI_POWER_STATUS_FLAG5_POS], spi_power_status_reg[`SPI2_SPI_POWER_STATUS_SPI_POWER_STATUS_FLAG4_POS], spi_power_status_reg[`SPI2_SPI_POWER_STATUS_SPI_POWER_STATUS_FLAG3_POS], spi_power_status_reg[`SPI2_SPI_POWER_STATUS_SPI_POWER_STATUS_FLAG2_POS], spi_power_status_reg[`SPI2_SPI_POWER_STATUS_SPI_POWER_STATUS_FLAG1_POS], spi_power_status_reg[`SPI2_SPI_POWER_STATUS_SPI_POWER_STATUS_FLAG0_POS]};
assign spi_reset_control_control_o = {spi_reset_control_reg[`SPI2_SPI_RESET_CONTROL_SPI_RESET_CONTROL_CONTROL7_POS], spi_reset_control_reg[`SPI2_SPI_RESET_CONTROL_SPI_RESET_CONTROL_CONTROL6_POS], spi_reset_control_reg[`SPI2_SPI_RESET_CONTROL_SPI_RESET_CONTROL_CONTROL5_POS], spi_reset_control_reg[`SPI2_SPI_RESET_CONTROL_SPI_RESET_CONTROL_CONTROL4_POS], spi_reset_control_reg[`SPI2_SPI_RESET_CONTROL_SPI_RESET_CONTROL_CONTROL3_POS], spi_reset_control_reg[`SPI2_SPI_RESET_CONTROL_SPI_RESET_CONTROL_CONTROL2_POS], spi_reset_control_reg[`SPI2_SPI_RESET_CONTROL_SPI_RESET_CONTROL_CONTROL1_POS], spi_reset_control_reg[`SPI2_SPI_RESET_CONTROL_SPI_RESET_CONTROL_CONTROL0_POS]};
assign spi_reset_control_config_o = {spi_reset_control_reg[`SPI2_SPI_RESET_CONTROL_SPI_RESET_CONTROL_CONFIG7_POS], spi_reset_control_reg[`SPI2_SPI_RESET_CONTROL_SPI_RESET_CONTROL_CONFIG6_POS], spi_reset_control_reg[`SPI2_SPI_RESET_CONTROL_SPI_RESET_CONTROL_CONFIG5_POS], spi_reset_control_reg[`SPI2_SPI_RESET_CONTROL_SPI_RESET_CONTROL_CONFIG4_POS], spi_reset_control_reg[`SPI2_SPI_RESET_CONTROL_SPI_RESET_CONTROL_CONFIG3_POS], spi_reset_control_reg[`SPI2_SPI_RESET_CONTROL_SPI_RESET_CONTROL_CONFIG2_POS], spi_reset_control_reg[`SPI2_SPI_RESET_CONTROL_SPI_RESET_CONTROL_CONFIG1_POS], spi_reset_control_reg[`SPI2_SPI_RESET_CONTROL_SPI_RESET_CONTROL_CONFIG0_POS]};
assign spi_reset_control_value_o = {spi_reset_control_reg[`SPI2_SPI_RESET_CONTROL_SPI_RESET_CONTROL_VALUE7_POS], spi_reset_control_reg[`SPI2_SPI_RESET_CONTROL_SPI_RESET_CONTROL_VALUE6_POS], spi_reset_control_reg[`SPI2_SPI_RESET_CONTROL_SPI_RESET_CONTROL_VALUE5_POS], spi_reset_control_reg[`SPI2_SPI_RESET_CONTROL_SPI_RESET_CONTROL_VALUE4_POS], spi_reset_control_reg[`SPI2_SPI_RESET_CONTROL_SPI_RESET_CONTROL_VALUE3_POS], spi_reset_control_reg[`SPI2_SPI_RESET_CONTROL_SPI_RESET_CONTROL_VALUE2_POS], spi_reset_control_reg[`SPI2_SPI_RESET_CONTROL_SPI_RESET_CONTROL_VALUE1_POS], spi_reset_control_reg[`SPI2_SPI_RESET_CONTROL_SPI_RESET_CONTROL_VALUE0_POS]};
assign spi_reset_control_flag_o = {spi_reset_control_reg[`SPI2_SPI_RESET_CONTROL_SPI_RESET_CONTROL_FLAG7_POS], spi_reset_control_reg[`SPI2_SPI_RESET_CONTROL_SPI_RESET_CONTROL_FLAG6_POS], spi_reset_control_reg[`SPI2_SPI_RESET_CONTROL_SPI_RESET_CONTROL_FLAG5_POS], spi_reset_control_reg[`SPI2_SPI_RESET_CONTROL_SPI_RESET_CONTROL_FLAG4_POS], spi_reset_control_reg[`SPI2_SPI_RESET_CONTROL_SPI_RESET_CONTROL_FLAG3_POS], spi_reset_control_reg[`SPI2_SPI_RESET_CONTROL_SPI_RESET_CONTROL_FLAG2_POS], spi_reset_control_reg[`SPI2_SPI_RESET_CONTROL_SPI_RESET_CONTROL_FLAG1_POS], spi_reset_control_reg[`SPI2_SPI_RESET_CONTROL_SPI_RESET_CONTROL_FLAG0_POS]};
assign spi_reset_status_control_o = {spi_reset_status_reg[`SPI2_SPI_RESET_STATUS_SPI_RESET_STATUS_CONTROL7_POS], spi_reset_status_reg[`SPI2_SPI_RESET_STATUS_SPI_RESET_STATUS_CONTROL6_POS], spi_reset_status_reg[`SPI2_SPI_RESET_STATUS_SPI_RESET_STATUS_CONTROL5_POS], spi_reset_status_reg[`SPI2_SPI_RESET_STATUS_SPI_RESET_STATUS_CONTROL4_POS], spi_reset_status_reg[`SPI2_SPI_RESET_STATUS_SPI_RESET_STATUS_CONTROL3_POS], spi_reset_status_reg[`SPI2_SPI_RESET_STATUS_SPI_RESET_STATUS_CONTROL2_POS], spi_reset_status_reg[`SPI2_SPI_RESET_STATUS_SPI_RESET_STATUS_CONTROL1_POS], spi_reset_status_reg[`SPI2_SPI_RESET_STATUS_SPI_RESET_STATUS_CONTROL0_POS]};
assign spi_reset_status_config_o = {spi_reset_status_reg[`SPI2_SPI_RESET_STATUS_SPI_RESET_STATUS_CONFIG7_POS], spi_reset_status_reg[`SPI2_SPI_RESET_STATUS_SPI_RESET_STATUS_CONFIG6_POS], spi_reset_status_reg[`SPI2_SPI_RESET_STATUS_SPI_RESET_STATUS_CONFIG5_POS], spi_reset_status_reg[`SPI2_SPI_RESET_STATUS_SPI_RESET_STATUS_CONFIG4_POS], spi_reset_status_reg[`SPI2_SPI_RESET_STATUS_SPI_RESET_STATUS_CONFIG3_POS], spi_reset_status_reg[`SPI2_SPI_RESET_STATUS_SPI_RESET_STATUS_CONFIG2_POS], spi_reset_status_reg[`SPI2_SPI_RESET_STATUS_SPI_RESET_STATUS_CONFIG1_POS], spi_reset_status_reg[`SPI2_SPI_RESET_STATUS_SPI_RESET_STATUS_CONFIG0_POS]};
assign spi_reset_status_value_o = {spi_reset_status_reg[`SPI2_SPI_RESET_STATUS_SPI_RESET_STATUS_VALUE7_POS], spi_reset_status_reg[`SPI2_SPI_RESET_STATUS_SPI_RESET_STATUS_VALUE6_POS], spi_reset_status_reg[`SPI2_SPI_RESET_STATUS_SPI_RESET_STATUS_VALUE5_POS], spi_reset_status_reg[`SPI2_SPI_RESET_STATUS_SPI_RESET_STATUS_VALUE4_POS], spi_reset_status_reg[`SPI2_SPI_RESET_STATUS_SPI_RESET_STATUS_VALUE3_POS], spi_reset_status_reg[`SPI2_SPI_RESET_STATUS_SPI_RESET_STATUS_VALUE2_POS], spi_reset_status_reg[`SPI2_SPI_RESET_STATUS_SPI_RESET_STATUS_VALUE1_POS], spi_reset_status_reg[`SPI2_SPI_RESET_STATUS_SPI_RESET_STATUS_VALUE0_POS]};
assign spi_reset_status_flag_o = {spi_reset_status_reg[`SPI2_SPI_RESET_STATUS_SPI_RESET_STATUS_FLAG7_POS], spi_reset_status_reg[`SPI2_SPI_RESET_STATUS_SPI_RESET_STATUS_FLAG6_POS], spi_reset_status_reg[`SPI2_SPI_RESET_STATUS_SPI_RESET_STATUS_FLAG5_POS], spi_reset_status_reg[`SPI2_SPI_RESET_STATUS_SPI_RESET_STATUS_FLAG4_POS], spi_reset_status_reg[`SPI2_SPI_RESET_STATUS_SPI_RESET_STATUS_FLAG3_POS], spi_reset_status_reg[`SPI2_SPI_RESET_STATUS_SPI_RESET_STATUS_FLAG2_POS], spi_reset_status_reg[`SPI2_SPI_RESET_STATUS_SPI_RESET_STATUS_FLAG1_POS], spi_reset_status_reg[`SPI2_SPI_RESET_STATUS_SPI_RESET_STATUS_FLAG0_POS]};
assign spi_sleep_config_control_o = {spi_sleep_config_reg[`SPI2_SPI_SLEEP_CONFIG_SPI_SLEEP_CONFIG_CONTROL7_POS], spi_sleep_config_reg[`SPI2_SPI_SLEEP_CONFIG_SPI_SLEEP_CONFIG_CONTROL6_POS], spi_sleep_config_reg[`SPI2_SPI_SLEEP_CONFIG_SPI_SLEEP_CONFIG_CONTROL5_POS], spi_sleep_config_reg[`SPI2_SPI_SLEEP_CONFIG_SPI_SLEEP_CONFIG_CONTROL4_POS], spi_sleep_config_reg[`SPI2_SPI_SLEEP_CONFIG_SPI_SLEEP_CONFIG_CONTROL3_POS], spi_sleep_config_reg[`SPI2_SPI_SLEEP_CONFIG_SPI_SLEEP_CONFIG_CONTROL2_POS], spi_sleep_config_reg[`SPI2_SPI_SLEEP_CONFIG_SPI_SLEEP_CONFIG_CONTROL1_POS], spi_sleep_config_reg[`SPI2_SPI_SLEEP_CONFIG_SPI_SLEEP_CONFIG_CONTROL0_POS]};
assign spi_sleep_config_config_o = {spi_sleep_config_reg[`SPI2_SPI_SLEEP_CONFIG_SPI_SLEEP_CONFIG_CONFIG7_POS], spi_sleep_config_reg[`SPI2_SPI_SLEEP_CONFIG_SPI_SLEEP_CONFIG_CONFIG6_POS], spi_sleep_config_reg[`SPI2_SPI_SLEEP_CONFIG_SPI_SLEEP_CONFIG_CONFIG5_POS], spi_sleep_config_reg[`SPI2_SPI_SLEEP_CONFIG_SPI_SLEEP_CONFIG_CONFIG4_POS], spi_sleep_config_reg[`SPI2_SPI_SLEEP_CONFIG_SPI_SLEEP_CONFIG_CONFIG3_POS], spi_sleep_config_reg[`SPI2_SPI_SLEEP_CONFIG_SPI_SLEEP_CONFIG_CONFIG2_POS], spi_sleep_config_reg[`SPI2_SPI_SLEEP_CONFIG_SPI_SLEEP_CONFIG_CONFIG1_POS], spi_sleep_config_reg[`SPI2_SPI_SLEEP_CONFIG_SPI_SLEEP_CONFIG_CONFIG0_POS]};
assign spi_sleep_config_value_o = {spi_sleep_config_reg[`SPI2_SPI_SLEEP_CONFIG_SPI_SLEEP_CONFIG_VALUE7_POS], spi_sleep_config_reg[`SPI2_SPI_SLEEP_CONFIG_SPI_SLEEP_CONFIG_VALUE6_POS], spi_sleep_config_reg[`SPI2_SPI_SLEEP_CONFIG_SPI_SLEEP_CONFIG_VALUE5_POS], spi_sleep_config_reg[`SPI2_SPI_SLEEP_CONFIG_SPI_SLEEP_CONFIG_VALUE4_POS], spi_sleep_config_reg[`SPI2_SPI_SLEEP_CONFIG_SPI_SLEEP_CONFIG_VALUE3_POS], spi_sleep_config_reg[`SPI2_SPI_SLEEP_CONFIG_SPI_SLEEP_CONFIG_VALUE2_POS], spi_sleep_config_reg[`SPI2_SPI_SLEEP_CONFIG_SPI_SLEEP_CONFIG_VALUE1_POS], spi_sleep_config_reg[`SPI2_SPI_SLEEP_CONFIG_SPI_SLEEP_CONFIG_VALUE0_POS]};
assign spi_sleep_config_flag_o = {spi_sleep_config_reg[`SPI2_SPI_SLEEP_CONFIG_SPI_SLEEP_CONFIG_FLAG7_POS], spi_sleep_config_reg[`SPI2_SPI_SLEEP_CONFIG_SPI_SLEEP_CONFIG_FLAG6_POS], spi_sleep_config_reg[`SPI2_SPI_SLEEP_CONFIG_SPI_SLEEP_CONFIG_FLAG5_POS], spi_sleep_config_reg[`SPI2_SPI_SLEEP_CONFIG_SPI_SLEEP_CONFIG_FLAG4_POS], spi_sleep_config_reg[`SPI2_SPI_SLEEP_CONFIG_SPI_SLEEP_CONFIG_FLAG3_POS], spi_sleep_config_reg[`SPI2_SPI_SLEEP_CONFIG_SPI_SLEEP_CONFIG_FLAG2_POS], spi_sleep_config_reg[`SPI2_SPI_SLEEP_CONFIG_SPI_SLEEP_CONFIG_FLAG1_POS], spi_sleep_config_reg[`SPI2_SPI_SLEEP_CONFIG_SPI_SLEEP_CONFIG_FLAG0_POS]};
assign spi_wake_status_control_o = {spi_wake_status_reg[`SPI2_SPI_WAKE_STATUS_SPI_WAKE_STATUS_CONTROL7_POS], spi_wake_status_reg[`SPI2_SPI_WAKE_STATUS_SPI_WAKE_STATUS_CONTROL6_POS], spi_wake_status_reg[`SPI2_SPI_WAKE_STATUS_SPI_WAKE_STATUS_CONTROL5_POS], spi_wake_status_reg[`SPI2_SPI_WAKE_STATUS_SPI_WAKE_STATUS_CONTROL4_POS], spi_wake_status_reg[`SPI2_SPI_WAKE_STATUS_SPI_WAKE_STATUS_CONTROL3_POS], spi_wake_status_reg[`SPI2_SPI_WAKE_STATUS_SPI_WAKE_STATUS_CONTROL2_POS], spi_wake_status_reg[`SPI2_SPI_WAKE_STATUS_SPI_WAKE_STATUS_CONTROL1_POS], spi_wake_status_reg[`SPI2_SPI_WAKE_STATUS_SPI_WAKE_STATUS_CONTROL0_POS]};
assign spi_wake_status_config_o = {spi_wake_status_reg[`SPI2_SPI_WAKE_STATUS_SPI_WAKE_STATUS_CONFIG7_POS], spi_wake_status_reg[`SPI2_SPI_WAKE_STATUS_SPI_WAKE_STATUS_CONFIG6_POS], spi_wake_status_reg[`SPI2_SPI_WAKE_STATUS_SPI_WAKE_STATUS_CONFIG5_POS], spi_wake_status_reg[`SPI2_SPI_WAKE_STATUS_SPI_WAKE_STATUS_CONFIG4_POS], spi_wake_status_reg[`SPI2_SPI_WAKE_STATUS_SPI_WAKE_STATUS_CONFIG3_POS], spi_wake_status_reg[`SPI2_SPI_WAKE_STATUS_SPI_WAKE_STATUS_CONFIG2_POS], spi_wake_status_reg[`SPI2_SPI_WAKE_STATUS_SPI_WAKE_STATUS_CONFIG1_POS], spi_wake_status_reg[`SPI2_SPI_WAKE_STATUS_SPI_WAKE_STATUS_CONFIG0_POS]};
assign spi_wake_status_value_o = {spi_wake_status_reg[`SPI2_SPI_WAKE_STATUS_SPI_WAKE_STATUS_VALUE7_POS], spi_wake_status_reg[`SPI2_SPI_WAKE_STATUS_SPI_WAKE_STATUS_VALUE6_POS], spi_wake_status_reg[`SPI2_SPI_WAKE_STATUS_SPI_WAKE_STATUS_VALUE5_POS], spi_wake_status_reg[`SPI2_SPI_WAKE_STATUS_SPI_WAKE_STATUS_VALUE4_POS], spi_wake_status_reg[`SPI2_SPI_WAKE_STATUS_SPI_WAKE_STATUS_VALUE3_POS], spi_wake_status_reg[`SPI2_SPI_WAKE_STATUS_SPI_WAKE_STATUS_VALUE2_POS], spi_wake_status_reg[`SPI2_SPI_WAKE_STATUS_SPI_WAKE_STATUS_VALUE1_POS], spi_wake_status_reg[`SPI2_SPI_WAKE_STATUS_SPI_WAKE_STATUS_VALUE0_POS]};
assign spi_wake_status_flag_o = {spi_wake_status_reg[`SPI2_SPI_WAKE_STATUS_SPI_WAKE_STATUS_FLAG7_POS], spi_wake_status_reg[`SPI2_SPI_WAKE_STATUS_SPI_WAKE_STATUS_FLAG6_POS], spi_wake_status_reg[`SPI2_SPI_WAKE_STATUS_SPI_WAKE_STATUS_FLAG5_POS], spi_wake_status_reg[`SPI2_SPI_WAKE_STATUS_SPI_WAKE_STATUS_FLAG4_POS], spi_wake_status_reg[`SPI2_SPI_WAKE_STATUS_SPI_WAKE_STATUS_FLAG3_POS], spi_wake_status_reg[`SPI2_SPI_WAKE_STATUS_SPI_WAKE_STATUS_FLAG2_POS], spi_wake_status_reg[`SPI2_SPI_WAKE_STATUS_SPI_WAKE_STATUS_FLAG1_POS], spi_wake_status_reg[`SPI2_SPI_WAKE_STATUS_SPI_WAKE_STATUS_FLAG0_POS]};
assign spi_wait_config_control_o = {spi_wait_config_reg[`SPI2_SPI_WAIT_CONFIG_SPI_WAIT_CONFIG_CONTROL7_POS], spi_wait_config_reg[`SPI2_SPI_WAIT_CONFIG_SPI_WAIT_CONFIG_CONTROL6_POS], spi_wait_config_reg[`SPI2_SPI_WAIT_CONFIG_SPI_WAIT_CONFIG_CONTROL5_POS], spi_wait_config_reg[`SPI2_SPI_WAIT_CONFIG_SPI_WAIT_CONFIG_CONTROL4_POS], spi_wait_config_reg[`SPI2_SPI_WAIT_CONFIG_SPI_WAIT_CONFIG_CONTROL3_POS], spi_wait_config_reg[`SPI2_SPI_WAIT_CONFIG_SPI_WAIT_CONFIG_CONTROL2_POS], spi_wait_config_reg[`SPI2_SPI_WAIT_CONFIG_SPI_WAIT_CONFIG_CONTROL1_POS], spi_wait_config_reg[`SPI2_SPI_WAIT_CONFIG_SPI_WAIT_CONFIG_CONTROL0_POS]};
assign spi_wait_config_config_o = {spi_wait_config_reg[`SPI2_SPI_WAIT_CONFIG_SPI_WAIT_CONFIG_CONFIG7_POS], spi_wait_config_reg[`SPI2_SPI_WAIT_CONFIG_SPI_WAIT_CONFIG_CONFIG6_POS], spi_wait_config_reg[`SPI2_SPI_WAIT_CONFIG_SPI_WAIT_CONFIG_CONFIG5_POS], spi_wait_config_reg[`SPI2_SPI_WAIT_CONFIG_SPI_WAIT_CONFIG_CONFIG4_POS], spi_wait_config_reg[`SPI2_SPI_WAIT_CONFIG_SPI_WAIT_CONFIG_CONFIG3_POS], spi_wait_config_reg[`SPI2_SPI_WAIT_CONFIG_SPI_WAIT_CONFIG_CONFIG2_POS], spi_wait_config_reg[`SPI2_SPI_WAIT_CONFIG_SPI_WAIT_CONFIG_CONFIG1_POS], spi_wait_config_reg[`SPI2_SPI_WAIT_CONFIG_SPI_WAIT_CONFIG_CONFIG0_POS]};
assign spi_wait_config_value_o = {spi_wait_config_reg[`SPI2_SPI_WAIT_CONFIG_SPI_WAIT_CONFIG_VALUE7_POS], spi_wait_config_reg[`SPI2_SPI_WAIT_CONFIG_SPI_WAIT_CONFIG_VALUE6_POS], spi_wait_config_reg[`SPI2_SPI_WAIT_CONFIG_SPI_WAIT_CONFIG_VALUE5_POS], spi_wait_config_reg[`SPI2_SPI_WAIT_CONFIG_SPI_WAIT_CONFIG_VALUE4_POS], spi_wait_config_reg[`SPI2_SPI_WAIT_CONFIG_SPI_WAIT_CONFIG_VALUE3_POS], spi_wait_config_reg[`SPI2_SPI_WAIT_CONFIG_SPI_WAIT_CONFIG_VALUE2_POS], spi_wait_config_reg[`SPI2_SPI_WAIT_CONFIG_SPI_WAIT_CONFIG_VALUE1_POS], spi_wait_config_reg[`SPI2_SPI_WAIT_CONFIG_SPI_WAIT_CONFIG_VALUE0_POS]};
assign spi_wait_config_flag_o = {spi_wait_config_reg[`SPI2_SPI_WAIT_CONFIG_SPI_WAIT_CONFIG_FLAG7_POS], spi_wait_config_reg[`SPI2_SPI_WAIT_CONFIG_SPI_WAIT_CONFIG_FLAG6_POS], spi_wait_config_reg[`SPI2_SPI_WAIT_CONFIG_SPI_WAIT_CONFIG_FLAG5_POS], spi_wait_config_reg[`SPI2_SPI_WAIT_CONFIG_SPI_WAIT_CONFIG_FLAG4_POS], spi_wait_config_reg[`SPI2_SPI_WAIT_CONFIG_SPI_WAIT_CONFIG_FLAG3_POS], spi_wait_config_reg[`SPI2_SPI_WAIT_CONFIG_SPI_WAIT_CONFIG_FLAG2_POS], spi_wait_config_reg[`SPI2_SPI_WAIT_CONFIG_SPI_WAIT_CONFIG_FLAG1_POS], spi_wait_config_reg[`SPI2_SPI_WAIT_CONFIG_SPI_WAIT_CONFIG_FLAG0_POS]};
assign spi_wait_status_control_o = {spi_wait_status_reg[`SPI2_SPI_WAIT_STATUS_SPI_WAIT_STATUS_CONTROL7_POS], spi_wait_status_reg[`SPI2_SPI_WAIT_STATUS_SPI_WAIT_STATUS_CONTROL6_POS], spi_wait_status_reg[`SPI2_SPI_WAIT_STATUS_SPI_WAIT_STATUS_CONTROL5_POS], spi_wait_status_reg[`SPI2_SPI_WAIT_STATUS_SPI_WAIT_STATUS_CONTROL4_POS], spi_wait_status_reg[`SPI2_SPI_WAIT_STATUS_SPI_WAIT_STATUS_CONTROL3_POS], spi_wait_status_reg[`SPI2_SPI_WAIT_STATUS_SPI_WAIT_STATUS_CONTROL2_POS], spi_wait_status_reg[`SPI2_SPI_WAIT_STATUS_SPI_WAIT_STATUS_CONTROL1_POS], spi_wait_status_reg[`SPI2_SPI_WAIT_STATUS_SPI_WAIT_STATUS_CONTROL0_POS]};
assign spi_wait_status_config_o = {spi_wait_status_reg[`SPI2_SPI_WAIT_STATUS_SPI_WAIT_STATUS_CONFIG7_POS], spi_wait_status_reg[`SPI2_SPI_WAIT_STATUS_SPI_WAIT_STATUS_CONFIG6_POS], spi_wait_status_reg[`SPI2_SPI_WAIT_STATUS_SPI_WAIT_STATUS_CONFIG5_POS], spi_wait_status_reg[`SPI2_SPI_WAIT_STATUS_SPI_WAIT_STATUS_CONFIG4_POS], spi_wait_status_reg[`SPI2_SPI_WAIT_STATUS_SPI_WAIT_STATUS_CONFIG3_POS], spi_wait_status_reg[`SPI2_SPI_WAIT_STATUS_SPI_WAIT_STATUS_CONFIG2_POS], spi_wait_status_reg[`SPI2_SPI_WAIT_STATUS_SPI_WAIT_STATUS_CONFIG1_POS], spi_wait_status_reg[`SPI2_SPI_WAIT_STATUS_SPI_WAIT_STATUS_CONFIG0_POS]};
assign spi_wait_status_value_o = {spi_wait_status_reg[`SPI2_SPI_WAIT_STATUS_SPI_WAIT_STATUS_VALUE7_POS], spi_wait_status_reg[`SPI2_SPI_WAIT_STATUS_SPI_WAIT_STATUS_VALUE6_POS], spi_wait_status_reg[`SPI2_SPI_WAIT_STATUS_SPI_WAIT_STATUS_VALUE5_POS], spi_wait_status_reg[`SPI2_SPI_WAIT_STATUS_SPI_WAIT_STATUS_VALUE4_POS], spi_wait_status_reg[`SPI2_SPI_WAIT_STATUS_SPI_WAIT_STATUS_VALUE3_POS], spi_wait_status_reg[`SPI2_SPI_WAIT_STATUS_SPI_WAIT_STATUS_VALUE2_POS], spi_wait_status_reg[`SPI2_SPI_WAIT_STATUS_SPI_WAIT_STATUS_VALUE1_POS], spi_wait_status_reg[`SPI2_SPI_WAIT_STATUS_SPI_WAIT_STATUS_VALUE0_POS]};
assign spi_wait_status_flag_o = {spi_wait_status_reg[`SPI2_SPI_WAIT_STATUS_SPI_WAIT_STATUS_FLAG7_POS], spi_wait_status_reg[`SPI2_SPI_WAIT_STATUS_SPI_WAIT_STATUS_FLAG6_POS], spi_wait_status_reg[`SPI2_SPI_WAIT_STATUS_SPI_WAIT_STATUS_FLAG5_POS], spi_wait_status_reg[`SPI2_SPI_WAIT_STATUS_SPI_WAIT_STATUS_FLAG4_POS], spi_wait_status_reg[`SPI2_SPI_WAIT_STATUS_SPI_WAIT_STATUS_FLAG3_POS], spi_wait_status_reg[`SPI2_SPI_WAIT_STATUS_SPI_WAIT_STATUS_FLAG2_POS], spi_wait_status_reg[`SPI2_SPI_WAIT_STATUS_SPI_WAIT_STATUS_FLAG1_POS], spi_wait_status_reg[`SPI2_SPI_WAIT_STATUS_SPI_WAIT_STATUS_FLAG0_POS]};
assign spi_frame_count_control_o = {spi_frame_count_reg[`SPI2_SPI_FRAME_COUNT_SPI_FRAME_COUNT_CONTROL7_POS], spi_frame_count_reg[`SPI2_SPI_FRAME_COUNT_SPI_FRAME_COUNT_CONTROL6_POS], spi_frame_count_reg[`SPI2_SPI_FRAME_COUNT_SPI_FRAME_COUNT_CONTROL5_POS], spi_frame_count_reg[`SPI2_SPI_FRAME_COUNT_SPI_FRAME_COUNT_CONTROL4_POS], spi_frame_count_reg[`SPI2_SPI_FRAME_COUNT_SPI_FRAME_COUNT_CONTROL3_POS], spi_frame_count_reg[`SPI2_SPI_FRAME_COUNT_SPI_FRAME_COUNT_CONTROL2_POS], spi_frame_count_reg[`SPI2_SPI_FRAME_COUNT_SPI_FRAME_COUNT_CONTROL1_POS], spi_frame_count_reg[`SPI2_SPI_FRAME_COUNT_SPI_FRAME_COUNT_CONTROL0_POS]};
assign spi_frame_count_config_o = {spi_frame_count_reg[`SPI2_SPI_FRAME_COUNT_SPI_FRAME_COUNT_CONFIG7_POS], spi_frame_count_reg[`SPI2_SPI_FRAME_COUNT_SPI_FRAME_COUNT_CONFIG6_POS], spi_frame_count_reg[`SPI2_SPI_FRAME_COUNT_SPI_FRAME_COUNT_CONFIG5_POS], spi_frame_count_reg[`SPI2_SPI_FRAME_COUNT_SPI_FRAME_COUNT_CONFIG4_POS], spi_frame_count_reg[`SPI2_SPI_FRAME_COUNT_SPI_FRAME_COUNT_CONFIG3_POS], spi_frame_count_reg[`SPI2_SPI_FRAME_COUNT_SPI_FRAME_COUNT_CONFIG2_POS], spi_frame_count_reg[`SPI2_SPI_FRAME_COUNT_SPI_FRAME_COUNT_CONFIG1_POS], spi_frame_count_reg[`SPI2_SPI_FRAME_COUNT_SPI_FRAME_COUNT_CONFIG0_POS]};
assign spi_frame_count_value_o = {spi_frame_count_reg[`SPI2_SPI_FRAME_COUNT_SPI_FRAME_COUNT_VALUE7_POS], spi_frame_count_reg[`SPI2_SPI_FRAME_COUNT_SPI_FRAME_COUNT_VALUE6_POS], spi_frame_count_reg[`SPI2_SPI_FRAME_COUNT_SPI_FRAME_COUNT_VALUE5_POS], spi_frame_count_reg[`SPI2_SPI_FRAME_COUNT_SPI_FRAME_COUNT_VALUE4_POS], spi_frame_count_reg[`SPI2_SPI_FRAME_COUNT_SPI_FRAME_COUNT_VALUE3_POS], spi_frame_count_reg[`SPI2_SPI_FRAME_COUNT_SPI_FRAME_COUNT_VALUE2_POS], spi_frame_count_reg[`SPI2_SPI_FRAME_COUNT_SPI_FRAME_COUNT_VALUE1_POS], spi_frame_count_reg[`SPI2_SPI_FRAME_COUNT_SPI_FRAME_COUNT_VALUE0_POS]};
assign spi_frame_count_flag_o = {spi_frame_count_reg[`SPI2_SPI_FRAME_COUNT_SPI_FRAME_COUNT_FLAG7_POS], spi_frame_count_reg[`SPI2_SPI_FRAME_COUNT_SPI_FRAME_COUNT_FLAG6_POS], spi_frame_count_reg[`SPI2_SPI_FRAME_COUNT_SPI_FRAME_COUNT_FLAG5_POS], spi_frame_count_reg[`SPI2_SPI_FRAME_COUNT_SPI_FRAME_COUNT_FLAG4_POS], spi_frame_count_reg[`SPI2_SPI_FRAME_COUNT_SPI_FRAME_COUNT_FLAG3_POS], spi_frame_count_reg[`SPI2_SPI_FRAME_COUNT_SPI_FRAME_COUNT_FLAG2_POS], spi_frame_count_reg[`SPI2_SPI_FRAME_COUNT_SPI_FRAME_COUNT_FLAG1_POS], spi_frame_count_reg[`SPI2_SPI_FRAME_COUNT_SPI_FRAME_COUNT_FLAG0_POS]};
assign spi_byte_count_control_o = {spi_byte_count_reg[`SPI2_SPI_BYTE_COUNT_SPI_BYTE_COUNT_CONTROL7_POS], spi_byte_count_reg[`SPI2_SPI_BYTE_COUNT_SPI_BYTE_COUNT_CONTROL6_POS], spi_byte_count_reg[`SPI2_SPI_BYTE_COUNT_SPI_BYTE_COUNT_CONTROL5_POS], spi_byte_count_reg[`SPI2_SPI_BYTE_COUNT_SPI_BYTE_COUNT_CONTROL4_POS], spi_byte_count_reg[`SPI2_SPI_BYTE_COUNT_SPI_BYTE_COUNT_CONTROL3_POS], spi_byte_count_reg[`SPI2_SPI_BYTE_COUNT_SPI_BYTE_COUNT_CONTROL2_POS], spi_byte_count_reg[`SPI2_SPI_BYTE_COUNT_SPI_BYTE_COUNT_CONTROL1_POS], spi_byte_count_reg[`SPI2_SPI_BYTE_COUNT_SPI_BYTE_COUNT_CONTROL0_POS]};
assign spi_byte_count_config_o = {spi_byte_count_reg[`SPI2_SPI_BYTE_COUNT_SPI_BYTE_COUNT_CONFIG7_POS], spi_byte_count_reg[`SPI2_SPI_BYTE_COUNT_SPI_BYTE_COUNT_CONFIG6_POS], spi_byte_count_reg[`SPI2_SPI_BYTE_COUNT_SPI_BYTE_COUNT_CONFIG5_POS], spi_byte_count_reg[`SPI2_SPI_BYTE_COUNT_SPI_BYTE_COUNT_CONFIG4_POS], spi_byte_count_reg[`SPI2_SPI_BYTE_COUNT_SPI_BYTE_COUNT_CONFIG3_POS], spi_byte_count_reg[`SPI2_SPI_BYTE_COUNT_SPI_BYTE_COUNT_CONFIG2_POS], spi_byte_count_reg[`SPI2_SPI_BYTE_COUNT_SPI_BYTE_COUNT_CONFIG1_POS], spi_byte_count_reg[`SPI2_SPI_BYTE_COUNT_SPI_BYTE_COUNT_CONFIG0_POS]};
assign spi_byte_count_value_o = {spi_byte_count_reg[`SPI2_SPI_BYTE_COUNT_SPI_BYTE_COUNT_VALUE7_POS], spi_byte_count_reg[`SPI2_SPI_BYTE_COUNT_SPI_BYTE_COUNT_VALUE6_POS], spi_byte_count_reg[`SPI2_SPI_BYTE_COUNT_SPI_BYTE_COUNT_VALUE5_POS], spi_byte_count_reg[`SPI2_SPI_BYTE_COUNT_SPI_BYTE_COUNT_VALUE4_POS], spi_byte_count_reg[`SPI2_SPI_BYTE_COUNT_SPI_BYTE_COUNT_VALUE3_POS], spi_byte_count_reg[`SPI2_SPI_BYTE_COUNT_SPI_BYTE_COUNT_VALUE2_POS], spi_byte_count_reg[`SPI2_SPI_BYTE_COUNT_SPI_BYTE_COUNT_VALUE1_POS], spi_byte_count_reg[`SPI2_SPI_BYTE_COUNT_SPI_BYTE_COUNT_VALUE0_POS]};
assign spi_byte_count_flag_o = {spi_byte_count_reg[`SPI2_SPI_BYTE_COUNT_SPI_BYTE_COUNT_FLAG7_POS], spi_byte_count_reg[`SPI2_SPI_BYTE_COUNT_SPI_BYTE_COUNT_FLAG6_POS], spi_byte_count_reg[`SPI2_SPI_BYTE_COUNT_SPI_BYTE_COUNT_FLAG5_POS], spi_byte_count_reg[`SPI2_SPI_BYTE_COUNT_SPI_BYTE_COUNT_FLAG4_POS], spi_byte_count_reg[`SPI2_SPI_BYTE_COUNT_SPI_BYTE_COUNT_FLAG3_POS], spi_byte_count_reg[`SPI2_SPI_BYTE_COUNT_SPI_BYTE_COUNT_FLAG2_POS], spi_byte_count_reg[`SPI2_SPI_BYTE_COUNT_SPI_BYTE_COUNT_FLAG1_POS], spi_byte_count_reg[`SPI2_SPI_BYTE_COUNT_SPI_BYTE_COUNT_FLAG0_POS]};
assign spi_bit_count_control_o = {spi_bit_count_reg[`SPI2_SPI_BIT_COUNT_SPI_BIT_COUNT_CONTROL7_POS], spi_bit_count_reg[`SPI2_SPI_BIT_COUNT_SPI_BIT_COUNT_CONTROL6_POS], spi_bit_count_reg[`SPI2_SPI_BIT_COUNT_SPI_BIT_COUNT_CONTROL5_POS], spi_bit_count_reg[`SPI2_SPI_BIT_COUNT_SPI_BIT_COUNT_CONTROL4_POS], spi_bit_count_reg[`SPI2_SPI_BIT_COUNT_SPI_BIT_COUNT_CONTROL3_POS], spi_bit_count_reg[`SPI2_SPI_BIT_COUNT_SPI_BIT_COUNT_CONTROL2_POS], spi_bit_count_reg[`SPI2_SPI_BIT_COUNT_SPI_BIT_COUNT_CONTROL1_POS], spi_bit_count_reg[`SPI2_SPI_BIT_COUNT_SPI_BIT_COUNT_CONTROL0_POS]};
assign spi_bit_count_config_o = {spi_bit_count_reg[`SPI2_SPI_BIT_COUNT_SPI_BIT_COUNT_CONFIG7_POS], spi_bit_count_reg[`SPI2_SPI_BIT_COUNT_SPI_BIT_COUNT_CONFIG6_POS], spi_bit_count_reg[`SPI2_SPI_BIT_COUNT_SPI_BIT_COUNT_CONFIG5_POS], spi_bit_count_reg[`SPI2_SPI_BIT_COUNT_SPI_BIT_COUNT_CONFIG4_POS], spi_bit_count_reg[`SPI2_SPI_BIT_COUNT_SPI_BIT_COUNT_CONFIG3_POS], spi_bit_count_reg[`SPI2_SPI_BIT_COUNT_SPI_BIT_COUNT_CONFIG2_POS], spi_bit_count_reg[`SPI2_SPI_BIT_COUNT_SPI_BIT_COUNT_CONFIG1_POS], spi_bit_count_reg[`SPI2_SPI_BIT_COUNT_SPI_BIT_COUNT_CONFIG0_POS]};
assign spi_bit_count_value_o = {spi_bit_count_reg[`SPI2_SPI_BIT_COUNT_SPI_BIT_COUNT_VALUE7_POS], spi_bit_count_reg[`SPI2_SPI_BIT_COUNT_SPI_BIT_COUNT_VALUE6_POS], spi_bit_count_reg[`SPI2_SPI_BIT_COUNT_SPI_BIT_COUNT_VALUE5_POS], spi_bit_count_reg[`SPI2_SPI_BIT_COUNT_SPI_BIT_COUNT_VALUE4_POS], spi_bit_count_reg[`SPI2_SPI_BIT_COUNT_SPI_BIT_COUNT_VALUE3_POS], spi_bit_count_reg[`SPI2_SPI_BIT_COUNT_SPI_BIT_COUNT_VALUE2_POS], spi_bit_count_reg[`SPI2_SPI_BIT_COUNT_SPI_BIT_COUNT_VALUE1_POS], spi_bit_count_reg[`SPI2_SPI_BIT_COUNT_SPI_BIT_COUNT_VALUE0_POS]};
assign spi_bit_count_flag_o = {spi_bit_count_reg[`SPI2_SPI_BIT_COUNT_SPI_BIT_COUNT_FLAG7_POS], spi_bit_count_reg[`SPI2_SPI_BIT_COUNT_SPI_BIT_COUNT_FLAG6_POS], spi_bit_count_reg[`SPI2_SPI_BIT_COUNT_SPI_BIT_COUNT_FLAG5_POS], spi_bit_count_reg[`SPI2_SPI_BIT_COUNT_SPI_BIT_COUNT_FLAG4_POS], spi_bit_count_reg[`SPI2_SPI_BIT_COUNT_SPI_BIT_COUNT_FLAG3_POS], spi_bit_count_reg[`SPI2_SPI_BIT_COUNT_SPI_BIT_COUNT_FLAG2_POS], spi_bit_count_reg[`SPI2_SPI_BIT_COUNT_SPI_BIT_COUNT_FLAG1_POS], spi_bit_count_reg[`SPI2_SPI_BIT_COUNT_SPI_BIT_COUNT_FLAG0_POS]};
assign spi_transfer_count_control_o = {spi_transfer_count_reg[`SPI2_SPI_TRANSFER_COUNT_SPI_TRANSFER_COUNT_CONTROL7_POS], spi_transfer_count_reg[`SPI2_SPI_TRANSFER_COUNT_SPI_TRANSFER_COUNT_CONTROL6_POS], spi_transfer_count_reg[`SPI2_SPI_TRANSFER_COUNT_SPI_TRANSFER_COUNT_CONTROL5_POS], spi_transfer_count_reg[`SPI2_SPI_TRANSFER_COUNT_SPI_TRANSFER_COUNT_CONTROL4_POS], spi_transfer_count_reg[`SPI2_SPI_TRANSFER_COUNT_SPI_TRANSFER_COUNT_CONTROL3_POS], spi_transfer_count_reg[`SPI2_SPI_TRANSFER_COUNT_SPI_TRANSFER_COUNT_CONTROL2_POS], spi_transfer_count_reg[`SPI2_SPI_TRANSFER_COUNT_SPI_TRANSFER_COUNT_CONTROL1_POS], spi_transfer_count_reg[`SPI2_SPI_TRANSFER_COUNT_SPI_TRANSFER_COUNT_CONTROL0_POS]};
assign spi_transfer_count_config_o = {spi_transfer_count_reg[`SPI2_SPI_TRANSFER_COUNT_SPI_TRANSFER_COUNT_CONFIG7_POS], spi_transfer_count_reg[`SPI2_SPI_TRANSFER_COUNT_SPI_TRANSFER_COUNT_CONFIG6_POS], spi_transfer_count_reg[`SPI2_SPI_TRANSFER_COUNT_SPI_TRANSFER_COUNT_CONFIG5_POS], spi_transfer_count_reg[`SPI2_SPI_TRANSFER_COUNT_SPI_TRANSFER_COUNT_CONFIG4_POS], spi_transfer_count_reg[`SPI2_SPI_TRANSFER_COUNT_SPI_TRANSFER_COUNT_CONFIG3_POS], spi_transfer_count_reg[`SPI2_SPI_TRANSFER_COUNT_SPI_TRANSFER_COUNT_CONFIG2_POS], spi_transfer_count_reg[`SPI2_SPI_TRANSFER_COUNT_SPI_TRANSFER_COUNT_CONFIG1_POS], spi_transfer_count_reg[`SPI2_SPI_TRANSFER_COUNT_SPI_TRANSFER_COUNT_CONFIG0_POS]};
assign spi_transfer_count_value_o = {spi_transfer_count_reg[`SPI2_SPI_TRANSFER_COUNT_SPI_TRANSFER_COUNT_VALUE7_POS], spi_transfer_count_reg[`SPI2_SPI_TRANSFER_COUNT_SPI_TRANSFER_COUNT_VALUE6_POS], spi_transfer_count_reg[`SPI2_SPI_TRANSFER_COUNT_SPI_TRANSFER_COUNT_VALUE5_POS], spi_transfer_count_reg[`SPI2_SPI_TRANSFER_COUNT_SPI_TRANSFER_COUNT_VALUE4_POS], spi_transfer_count_reg[`SPI2_SPI_TRANSFER_COUNT_SPI_TRANSFER_COUNT_VALUE3_POS], spi_transfer_count_reg[`SPI2_SPI_TRANSFER_COUNT_SPI_TRANSFER_COUNT_VALUE2_POS], spi_transfer_count_reg[`SPI2_SPI_TRANSFER_COUNT_SPI_TRANSFER_COUNT_VALUE1_POS], spi_transfer_count_reg[`SPI2_SPI_TRANSFER_COUNT_SPI_TRANSFER_COUNT_VALUE0_POS]};
assign spi_transfer_count_flag_o = {spi_transfer_count_reg[`SPI2_SPI_TRANSFER_COUNT_SPI_TRANSFER_COUNT_FLAG7_POS], spi_transfer_count_reg[`SPI2_SPI_TRANSFER_COUNT_SPI_TRANSFER_COUNT_FLAG6_POS], spi_transfer_count_reg[`SPI2_SPI_TRANSFER_COUNT_SPI_TRANSFER_COUNT_FLAG5_POS], spi_transfer_count_reg[`SPI2_SPI_TRANSFER_COUNT_SPI_TRANSFER_COUNT_FLAG4_POS], spi_transfer_count_reg[`SPI2_SPI_TRANSFER_COUNT_SPI_TRANSFER_COUNT_FLAG3_POS], spi_transfer_count_reg[`SPI2_SPI_TRANSFER_COUNT_SPI_TRANSFER_COUNT_FLAG2_POS], spi_transfer_count_reg[`SPI2_SPI_TRANSFER_COUNT_SPI_TRANSFER_COUNT_FLAG1_POS], spi_transfer_count_reg[`SPI2_SPI_TRANSFER_COUNT_SPI_TRANSFER_COUNT_FLAG0_POS]};
assign spi_error_count_control_o = {spi_error_count_reg[`SPI2_SPI_ERROR_COUNT_SPI_ERROR_COUNT_CONTROL7_POS], spi_error_count_reg[`SPI2_SPI_ERROR_COUNT_SPI_ERROR_COUNT_CONTROL6_POS], spi_error_count_reg[`SPI2_SPI_ERROR_COUNT_SPI_ERROR_COUNT_CONTROL5_POS], spi_error_count_reg[`SPI2_SPI_ERROR_COUNT_SPI_ERROR_COUNT_CONTROL4_POS], spi_error_count_reg[`SPI2_SPI_ERROR_COUNT_SPI_ERROR_COUNT_CONTROL3_POS], spi_error_count_reg[`SPI2_SPI_ERROR_COUNT_SPI_ERROR_COUNT_CONTROL2_POS], spi_error_count_reg[`SPI2_SPI_ERROR_COUNT_SPI_ERROR_COUNT_CONTROL1_POS], spi_error_count_reg[`SPI2_SPI_ERROR_COUNT_SPI_ERROR_COUNT_CONTROL0_POS]};
assign spi_error_count_config_o = {spi_error_count_reg[`SPI2_SPI_ERROR_COUNT_SPI_ERROR_COUNT_CONFIG7_POS], spi_error_count_reg[`SPI2_SPI_ERROR_COUNT_SPI_ERROR_COUNT_CONFIG6_POS], spi_error_count_reg[`SPI2_SPI_ERROR_COUNT_SPI_ERROR_COUNT_CONFIG5_POS], spi_error_count_reg[`SPI2_SPI_ERROR_COUNT_SPI_ERROR_COUNT_CONFIG4_POS], spi_error_count_reg[`SPI2_SPI_ERROR_COUNT_SPI_ERROR_COUNT_CONFIG3_POS], spi_error_count_reg[`SPI2_SPI_ERROR_COUNT_SPI_ERROR_COUNT_CONFIG2_POS], spi_error_count_reg[`SPI2_SPI_ERROR_COUNT_SPI_ERROR_COUNT_CONFIG1_POS], spi_error_count_reg[`SPI2_SPI_ERROR_COUNT_SPI_ERROR_COUNT_CONFIG0_POS]};
assign spi_error_count_value_o = {spi_error_count_reg[`SPI2_SPI_ERROR_COUNT_SPI_ERROR_COUNT_VALUE7_POS], spi_error_count_reg[`SPI2_SPI_ERROR_COUNT_SPI_ERROR_COUNT_VALUE6_POS], spi_error_count_reg[`SPI2_SPI_ERROR_COUNT_SPI_ERROR_COUNT_VALUE5_POS], spi_error_count_reg[`SPI2_SPI_ERROR_COUNT_SPI_ERROR_COUNT_VALUE4_POS], spi_error_count_reg[`SPI2_SPI_ERROR_COUNT_SPI_ERROR_COUNT_VALUE3_POS], spi_error_count_reg[`SPI2_SPI_ERROR_COUNT_SPI_ERROR_COUNT_VALUE2_POS], spi_error_count_reg[`SPI2_SPI_ERROR_COUNT_SPI_ERROR_COUNT_VALUE1_POS], spi_error_count_reg[`SPI2_SPI_ERROR_COUNT_SPI_ERROR_COUNT_VALUE0_POS]};
assign spi_error_count_flag_o = {spi_error_count_reg[`SPI2_SPI_ERROR_COUNT_SPI_ERROR_COUNT_FLAG7_POS], spi_error_count_reg[`SPI2_SPI_ERROR_COUNT_SPI_ERROR_COUNT_FLAG6_POS], spi_error_count_reg[`SPI2_SPI_ERROR_COUNT_SPI_ERROR_COUNT_FLAG5_POS], spi_error_count_reg[`SPI2_SPI_ERROR_COUNT_SPI_ERROR_COUNT_FLAG4_POS], spi_error_count_reg[`SPI2_SPI_ERROR_COUNT_SPI_ERROR_COUNT_FLAG3_POS], spi_error_count_reg[`SPI2_SPI_ERROR_COUNT_SPI_ERROR_COUNT_FLAG2_POS], spi_error_count_reg[`SPI2_SPI_ERROR_COUNT_SPI_ERROR_COUNT_FLAG1_POS], spi_error_count_reg[`SPI2_SPI_ERROR_COUNT_SPI_ERROR_COUNT_FLAG0_POS]};
assign spi_retry_config_control_o = {spi_retry_config_reg[`SPI2_SPI_RETRY_CONFIG_SPI_RETRY_CONFIG_CONTROL7_POS], spi_retry_config_reg[`SPI2_SPI_RETRY_CONFIG_SPI_RETRY_CONFIG_CONTROL6_POS], spi_retry_config_reg[`SPI2_SPI_RETRY_CONFIG_SPI_RETRY_CONFIG_CONTROL5_POS], spi_retry_config_reg[`SPI2_SPI_RETRY_CONFIG_SPI_RETRY_CONFIG_CONTROL4_POS], spi_retry_config_reg[`SPI2_SPI_RETRY_CONFIG_SPI_RETRY_CONFIG_CONTROL3_POS], spi_retry_config_reg[`SPI2_SPI_RETRY_CONFIG_SPI_RETRY_CONFIG_CONTROL2_POS], spi_retry_config_reg[`SPI2_SPI_RETRY_CONFIG_SPI_RETRY_CONFIG_CONTROL1_POS], spi_retry_config_reg[`SPI2_SPI_RETRY_CONFIG_SPI_RETRY_CONFIG_CONTROL0_POS]};
assign spi_retry_config_config_o = {spi_retry_config_reg[`SPI2_SPI_RETRY_CONFIG_SPI_RETRY_CONFIG_CONFIG7_POS], spi_retry_config_reg[`SPI2_SPI_RETRY_CONFIG_SPI_RETRY_CONFIG_CONFIG6_POS], spi_retry_config_reg[`SPI2_SPI_RETRY_CONFIG_SPI_RETRY_CONFIG_CONFIG5_POS], spi_retry_config_reg[`SPI2_SPI_RETRY_CONFIG_SPI_RETRY_CONFIG_CONFIG4_POS], spi_retry_config_reg[`SPI2_SPI_RETRY_CONFIG_SPI_RETRY_CONFIG_CONFIG3_POS], spi_retry_config_reg[`SPI2_SPI_RETRY_CONFIG_SPI_RETRY_CONFIG_CONFIG2_POS], spi_retry_config_reg[`SPI2_SPI_RETRY_CONFIG_SPI_RETRY_CONFIG_CONFIG1_POS], spi_retry_config_reg[`SPI2_SPI_RETRY_CONFIG_SPI_RETRY_CONFIG_CONFIG0_POS]};
assign spi_retry_config_value_o = {spi_retry_config_reg[`SPI2_SPI_RETRY_CONFIG_SPI_RETRY_CONFIG_VALUE7_POS], spi_retry_config_reg[`SPI2_SPI_RETRY_CONFIG_SPI_RETRY_CONFIG_VALUE6_POS], spi_retry_config_reg[`SPI2_SPI_RETRY_CONFIG_SPI_RETRY_CONFIG_VALUE5_POS], spi_retry_config_reg[`SPI2_SPI_RETRY_CONFIG_SPI_RETRY_CONFIG_VALUE4_POS], spi_retry_config_reg[`SPI2_SPI_RETRY_CONFIG_SPI_RETRY_CONFIG_VALUE3_POS], spi_retry_config_reg[`SPI2_SPI_RETRY_CONFIG_SPI_RETRY_CONFIG_VALUE2_POS], spi_retry_config_reg[`SPI2_SPI_RETRY_CONFIG_SPI_RETRY_CONFIG_VALUE1_POS], spi_retry_config_reg[`SPI2_SPI_RETRY_CONFIG_SPI_RETRY_CONFIG_VALUE0_POS]};
assign spi_retry_config_flag_o = {spi_retry_config_reg[`SPI2_SPI_RETRY_CONFIG_SPI_RETRY_CONFIG_FLAG7_POS], spi_retry_config_reg[`SPI2_SPI_RETRY_CONFIG_SPI_RETRY_CONFIG_FLAG6_POS], spi_retry_config_reg[`SPI2_SPI_RETRY_CONFIG_SPI_RETRY_CONFIG_FLAG5_POS], spi_retry_config_reg[`SPI2_SPI_RETRY_CONFIG_SPI_RETRY_CONFIG_FLAG4_POS], spi_retry_config_reg[`SPI2_SPI_RETRY_CONFIG_SPI_RETRY_CONFIG_FLAG3_POS], spi_retry_config_reg[`SPI2_SPI_RETRY_CONFIG_SPI_RETRY_CONFIG_FLAG2_POS], spi_retry_config_reg[`SPI2_SPI_RETRY_CONFIG_SPI_RETRY_CONFIG_FLAG1_POS], spi_retry_config_reg[`SPI2_SPI_RETRY_CONFIG_SPI_RETRY_CONFIG_FLAG0_POS]};
assign spi_retry_status_control_o = {spi_retry_status_reg[`SPI2_SPI_RETRY_STATUS_SPI_RETRY_STATUS_CONTROL7_POS], spi_retry_status_reg[`SPI2_SPI_RETRY_STATUS_SPI_RETRY_STATUS_CONTROL6_POS], spi_retry_status_reg[`SPI2_SPI_RETRY_STATUS_SPI_RETRY_STATUS_CONTROL5_POS], spi_retry_status_reg[`SPI2_SPI_RETRY_STATUS_SPI_RETRY_STATUS_CONTROL4_POS], spi_retry_status_reg[`SPI2_SPI_RETRY_STATUS_SPI_RETRY_STATUS_CONTROL3_POS], spi_retry_status_reg[`SPI2_SPI_RETRY_STATUS_SPI_RETRY_STATUS_CONTROL2_POS], spi_retry_status_reg[`SPI2_SPI_RETRY_STATUS_SPI_RETRY_STATUS_CONTROL1_POS], spi_retry_status_reg[`SPI2_SPI_RETRY_STATUS_SPI_RETRY_STATUS_CONTROL0_POS]};
assign spi_retry_status_config_o = {spi_retry_status_reg[`SPI2_SPI_RETRY_STATUS_SPI_RETRY_STATUS_CONFIG7_POS], spi_retry_status_reg[`SPI2_SPI_RETRY_STATUS_SPI_RETRY_STATUS_CONFIG6_POS], spi_retry_status_reg[`SPI2_SPI_RETRY_STATUS_SPI_RETRY_STATUS_CONFIG5_POS], spi_retry_status_reg[`SPI2_SPI_RETRY_STATUS_SPI_RETRY_STATUS_CONFIG4_POS], spi_retry_status_reg[`SPI2_SPI_RETRY_STATUS_SPI_RETRY_STATUS_CONFIG3_POS], spi_retry_status_reg[`SPI2_SPI_RETRY_STATUS_SPI_RETRY_STATUS_CONFIG2_POS], spi_retry_status_reg[`SPI2_SPI_RETRY_STATUS_SPI_RETRY_STATUS_CONFIG1_POS], spi_retry_status_reg[`SPI2_SPI_RETRY_STATUS_SPI_RETRY_STATUS_CONFIG0_POS]};
assign spi_retry_status_value_o = {spi_retry_status_reg[`SPI2_SPI_RETRY_STATUS_SPI_RETRY_STATUS_VALUE7_POS], spi_retry_status_reg[`SPI2_SPI_RETRY_STATUS_SPI_RETRY_STATUS_VALUE6_POS], spi_retry_status_reg[`SPI2_SPI_RETRY_STATUS_SPI_RETRY_STATUS_VALUE5_POS], spi_retry_status_reg[`SPI2_SPI_RETRY_STATUS_SPI_RETRY_STATUS_VALUE4_POS], spi_retry_status_reg[`SPI2_SPI_RETRY_STATUS_SPI_RETRY_STATUS_VALUE3_POS], spi_retry_status_reg[`SPI2_SPI_RETRY_STATUS_SPI_RETRY_STATUS_VALUE2_POS], spi_retry_status_reg[`SPI2_SPI_RETRY_STATUS_SPI_RETRY_STATUS_VALUE1_POS], spi_retry_status_reg[`SPI2_SPI_RETRY_STATUS_SPI_RETRY_STATUS_VALUE0_POS]};
assign spi_retry_status_flag_o = {spi_retry_status_reg[`SPI2_SPI_RETRY_STATUS_SPI_RETRY_STATUS_FLAG7_POS], spi_retry_status_reg[`SPI2_SPI_RETRY_STATUS_SPI_RETRY_STATUS_FLAG6_POS], spi_retry_status_reg[`SPI2_SPI_RETRY_STATUS_SPI_RETRY_STATUS_FLAG5_POS], spi_retry_status_reg[`SPI2_SPI_RETRY_STATUS_SPI_RETRY_STATUS_FLAG4_POS], spi_retry_status_reg[`SPI2_SPI_RETRY_STATUS_SPI_RETRY_STATUS_FLAG3_POS], spi_retry_status_reg[`SPI2_SPI_RETRY_STATUS_SPI_RETRY_STATUS_FLAG2_POS], spi_retry_status_reg[`SPI2_SPI_RETRY_STATUS_SPI_RETRY_STATUS_FLAG1_POS], spi_retry_status_reg[`SPI2_SPI_RETRY_STATUS_SPI_RETRY_STATUS_FLAG0_POS]};
assign spi_retry_count_control_o = {spi_retry_count_reg[`SPI2_SPI_RETRY_COUNT_SPI_RETRY_COUNT_CONTROL7_POS], spi_retry_count_reg[`SPI2_SPI_RETRY_COUNT_SPI_RETRY_COUNT_CONTROL6_POS], spi_retry_count_reg[`SPI2_SPI_RETRY_COUNT_SPI_RETRY_COUNT_CONTROL5_POS], spi_retry_count_reg[`SPI2_SPI_RETRY_COUNT_SPI_RETRY_COUNT_CONTROL4_POS], spi_retry_count_reg[`SPI2_SPI_RETRY_COUNT_SPI_RETRY_COUNT_CONTROL3_POS], spi_retry_count_reg[`SPI2_SPI_RETRY_COUNT_SPI_RETRY_COUNT_CONTROL2_POS], spi_retry_count_reg[`SPI2_SPI_RETRY_COUNT_SPI_RETRY_COUNT_CONTROL1_POS], spi_retry_count_reg[`SPI2_SPI_RETRY_COUNT_SPI_RETRY_COUNT_CONTROL0_POS]};
assign spi_retry_count_config_o = {spi_retry_count_reg[`SPI2_SPI_RETRY_COUNT_SPI_RETRY_COUNT_CONFIG7_POS], spi_retry_count_reg[`SPI2_SPI_RETRY_COUNT_SPI_RETRY_COUNT_CONFIG6_POS], spi_retry_count_reg[`SPI2_SPI_RETRY_COUNT_SPI_RETRY_COUNT_CONFIG5_POS], spi_retry_count_reg[`SPI2_SPI_RETRY_COUNT_SPI_RETRY_COUNT_CONFIG4_POS], spi_retry_count_reg[`SPI2_SPI_RETRY_COUNT_SPI_RETRY_COUNT_CONFIG3_POS], spi_retry_count_reg[`SPI2_SPI_RETRY_COUNT_SPI_RETRY_COUNT_CONFIG2_POS], spi_retry_count_reg[`SPI2_SPI_RETRY_COUNT_SPI_RETRY_COUNT_CONFIG1_POS], spi_retry_count_reg[`SPI2_SPI_RETRY_COUNT_SPI_RETRY_COUNT_CONFIG0_POS]};
assign spi_retry_count_value_o = {spi_retry_count_reg[`SPI2_SPI_RETRY_COUNT_SPI_RETRY_COUNT_VALUE7_POS], spi_retry_count_reg[`SPI2_SPI_RETRY_COUNT_SPI_RETRY_COUNT_VALUE6_POS], spi_retry_count_reg[`SPI2_SPI_RETRY_COUNT_SPI_RETRY_COUNT_VALUE5_POS], spi_retry_count_reg[`SPI2_SPI_RETRY_COUNT_SPI_RETRY_COUNT_VALUE4_POS], spi_retry_count_reg[`SPI2_SPI_RETRY_COUNT_SPI_RETRY_COUNT_VALUE3_POS], spi_retry_count_reg[`SPI2_SPI_RETRY_COUNT_SPI_RETRY_COUNT_VALUE2_POS], spi_retry_count_reg[`SPI2_SPI_RETRY_COUNT_SPI_RETRY_COUNT_VALUE1_POS], spi_retry_count_reg[`SPI2_SPI_RETRY_COUNT_SPI_RETRY_COUNT_VALUE0_POS]};
assign spi_retry_count_flag_o = {spi_retry_count_reg[`SPI2_SPI_RETRY_COUNT_SPI_RETRY_COUNT_FLAG7_POS], spi_retry_count_reg[`SPI2_SPI_RETRY_COUNT_SPI_RETRY_COUNT_FLAG6_POS], spi_retry_count_reg[`SPI2_SPI_RETRY_COUNT_SPI_RETRY_COUNT_FLAG5_POS], spi_retry_count_reg[`SPI2_SPI_RETRY_COUNT_SPI_RETRY_COUNT_FLAG4_POS], spi_retry_count_reg[`SPI2_SPI_RETRY_COUNT_SPI_RETRY_COUNT_FLAG3_POS], spi_retry_count_reg[`SPI2_SPI_RETRY_COUNT_SPI_RETRY_COUNT_FLAG2_POS], spi_retry_count_reg[`SPI2_SPI_RETRY_COUNT_SPI_RETRY_COUNT_FLAG1_POS], spi_retry_count_reg[`SPI2_SPI_RETRY_COUNT_SPI_RETRY_COUNT_FLAG0_POS]};
assign spi_packet_config_control_o = {spi_packet_config_reg[`SPI2_SPI_PACKET_CONFIG_SPI_PACKET_CONFIG_CONTROL7_POS], spi_packet_config_reg[`SPI2_SPI_PACKET_CONFIG_SPI_PACKET_CONFIG_CONTROL6_POS], spi_packet_config_reg[`SPI2_SPI_PACKET_CONFIG_SPI_PACKET_CONFIG_CONTROL5_POS], spi_packet_config_reg[`SPI2_SPI_PACKET_CONFIG_SPI_PACKET_CONFIG_CONTROL4_POS], spi_packet_config_reg[`SPI2_SPI_PACKET_CONFIG_SPI_PACKET_CONFIG_CONTROL3_POS], spi_packet_config_reg[`SPI2_SPI_PACKET_CONFIG_SPI_PACKET_CONFIG_CONTROL2_POS], spi_packet_config_reg[`SPI2_SPI_PACKET_CONFIG_SPI_PACKET_CONFIG_CONTROL1_POS], spi_packet_config_reg[`SPI2_SPI_PACKET_CONFIG_SPI_PACKET_CONFIG_CONTROL0_POS]};
assign spi_packet_config_config_o = {spi_packet_config_reg[`SPI2_SPI_PACKET_CONFIG_SPI_PACKET_CONFIG_CONFIG7_POS], spi_packet_config_reg[`SPI2_SPI_PACKET_CONFIG_SPI_PACKET_CONFIG_CONFIG6_POS], spi_packet_config_reg[`SPI2_SPI_PACKET_CONFIG_SPI_PACKET_CONFIG_CONFIG5_POS], spi_packet_config_reg[`SPI2_SPI_PACKET_CONFIG_SPI_PACKET_CONFIG_CONFIG4_POS], spi_packet_config_reg[`SPI2_SPI_PACKET_CONFIG_SPI_PACKET_CONFIG_CONFIG3_POS], spi_packet_config_reg[`SPI2_SPI_PACKET_CONFIG_SPI_PACKET_CONFIG_CONFIG2_POS], spi_packet_config_reg[`SPI2_SPI_PACKET_CONFIG_SPI_PACKET_CONFIG_CONFIG1_POS], spi_packet_config_reg[`SPI2_SPI_PACKET_CONFIG_SPI_PACKET_CONFIG_CONFIG0_POS]};
assign spi_packet_config_value_o = {spi_packet_config_reg[`SPI2_SPI_PACKET_CONFIG_SPI_PACKET_CONFIG_VALUE7_POS], spi_packet_config_reg[`SPI2_SPI_PACKET_CONFIG_SPI_PACKET_CONFIG_VALUE6_POS], spi_packet_config_reg[`SPI2_SPI_PACKET_CONFIG_SPI_PACKET_CONFIG_VALUE5_POS], spi_packet_config_reg[`SPI2_SPI_PACKET_CONFIG_SPI_PACKET_CONFIG_VALUE4_POS], spi_packet_config_reg[`SPI2_SPI_PACKET_CONFIG_SPI_PACKET_CONFIG_VALUE3_POS], spi_packet_config_reg[`SPI2_SPI_PACKET_CONFIG_SPI_PACKET_CONFIG_VALUE2_POS], spi_packet_config_reg[`SPI2_SPI_PACKET_CONFIG_SPI_PACKET_CONFIG_VALUE1_POS], spi_packet_config_reg[`SPI2_SPI_PACKET_CONFIG_SPI_PACKET_CONFIG_VALUE0_POS]};
assign spi_packet_config_flag_o = {spi_packet_config_reg[`SPI2_SPI_PACKET_CONFIG_SPI_PACKET_CONFIG_FLAG7_POS], spi_packet_config_reg[`SPI2_SPI_PACKET_CONFIG_SPI_PACKET_CONFIG_FLAG6_POS], spi_packet_config_reg[`SPI2_SPI_PACKET_CONFIG_SPI_PACKET_CONFIG_FLAG5_POS], spi_packet_config_reg[`SPI2_SPI_PACKET_CONFIG_SPI_PACKET_CONFIG_FLAG4_POS], spi_packet_config_reg[`SPI2_SPI_PACKET_CONFIG_SPI_PACKET_CONFIG_FLAG3_POS], spi_packet_config_reg[`SPI2_SPI_PACKET_CONFIG_SPI_PACKET_CONFIG_FLAG2_POS], spi_packet_config_reg[`SPI2_SPI_PACKET_CONFIG_SPI_PACKET_CONFIG_FLAG1_POS], spi_packet_config_reg[`SPI2_SPI_PACKET_CONFIG_SPI_PACKET_CONFIG_FLAG0_POS]};
assign spi_packet_status_control_o = {spi_packet_status_reg[`SPI2_SPI_PACKET_STATUS_SPI_PACKET_STATUS_CONTROL7_POS], spi_packet_status_reg[`SPI2_SPI_PACKET_STATUS_SPI_PACKET_STATUS_CONTROL6_POS], spi_packet_status_reg[`SPI2_SPI_PACKET_STATUS_SPI_PACKET_STATUS_CONTROL5_POS], spi_packet_status_reg[`SPI2_SPI_PACKET_STATUS_SPI_PACKET_STATUS_CONTROL4_POS], spi_packet_status_reg[`SPI2_SPI_PACKET_STATUS_SPI_PACKET_STATUS_CONTROL3_POS], spi_packet_status_reg[`SPI2_SPI_PACKET_STATUS_SPI_PACKET_STATUS_CONTROL2_POS], spi_packet_status_reg[`SPI2_SPI_PACKET_STATUS_SPI_PACKET_STATUS_CONTROL1_POS], spi_packet_status_reg[`SPI2_SPI_PACKET_STATUS_SPI_PACKET_STATUS_CONTROL0_POS]};
assign spi_packet_status_config_o = {spi_packet_status_reg[`SPI2_SPI_PACKET_STATUS_SPI_PACKET_STATUS_CONFIG7_POS], spi_packet_status_reg[`SPI2_SPI_PACKET_STATUS_SPI_PACKET_STATUS_CONFIG6_POS], spi_packet_status_reg[`SPI2_SPI_PACKET_STATUS_SPI_PACKET_STATUS_CONFIG5_POS], spi_packet_status_reg[`SPI2_SPI_PACKET_STATUS_SPI_PACKET_STATUS_CONFIG4_POS], spi_packet_status_reg[`SPI2_SPI_PACKET_STATUS_SPI_PACKET_STATUS_CONFIG3_POS], spi_packet_status_reg[`SPI2_SPI_PACKET_STATUS_SPI_PACKET_STATUS_CONFIG2_POS], spi_packet_status_reg[`SPI2_SPI_PACKET_STATUS_SPI_PACKET_STATUS_CONFIG1_POS], spi_packet_status_reg[`SPI2_SPI_PACKET_STATUS_SPI_PACKET_STATUS_CONFIG0_POS]};
assign spi_packet_status_value_o = {spi_packet_status_reg[`SPI2_SPI_PACKET_STATUS_SPI_PACKET_STATUS_VALUE7_POS], spi_packet_status_reg[`SPI2_SPI_PACKET_STATUS_SPI_PACKET_STATUS_VALUE6_POS], spi_packet_status_reg[`SPI2_SPI_PACKET_STATUS_SPI_PACKET_STATUS_VALUE5_POS], spi_packet_status_reg[`SPI2_SPI_PACKET_STATUS_SPI_PACKET_STATUS_VALUE4_POS], spi_packet_status_reg[`SPI2_SPI_PACKET_STATUS_SPI_PACKET_STATUS_VALUE3_POS], spi_packet_status_reg[`SPI2_SPI_PACKET_STATUS_SPI_PACKET_STATUS_VALUE2_POS], spi_packet_status_reg[`SPI2_SPI_PACKET_STATUS_SPI_PACKET_STATUS_VALUE1_POS], spi_packet_status_reg[`SPI2_SPI_PACKET_STATUS_SPI_PACKET_STATUS_VALUE0_POS]};
assign spi_packet_status_flag_o = {spi_packet_status_reg[`SPI2_SPI_PACKET_STATUS_SPI_PACKET_STATUS_FLAG7_POS], spi_packet_status_reg[`SPI2_SPI_PACKET_STATUS_SPI_PACKET_STATUS_FLAG6_POS], spi_packet_status_reg[`SPI2_SPI_PACKET_STATUS_SPI_PACKET_STATUS_FLAG5_POS], spi_packet_status_reg[`SPI2_SPI_PACKET_STATUS_SPI_PACKET_STATUS_FLAG4_POS], spi_packet_status_reg[`SPI2_SPI_PACKET_STATUS_SPI_PACKET_STATUS_FLAG3_POS], spi_packet_status_reg[`SPI2_SPI_PACKET_STATUS_SPI_PACKET_STATUS_FLAG2_POS], spi_packet_status_reg[`SPI2_SPI_PACKET_STATUS_SPI_PACKET_STATUS_FLAG1_POS], spi_packet_status_reg[`SPI2_SPI_PACKET_STATUS_SPI_PACKET_STATUS_FLAG0_POS]};
assign spi_header_config_control_o = {spi_header_config_reg[`SPI2_SPI_HEADER_CONFIG_SPI_HEADER_CONFIG_CONTROL7_POS], spi_header_config_reg[`SPI2_SPI_HEADER_CONFIG_SPI_HEADER_CONFIG_CONTROL6_POS], spi_header_config_reg[`SPI2_SPI_HEADER_CONFIG_SPI_HEADER_CONFIG_CONTROL5_POS], spi_header_config_reg[`SPI2_SPI_HEADER_CONFIG_SPI_HEADER_CONFIG_CONTROL4_POS], spi_header_config_reg[`SPI2_SPI_HEADER_CONFIG_SPI_HEADER_CONFIG_CONTROL3_POS], spi_header_config_reg[`SPI2_SPI_HEADER_CONFIG_SPI_HEADER_CONFIG_CONTROL2_POS], spi_header_config_reg[`SPI2_SPI_HEADER_CONFIG_SPI_HEADER_CONFIG_CONTROL1_POS], spi_header_config_reg[`SPI2_SPI_HEADER_CONFIG_SPI_HEADER_CONFIG_CONTROL0_POS]};
assign spi_header_config_config_o = {spi_header_config_reg[`SPI2_SPI_HEADER_CONFIG_SPI_HEADER_CONFIG_CONFIG7_POS], spi_header_config_reg[`SPI2_SPI_HEADER_CONFIG_SPI_HEADER_CONFIG_CONFIG6_POS], spi_header_config_reg[`SPI2_SPI_HEADER_CONFIG_SPI_HEADER_CONFIG_CONFIG5_POS], spi_header_config_reg[`SPI2_SPI_HEADER_CONFIG_SPI_HEADER_CONFIG_CONFIG4_POS], spi_header_config_reg[`SPI2_SPI_HEADER_CONFIG_SPI_HEADER_CONFIG_CONFIG3_POS], spi_header_config_reg[`SPI2_SPI_HEADER_CONFIG_SPI_HEADER_CONFIG_CONFIG2_POS], spi_header_config_reg[`SPI2_SPI_HEADER_CONFIG_SPI_HEADER_CONFIG_CONFIG1_POS], spi_header_config_reg[`SPI2_SPI_HEADER_CONFIG_SPI_HEADER_CONFIG_CONFIG0_POS]};
assign spi_header_config_value_o = {spi_header_config_reg[`SPI2_SPI_HEADER_CONFIG_SPI_HEADER_CONFIG_VALUE7_POS], spi_header_config_reg[`SPI2_SPI_HEADER_CONFIG_SPI_HEADER_CONFIG_VALUE6_POS], spi_header_config_reg[`SPI2_SPI_HEADER_CONFIG_SPI_HEADER_CONFIG_VALUE5_POS], spi_header_config_reg[`SPI2_SPI_HEADER_CONFIG_SPI_HEADER_CONFIG_VALUE4_POS], spi_header_config_reg[`SPI2_SPI_HEADER_CONFIG_SPI_HEADER_CONFIG_VALUE3_POS], spi_header_config_reg[`SPI2_SPI_HEADER_CONFIG_SPI_HEADER_CONFIG_VALUE2_POS], spi_header_config_reg[`SPI2_SPI_HEADER_CONFIG_SPI_HEADER_CONFIG_VALUE1_POS], spi_header_config_reg[`SPI2_SPI_HEADER_CONFIG_SPI_HEADER_CONFIG_VALUE0_POS]};
assign spi_header_config_flag_o = {spi_header_config_reg[`SPI2_SPI_HEADER_CONFIG_SPI_HEADER_CONFIG_FLAG7_POS], spi_header_config_reg[`SPI2_SPI_HEADER_CONFIG_SPI_HEADER_CONFIG_FLAG6_POS], spi_header_config_reg[`SPI2_SPI_HEADER_CONFIG_SPI_HEADER_CONFIG_FLAG5_POS], spi_header_config_reg[`SPI2_SPI_HEADER_CONFIG_SPI_HEADER_CONFIG_FLAG4_POS], spi_header_config_reg[`SPI2_SPI_HEADER_CONFIG_SPI_HEADER_CONFIG_FLAG3_POS], spi_header_config_reg[`SPI2_SPI_HEADER_CONFIG_SPI_HEADER_CONFIG_FLAG2_POS], spi_header_config_reg[`SPI2_SPI_HEADER_CONFIG_SPI_HEADER_CONFIG_FLAG1_POS], spi_header_config_reg[`SPI2_SPI_HEADER_CONFIG_SPI_HEADER_CONFIG_FLAG0_POS]};
assign spi_header_status_control_o = {spi_header_status_reg[`SPI2_SPI_HEADER_STATUS_SPI_HEADER_STATUS_CONTROL7_POS], spi_header_status_reg[`SPI2_SPI_HEADER_STATUS_SPI_HEADER_STATUS_CONTROL6_POS], spi_header_status_reg[`SPI2_SPI_HEADER_STATUS_SPI_HEADER_STATUS_CONTROL5_POS], spi_header_status_reg[`SPI2_SPI_HEADER_STATUS_SPI_HEADER_STATUS_CONTROL4_POS], spi_header_status_reg[`SPI2_SPI_HEADER_STATUS_SPI_HEADER_STATUS_CONTROL3_POS], spi_header_status_reg[`SPI2_SPI_HEADER_STATUS_SPI_HEADER_STATUS_CONTROL2_POS], spi_header_status_reg[`SPI2_SPI_HEADER_STATUS_SPI_HEADER_STATUS_CONTROL1_POS], spi_header_status_reg[`SPI2_SPI_HEADER_STATUS_SPI_HEADER_STATUS_CONTROL0_POS]};
assign spi_header_status_config_o = {spi_header_status_reg[`SPI2_SPI_HEADER_STATUS_SPI_HEADER_STATUS_CONFIG7_POS], spi_header_status_reg[`SPI2_SPI_HEADER_STATUS_SPI_HEADER_STATUS_CONFIG6_POS], spi_header_status_reg[`SPI2_SPI_HEADER_STATUS_SPI_HEADER_STATUS_CONFIG5_POS], spi_header_status_reg[`SPI2_SPI_HEADER_STATUS_SPI_HEADER_STATUS_CONFIG4_POS], spi_header_status_reg[`SPI2_SPI_HEADER_STATUS_SPI_HEADER_STATUS_CONFIG3_POS], spi_header_status_reg[`SPI2_SPI_HEADER_STATUS_SPI_HEADER_STATUS_CONFIG2_POS], spi_header_status_reg[`SPI2_SPI_HEADER_STATUS_SPI_HEADER_STATUS_CONFIG1_POS], spi_header_status_reg[`SPI2_SPI_HEADER_STATUS_SPI_HEADER_STATUS_CONFIG0_POS]};
assign spi_header_status_value_o = {spi_header_status_reg[`SPI2_SPI_HEADER_STATUS_SPI_HEADER_STATUS_VALUE7_POS], spi_header_status_reg[`SPI2_SPI_HEADER_STATUS_SPI_HEADER_STATUS_VALUE6_POS], spi_header_status_reg[`SPI2_SPI_HEADER_STATUS_SPI_HEADER_STATUS_VALUE5_POS], spi_header_status_reg[`SPI2_SPI_HEADER_STATUS_SPI_HEADER_STATUS_VALUE4_POS], spi_header_status_reg[`SPI2_SPI_HEADER_STATUS_SPI_HEADER_STATUS_VALUE3_POS], spi_header_status_reg[`SPI2_SPI_HEADER_STATUS_SPI_HEADER_STATUS_VALUE2_POS], spi_header_status_reg[`SPI2_SPI_HEADER_STATUS_SPI_HEADER_STATUS_VALUE1_POS], spi_header_status_reg[`SPI2_SPI_HEADER_STATUS_SPI_HEADER_STATUS_VALUE0_POS]};
assign spi_header_status_flag_o = {spi_header_status_reg[`SPI2_SPI_HEADER_STATUS_SPI_HEADER_STATUS_FLAG7_POS], spi_header_status_reg[`SPI2_SPI_HEADER_STATUS_SPI_HEADER_STATUS_FLAG6_POS], spi_header_status_reg[`SPI2_SPI_HEADER_STATUS_SPI_HEADER_STATUS_FLAG5_POS], spi_header_status_reg[`SPI2_SPI_HEADER_STATUS_SPI_HEADER_STATUS_FLAG4_POS], spi_header_status_reg[`SPI2_SPI_HEADER_STATUS_SPI_HEADER_STATUS_FLAG3_POS], spi_header_status_reg[`SPI2_SPI_HEADER_STATUS_SPI_HEADER_STATUS_FLAG2_POS], spi_header_status_reg[`SPI2_SPI_HEADER_STATUS_SPI_HEADER_STATUS_FLAG1_POS], spi_header_status_reg[`SPI2_SPI_HEADER_STATUS_SPI_HEADER_STATUS_FLAG0_POS]};
assign spi_crc_config_control_o = {spi_crc_config_reg[`SPI2_SPI_CRC_CONFIG_SPI_CRC_CONFIG_CONTROL7_POS], spi_crc_config_reg[`SPI2_SPI_CRC_CONFIG_SPI_CRC_CONFIG_CONTROL6_POS], spi_crc_config_reg[`SPI2_SPI_CRC_CONFIG_SPI_CRC_CONFIG_CONTROL5_POS], spi_crc_config_reg[`SPI2_SPI_CRC_CONFIG_SPI_CRC_CONFIG_CONTROL4_POS], spi_crc_config_reg[`SPI2_SPI_CRC_CONFIG_SPI_CRC_CONFIG_CONTROL3_POS], spi_crc_config_reg[`SPI2_SPI_CRC_CONFIG_SPI_CRC_CONFIG_CONTROL2_POS], spi_crc_config_reg[`SPI2_SPI_CRC_CONFIG_SPI_CRC_CONFIG_CONTROL1_POS], spi_crc_config_reg[`SPI2_SPI_CRC_CONFIG_SPI_CRC_CONFIG_CONTROL0_POS]};
assign spi_crc_config_config_o = {spi_crc_config_reg[`SPI2_SPI_CRC_CONFIG_SPI_CRC_CONFIG_CONFIG7_POS], spi_crc_config_reg[`SPI2_SPI_CRC_CONFIG_SPI_CRC_CONFIG_CONFIG6_POS], spi_crc_config_reg[`SPI2_SPI_CRC_CONFIG_SPI_CRC_CONFIG_CONFIG5_POS], spi_crc_config_reg[`SPI2_SPI_CRC_CONFIG_SPI_CRC_CONFIG_CONFIG4_POS], spi_crc_config_reg[`SPI2_SPI_CRC_CONFIG_SPI_CRC_CONFIG_CONFIG3_POS], spi_crc_config_reg[`SPI2_SPI_CRC_CONFIG_SPI_CRC_CONFIG_CONFIG2_POS], spi_crc_config_reg[`SPI2_SPI_CRC_CONFIG_SPI_CRC_CONFIG_CONFIG1_POS], spi_crc_config_reg[`SPI2_SPI_CRC_CONFIG_SPI_CRC_CONFIG_CONFIG0_POS]};
assign spi_crc_config_value_o = {spi_crc_config_reg[`SPI2_SPI_CRC_CONFIG_SPI_CRC_CONFIG_VALUE7_POS], spi_crc_config_reg[`SPI2_SPI_CRC_CONFIG_SPI_CRC_CONFIG_VALUE6_POS], spi_crc_config_reg[`SPI2_SPI_CRC_CONFIG_SPI_CRC_CONFIG_VALUE5_POS], spi_crc_config_reg[`SPI2_SPI_CRC_CONFIG_SPI_CRC_CONFIG_VALUE4_POS], spi_crc_config_reg[`SPI2_SPI_CRC_CONFIG_SPI_CRC_CONFIG_VALUE3_POS], spi_crc_config_reg[`SPI2_SPI_CRC_CONFIG_SPI_CRC_CONFIG_VALUE2_POS], spi_crc_config_reg[`SPI2_SPI_CRC_CONFIG_SPI_CRC_CONFIG_VALUE1_POS], spi_crc_config_reg[`SPI2_SPI_CRC_CONFIG_SPI_CRC_CONFIG_VALUE0_POS]};
assign spi_crc_config_flag_o = {spi_crc_config_reg[`SPI2_SPI_CRC_CONFIG_SPI_CRC_CONFIG_FLAG7_POS], spi_crc_config_reg[`SPI2_SPI_CRC_CONFIG_SPI_CRC_CONFIG_FLAG6_POS], spi_crc_config_reg[`SPI2_SPI_CRC_CONFIG_SPI_CRC_CONFIG_FLAG5_POS], spi_crc_config_reg[`SPI2_SPI_CRC_CONFIG_SPI_CRC_CONFIG_FLAG4_POS], spi_crc_config_reg[`SPI2_SPI_CRC_CONFIG_SPI_CRC_CONFIG_FLAG3_POS], spi_crc_config_reg[`SPI2_SPI_CRC_CONFIG_SPI_CRC_CONFIG_FLAG2_POS], spi_crc_config_reg[`SPI2_SPI_CRC_CONFIG_SPI_CRC_CONFIG_FLAG1_POS], spi_crc_config_reg[`SPI2_SPI_CRC_CONFIG_SPI_CRC_CONFIG_FLAG0_POS]};
assign spi_crc_status_control_o = {spi_crc_status_reg[`SPI2_SPI_CRC_STATUS_SPI_CRC_STATUS_CONTROL7_POS], spi_crc_status_reg[`SPI2_SPI_CRC_STATUS_SPI_CRC_STATUS_CONTROL6_POS], spi_crc_status_reg[`SPI2_SPI_CRC_STATUS_SPI_CRC_STATUS_CONTROL5_POS], spi_crc_status_reg[`SPI2_SPI_CRC_STATUS_SPI_CRC_STATUS_CONTROL4_POS], spi_crc_status_reg[`SPI2_SPI_CRC_STATUS_SPI_CRC_STATUS_CONTROL3_POS], spi_crc_status_reg[`SPI2_SPI_CRC_STATUS_SPI_CRC_STATUS_CONTROL2_POS], spi_crc_status_reg[`SPI2_SPI_CRC_STATUS_SPI_CRC_STATUS_CONTROL1_POS], spi_crc_status_reg[`SPI2_SPI_CRC_STATUS_SPI_CRC_STATUS_CONTROL0_POS]};
assign spi_crc_status_config_o = {spi_crc_status_reg[`SPI2_SPI_CRC_STATUS_SPI_CRC_STATUS_CONFIG7_POS], spi_crc_status_reg[`SPI2_SPI_CRC_STATUS_SPI_CRC_STATUS_CONFIG6_POS], spi_crc_status_reg[`SPI2_SPI_CRC_STATUS_SPI_CRC_STATUS_CONFIG5_POS], spi_crc_status_reg[`SPI2_SPI_CRC_STATUS_SPI_CRC_STATUS_CONFIG4_POS], spi_crc_status_reg[`SPI2_SPI_CRC_STATUS_SPI_CRC_STATUS_CONFIG3_POS], spi_crc_status_reg[`SPI2_SPI_CRC_STATUS_SPI_CRC_STATUS_CONFIG2_POS], spi_crc_status_reg[`SPI2_SPI_CRC_STATUS_SPI_CRC_STATUS_CONFIG1_POS], spi_crc_status_reg[`SPI2_SPI_CRC_STATUS_SPI_CRC_STATUS_CONFIG0_POS]};
assign spi_crc_status_value_o = {spi_crc_status_reg[`SPI2_SPI_CRC_STATUS_SPI_CRC_STATUS_VALUE7_POS], spi_crc_status_reg[`SPI2_SPI_CRC_STATUS_SPI_CRC_STATUS_VALUE6_POS], spi_crc_status_reg[`SPI2_SPI_CRC_STATUS_SPI_CRC_STATUS_VALUE5_POS], spi_crc_status_reg[`SPI2_SPI_CRC_STATUS_SPI_CRC_STATUS_VALUE4_POS], spi_crc_status_reg[`SPI2_SPI_CRC_STATUS_SPI_CRC_STATUS_VALUE3_POS], spi_crc_status_reg[`SPI2_SPI_CRC_STATUS_SPI_CRC_STATUS_VALUE2_POS], spi_crc_status_reg[`SPI2_SPI_CRC_STATUS_SPI_CRC_STATUS_VALUE1_POS], spi_crc_status_reg[`SPI2_SPI_CRC_STATUS_SPI_CRC_STATUS_VALUE0_POS]};
assign spi_crc_status_flag_o = {spi_crc_status_reg[`SPI2_SPI_CRC_STATUS_SPI_CRC_STATUS_FLAG7_POS], spi_crc_status_reg[`SPI2_SPI_CRC_STATUS_SPI_CRC_STATUS_FLAG6_POS], spi_crc_status_reg[`SPI2_SPI_CRC_STATUS_SPI_CRC_STATUS_FLAG5_POS], spi_crc_status_reg[`SPI2_SPI_CRC_STATUS_SPI_CRC_STATUS_FLAG4_POS], spi_crc_status_reg[`SPI2_SPI_CRC_STATUS_SPI_CRC_STATUS_FLAG3_POS], spi_crc_status_reg[`SPI2_SPI_CRC_STATUS_SPI_CRC_STATUS_FLAG2_POS], spi_crc_status_reg[`SPI2_SPI_CRC_STATUS_SPI_CRC_STATUS_FLAG1_POS], spi_crc_status_reg[`SPI2_SPI_CRC_STATUS_SPI_CRC_STATUS_FLAG0_POS]};
assign spi_crc_result_control_o = {spi_crc_result_reg[`SPI2_SPI_CRC_RESULT_SPI_CRC_RESULT_CONTROL7_POS], spi_crc_result_reg[`SPI2_SPI_CRC_RESULT_SPI_CRC_RESULT_CONTROL6_POS], spi_crc_result_reg[`SPI2_SPI_CRC_RESULT_SPI_CRC_RESULT_CONTROL5_POS], spi_crc_result_reg[`SPI2_SPI_CRC_RESULT_SPI_CRC_RESULT_CONTROL4_POS], spi_crc_result_reg[`SPI2_SPI_CRC_RESULT_SPI_CRC_RESULT_CONTROL3_POS], spi_crc_result_reg[`SPI2_SPI_CRC_RESULT_SPI_CRC_RESULT_CONTROL2_POS], spi_crc_result_reg[`SPI2_SPI_CRC_RESULT_SPI_CRC_RESULT_CONTROL1_POS], spi_crc_result_reg[`SPI2_SPI_CRC_RESULT_SPI_CRC_RESULT_CONTROL0_POS]};
assign spi_crc_result_config_o = {spi_crc_result_reg[`SPI2_SPI_CRC_RESULT_SPI_CRC_RESULT_CONFIG7_POS], spi_crc_result_reg[`SPI2_SPI_CRC_RESULT_SPI_CRC_RESULT_CONFIG6_POS], spi_crc_result_reg[`SPI2_SPI_CRC_RESULT_SPI_CRC_RESULT_CONFIG5_POS], spi_crc_result_reg[`SPI2_SPI_CRC_RESULT_SPI_CRC_RESULT_CONFIG4_POS], spi_crc_result_reg[`SPI2_SPI_CRC_RESULT_SPI_CRC_RESULT_CONFIG3_POS], spi_crc_result_reg[`SPI2_SPI_CRC_RESULT_SPI_CRC_RESULT_CONFIG2_POS], spi_crc_result_reg[`SPI2_SPI_CRC_RESULT_SPI_CRC_RESULT_CONFIG1_POS], spi_crc_result_reg[`SPI2_SPI_CRC_RESULT_SPI_CRC_RESULT_CONFIG0_POS]};
assign spi_crc_result_value_o = {spi_crc_result_reg[`SPI2_SPI_CRC_RESULT_SPI_CRC_RESULT_VALUE7_POS], spi_crc_result_reg[`SPI2_SPI_CRC_RESULT_SPI_CRC_RESULT_VALUE6_POS], spi_crc_result_reg[`SPI2_SPI_CRC_RESULT_SPI_CRC_RESULT_VALUE5_POS], spi_crc_result_reg[`SPI2_SPI_CRC_RESULT_SPI_CRC_RESULT_VALUE4_POS], spi_crc_result_reg[`SPI2_SPI_CRC_RESULT_SPI_CRC_RESULT_VALUE3_POS], spi_crc_result_reg[`SPI2_SPI_CRC_RESULT_SPI_CRC_RESULT_VALUE2_POS], spi_crc_result_reg[`SPI2_SPI_CRC_RESULT_SPI_CRC_RESULT_VALUE1_POS], spi_crc_result_reg[`SPI2_SPI_CRC_RESULT_SPI_CRC_RESULT_VALUE0_POS]};
assign spi_crc_result_flag_o = {spi_crc_result_reg[`SPI2_SPI_CRC_RESULT_SPI_CRC_RESULT_FLAG7_POS], spi_crc_result_reg[`SPI2_SPI_CRC_RESULT_SPI_CRC_RESULT_FLAG6_POS], spi_crc_result_reg[`SPI2_SPI_CRC_RESULT_SPI_CRC_RESULT_FLAG5_POS], spi_crc_result_reg[`SPI2_SPI_CRC_RESULT_SPI_CRC_RESULT_FLAG4_POS], spi_crc_result_reg[`SPI2_SPI_CRC_RESULT_SPI_CRC_RESULT_FLAG3_POS], spi_crc_result_reg[`SPI2_SPI_CRC_RESULT_SPI_CRC_RESULT_FLAG2_POS], spi_crc_result_reg[`SPI2_SPI_CRC_RESULT_SPI_CRC_RESULT_FLAG1_POS], spi_crc_result_reg[`SPI2_SPI_CRC_RESULT_SPI_CRC_RESULT_FLAG0_POS]};
assign spi_checksum_config_control_o = {spi_checksum_config_reg[`SPI2_SPI_CHECKSUM_CONFIG_SPI_CHECKSUM_CONFIG_CONTROL7_POS], spi_checksum_config_reg[`SPI2_SPI_CHECKSUM_CONFIG_SPI_CHECKSUM_CONFIG_CONTROL6_POS], spi_checksum_config_reg[`SPI2_SPI_CHECKSUM_CONFIG_SPI_CHECKSUM_CONFIG_CONTROL5_POS], spi_checksum_config_reg[`SPI2_SPI_CHECKSUM_CONFIG_SPI_CHECKSUM_CONFIG_CONTROL4_POS], spi_checksum_config_reg[`SPI2_SPI_CHECKSUM_CONFIG_SPI_CHECKSUM_CONFIG_CONTROL3_POS], spi_checksum_config_reg[`SPI2_SPI_CHECKSUM_CONFIG_SPI_CHECKSUM_CONFIG_CONTROL2_POS], spi_checksum_config_reg[`SPI2_SPI_CHECKSUM_CONFIG_SPI_CHECKSUM_CONFIG_CONTROL1_POS], spi_checksum_config_reg[`SPI2_SPI_CHECKSUM_CONFIG_SPI_CHECKSUM_CONFIG_CONTROL0_POS]};
assign spi_checksum_config_config_o = {spi_checksum_config_reg[`SPI2_SPI_CHECKSUM_CONFIG_SPI_CHECKSUM_CONFIG_CONFIG7_POS], spi_checksum_config_reg[`SPI2_SPI_CHECKSUM_CONFIG_SPI_CHECKSUM_CONFIG_CONFIG6_POS], spi_checksum_config_reg[`SPI2_SPI_CHECKSUM_CONFIG_SPI_CHECKSUM_CONFIG_CONFIG5_POS], spi_checksum_config_reg[`SPI2_SPI_CHECKSUM_CONFIG_SPI_CHECKSUM_CONFIG_CONFIG4_POS], spi_checksum_config_reg[`SPI2_SPI_CHECKSUM_CONFIG_SPI_CHECKSUM_CONFIG_CONFIG3_POS], spi_checksum_config_reg[`SPI2_SPI_CHECKSUM_CONFIG_SPI_CHECKSUM_CONFIG_CONFIG2_POS], spi_checksum_config_reg[`SPI2_SPI_CHECKSUM_CONFIG_SPI_CHECKSUM_CONFIG_CONFIG1_POS], spi_checksum_config_reg[`SPI2_SPI_CHECKSUM_CONFIG_SPI_CHECKSUM_CONFIG_CONFIG0_POS]};
assign spi_checksum_config_value_o = {spi_checksum_config_reg[`SPI2_SPI_CHECKSUM_CONFIG_SPI_CHECKSUM_CONFIG_VALUE7_POS], spi_checksum_config_reg[`SPI2_SPI_CHECKSUM_CONFIG_SPI_CHECKSUM_CONFIG_VALUE6_POS], spi_checksum_config_reg[`SPI2_SPI_CHECKSUM_CONFIG_SPI_CHECKSUM_CONFIG_VALUE5_POS], spi_checksum_config_reg[`SPI2_SPI_CHECKSUM_CONFIG_SPI_CHECKSUM_CONFIG_VALUE4_POS], spi_checksum_config_reg[`SPI2_SPI_CHECKSUM_CONFIG_SPI_CHECKSUM_CONFIG_VALUE3_POS], spi_checksum_config_reg[`SPI2_SPI_CHECKSUM_CONFIG_SPI_CHECKSUM_CONFIG_VALUE2_POS], spi_checksum_config_reg[`SPI2_SPI_CHECKSUM_CONFIG_SPI_CHECKSUM_CONFIG_VALUE1_POS], spi_checksum_config_reg[`SPI2_SPI_CHECKSUM_CONFIG_SPI_CHECKSUM_CONFIG_VALUE0_POS]};
assign spi_checksum_config_flag_o = {spi_checksum_config_reg[`SPI2_SPI_CHECKSUM_CONFIG_SPI_CHECKSUM_CONFIG_FLAG7_POS], spi_checksum_config_reg[`SPI2_SPI_CHECKSUM_CONFIG_SPI_CHECKSUM_CONFIG_FLAG6_POS], spi_checksum_config_reg[`SPI2_SPI_CHECKSUM_CONFIG_SPI_CHECKSUM_CONFIG_FLAG5_POS], spi_checksum_config_reg[`SPI2_SPI_CHECKSUM_CONFIG_SPI_CHECKSUM_CONFIG_FLAG4_POS], spi_checksum_config_reg[`SPI2_SPI_CHECKSUM_CONFIG_SPI_CHECKSUM_CONFIG_FLAG3_POS], spi_checksum_config_reg[`SPI2_SPI_CHECKSUM_CONFIG_SPI_CHECKSUM_CONFIG_FLAG2_POS], spi_checksum_config_reg[`SPI2_SPI_CHECKSUM_CONFIG_SPI_CHECKSUM_CONFIG_FLAG1_POS], spi_checksum_config_reg[`SPI2_SPI_CHECKSUM_CONFIG_SPI_CHECKSUM_CONFIG_FLAG0_POS]};
assign spi_checksum_status_control_o = {spi_checksum_status_reg[`SPI2_SPI_CHECKSUM_STATUS_SPI_CHECKSUM_STATUS_CONTROL7_POS], spi_checksum_status_reg[`SPI2_SPI_CHECKSUM_STATUS_SPI_CHECKSUM_STATUS_CONTROL6_POS], spi_checksum_status_reg[`SPI2_SPI_CHECKSUM_STATUS_SPI_CHECKSUM_STATUS_CONTROL5_POS], spi_checksum_status_reg[`SPI2_SPI_CHECKSUM_STATUS_SPI_CHECKSUM_STATUS_CONTROL4_POS], spi_checksum_status_reg[`SPI2_SPI_CHECKSUM_STATUS_SPI_CHECKSUM_STATUS_CONTROL3_POS], spi_checksum_status_reg[`SPI2_SPI_CHECKSUM_STATUS_SPI_CHECKSUM_STATUS_CONTROL2_POS], spi_checksum_status_reg[`SPI2_SPI_CHECKSUM_STATUS_SPI_CHECKSUM_STATUS_CONTROL1_POS], spi_checksum_status_reg[`SPI2_SPI_CHECKSUM_STATUS_SPI_CHECKSUM_STATUS_CONTROL0_POS]};
assign spi_checksum_status_config_o = {spi_checksum_status_reg[`SPI2_SPI_CHECKSUM_STATUS_SPI_CHECKSUM_STATUS_CONFIG7_POS], spi_checksum_status_reg[`SPI2_SPI_CHECKSUM_STATUS_SPI_CHECKSUM_STATUS_CONFIG6_POS], spi_checksum_status_reg[`SPI2_SPI_CHECKSUM_STATUS_SPI_CHECKSUM_STATUS_CONFIG5_POS], spi_checksum_status_reg[`SPI2_SPI_CHECKSUM_STATUS_SPI_CHECKSUM_STATUS_CONFIG4_POS], spi_checksum_status_reg[`SPI2_SPI_CHECKSUM_STATUS_SPI_CHECKSUM_STATUS_CONFIG3_POS], spi_checksum_status_reg[`SPI2_SPI_CHECKSUM_STATUS_SPI_CHECKSUM_STATUS_CONFIG2_POS], spi_checksum_status_reg[`SPI2_SPI_CHECKSUM_STATUS_SPI_CHECKSUM_STATUS_CONFIG1_POS], spi_checksum_status_reg[`SPI2_SPI_CHECKSUM_STATUS_SPI_CHECKSUM_STATUS_CONFIG0_POS]};
assign spi_checksum_status_value_o = {spi_checksum_status_reg[`SPI2_SPI_CHECKSUM_STATUS_SPI_CHECKSUM_STATUS_VALUE7_POS], spi_checksum_status_reg[`SPI2_SPI_CHECKSUM_STATUS_SPI_CHECKSUM_STATUS_VALUE6_POS], spi_checksum_status_reg[`SPI2_SPI_CHECKSUM_STATUS_SPI_CHECKSUM_STATUS_VALUE5_POS], spi_checksum_status_reg[`SPI2_SPI_CHECKSUM_STATUS_SPI_CHECKSUM_STATUS_VALUE4_POS], spi_checksum_status_reg[`SPI2_SPI_CHECKSUM_STATUS_SPI_CHECKSUM_STATUS_VALUE3_POS], spi_checksum_status_reg[`SPI2_SPI_CHECKSUM_STATUS_SPI_CHECKSUM_STATUS_VALUE2_POS], spi_checksum_status_reg[`SPI2_SPI_CHECKSUM_STATUS_SPI_CHECKSUM_STATUS_VALUE1_POS], spi_checksum_status_reg[`SPI2_SPI_CHECKSUM_STATUS_SPI_CHECKSUM_STATUS_VALUE0_POS]};
assign spi_checksum_status_flag_o = {spi_checksum_status_reg[`SPI2_SPI_CHECKSUM_STATUS_SPI_CHECKSUM_STATUS_FLAG7_POS], spi_checksum_status_reg[`SPI2_SPI_CHECKSUM_STATUS_SPI_CHECKSUM_STATUS_FLAG6_POS], spi_checksum_status_reg[`SPI2_SPI_CHECKSUM_STATUS_SPI_CHECKSUM_STATUS_FLAG5_POS], spi_checksum_status_reg[`SPI2_SPI_CHECKSUM_STATUS_SPI_CHECKSUM_STATUS_FLAG4_POS], spi_checksum_status_reg[`SPI2_SPI_CHECKSUM_STATUS_SPI_CHECKSUM_STATUS_FLAG3_POS], spi_checksum_status_reg[`SPI2_SPI_CHECKSUM_STATUS_SPI_CHECKSUM_STATUS_FLAG2_POS], spi_checksum_status_reg[`SPI2_SPI_CHECKSUM_STATUS_SPI_CHECKSUM_STATUS_FLAG1_POS], spi_checksum_status_reg[`SPI2_SPI_CHECKSUM_STATUS_SPI_CHECKSUM_STATUS_FLAG0_POS]};
assign spi_checksum_result_control_o = {spi_checksum_result_reg[`SPI2_SPI_CHECKSUM_RESULT_SPI_CHECKSUM_RESULT_CONTROL7_POS], spi_checksum_result_reg[`SPI2_SPI_CHECKSUM_RESULT_SPI_CHECKSUM_RESULT_CONTROL6_POS], spi_checksum_result_reg[`SPI2_SPI_CHECKSUM_RESULT_SPI_CHECKSUM_RESULT_CONTROL5_POS], spi_checksum_result_reg[`SPI2_SPI_CHECKSUM_RESULT_SPI_CHECKSUM_RESULT_CONTROL4_POS], spi_checksum_result_reg[`SPI2_SPI_CHECKSUM_RESULT_SPI_CHECKSUM_RESULT_CONTROL3_POS], spi_checksum_result_reg[`SPI2_SPI_CHECKSUM_RESULT_SPI_CHECKSUM_RESULT_CONTROL2_POS], spi_checksum_result_reg[`SPI2_SPI_CHECKSUM_RESULT_SPI_CHECKSUM_RESULT_CONTROL1_POS], spi_checksum_result_reg[`SPI2_SPI_CHECKSUM_RESULT_SPI_CHECKSUM_RESULT_CONTROL0_POS]};
assign spi_checksum_result_config_o = {spi_checksum_result_reg[`SPI2_SPI_CHECKSUM_RESULT_SPI_CHECKSUM_RESULT_CONFIG7_POS], spi_checksum_result_reg[`SPI2_SPI_CHECKSUM_RESULT_SPI_CHECKSUM_RESULT_CONFIG6_POS], spi_checksum_result_reg[`SPI2_SPI_CHECKSUM_RESULT_SPI_CHECKSUM_RESULT_CONFIG5_POS], spi_checksum_result_reg[`SPI2_SPI_CHECKSUM_RESULT_SPI_CHECKSUM_RESULT_CONFIG4_POS], spi_checksum_result_reg[`SPI2_SPI_CHECKSUM_RESULT_SPI_CHECKSUM_RESULT_CONFIG3_POS], spi_checksum_result_reg[`SPI2_SPI_CHECKSUM_RESULT_SPI_CHECKSUM_RESULT_CONFIG2_POS], spi_checksum_result_reg[`SPI2_SPI_CHECKSUM_RESULT_SPI_CHECKSUM_RESULT_CONFIG1_POS], spi_checksum_result_reg[`SPI2_SPI_CHECKSUM_RESULT_SPI_CHECKSUM_RESULT_CONFIG0_POS]};
assign spi_checksum_result_value_o = {spi_checksum_result_reg[`SPI2_SPI_CHECKSUM_RESULT_SPI_CHECKSUM_RESULT_VALUE7_POS], spi_checksum_result_reg[`SPI2_SPI_CHECKSUM_RESULT_SPI_CHECKSUM_RESULT_VALUE6_POS], spi_checksum_result_reg[`SPI2_SPI_CHECKSUM_RESULT_SPI_CHECKSUM_RESULT_VALUE5_POS], spi_checksum_result_reg[`SPI2_SPI_CHECKSUM_RESULT_SPI_CHECKSUM_RESULT_VALUE4_POS], spi_checksum_result_reg[`SPI2_SPI_CHECKSUM_RESULT_SPI_CHECKSUM_RESULT_VALUE3_POS], spi_checksum_result_reg[`SPI2_SPI_CHECKSUM_RESULT_SPI_CHECKSUM_RESULT_VALUE2_POS], spi_checksum_result_reg[`SPI2_SPI_CHECKSUM_RESULT_SPI_CHECKSUM_RESULT_VALUE1_POS], spi_checksum_result_reg[`SPI2_SPI_CHECKSUM_RESULT_SPI_CHECKSUM_RESULT_VALUE0_POS]};
assign spi_checksum_result_flag_o = {spi_checksum_result_reg[`SPI2_SPI_CHECKSUM_RESULT_SPI_CHECKSUM_RESULT_FLAG7_POS], spi_checksum_result_reg[`SPI2_SPI_CHECKSUM_RESULT_SPI_CHECKSUM_RESULT_FLAG6_POS], spi_checksum_result_reg[`SPI2_SPI_CHECKSUM_RESULT_SPI_CHECKSUM_RESULT_FLAG5_POS], spi_checksum_result_reg[`SPI2_SPI_CHECKSUM_RESULT_SPI_CHECKSUM_RESULT_FLAG4_POS], spi_checksum_result_reg[`SPI2_SPI_CHECKSUM_RESULT_SPI_CHECKSUM_RESULT_FLAG3_POS], spi_checksum_result_reg[`SPI2_SPI_CHECKSUM_RESULT_SPI_CHECKSUM_RESULT_FLAG2_POS], spi_checksum_result_reg[`SPI2_SPI_CHECKSUM_RESULT_SPI_CHECKSUM_RESULT_FLAG1_POS], spi_checksum_result_reg[`SPI2_SPI_CHECKSUM_RESULT_SPI_CHECKSUM_RESULT_FLAG0_POS]};
assign spi_sequence_config_control_o = {spi_sequence_config_reg[`SPI2_SPI_SEQUENCE_CONFIG_SPI_SEQUENCE_CONFIG_CONTROL7_POS], spi_sequence_config_reg[`SPI2_SPI_SEQUENCE_CONFIG_SPI_SEQUENCE_CONFIG_CONTROL6_POS], spi_sequence_config_reg[`SPI2_SPI_SEQUENCE_CONFIG_SPI_SEQUENCE_CONFIG_CONTROL5_POS], spi_sequence_config_reg[`SPI2_SPI_SEQUENCE_CONFIG_SPI_SEQUENCE_CONFIG_CONTROL4_POS], spi_sequence_config_reg[`SPI2_SPI_SEQUENCE_CONFIG_SPI_SEQUENCE_CONFIG_CONTROL3_POS], spi_sequence_config_reg[`SPI2_SPI_SEQUENCE_CONFIG_SPI_SEQUENCE_CONFIG_CONTROL2_POS], spi_sequence_config_reg[`SPI2_SPI_SEQUENCE_CONFIG_SPI_SEQUENCE_CONFIG_CONTROL1_POS], spi_sequence_config_reg[`SPI2_SPI_SEQUENCE_CONFIG_SPI_SEQUENCE_CONFIG_CONTROL0_POS]};
assign spi_sequence_config_config_o = {spi_sequence_config_reg[`SPI2_SPI_SEQUENCE_CONFIG_SPI_SEQUENCE_CONFIG_CONFIG7_POS], spi_sequence_config_reg[`SPI2_SPI_SEQUENCE_CONFIG_SPI_SEQUENCE_CONFIG_CONFIG6_POS], spi_sequence_config_reg[`SPI2_SPI_SEQUENCE_CONFIG_SPI_SEQUENCE_CONFIG_CONFIG5_POS], spi_sequence_config_reg[`SPI2_SPI_SEQUENCE_CONFIG_SPI_SEQUENCE_CONFIG_CONFIG4_POS], spi_sequence_config_reg[`SPI2_SPI_SEQUENCE_CONFIG_SPI_SEQUENCE_CONFIG_CONFIG3_POS], spi_sequence_config_reg[`SPI2_SPI_SEQUENCE_CONFIG_SPI_SEQUENCE_CONFIG_CONFIG2_POS], spi_sequence_config_reg[`SPI2_SPI_SEQUENCE_CONFIG_SPI_SEQUENCE_CONFIG_CONFIG1_POS], spi_sequence_config_reg[`SPI2_SPI_SEQUENCE_CONFIG_SPI_SEQUENCE_CONFIG_CONFIG0_POS]};
assign spi_sequence_config_value_o = {spi_sequence_config_reg[`SPI2_SPI_SEQUENCE_CONFIG_SPI_SEQUENCE_CONFIG_VALUE7_POS], spi_sequence_config_reg[`SPI2_SPI_SEQUENCE_CONFIG_SPI_SEQUENCE_CONFIG_VALUE6_POS], spi_sequence_config_reg[`SPI2_SPI_SEQUENCE_CONFIG_SPI_SEQUENCE_CONFIG_VALUE5_POS], spi_sequence_config_reg[`SPI2_SPI_SEQUENCE_CONFIG_SPI_SEQUENCE_CONFIG_VALUE4_POS], spi_sequence_config_reg[`SPI2_SPI_SEQUENCE_CONFIG_SPI_SEQUENCE_CONFIG_VALUE3_POS], spi_sequence_config_reg[`SPI2_SPI_SEQUENCE_CONFIG_SPI_SEQUENCE_CONFIG_VALUE2_POS], spi_sequence_config_reg[`SPI2_SPI_SEQUENCE_CONFIG_SPI_SEQUENCE_CONFIG_VALUE1_POS], spi_sequence_config_reg[`SPI2_SPI_SEQUENCE_CONFIG_SPI_SEQUENCE_CONFIG_VALUE0_POS]};
assign spi_sequence_config_flag_o = {spi_sequence_config_reg[`SPI2_SPI_SEQUENCE_CONFIG_SPI_SEQUENCE_CONFIG_FLAG7_POS], spi_sequence_config_reg[`SPI2_SPI_SEQUENCE_CONFIG_SPI_SEQUENCE_CONFIG_FLAG6_POS], spi_sequence_config_reg[`SPI2_SPI_SEQUENCE_CONFIG_SPI_SEQUENCE_CONFIG_FLAG5_POS], spi_sequence_config_reg[`SPI2_SPI_SEQUENCE_CONFIG_SPI_SEQUENCE_CONFIG_FLAG4_POS], spi_sequence_config_reg[`SPI2_SPI_SEQUENCE_CONFIG_SPI_SEQUENCE_CONFIG_FLAG3_POS], spi_sequence_config_reg[`SPI2_SPI_SEQUENCE_CONFIG_SPI_SEQUENCE_CONFIG_FLAG2_POS], spi_sequence_config_reg[`SPI2_SPI_SEQUENCE_CONFIG_SPI_SEQUENCE_CONFIG_FLAG1_POS], spi_sequence_config_reg[`SPI2_SPI_SEQUENCE_CONFIG_SPI_SEQUENCE_CONFIG_FLAG0_POS]};
assign spi_sequence_status_control_o = {spi_sequence_status_reg[`SPI2_SPI_SEQUENCE_STATUS_SPI_SEQUENCE_STATUS_CONTROL7_POS], spi_sequence_status_reg[`SPI2_SPI_SEQUENCE_STATUS_SPI_SEQUENCE_STATUS_CONTROL6_POS], spi_sequence_status_reg[`SPI2_SPI_SEQUENCE_STATUS_SPI_SEQUENCE_STATUS_CONTROL5_POS], spi_sequence_status_reg[`SPI2_SPI_SEQUENCE_STATUS_SPI_SEQUENCE_STATUS_CONTROL4_POS], spi_sequence_status_reg[`SPI2_SPI_SEQUENCE_STATUS_SPI_SEQUENCE_STATUS_CONTROL3_POS], spi_sequence_status_reg[`SPI2_SPI_SEQUENCE_STATUS_SPI_SEQUENCE_STATUS_CONTROL2_POS], spi_sequence_status_reg[`SPI2_SPI_SEQUENCE_STATUS_SPI_SEQUENCE_STATUS_CONTROL1_POS], spi_sequence_status_reg[`SPI2_SPI_SEQUENCE_STATUS_SPI_SEQUENCE_STATUS_CONTROL0_POS]};
assign spi_sequence_status_config_o = {spi_sequence_status_reg[`SPI2_SPI_SEQUENCE_STATUS_SPI_SEQUENCE_STATUS_CONFIG7_POS], spi_sequence_status_reg[`SPI2_SPI_SEQUENCE_STATUS_SPI_SEQUENCE_STATUS_CONFIG6_POS], spi_sequence_status_reg[`SPI2_SPI_SEQUENCE_STATUS_SPI_SEQUENCE_STATUS_CONFIG5_POS], spi_sequence_status_reg[`SPI2_SPI_SEQUENCE_STATUS_SPI_SEQUENCE_STATUS_CONFIG4_POS], spi_sequence_status_reg[`SPI2_SPI_SEQUENCE_STATUS_SPI_SEQUENCE_STATUS_CONFIG3_POS], spi_sequence_status_reg[`SPI2_SPI_SEQUENCE_STATUS_SPI_SEQUENCE_STATUS_CONFIG2_POS], spi_sequence_status_reg[`SPI2_SPI_SEQUENCE_STATUS_SPI_SEQUENCE_STATUS_CONFIG1_POS], spi_sequence_status_reg[`SPI2_SPI_SEQUENCE_STATUS_SPI_SEQUENCE_STATUS_CONFIG0_POS]};
assign spi_sequence_status_value_o = {spi_sequence_status_reg[`SPI2_SPI_SEQUENCE_STATUS_SPI_SEQUENCE_STATUS_VALUE7_POS], spi_sequence_status_reg[`SPI2_SPI_SEQUENCE_STATUS_SPI_SEQUENCE_STATUS_VALUE6_POS], spi_sequence_status_reg[`SPI2_SPI_SEQUENCE_STATUS_SPI_SEQUENCE_STATUS_VALUE5_POS], spi_sequence_status_reg[`SPI2_SPI_SEQUENCE_STATUS_SPI_SEQUENCE_STATUS_VALUE4_POS], spi_sequence_status_reg[`SPI2_SPI_SEQUENCE_STATUS_SPI_SEQUENCE_STATUS_VALUE3_POS], spi_sequence_status_reg[`SPI2_SPI_SEQUENCE_STATUS_SPI_SEQUENCE_STATUS_VALUE2_POS], spi_sequence_status_reg[`SPI2_SPI_SEQUENCE_STATUS_SPI_SEQUENCE_STATUS_VALUE1_POS], spi_sequence_status_reg[`SPI2_SPI_SEQUENCE_STATUS_SPI_SEQUENCE_STATUS_VALUE0_POS]};
assign spi_sequence_status_flag_o = {spi_sequence_status_reg[`SPI2_SPI_SEQUENCE_STATUS_SPI_SEQUENCE_STATUS_FLAG7_POS], spi_sequence_status_reg[`SPI2_SPI_SEQUENCE_STATUS_SPI_SEQUENCE_STATUS_FLAG6_POS], spi_sequence_status_reg[`SPI2_SPI_SEQUENCE_STATUS_SPI_SEQUENCE_STATUS_FLAG5_POS], spi_sequence_status_reg[`SPI2_SPI_SEQUENCE_STATUS_SPI_SEQUENCE_STATUS_FLAG4_POS], spi_sequence_status_reg[`SPI2_SPI_SEQUENCE_STATUS_SPI_SEQUENCE_STATUS_FLAG3_POS], spi_sequence_status_reg[`SPI2_SPI_SEQUENCE_STATUS_SPI_SEQUENCE_STATUS_FLAG2_POS], spi_sequence_status_reg[`SPI2_SPI_SEQUENCE_STATUS_SPI_SEQUENCE_STATUS_FLAG1_POS], spi_sequence_status_reg[`SPI2_SPI_SEQUENCE_STATUS_SPI_SEQUENCE_STATUS_FLAG0_POS]};
assign spi_buffer_config_control_o = {spi_buffer_config_reg[`SPI2_SPI_BUFFER_CONFIG_SPI_BUFFER_CONFIG_CONTROL7_POS], spi_buffer_config_reg[`SPI2_SPI_BUFFER_CONFIG_SPI_BUFFER_CONFIG_CONTROL6_POS], spi_buffer_config_reg[`SPI2_SPI_BUFFER_CONFIG_SPI_BUFFER_CONFIG_CONTROL5_POS], spi_buffer_config_reg[`SPI2_SPI_BUFFER_CONFIG_SPI_BUFFER_CONFIG_CONTROL4_POS], spi_buffer_config_reg[`SPI2_SPI_BUFFER_CONFIG_SPI_BUFFER_CONFIG_CONTROL3_POS], spi_buffer_config_reg[`SPI2_SPI_BUFFER_CONFIG_SPI_BUFFER_CONFIG_CONTROL2_POS], spi_buffer_config_reg[`SPI2_SPI_BUFFER_CONFIG_SPI_BUFFER_CONFIG_CONTROL1_POS], spi_buffer_config_reg[`SPI2_SPI_BUFFER_CONFIG_SPI_BUFFER_CONFIG_CONTROL0_POS]};
assign spi_buffer_config_config_o = {spi_buffer_config_reg[`SPI2_SPI_BUFFER_CONFIG_SPI_BUFFER_CONFIG_CONFIG7_POS], spi_buffer_config_reg[`SPI2_SPI_BUFFER_CONFIG_SPI_BUFFER_CONFIG_CONFIG6_POS], spi_buffer_config_reg[`SPI2_SPI_BUFFER_CONFIG_SPI_BUFFER_CONFIG_CONFIG5_POS], spi_buffer_config_reg[`SPI2_SPI_BUFFER_CONFIG_SPI_BUFFER_CONFIG_CONFIG4_POS], spi_buffer_config_reg[`SPI2_SPI_BUFFER_CONFIG_SPI_BUFFER_CONFIG_CONFIG3_POS], spi_buffer_config_reg[`SPI2_SPI_BUFFER_CONFIG_SPI_BUFFER_CONFIG_CONFIG2_POS], spi_buffer_config_reg[`SPI2_SPI_BUFFER_CONFIG_SPI_BUFFER_CONFIG_CONFIG1_POS], spi_buffer_config_reg[`SPI2_SPI_BUFFER_CONFIG_SPI_BUFFER_CONFIG_CONFIG0_POS]};
assign spi_buffer_config_value_o = {spi_buffer_config_reg[`SPI2_SPI_BUFFER_CONFIG_SPI_BUFFER_CONFIG_VALUE7_POS], spi_buffer_config_reg[`SPI2_SPI_BUFFER_CONFIG_SPI_BUFFER_CONFIG_VALUE6_POS], spi_buffer_config_reg[`SPI2_SPI_BUFFER_CONFIG_SPI_BUFFER_CONFIG_VALUE5_POS], spi_buffer_config_reg[`SPI2_SPI_BUFFER_CONFIG_SPI_BUFFER_CONFIG_VALUE4_POS], spi_buffer_config_reg[`SPI2_SPI_BUFFER_CONFIG_SPI_BUFFER_CONFIG_VALUE3_POS], spi_buffer_config_reg[`SPI2_SPI_BUFFER_CONFIG_SPI_BUFFER_CONFIG_VALUE2_POS], spi_buffer_config_reg[`SPI2_SPI_BUFFER_CONFIG_SPI_BUFFER_CONFIG_VALUE1_POS], spi_buffer_config_reg[`SPI2_SPI_BUFFER_CONFIG_SPI_BUFFER_CONFIG_VALUE0_POS]};
assign spi_buffer_config_flag_o = {spi_buffer_config_reg[`SPI2_SPI_BUFFER_CONFIG_SPI_BUFFER_CONFIG_FLAG7_POS], spi_buffer_config_reg[`SPI2_SPI_BUFFER_CONFIG_SPI_BUFFER_CONFIG_FLAG6_POS], spi_buffer_config_reg[`SPI2_SPI_BUFFER_CONFIG_SPI_BUFFER_CONFIG_FLAG5_POS], spi_buffer_config_reg[`SPI2_SPI_BUFFER_CONFIG_SPI_BUFFER_CONFIG_FLAG4_POS], spi_buffer_config_reg[`SPI2_SPI_BUFFER_CONFIG_SPI_BUFFER_CONFIG_FLAG3_POS], spi_buffer_config_reg[`SPI2_SPI_BUFFER_CONFIG_SPI_BUFFER_CONFIG_FLAG2_POS], spi_buffer_config_reg[`SPI2_SPI_BUFFER_CONFIG_SPI_BUFFER_CONFIG_FLAG1_POS], spi_buffer_config_reg[`SPI2_SPI_BUFFER_CONFIG_SPI_BUFFER_CONFIG_FLAG0_POS]};
assign spi_buffer_status_control_o = {spi_buffer_status_reg[`SPI2_SPI_BUFFER_STATUS_SPI_BUFFER_STATUS_CONTROL7_POS], spi_buffer_status_reg[`SPI2_SPI_BUFFER_STATUS_SPI_BUFFER_STATUS_CONTROL6_POS], spi_buffer_status_reg[`SPI2_SPI_BUFFER_STATUS_SPI_BUFFER_STATUS_CONTROL5_POS], spi_buffer_status_reg[`SPI2_SPI_BUFFER_STATUS_SPI_BUFFER_STATUS_CONTROL4_POS], spi_buffer_status_reg[`SPI2_SPI_BUFFER_STATUS_SPI_BUFFER_STATUS_CONTROL3_POS], spi_buffer_status_reg[`SPI2_SPI_BUFFER_STATUS_SPI_BUFFER_STATUS_CONTROL2_POS], spi_buffer_status_reg[`SPI2_SPI_BUFFER_STATUS_SPI_BUFFER_STATUS_CONTROL1_POS], spi_buffer_status_reg[`SPI2_SPI_BUFFER_STATUS_SPI_BUFFER_STATUS_CONTROL0_POS]};
assign spi_buffer_status_config_o = {spi_buffer_status_reg[`SPI2_SPI_BUFFER_STATUS_SPI_BUFFER_STATUS_CONFIG7_POS], spi_buffer_status_reg[`SPI2_SPI_BUFFER_STATUS_SPI_BUFFER_STATUS_CONFIG6_POS], spi_buffer_status_reg[`SPI2_SPI_BUFFER_STATUS_SPI_BUFFER_STATUS_CONFIG5_POS], spi_buffer_status_reg[`SPI2_SPI_BUFFER_STATUS_SPI_BUFFER_STATUS_CONFIG4_POS], spi_buffer_status_reg[`SPI2_SPI_BUFFER_STATUS_SPI_BUFFER_STATUS_CONFIG3_POS], spi_buffer_status_reg[`SPI2_SPI_BUFFER_STATUS_SPI_BUFFER_STATUS_CONFIG2_POS], spi_buffer_status_reg[`SPI2_SPI_BUFFER_STATUS_SPI_BUFFER_STATUS_CONFIG1_POS], spi_buffer_status_reg[`SPI2_SPI_BUFFER_STATUS_SPI_BUFFER_STATUS_CONFIG0_POS]};
assign spi_buffer_status_value_o = {spi_buffer_status_reg[`SPI2_SPI_BUFFER_STATUS_SPI_BUFFER_STATUS_VALUE7_POS], spi_buffer_status_reg[`SPI2_SPI_BUFFER_STATUS_SPI_BUFFER_STATUS_VALUE6_POS], spi_buffer_status_reg[`SPI2_SPI_BUFFER_STATUS_SPI_BUFFER_STATUS_VALUE5_POS], spi_buffer_status_reg[`SPI2_SPI_BUFFER_STATUS_SPI_BUFFER_STATUS_VALUE4_POS], spi_buffer_status_reg[`SPI2_SPI_BUFFER_STATUS_SPI_BUFFER_STATUS_VALUE3_POS], spi_buffer_status_reg[`SPI2_SPI_BUFFER_STATUS_SPI_BUFFER_STATUS_VALUE2_POS], spi_buffer_status_reg[`SPI2_SPI_BUFFER_STATUS_SPI_BUFFER_STATUS_VALUE1_POS], spi_buffer_status_reg[`SPI2_SPI_BUFFER_STATUS_SPI_BUFFER_STATUS_VALUE0_POS]};
assign spi_buffer_status_flag_o = {spi_buffer_status_reg[`SPI2_SPI_BUFFER_STATUS_SPI_BUFFER_STATUS_FLAG7_POS], spi_buffer_status_reg[`SPI2_SPI_BUFFER_STATUS_SPI_BUFFER_STATUS_FLAG6_POS], spi_buffer_status_reg[`SPI2_SPI_BUFFER_STATUS_SPI_BUFFER_STATUS_FLAG5_POS], spi_buffer_status_reg[`SPI2_SPI_BUFFER_STATUS_SPI_BUFFER_STATUS_FLAG4_POS], spi_buffer_status_reg[`SPI2_SPI_BUFFER_STATUS_SPI_BUFFER_STATUS_FLAG3_POS], spi_buffer_status_reg[`SPI2_SPI_BUFFER_STATUS_SPI_BUFFER_STATUS_FLAG2_POS], spi_buffer_status_reg[`SPI2_SPI_BUFFER_STATUS_SPI_BUFFER_STATUS_FLAG1_POS], spi_buffer_status_reg[`SPI2_SPI_BUFFER_STATUS_SPI_BUFFER_STATUS_FLAG0_POS]};
assign spi_queue_control_control_o = {spi_queue_control_reg[`SPI2_SPI_QUEUE_CONTROL_SPI_QUEUE_CONTROL_CONTROL7_POS], spi_queue_control_reg[`SPI2_SPI_QUEUE_CONTROL_SPI_QUEUE_CONTROL_CONTROL6_POS], spi_queue_control_reg[`SPI2_SPI_QUEUE_CONTROL_SPI_QUEUE_CONTROL_CONTROL5_POS], spi_queue_control_reg[`SPI2_SPI_QUEUE_CONTROL_SPI_QUEUE_CONTROL_CONTROL4_POS], spi_queue_control_reg[`SPI2_SPI_QUEUE_CONTROL_SPI_QUEUE_CONTROL_CONTROL3_POS], spi_queue_control_reg[`SPI2_SPI_QUEUE_CONTROL_SPI_QUEUE_CONTROL_CONTROL2_POS], spi_queue_control_reg[`SPI2_SPI_QUEUE_CONTROL_SPI_QUEUE_CONTROL_CONTROL1_POS], spi_queue_control_reg[`SPI2_SPI_QUEUE_CONTROL_SPI_QUEUE_CONTROL_CONTROL0_POS]};
assign spi_queue_control_config_o = {spi_queue_control_reg[`SPI2_SPI_QUEUE_CONTROL_SPI_QUEUE_CONTROL_CONFIG7_POS], spi_queue_control_reg[`SPI2_SPI_QUEUE_CONTROL_SPI_QUEUE_CONTROL_CONFIG6_POS], spi_queue_control_reg[`SPI2_SPI_QUEUE_CONTROL_SPI_QUEUE_CONTROL_CONFIG5_POS], spi_queue_control_reg[`SPI2_SPI_QUEUE_CONTROL_SPI_QUEUE_CONTROL_CONFIG4_POS], spi_queue_control_reg[`SPI2_SPI_QUEUE_CONTROL_SPI_QUEUE_CONTROL_CONFIG3_POS], spi_queue_control_reg[`SPI2_SPI_QUEUE_CONTROL_SPI_QUEUE_CONTROL_CONFIG2_POS], spi_queue_control_reg[`SPI2_SPI_QUEUE_CONTROL_SPI_QUEUE_CONTROL_CONFIG1_POS], spi_queue_control_reg[`SPI2_SPI_QUEUE_CONTROL_SPI_QUEUE_CONTROL_CONFIG0_POS]};
assign spi_queue_control_value_o = {spi_queue_control_reg[`SPI2_SPI_QUEUE_CONTROL_SPI_QUEUE_CONTROL_VALUE7_POS], spi_queue_control_reg[`SPI2_SPI_QUEUE_CONTROL_SPI_QUEUE_CONTROL_VALUE6_POS], spi_queue_control_reg[`SPI2_SPI_QUEUE_CONTROL_SPI_QUEUE_CONTROL_VALUE5_POS], spi_queue_control_reg[`SPI2_SPI_QUEUE_CONTROL_SPI_QUEUE_CONTROL_VALUE4_POS], spi_queue_control_reg[`SPI2_SPI_QUEUE_CONTROL_SPI_QUEUE_CONTROL_VALUE3_POS], spi_queue_control_reg[`SPI2_SPI_QUEUE_CONTROL_SPI_QUEUE_CONTROL_VALUE2_POS], spi_queue_control_reg[`SPI2_SPI_QUEUE_CONTROL_SPI_QUEUE_CONTROL_VALUE1_POS], spi_queue_control_reg[`SPI2_SPI_QUEUE_CONTROL_SPI_QUEUE_CONTROL_VALUE0_POS]};
assign spi_queue_control_flag_o = {spi_queue_control_reg[`SPI2_SPI_QUEUE_CONTROL_SPI_QUEUE_CONTROL_FLAG7_POS], spi_queue_control_reg[`SPI2_SPI_QUEUE_CONTROL_SPI_QUEUE_CONTROL_FLAG6_POS], spi_queue_control_reg[`SPI2_SPI_QUEUE_CONTROL_SPI_QUEUE_CONTROL_FLAG5_POS], spi_queue_control_reg[`SPI2_SPI_QUEUE_CONTROL_SPI_QUEUE_CONTROL_FLAG4_POS], spi_queue_control_reg[`SPI2_SPI_QUEUE_CONTROL_SPI_QUEUE_CONTROL_FLAG3_POS], spi_queue_control_reg[`SPI2_SPI_QUEUE_CONTROL_SPI_QUEUE_CONTROL_FLAG2_POS], spi_queue_control_reg[`SPI2_SPI_QUEUE_CONTROL_SPI_QUEUE_CONTROL_FLAG1_POS], spi_queue_control_reg[`SPI2_SPI_QUEUE_CONTROL_SPI_QUEUE_CONTROL_FLAG0_POS]};
assign spi_queue_status_control_o = {spi_queue_status_reg[`SPI2_SPI_QUEUE_STATUS_SPI_QUEUE_STATUS_CONTROL7_POS], spi_queue_status_reg[`SPI2_SPI_QUEUE_STATUS_SPI_QUEUE_STATUS_CONTROL6_POS], spi_queue_status_reg[`SPI2_SPI_QUEUE_STATUS_SPI_QUEUE_STATUS_CONTROL5_POS], spi_queue_status_reg[`SPI2_SPI_QUEUE_STATUS_SPI_QUEUE_STATUS_CONTROL4_POS], spi_queue_status_reg[`SPI2_SPI_QUEUE_STATUS_SPI_QUEUE_STATUS_CONTROL3_POS], spi_queue_status_reg[`SPI2_SPI_QUEUE_STATUS_SPI_QUEUE_STATUS_CONTROL2_POS], spi_queue_status_reg[`SPI2_SPI_QUEUE_STATUS_SPI_QUEUE_STATUS_CONTROL1_POS], spi_queue_status_reg[`SPI2_SPI_QUEUE_STATUS_SPI_QUEUE_STATUS_CONTROL0_POS]};
assign spi_queue_status_config_o = {spi_queue_status_reg[`SPI2_SPI_QUEUE_STATUS_SPI_QUEUE_STATUS_CONFIG7_POS], spi_queue_status_reg[`SPI2_SPI_QUEUE_STATUS_SPI_QUEUE_STATUS_CONFIG6_POS], spi_queue_status_reg[`SPI2_SPI_QUEUE_STATUS_SPI_QUEUE_STATUS_CONFIG5_POS], spi_queue_status_reg[`SPI2_SPI_QUEUE_STATUS_SPI_QUEUE_STATUS_CONFIG4_POS], spi_queue_status_reg[`SPI2_SPI_QUEUE_STATUS_SPI_QUEUE_STATUS_CONFIG3_POS], spi_queue_status_reg[`SPI2_SPI_QUEUE_STATUS_SPI_QUEUE_STATUS_CONFIG2_POS], spi_queue_status_reg[`SPI2_SPI_QUEUE_STATUS_SPI_QUEUE_STATUS_CONFIG1_POS], spi_queue_status_reg[`SPI2_SPI_QUEUE_STATUS_SPI_QUEUE_STATUS_CONFIG0_POS]};
assign spi_queue_status_value_o = {spi_queue_status_reg[`SPI2_SPI_QUEUE_STATUS_SPI_QUEUE_STATUS_VALUE7_POS], spi_queue_status_reg[`SPI2_SPI_QUEUE_STATUS_SPI_QUEUE_STATUS_VALUE6_POS], spi_queue_status_reg[`SPI2_SPI_QUEUE_STATUS_SPI_QUEUE_STATUS_VALUE5_POS], spi_queue_status_reg[`SPI2_SPI_QUEUE_STATUS_SPI_QUEUE_STATUS_VALUE4_POS], spi_queue_status_reg[`SPI2_SPI_QUEUE_STATUS_SPI_QUEUE_STATUS_VALUE3_POS], spi_queue_status_reg[`SPI2_SPI_QUEUE_STATUS_SPI_QUEUE_STATUS_VALUE2_POS], spi_queue_status_reg[`SPI2_SPI_QUEUE_STATUS_SPI_QUEUE_STATUS_VALUE1_POS], spi_queue_status_reg[`SPI2_SPI_QUEUE_STATUS_SPI_QUEUE_STATUS_VALUE0_POS]};
assign spi_queue_status_flag_o = {spi_queue_status_reg[`SPI2_SPI_QUEUE_STATUS_SPI_QUEUE_STATUS_FLAG7_POS], spi_queue_status_reg[`SPI2_SPI_QUEUE_STATUS_SPI_QUEUE_STATUS_FLAG6_POS], spi_queue_status_reg[`SPI2_SPI_QUEUE_STATUS_SPI_QUEUE_STATUS_FLAG5_POS], spi_queue_status_reg[`SPI2_SPI_QUEUE_STATUS_SPI_QUEUE_STATUS_FLAG4_POS], spi_queue_status_reg[`SPI2_SPI_QUEUE_STATUS_SPI_QUEUE_STATUS_FLAG3_POS], spi_queue_status_reg[`SPI2_SPI_QUEUE_STATUS_SPI_QUEUE_STATUS_FLAG2_POS], spi_queue_status_reg[`SPI2_SPI_QUEUE_STATUS_SPI_QUEUE_STATUS_FLAG1_POS], spi_queue_status_reg[`SPI2_SPI_QUEUE_STATUS_SPI_QUEUE_STATUS_FLAG0_POS]};
assign spi_arbitration_control_o = {spi_arbitration_reg[`SPI2_SPI_ARBITRATION_SPI_ARBITRATION_CONTROL7_POS], spi_arbitration_reg[`SPI2_SPI_ARBITRATION_SPI_ARBITRATION_CONTROL6_POS], spi_arbitration_reg[`SPI2_SPI_ARBITRATION_SPI_ARBITRATION_CONTROL5_POS], spi_arbitration_reg[`SPI2_SPI_ARBITRATION_SPI_ARBITRATION_CONTROL4_POS], spi_arbitration_reg[`SPI2_SPI_ARBITRATION_SPI_ARBITRATION_CONTROL3_POS], spi_arbitration_reg[`SPI2_SPI_ARBITRATION_SPI_ARBITRATION_CONTROL2_POS], spi_arbitration_reg[`SPI2_SPI_ARBITRATION_SPI_ARBITRATION_CONTROL1_POS], spi_arbitration_reg[`SPI2_SPI_ARBITRATION_SPI_ARBITRATION_CONTROL0_POS]};
assign spi_arbitration_config_o = {spi_arbitration_reg[`SPI2_SPI_ARBITRATION_SPI_ARBITRATION_CONFIG7_POS], spi_arbitration_reg[`SPI2_SPI_ARBITRATION_SPI_ARBITRATION_CONFIG6_POS], spi_arbitration_reg[`SPI2_SPI_ARBITRATION_SPI_ARBITRATION_CONFIG5_POS], spi_arbitration_reg[`SPI2_SPI_ARBITRATION_SPI_ARBITRATION_CONFIG4_POS], spi_arbitration_reg[`SPI2_SPI_ARBITRATION_SPI_ARBITRATION_CONFIG3_POS], spi_arbitration_reg[`SPI2_SPI_ARBITRATION_SPI_ARBITRATION_CONFIG2_POS], spi_arbitration_reg[`SPI2_SPI_ARBITRATION_SPI_ARBITRATION_CONFIG1_POS], spi_arbitration_reg[`SPI2_SPI_ARBITRATION_SPI_ARBITRATION_CONFIG0_POS]};
assign spi_arbitration_value_o = {spi_arbitration_reg[`SPI2_SPI_ARBITRATION_SPI_ARBITRATION_VALUE7_POS], spi_arbitration_reg[`SPI2_SPI_ARBITRATION_SPI_ARBITRATION_VALUE6_POS], spi_arbitration_reg[`SPI2_SPI_ARBITRATION_SPI_ARBITRATION_VALUE5_POS], spi_arbitration_reg[`SPI2_SPI_ARBITRATION_SPI_ARBITRATION_VALUE4_POS], spi_arbitration_reg[`SPI2_SPI_ARBITRATION_SPI_ARBITRATION_VALUE3_POS], spi_arbitration_reg[`SPI2_SPI_ARBITRATION_SPI_ARBITRATION_VALUE2_POS], spi_arbitration_reg[`SPI2_SPI_ARBITRATION_SPI_ARBITRATION_VALUE1_POS], spi_arbitration_reg[`SPI2_SPI_ARBITRATION_SPI_ARBITRATION_VALUE0_POS]};
assign spi_arbitration_flag_o = {spi_arbitration_reg[`SPI2_SPI_ARBITRATION_SPI_ARBITRATION_FLAG7_POS], spi_arbitration_reg[`SPI2_SPI_ARBITRATION_SPI_ARBITRATION_FLAG6_POS], spi_arbitration_reg[`SPI2_SPI_ARBITRATION_SPI_ARBITRATION_FLAG5_POS], spi_arbitration_reg[`SPI2_SPI_ARBITRATION_SPI_ARBITRATION_FLAG4_POS], spi_arbitration_reg[`SPI2_SPI_ARBITRATION_SPI_ARBITRATION_FLAG3_POS], spi_arbitration_reg[`SPI2_SPI_ARBITRATION_SPI_ARBITRATION_FLAG2_POS], spi_arbitration_reg[`SPI2_SPI_ARBITRATION_SPI_ARBITRATION_FLAG1_POS], spi_arbitration_reg[`SPI2_SPI_ARBITRATION_SPI_ARBITRATION_FLAG0_POS]};
assign spi_arbitration_status_control_o = {spi_arbitration_status_reg[`SPI2_SPI_ARBITRATION_STATUS_SPI_ARBITRATION_STATUS_CONTROL7_POS], spi_arbitration_status_reg[`SPI2_SPI_ARBITRATION_STATUS_SPI_ARBITRATION_STATUS_CONTROL6_POS], spi_arbitration_status_reg[`SPI2_SPI_ARBITRATION_STATUS_SPI_ARBITRATION_STATUS_CONTROL5_POS], spi_arbitration_status_reg[`SPI2_SPI_ARBITRATION_STATUS_SPI_ARBITRATION_STATUS_CONTROL4_POS], spi_arbitration_status_reg[`SPI2_SPI_ARBITRATION_STATUS_SPI_ARBITRATION_STATUS_CONTROL3_POS], spi_arbitration_status_reg[`SPI2_SPI_ARBITRATION_STATUS_SPI_ARBITRATION_STATUS_CONTROL2_POS], spi_arbitration_status_reg[`SPI2_SPI_ARBITRATION_STATUS_SPI_ARBITRATION_STATUS_CONTROL1_POS], spi_arbitration_status_reg[`SPI2_SPI_ARBITRATION_STATUS_SPI_ARBITRATION_STATUS_CONTROL0_POS]};
assign spi_arbitration_status_config_o = {spi_arbitration_status_reg[`SPI2_SPI_ARBITRATION_STATUS_SPI_ARBITRATION_STATUS_CONFIG7_POS], spi_arbitration_status_reg[`SPI2_SPI_ARBITRATION_STATUS_SPI_ARBITRATION_STATUS_CONFIG6_POS], spi_arbitration_status_reg[`SPI2_SPI_ARBITRATION_STATUS_SPI_ARBITRATION_STATUS_CONFIG5_POS], spi_arbitration_status_reg[`SPI2_SPI_ARBITRATION_STATUS_SPI_ARBITRATION_STATUS_CONFIG4_POS], spi_arbitration_status_reg[`SPI2_SPI_ARBITRATION_STATUS_SPI_ARBITRATION_STATUS_CONFIG3_POS], spi_arbitration_status_reg[`SPI2_SPI_ARBITRATION_STATUS_SPI_ARBITRATION_STATUS_CONFIG2_POS], spi_arbitration_status_reg[`SPI2_SPI_ARBITRATION_STATUS_SPI_ARBITRATION_STATUS_CONFIG1_POS], spi_arbitration_status_reg[`SPI2_SPI_ARBITRATION_STATUS_SPI_ARBITRATION_STATUS_CONFIG0_POS]};
assign spi_arbitration_status_value_o = {spi_arbitration_status_reg[`SPI2_SPI_ARBITRATION_STATUS_SPI_ARBITRATION_STATUS_VALUE7_POS], spi_arbitration_status_reg[`SPI2_SPI_ARBITRATION_STATUS_SPI_ARBITRATION_STATUS_VALUE6_POS], spi_arbitration_status_reg[`SPI2_SPI_ARBITRATION_STATUS_SPI_ARBITRATION_STATUS_VALUE5_POS], spi_arbitration_status_reg[`SPI2_SPI_ARBITRATION_STATUS_SPI_ARBITRATION_STATUS_VALUE4_POS], spi_arbitration_status_reg[`SPI2_SPI_ARBITRATION_STATUS_SPI_ARBITRATION_STATUS_VALUE3_POS], spi_arbitration_status_reg[`SPI2_SPI_ARBITRATION_STATUS_SPI_ARBITRATION_STATUS_VALUE2_POS], spi_arbitration_status_reg[`SPI2_SPI_ARBITRATION_STATUS_SPI_ARBITRATION_STATUS_VALUE1_POS], spi_arbitration_status_reg[`SPI2_SPI_ARBITRATION_STATUS_SPI_ARBITRATION_STATUS_VALUE0_POS]};
assign spi_arbitration_status_flag_o = {spi_arbitration_status_reg[`SPI2_SPI_ARBITRATION_STATUS_SPI_ARBITRATION_STATUS_FLAG7_POS], spi_arbitration_status_reg[`SPI2_SPI_ARBITRATION_STATUS_SPI_ARBITRATION_STATUS_FLAG6_POS], spi_arbitration_status_reg[`SPI2_SPI_ARBITRATION_STATUS_SPI_ARBITRATION_STATUS_FLAG5_POS], spi_arbitration_status_reg[`SPI2_SPI_ARBITRATION_STATUS_SPI_ARBITRATION_STATUS_FLAG4_POS], spi_arbitration_status_reg[`SPI2_SPI_ARBITRATION_STATUS_SPI_ARBITRATION_STATUS_FLAG3_POS], spi_arbitration_status_reg[`SPI2_SPI_ARBITRATION_STATUS_SPI_ARBITRATION_STATUS_FLAG2_POS], spi_arbitration_status_reg[`SPI2_SPI_ARBITRATION_STATUS_SPI_ARBITRATION_STATUS_FLAG1_POS], spi_arbitration_status_reg[`SPI2_SPI_ARBITRATION_STATUS_SPI_ARBITRATION_STATUS_FLAG0_POS]};
assign spi_slave_config_control_o = {spi_slave_config_reg[`SPI2_SPI_SLAVE_CONFIG_SPI_SLAVE_CONFIG_CONTROL7_POS], spi_slave_config_reg[`SPI2_SPI_SLAVE_CONFIG_SPI_SLAVE_CONFIG_CONTROL6_POS], spi_slave_config_reg[`SPI2_SPI_SLAVE_CONFIG_SPI_SLAVE_CONFIG_CONTROL5_POS], spi_slave_config_reg[`SPI2_SPI_SLAVE_CONFIG_SPI_SLAVE_CONFIG_CONTROL4_POS], spi_slave_config_reg[`SPI2_SPI_SLAVE_CONFIG_SPI_SLAVE_CONFIG_CONTROL3_POS], spi_slave_config_reg[`SPI2_SPI_SLAVE_CONFIG_SPI_SLAVE_CONFIG_CONTROL2_POS], spi_slave_config_reg[`SPI2_SPI_SLAVE_CONFIG_SPI_SLAVE_CONFIG_CONTROL1_POS], spi_slave_config_reg[`SPI2_SPI_SLAVE_CONFIG_SPI_SLAVE_CONFIG_CONTROL0_POS]};
assign spi_slave_config_config_o = {spi_slave_config_reg[`SPI2_SPI_SLAVE_CONFIG_SPI_SLAVE_CONFIG_CONFIG7_POS], spi_slave_config_reg[`SPI2_SPI_SLAVE_CONFIG_SPI_SLAVE_CONFIG_CONFIG6_POS], spi_slave_config_reg[`SPI2_SPI_SLAVE_CONFIG_SPI_SLAVE_CONFIG_CONFIG5_POS], spi_slave_config_reg[`SPI2_SPI_SLAVE_CONFIG_SPI_SLAVE_CONFIG_CONFIG4_POS], spi_slave_config_reg[`SPI2_SPI_SLAVE_CONFIG_SPI_SLAVE_CONFIG_CONFIG3_POS], spi_slave_config_reg[`SPI2_SPI_SLAVE_CONFIG_SPI_SLAVE_CONFIG_CONFIG2_POS], spi_slave_config_reg[`SPI2_SPI_SLAVE_CONFIG_SPI_SLAVE_CONFIG_CONFIG1_POS], spi_slave_config_reg[`SPI2_SPI_SLAVE_CONFIG_SPI_SLAVE_CONFIG_CONFIG0_POS]};
assign spi_slave_config_value_o = {spi_slave_config_reg[`SPI2_SPI_SLAVE_CONFIG_SPI_SLAVE_CONFIG_VALUE7_POS], spi_slave_config_reg[`SPI2_SPI_SLAVE_CONFIG_SPI_SLAVE_CONFIG_VALUE6_POS], spi_slave_config_reg[`SPI2_SPI_SLAVE_CONFIG_SPI_SLAVE_CONFIG_VALUE5_POS], spi_slave_config_reg[`SPI2_SPI_SLAVE_CONFIG_SPI_SLAVE_CONFIG_VALUE4_POS], spi_slave_config_reg[`SPI2_SPI_SLAVE_CONFIG_SPI_SLAVE_CONFIG_VALUE3_POS], spi_slave_config_reg[`SPI2_SPI_SLAVE_CONFIG_SPI_SLAVE_CONFIG_VALUE2_POS], spi_slave_config_reg[`SPI2_SPI_SLAVE_CONFIG_SPI_SLAVE_CONFIG_VALUE1_POS], spi_slave_config_reg[`SPI2_SPI_SLAVE_CONFIG_SPI_SLAVE_CONFIG_VALUE0_POS]};
assign spi_slave_config_flag_o = {spi_slave_config_reg[`SPI2_SPI_SLAVE_CONFIG_SPI_SLAVE_CONFIG_FLAG7_POS], spi_slave_config_reg[`SPI2_SPI_SLAVE_CONFIG_SPI_SLAVE_CONFIG_FLAG6_POS], spi_slave_config_reg[`SPI2_SPI_SLAVE_CONFIG_SPI_SLAVE_CONFIG_FLAG5_POS], spi_slave_config_reg[`SPI2_SPI_SLAVE_CONFIG_SPI_SLAVE_CONFIG_FLAG4_POS], spi_slave_config_reg[`SPI2_SPI_SLAVE_CONFIG_SPI_SLAVE_CONFIG_FLAG3_POS], spi_slave_config_reg[`SPI2_SPI_SLAVE_CONFIG_SPI_SLAVE_CONFIG_FLAG2_POS], spi_slave_config_reg[`SPI2_SPI_SLAVE_CONFIG_SPI_SLAVE_CONFIG_FLAG1_POS], spi_slave_config_reg[`SPI2_SPI_SLAVE_CONFIG_SPI_SLAVE_CONFIG_FLAG0_POS]};
assign spi_slave_status_control_o = {spi_slave_status_reg[`SPI2_SPI_SLAVE_STATUS_SPI_SLAVE_STATUS_CONTROL7_POS], spi_slave_status_reg[`SPI2_SPI_SLAVE_STATUS_SPI_SLAVE_STATUS_CONTROL6_POS], spi_slave_status_reg[`SPI2_SPI_SLAVE_STATUS_SPI_SLAVE_STATUS_CONTROL5_POS], spi_slave_status_reg[`SPI2_SPI_SLAVE_STATUS_SPI_SLAVE_STATUS_CONTROL4_POS], spi_slave_status_reg[`SPI2_SPI_SLAVE_STATUS_SPI_SLAVE_STATUS_CONTROL3_POS], spi_slave_status_reg[`SPI2_SPI_SLAVE_STATUS_SPI_SLAVE_STATUS_CONTROL2_POS], spi_slave_status_reg[`SPI2_SPI_SLAVE_STATUS_SPI_SLAVE_STATUS_CONTROL1_POS], spi_slave_status_reg[`SPI2_SPI_SLAVE_STATUS_SPI_SLAVE_STATUS_CONTROL0_POS]};
assign spi_slave_status_config_o = {spi_slave_status_reg[`SPI2_SPI_SLAVE_STATUS_SPI_SLAVE_STATUS_CONFIG7_POS], spi_slave_status_reg[`SPI2_SPI_SLAVE_STATUS_SPI_SLAVE_STATUS_CONFIG6_POS], spi_slave_status_reg[`SPI2_SPI_SLAVE_STATUS_SPI_SLAVE_STATUS_CONFIG5_POS], spi_slave_status_reg[`SPI2_SPI_SLAVE_STATUS_SPI_SLAVE_STATUS_CONFIG4_POS], spi_slave_status_reg[`SPI2_SPI_SLAVE_STATUS_SPI_SLAVE_STATUS_CONFIG3_POS], spi_slave_status_reg[`SPI2_SPI_SLAVE_STATUS_SPI_SLAVE_STATUS_CONFIG2_POS], spi_slave_status_reg[`SPI2_SPI_SLAVE_STATUS_SPI_SLAVE_STATUS_CONFIG1_POS], spi_slave_status_reg[`SPI2_SPI_SLAVE_STATUS_SPI_SLAVE_STATUS_CONFIG0_POS]};
assign spi_slave_status_value_o = {spi_slave_status_reg[`SPI2_SPI_SLAVE_STATUS_SPI_SLAVE_STATUS_VALUE7_POS], spi_slave_status_reg[`SPI2_SPI_SLAVE_STATUS_SPI_SLAVE_STATUS_VALUE6_POS], spi_slave_status_reg[`SPI2_SPI_SLAVE_STATUS_SPI_SLAVE_STATUS_VALUE5_POS], spi_slave_status_reg[`SPI2_SPI_SLAVE_STATUS_SPI_SLAVE_STATUS_VALUE4_POS], spi_slave_status_reg[`SPI2_SPI_SLAVE_STATUS_SPI_SLAVE_STATUS_VALUE3_POS], spi_slave_status_reg[`SPI2_SPI_SLAVE_STATUS_SPI_SLAVE_STATUS_VALUE2_POS], spi_slave_status_reg[`SPI2_SPI_SLAVE_STATUS_SPI_SLAVE_STATUS_VALUE1_POS], spi_slave_status_reg[`SPI2_SPI_SLAVE_STATUS_SPI_SLAVE_STATUS_VALUE0_POS]};
assign spi_slave_status_flag_o = {spi_slave_status_reg[`SPI2_SPI_SLAVE_STATUS_SPI_SLAVE_STATUS_FLAG7_POS], spi_slave_status_reg[`SPI2_SPI_SLAVE_STATUS_SPI_SLAVE_STATUS_FLAG6_POS], spi_slave_status_reg[`SPI2_SPI_SLAVE_STATUS_SPI_SLAVE_STATUS_FLAG5_POS], spi_slave_status_reg[`SPI2_SPI_SLAVE_STATUS_SPI_SLAVE_STATUS_FLAG4_POS], spi_slave_status_reg[`SPI2_SPI_SLAVE_STATUS_SPI_SLAVE_STATUS_FLAG3_POS], spi_slave_status_reg[`SPI2_SPI_SLAVE_STATUS_SPI_SLAVE_STATUS_FLAG2_POS], spi_slave_status_reg[`SPI2_SPI_SLAVE_STATUS_SPI_SLAVE_STATUS_FLAG1_POS], spi_slave_status_reg[`SPI2_SPI_SLAVE_STATUS_SPI_SLAVE_STATUS_FLAG0_POS]};
assign spi_master_config_control_o = {spi_master_config_reg[`SPI2_SPI_MASTER_CONFIG_SPI_MASTER_CONFIG_CONTROL7_POS], spi_master_config_reg[`SPI2_SPI_MASTER_CONFIG_SPI_MASTER_CONFIG_CONTROL6_POS], spi_master_config_reg[`SPI2_SPI_MASTER_CONFIG_SPI_MASTER_CONFIG_CONTROL5_POS], spi_master_config_reg[`SPI2_SPI_MASTER_CONFIG_SPI_MASTER_CONFIG_CONTROL4_POS], spi_master_config_reg[`SPI2_SPI_MASTER_CONFIG_SPI_MASTER_CONFIG_CONTROL3_POS], spi_master_config_reg[`SPI2_SPI_MASTER_CONFIG_SPI_MASTER_CONFIG_CONTROL2_POS], spi_master_config_reg[`SPI2_SPI_MASTER_CONFIG_SPI_MASTER_CONFIG_CONTROL1_POS], spi_master_config_reg[`SPI2_SPI_MASTER_CONFIG_SPI_MASTER_CONFIG_CONTROL0_POS]};
assign spi_master_config_config_o = {spi_master_config_reg[`SPI2_SPI_MASTER_CONFIG_SPI_MASTER_CONFIG_CONFIG7_POS], spi_master_config_reg[`SPI2_SPI_MASTER_CONFIG_SPI_MASTER_CONFIG_CONFIG6_POS], spi_master_config_reg[`SPI2_SPI_MASTER_CONFIG_SPI_MASTER_CONFIG_CONFIG5_POS], spi_master_config_reg[`SPI2_SPI_MASTER_CONFIG_SPI_MASTER_CONFIG_CONFIG4_POS], spi_master_config_reg[`SPI2_SPI_MASTER_CONFIG_SPI_MASTER_CONFIG_CONFIG3_POS], spi_master_config_reg[`SPI2_SPI_MASTER_CONFIG_SPI_MASTER_CONFIG_CONFIG2_POS], spi_master_config_reg[`SPI2_SPI_MASTER_CONFIG_SPI_MASTER_CONFIG_CONFIG1_POS], spi_master_config_reg[`SPI2_SPI_MASTER_CONFIG_SPI_MASTER_CONFIG_CONFIG0_POS]};
assign spi_master_config_value_o = {spi_master_config_reg[`SPI2_SPI_MASTER_CONFIG_SPI_MASTER_CONFIG_VALUE7_POS], spi_master_config_reg[`SPI2_SPI_MASTER_CONFIG_SPI_MASTER_CONFIG_VALUE6_POS], spi_master_config_reg[`SPI2_SPI_MASTER_CONFIG_SPI_MASTER_CONFIG_VALUE5_POS], spi_master_config_reg[`SPI2_SPI_MASTER_CONFIG_SPI_MASTER_CONFIG_VALUE4_POS], spi_master_config_reg[`SPI2_SPI_MASTER_CONFIG_SPI_MASTER_CONFIG_VALUE3_POS], spi_master_config_reg[`SPI2_SPI_MASTER_CONFIG_SPI_MASTER_CONFIG_VALUE2_POS], spi_master_config_reg[`SPI2_SPI_MASTER_CONFIG_SPI_MASTER_CONFIG_VALUE1_POS], spi_master_config_reg[`SPI2_SPI_MASTER_CONFIG_SPI_MASTER_CONFIG_VALUE0_POS]};
assign spi_master_config_flag_o = {spi_master_config_reg[`SPI2_SPI_MASTER_CONFIG_SPI_MASTER_CONFIG_FLAG7_POS], spi_master_config_reg[`SPI2_SPI_MASTER_CONFIG_SPI_MASTER_CONFIG_FLAG6_POS], spi_master_config_reg[`SPI2_SPI_MASTER_CONFIG_SPI_MASTER_CONFIG_FLAG5_POS], spi_master_config_reg[`SPI2_SPI_MASTER_CONFIG_SPI_MASTER_CONFIG_FLAG4_POS], spi_master_config_reg[`SPI2_SPI_MASTER_CONFIG_SPI_MASTER_CONFIG_FLAG3_POS], spi_master_config_reg[`SPI2_SPI_MASTER_CONFIG_SPI_MASTER_CONFIG_FLAG2_POS], spi_master_config_reg[`SPI2_SPI_MASTER_CONFIG_SPI_MASTER_CONFIG_FLAG1_POS], spi_master_config_reg[`SPI2_SPI_MASTER_CONFIG_SPI_MASTER_CONFIG_FLAG0_POS]};
assign spi_master_status_control_o = {spi_master_status_reg[`SPI2_SPI_MASTER_STATUS_SPI_MASTER_STATUS_CONTROL7_POS], spi_master_status_reg[`SPI2_SPI_MASTER_STATUS_SPI_MASTER_STATUS_CONTROL6_POS], spi_master_status_reg[`SPI2_SPI_MASTER_STATUS_SPI_MASTER_STATUS_CONTROL5_POS], spi_master_status_reg[`SPI2_SPI_MASTER_STATUS_SPI_MASTER_STATUS_CONTROL4_POS], spi_master_status_reg[`SPI2_SPI_MASTER_STATUS_SPI_MASTER_STATUS_CONTROL3_POS], spi_master_status_reg[`SPI2_SPI_MASTER_STATUS_SPI_MASTER_STATUS_CONTROL2_POS], spi_master_status_reg[`SPI2_SPI_MASTER_STATUS_SPI_MASTER_STATUS_CONTROL1_POS], spi_master_status_reg[`SPI2_SPI_MASTER_STATUS_SPI_MASTER_STATUS_CONTROL0_POS]};
assign spi_master_status_config_o = {spi_master_status_reg[`SPI2_SPI_MASTER_STATUS_SPI_MASTER_STATUS_CONFIG7_POS], spi_master_status_reg[`SPI2_SPI_MASTER_STATUS_SPI_MASTER_STATUS_CONFIG6_POS], spi_master_status_reg[`SPI2_SPI_MASTER_STATUS_SPI_MASTER_STATUS_CONFIG5_POS], spi_master_status_reg[`SPI2_SPI_MASTER_STATUS_SPI_MASTER_STATUS_CONFIG4_POS], spi_master_status_reg[`SPI2_SPI_MASTER_STATUS_SPI_MASTER_STATUS_CONFIG3_POS], spi_master_status_reg[`SPI2_SPI_MASTER_STATUS_SPI_MASTER_STATUS_CONFIG2_POS], spi_master_status_reg[`SPI2_SPI_MASTER_STATUS_SPI_MASTER_STATUS_CONFIG1_POS], spi_master_status_reg[`SPI2_SPI_MASTER_STATUS_SPI_MASTER_STATUS_CONFIG0_POS]};
assign spi_master_status_value_o = {spi_master_status_reg[`SPI2_SPI_MASTER_STATUS_SPI_MASTER_STATUS_VALUE7_POS], spi_master_status_reg[`SPI2_SPI_MASTER_STATUS_SPI_MASTER_STATUS_VALUE6_POS], spi_master_status_reg[`SPI2_SPI_MASTER_STATUS_SPI_MASTER_STATUS_VALUE5_POS], spi_master_status_reg[`SPI2_SPI_MASTER_STATUS_SPI_MASTER_STATUS_VALUE4_POS], spi_master_status_reg[`SPI2_SPI_MASTER_STATUS_SPI_MASTER_STATUS_VALUE3_POS], spi_master_status_reg[`SPI2_SPI_MASTER_STATUS_SPI_MASTER_STATUS_VALUE2_POS], spi_master_status_reg[`SPI2_SPI_MASTER_STATUS_SPI_MASTER_STATUS_VALUE1_POS], spi_master_status_reg[`SPI2_SPI_MASTER_STATUS_SPI_MASTER_STATUS_VALUE0_POS]};
assign spi_master_status_flag_o = {spi_master_status_reg[`SPI2_SPI_MASTER_STATUS_SPI_MASTER_STATUS_FLAG7_POS], spi_master_status_reg[`SPI2_SPI_MASTER_STATUS_SPI_MASTER_STATUS_FLAG6_POS], spi_master_status_reg[`SPI2_SPI_MASTER_STATUS_SPI_MASTER_STATUS_FLAG5_POS], spi_master_status_reg[`SPI2_SPI_MASTER_STATUS_SPI_MASTER_STATUS_FLAG4_POS], spi_master_status_reg[`SPI2_SPI_MASTER_STATUS_SPI_MASTER_STATUS_FLAG3_POS], spi_master_status_reg[`SPI2_SPI_MASTER_STATUS_SPI_MASTER_STATUS_FLAG2_POS], spi_master_status_reg[`SPI2_SPI_MASTER_STATUS_SPI_MASTER_STATUS_FLAG1_POS], spi_master_status_reg[`SPI2_SPI_MASTER_STATUS_SPI_MASTER_STATUS_FLAG0_POS]};
assign spi_bus_config_control_o = {spi_bus_config_reg[`SPI2_SPI_BUS_CONFIG_SPI_BUS_CONFIG_CONTROL7_POS], spi_bus_config_reg[`SPI2_SPI_BUS_CONFIG_SPI_BUS_CONFIG_CONTROL6_POS], spi_bus_config_reg[`SPI2_SPI_BUS_CONFIG_SPI_BUS_CONFIG_CONTROL5_POS], spi_bus_config_reg[`SPI2_SPI_BUS_CONFIG_SPI_BUS_CONFIG_CONTROL4_POS], spi_bus_config_reg[`SPI2_SPI_BUS_CONFIG_SPI_BUS_CONFIG_CONTROL3_POS], spi_bus_config_reg[`SPI2_SPI_BUS_CONFIG_SPI_BUS_CONFIG_CONTROL2_POS], spi_bus_config_reg[`SPI2_SPI_BUS_CONFIG_SPI_BUS_CONFIG_CONTROL1_POS], spi_bus_config_reg[`SPI2_SPI_BUS_CONFIG_SPI_BUS_CONFIG_CONTROL0_POS]};
assign spi_bus_config_config_o = {spi_bus_config_reg[`SPI2_SPI_BUS_CONFIG_SPI_BUS_CONFIG_CONFIG7_POS], spi_bus_config_reg[`SPI2_SPI_BUS_CONFIG_SPI_BUS_CONFIG_CONFIG6_POS], spi_bus_config_reg[`SPI2_SPI_BUS_CONFIG_SPI_BUS_CONFIG_CONFIG5_POS], spi_bus_config_reg[`SPI2_SPI_BUS_CONFIG_SPI_BUS_CONFIG_CONFIG4_POS], spi_bus_config_reg[`SPI2_SPI_BUS_CONFIG_SPI_BUS_CONFIG_CONFIG3_POS], spi_bus_config_reg[`SPI2_SPI_BUS_CONFIG_SPI_BUS_CONFIG_CONFIG2_POS], spi_bus_config_reg[`SPI2_SPI_BUS_CONFIG_SPI_BUS_CONFIG_CONFIG1_POS], spi_bus_config_reg[`SPI2_SPI_BUS_CONFIG_SPI_BUS_CONFIG_CONFIG0_POS]};
assign spi_bus_config_value_o = {spi_bus_config_reg[`SPI2_SPI_BUS_CONFIG_SPI_BUS_CONFIG_VALUE7_POS], spi_bus_config_reg[`SPI2_SPI_BUS_CONFIG_SPI_BUS_CONFIG_VALUE6_POS], spi_bus_config_reg[`SPI2_SPI_BUS_CONFIG_SPI_BUS_CONFIG_VALUE5_POS], spi_bus_config_reg[`SPI2_SPI_BUS_CONFIG_SPI_BUS_CONFIG_VALUE4_POS], spi_bus_config_reg[`SPI2_SPI_BUS_CONFIG_SPI_BUS_CONFIG_VALUE3_POS], spi_bus_config_reg[`SPI2_SPI_BUS_CONFIG_SPI_BUS_CONFIG_VALUE2_POS], spi_bus_config_reg[`SPI2_SPI_BUS_CONFIG_SPI_BUS_CONFIG_VALUE1_POS], spi_bus_config_reg[`SPI2_SPI_BUS_CONFIG_SPI_BUS_CONFIG_VALUE0_POS]};
assign spi_bus_config_flag_o = {spi_bus_config_reg[`SPI2_SPI_BUS_CONFIG_SPI_BUS_CONFIG_FLAG7_POS], spi_bus_config_reg[`SPI2_SPI_BUS_CONFIG_SPI_BUS_CONFIG_FLAG6_POS], spi_bus_config_reg[`SPI2_SPI_BUS_CONFIG_SPI_BUS_CONFIG_FLAG5_POS], spi_bus_config_reg[`SPI2_SPI_BUS_CONFIG_SPI_BUS_CONFIG_FLAG4_POS], spi_bus_config_reg[`SPI2_SPI_BUS_CONFIG_SPI_BUS_CONFIG_FLAG3_POS], spi_bus_config_reg[`SPI2_SPI_BUS_CONFIG_SPI_BUS_CONFIG_FLAG2_POS], spi_bus_config_reg[`SPI2_SPI_BUS_CONFIG_SPI_BUS_CONFIG_FLAG1_POS], spi_bus_config_reg[`SPI2_SPI_BUS_CONFIG_SPI_BUS_CONFIG_FLAG0_POS]};
assign spi_bus_status_control_o = {spi_bus_status_reg[`SPI2_SPI_BUS_STATUS_SPI_BUS_STATUS_CONTROL7_POS], spi_bus_status_reg[`SPI2_SPI_BUS_STATUS_SPI_BUS_STATUS_CONTROL6_POS], spi_bus_status_reg[`SPI2_SPI_BUS_STATUS_SPI_BUS_STATUS_CONTROL5_POS], spi_bus_status_reg[`SPI2_SPI_BUS_STATUS_SPI_BUS_STATUS_CONTROL4_POS], spi_bus_status_reg[`SPI2_SPI_BUS_STATUS_SPI_BUS_STATUS_CONTROL3_POS], spi_bus_status_reg[`SPI2_SPI_BUS_STATUS_SPI_BUS_STATUS_CONTROL2_POS], spi_bus_status_reg[`SPI2_SPI_BUS_STATUS_SPI_BUS_STATUS_CONTROL1_POS], spi_bus_status_reg[`SPI2_SPI_BUS_STATUS_SPI_BUS_STATUS_CONTROL0_POS]};
assign spi_bus_status_config_o = {spi_bus_status_reg[`SPI2_SPI_BUS_STATUS_SPI_BUS_STATUS_CONFIG7_POS], spi_bus_status_reg[`SPI2_SPI_BUS_STATUS_SPI_BUS_STATUS_CONFIG6_POS], spi_bus_status_reg[`SPI2_SPI_BUS_STATUS_SPI_BUS_STATUS_CONFIG5_POS], spi_bus_status_reg[`SPI2_SPI_BUS_STATUS_SPI_BUS_STATUS_CONFIG4_POS], spi_bus_status_reg[`SPI2_SPI_BUS_STATUS_SPI_BUS_STATUS_CONFIG3_POS], spi_bus_status_reg[`SPI2_SPI_BUS_STATUS_SPI_BUS_STATUS_CONFIG2_POS], spi_bus_status_reg[`SPI2_SPI_BUS_STATUS_SPI_BUS_STATUS_CONFIG1_POS], spi_bus_status_reg[`SPI2_SPI_BUS_STATUS_SPI_BUS_STATUS_CONFIG0_POS]};
assign spi_bus_status_value_o = {spi_bus_status_reg[`SPI2_SPI_BUS_STATUS_SPI_BUS_STATUS_VALUE7_POS], spi_bus_status_reg[`SPI2_SPI_BUS_STATUS_SPI_BUS_STATUS_VALUE6_POS], spi_bus_status_reg[`SPI2_SPI_BUS_STATUS_SPI_BUS_STATUS_VALUE5_POS], spi_bus_status_reg[`SPI2_SPI_BUS_STATUS_SPI_BUS_STATUS_VALUE4_POS], spi_bus_status_reg[`SPI2_SPI_BUS_STATUS_SPI_BUS_STATUS_VALUE3_POS], spi_bus_status_reg[`SPI2_SPI_BUS_STATUS_SPI_BUS_STATUS_VALUE2_POS], spi_bus_status_reg[`SPI2_SPI_BUS_STATUS_SPI_BUS_STATUS_VALUE1_POS], spi_bus_status_reg[`SPI2_SPI_BUS_STATUS_SPI_BUS_STATUS_VALUE0_POS]};
assign spi_bus_status_flag_o = {spi_bus_status_reg[`SPI2_SPI_BUS_STATUS_SPI_BUS_STATUS_FLAG7_POS], spi_bus_status_reg[`SPI2_SPI_BUS_STATUS_SPI_BUS_STATUS_FLAG6_POS], spi_bus_status_reg[`SPI2_SPI_BUS_STATUS_SPI_BUS_STATUS_FLAG5_POS], spi_bus_status_reg[`SPI2_SPI_BUS_STATUS_SPI_BUS_STATUS_FLAG4_POS], spi_bus_status_reg[`SPI2_SPI_BUS_STATUS_SPI_BUS_STATUS_FLAG3_POS], spi_bus_status_reg[`SPI2_SPI_BUS_STATUS_SPI_BUS_STATUS_FLAG2_POS], spi_bus_status_reg[`SPI2_SPI_BUS_STATUS_SPI_BUS_STATUS_FLAG1_POS], spi_bus_status_reg[`SPI2_SPI_BUS_STATUS_SPI_BUS_STATUS_FLAG0_POS]};
assign spi_interface_config_control_o = {spi_interface_config_reg[`SPI2_SPI_INTERFACE_CONFIG_SPI_INTERFACE_CONFIG_CONTROL7_POS], spi_interface_config_reg[`SPI2_SPI_INTERFACE_CONFIG_SPI_INTERFACE_CONFIG_CONTROL6_POS], spi_interface_config_reg[`SPI2_SPI_INTERFACE_CONFIG_SPI_INTERFACE_CONFIG_CONTROL5_POS], spi_interface_config_reg[`SPI2_SPI_INTERFACE_CONFIG_SPI_INTERFACE_CONFIG_CONTROL4_POS], spi_interface_config_reg[`SPI2_SPI_INTERFACE_CONFIG_SPI_INTERFACE_CONFIG_CONTROL3_POS], spi_interface_config_reg[`SPI2_SPI_INTERFACE_CONFIG_SPI_INTERFACE_CONFIG_CONTROL2_POS], spi_interface_config_reg[`SPI2_SPI_INTERFACE_CONFIG_SPI_INTERFACE_CONFIG_CONTROL1_POS], spi_interface_config_reg[`SPI2_SPI_INTERFACE_CONFIG_SPI_INTERFACE_CONFIG_CONTROL0_POS]};
assign spi_interface_config_config_o = {spi_interface_config_reg[`SPI2_SPI_INTERFACE_CONFIG_SPI_INTERFACE_CONFIG_CONFIG7_POS], spi_interface_config_reg[`SPI2_SPI_INTERFACE_CONFIG_SPI_INTERFACE_CONFIG_CONFIG6_POS], spi_interface_config_reg[`SPI2_SPI_INTERFACE_CONFIG_SPI_INTERFACE_CONFIG_CONFIG5_POS], spi_interface_config_reg[`SPI2_SPI_INTERFACE_CONFIG_SPI_INTERFACE_CONFIG_CONFIG4_POS], spi_interface_config_reg[`SPI2_SPI_INTERFACE_CONFIG_SPI_INTERFACE_CONFIG_CONFIG3_POS], spi_interface_config_reg[`SPI2_SPI_INTERFACE_CONFIG_SPI_INTERFACE_CONFIG_CONFIG2_POS], spi_interface_config_reg[`SPI2_SPI_INTERFACE_CONFIG_SPI_INTERFACE_CONFIG_CONFIG1_POS], spi_interface_config_reg[`SPI2_SPI_INTERFACE_CONFIG_SPI_INTERFACE_CONFIG_CONFIG0_POS]};
assign spi_interface_config_value_o = {spi_interface_config_reg[`SPI2_SPI_INTERFACE_CONFIG_SPI_INTERFACE_CONFIG_VALUE7_POS], spi_interface_config_reg[`SPI2_SPI_INTERFACE_CONFIG_SPI_INTERFACE_CONFIG_VALUE6_POS], spi_interface_config_reg[`SPI2_SPI_INTERFACE_CONFIG_SPI_INTERFACE_CONFIG_VALUE5_POS], spi_interface_config_reg[`SPI2_SPI_INTERFACE_CONFIG_SPI_INTERFACE_CONFIG_VALUE4_POS], spi_interface_config_reg[`SPI2_SPI_INTERFACE_CONFIG_SPI_INTERFACE_CONFIG_VALUE3_POS], spi_interface_config_reg[`SPI2_SPI_INTERFACE_CONFIG_SPI_INTERFACE_CONFIG_VALUE2_POS], spi_interface_config_reg[`SPI2_SPI_INTERFACE_CONFIG_SPI_INTERFACE_CONFIG_VALUE1_POS], spi_interface_config_reg[`SPI2_SPI_INTERFACE_CONFIG_SPI_INTERFACE_CONFIG_VALUE0_POS]};
assign spi_interface_config_flag_o = {spi_interface_config_reg[`SPI2_SPI_INTERFACE_CONFIG_SPI_INTERFACE_CONFIG_FLAG7_POS], spi_interface_config_reg[`SPI2_SPI_INTERFACE_CONFIG_SPI_INTERFACE_CONFIG_FLAG6_POS], spi_interface_config_reg[`SPI2_SPI_INTERFACE_CONFIG_SPI_INTERFACE_CONFIG_FLAG5_POS], spi_interface_config_reg[`SPI2_SPI_INTERFACE_CONFIG_SPI_INTERFACE_CONFIG_FLAG4_POS], spi_interface_config_reg[`SPI2_SPI_INTERFACE_CONFIG_SPI_INTERFACE_CONFIG_FLAG3_POS], spi_interface_config_reg[`SPI2_SPI_INTERFACE_CONFIG_SPI_INTERFACE_CONFIG_FLAG2_POS], spi_interface_config_reg[`SPI2_SPI_INTERFACE_CONFIG_SPI_INTERFACE_CONFIG_FLAG1_POS], spi_interface_config_reg[`SPI2_SPI_INTERFACE_CONFIG_SPI_INTERFACE_CONFIG_FLAG0_POS]};
assign spi_interface_status_control_o = {spi_interface_status_reg[`SPI2_SPI_INTERFACE_STATUS_SPI_INTERFACE_STATUS_CONTROL7_POS], spi_interface_status_reg[`SPI2_SPI_INTERFACE_STATUS_SPI_INTERFACE_STATUS_CONTROL6_POS], spi_interface_status_reg[`SPI2_SPI_INTERFACE_STATUS_SPI_INTERFACE_STATUS_CONTROL5_POS], spi_interface_status_reg[`SPI2_SPI_INTERFACE_STATUS_SPI_INTERFACE_STATUS_CONTROL4_POS], spi_interface_status_reg[`SPI2_SPI_INTERFACE_STATUS_SPI_INTERFACE_STATUS_CONTROL3_POS], spi_interface_status_reg[`SPI2_SPI_INTERFACE_STATUS_SPI_INTERFACE_STATUS_CONTROL2_POS], spi_interface_status_reg[`SPI2_SPI_INTERFACE_STATUS_SPI_INTERFACE_STATUS_CONTROL1_POS], spi_interface_status_reg[`SPI2_SPI_INTERFACE_STATUS_SPI_INTERFACE_STATUS_CONTROL0_POS]};
assign spi_interface_status_config_o = {spi_interface_status_reg[`SPI2_SPI_INTERFACE_STATUS_SPI_INTERFACE_STATUS_CONFIG7_POS], spi_interface_status_reg[`SPI2_SPI_INTERFACE_STATUS_SPI_INTERFACE_STATUS_CONFIG6_POS], spi_interface_status_reg[`SPI2_SPI_INTERFACE_STATUS_SPI_INTERFACE_STATUS_CONFIG5_POS], spi_interface_status_reg[`SPI2_SPI_INTERFACE_STATUS_SPI_INTERFACE_STATUS_CONFIG4_POS], spi_interface_status_reg[`SPI2_SPI_INTERFACE_STATUS_SPI_INTERFACE_STATUS_CONFIG3_POS], spi_interface_status_reg[`SPI2_SPI_INTERFACE_STATUS_SPI_INTERFACE_STATUS_CONFIG2_POS], spi_interface_status_reg[`SPI2_SPI_INTERFACE_STATUS_SPI_INTERFACE_STATUS_CONFIG1_POS], spi_interface_status_reg[`SPI2_SPI_INTERFACE_STATUS_SPI_INTERFACE_STATUS_CONFIG0_POS]};
assign spi_interface_status_value_o = {spi_interface_status_reg[`SPI2_SPI_INTERFACE_STATUS_SPI_INTERFACE_STATUS_VALUE7_POS], spi_interface_status_reg[`SPI2_SPI_INTERFACE_STATUS_SPI_INTERFACE_STATUS_VALUE6_POS], spi_interface_status_reg[`SPI2_SPI_INTERFACE_STATUS_SPI_INTERFACE_STATUS_VALUE5_POS], spi_interface_status_reg[`SPI2_SPI_INTERFACE_STATUS_SPI_INTERFACE_STATUS_VALUE4_POS], spi_interface_status_reg[`SPI2_SPI_INTERFACE_STATUS_SPI_INTERFACE_STATUS_VALUE3_POS], spi_interface_status_reg[`SPI2_SPI_INTERFACE_STATUS_SPI_INTERFACE_STATUS_VALUE2_POS], spi_interface_status_reg[`SPI2_SPI_INTERFACE_STATUS_SPI_INTERFACE_STATUS_VALUE1_POS], spi_interface_status_reg[`SPI2_SPI_INTERFACE_STATUS_SPI_INTERFACE_STATUS_VALUE0_POS]};
assign spi_interface_status_flag_o = {spi_interface_status_reg[`SPI2_SPI_INTERFACE_STATUS_SPI_INTERFACE_STATUS_FLAG7_POS], spi_interface_status_reg[`SPI2_SPI_INTERFACE_STATUS_SPI_INTERFACE_STATUS_FLAG6_POS], spi_interface_status_reg[`SPI2_SPI_INTERFACE_STATUS_SPI_INTERFACE_STATUS_FLAG5_POS], spi_interface_status_reg[`SPI2_SPI_INTERFACE_STATUS_SPI_INTERFACE_STATUS_FLAG4_POS], spi_interface_status_reg[`SPI2_SPI_INTERFACE_STATUS_SPI_INTERFACE_STATUS_FLAG3_POS], spi_interface_status_reg[`SPI2_SPI_INTERFACE_STATUS_SPI_INTERFACE_STATUS_FLAG2_POS], spi_interface_status_reg[`SPI2_SPI_INTERFACE_STATUS_SPI_INTERFACE_STATUS_FLAG1_POS], spi_interface_status_reg[`SPI2_SPI_INTERFACE_STATUS_SPI_INTERFACE_STATUS_FLAG0_POS]};
assign spi_version_control_o = {spi_version_reg[`SPI2_SPI_VERSION_SPI_VERSION_CONTROL7_POS], spi_version_reg[`SPI2_SPI_VERSION_SPI_VERSION_CONTROL6_POS], spi_version_reg[`SPI2_SPI_VERSION_SPI_VERSION_CONTROL5_POS], spi_version_reg[`SPI2_SPI_VERSION_SPI_VERSION_CONTROL4_POS], spi_version_reg[`SPI2_SPI_VERSION_SPI_VERSION_CONTROL3_POS], spi_version_reg[`SPI2_SPI_VERSION_SPI_VERSION_CONTROL2_POS], spi_version_reg[`SPI2_SPI_VERSION_SPI_VERSION_CONTROL1_POS], spi_version_reg[`SPI2_SPI_VERSION_SPI_VERSION_CONTROL0_POS]};
assign spi_version_config_o = {spi_version_reg[`SPI2_SPI_VERSION_SPI_VERSION_CONFIG7_POS], spi_version_reg[`SPI2_SPI_VERSION_SPI_VERSION_CONFIG6_POS], spi_version_reg[`SPI2_SPI_VERSION_SPI_VERSION_CONFIG5_POS], spi_version_reg[`SPI2_SPI_VERSION_SPI_VERSION_CONFIG4_POS], spi_version_reg[`SPI2_SPI_VERSION_SPI_VERSION_CONFIG3_POS], spi_version_reg[`SPI2_SPI_VERSION_SPI_VERSION_CONFIG2_POS], spi_version_reg[`SPI2_SPI_VERSION_SPI_VERSION_CONFIG1_POS], spi_version_reg[`SPI2_SPI_VERSION_SPI_VERSION_CONFIG0_POS]};
assign spi_version_value_o = {spi_version_reg[`SPI2_SPI_VERSION_SPI_VERSION_VALUE7_POS], spi_version_reg[`SPI2_SPI_VERSION_SPI_VERSION_VALUE6_POS], spi_version_reg[`SPI2_SPI_VERSION_SPI_VERSION_VALUE5_POS], spi_version_reg[`SPI2_SPI_VERSION_SPI_VERSION_VALUE4_POS], spi_version_reg[`SPI2_SPI_VERSION_SPI_VERSION_VALUE3_POS], spi_version_reg[`SPI2_SPI_VERSION_SPI_VERSION_VALUE2_POS], spi_version_reg[`SPI2_SPI_VERSION_SPI_VERSION_VALUE1_POS], spi_version_reg[`SPI2_SPI_VERSION_SPI_VERSION_VALUE0_POS]};
assign spi_version_flag_o = {spi_version_reg[`SPI2_SPI_VERSION_SPI_VERSION_FLAG7_POS], spi_version_reg[`SPI2_SPI_VERSION_SPI_VERSION_FLAG6_POS], spi_version_reg[`SPI2_SPI_VERSION_SPI_VERSION_FLAG5_POS], spi_version_reg[`SPI2_SPI_VERSION_SPI_VERSION_FLAG4_POS], spi_version_reg[`SPI2_SPI_VERSION_SPI_VERSION_FLAG3_POS], spi_version_reg[`SPI2_SPI_VERSION_SPI_VERSION_FLAG2_POS], spi_version_reg[`SPI2_SPI_VERSION_SPI_VERSION_FLAG1_POS], spi_version_reg[`SPI2_SPI_VERSION_SPI_VERSION_FLAG0_POS]};

endmodule
