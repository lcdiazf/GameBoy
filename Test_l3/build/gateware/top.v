/* Machine-generated using LiteX gen */
module top(
	input clk100,
	input cpu_reset,
	output reg serial_tx,
	input serial_rx,
	output user_led0,
	output user_led1,
	output user_led2,
	output user_led3,
	output user_led4,
	output user_led5,
	output user_led6,
	output user_led7,
	output user_led8,
	output user_led9,
	output user_led10,
	output user_led11,
	output user_led12,
	output user_led13,
	output user_led14,
	output user_led15,
	input [7:0] LCD_Parallel0,
	input LCD_CS0,
	input LCD_RS0,
	input LCD_RD0,
	input LCD_WR0,
	input user_sw0,
	input user_sw1,
	input user_sw2,
	input user_sw3,
	input user_sw4,
	input user_sw5,
	input user_sw6,
	input user_sw7,
	input user_sw8,
	input user_sw9,
	input user_sw10,
	input user_sw11,
	input user_sw12,
	input user_sw13,
	input user_sw14,
	input user_sw15,
	input user_btn0,
	input user_btn1,
	input user_btn2,
	input user_btn3,
	input user_btn4,
	output reg user_rgb_led0_r,
	output reg user_rgb_led0_g,
	output reg user_rgb_led0_b,
	inout adxl362_spi_cs_n,
	inout adxl362_spi_clk,
	inout adxl362_spi_mosi,
	input adxl362_spi_miso,
	output [7:0] display_cs_n,
	output [7:0] display_abcdefg,
	output reg out_probe0,
	inout SPIprueba_cs_n,
	inout SPIprueba_clk,
	inout SPIprueba_mosi,
	input SPIprueba_miso
);

wire basesoc_reset_reset_re;
wire basesoc_reset_reset_r;
reg basesoc_reset_reset_w = 1'd0;
reg [31:0] basesoc_storage_full = 32'd305419896;
wire [31:0] basesoc_storage;
reg basesoc_re = 1'd0;
wire [31:0] basesoc_bus_errors_status;
wire basesoc_reset;
wire basesoc_bus_error;
reg [31:0] basesoc_bus_errors = 32'd0;
wire [29:0] basesoc_sram_bus_adr;
wire [31:0] basesoc_sram_bus_dat_w;
wire [31:0] basesoc_sram_bus_dat_r;
wire [3:0] basesoc_sram_bus_sel;
wire basesoc_sram_bus_cyc;
wire basesoc_sram_bus_stb;
reg basesoc_sram_bus_ack = 1'd0;
wire basesoc_sram_bus_we;
wire [2:0] basesoc_sram_bus_cti;
wire [1:0] basesoc_sram_bus_bte;
reg basesoc_sram_bus_err = 1'd0;
wire [9:0] basesoc_sram_adr;
wire [31:0] basesoc_sram_dat_r;
reg [3:0] basesoc_sram_we = 4'd0;
wire [31:0] basesoc_sram_dat_w;
reg [13:0] basesoc_interface_adr = 14'd0;
reg basesoc_interface_we = 1'd0;
reg [31:0] basesoc_interface_dat_w = 32'd0;
wire [31:0] basesoc_interface_dat_r;
wire [29:0] basesoc_wishbone2csr_adr;
wire [31:0] basesoc_wishbone2csr_dat_w;
reg [31:0] basesoc_wishbone2csr_dat_r = 32'd0;
wire [3:0] basesoc_wishbone2csr_sel;
wire basesoc_wishbone2csr_cyc;
wire basesoc_wishbone2csr_stb;
reg basesoc_wishbone2csr_ack = 1'd0;
wire basesoc_wishbone2csr_we;
wire [2:0] basesoc_wishbone2csr_cti;
wire [1:0] basesoc_wishbone2csr_bte;
reg basesoc_wishbone2csr_err = 1'd0;
reg [1:0] basesoc_wishbone2csr_counter = 2'd0;
wire sys_clk;
wire sys_rst;
wire por_clk;
reg int_rst = 1'd1;
reg [31:0] uartwishbonebridge_storage = 32'd4947802;
reg uartwishbonebridge_tx_valid = 1'd0;
reg uartwishbonebridge_tx_ready = 1'd0;
wire uartwishbonebridge_tx_last;
reg [7:0] uartwishbonebridge_tx_payload_data = 8'd0;
reg uartwishbonebridge_tx_uart_clk_txen = 1'd0;
reg [31:0] uartwishbonebridge_tx_phase_accumulator_tx = 32'd0;
reg [7:0] uartwishbonebridge_tx_tx_reg = 8'd0;
reg [3:0] uartwishbonebridge_tx_tx_bitcount = 4'd0;
reg uartwishbonebridge_tx_tx_busy = 1'd0;
reg uartwishbonebridge_rx_valid = 1'd0;
wire uartwishbonebridge_rx_ready;
reg [7:0] uartwishbonebridge_rx_payload_data = 8'd0;
reg uartwishbonebridge_rx_uart_clk_rxen = 1'd0;
reg [31:0] uartwishbonebridge_rx_phase_accumulator_rx = 32'd0;
wire uartwishbonebridge_rx_rx;
reg uartwishbonebridge_rx_rx_r = 1'd0;
reg [7:0] uartwishbonebridge_rx_rx_reg = 8'd0;
reg [3:0] uartwishbonebridge_rx_rx_bitcount = 4'd0;
reg uartwishbonebridge_rx_rx_busy = 1'd0;
wire [29:0] uartwishbonebridge_adr;
wire [31:0] uartwishbonebridge_dat_w;
wire [31:0] uartwishbonebridge_dat_r;
wire [3:0] uartwishbonebridge_sel;
reg uartwishbonebridge_cyc = 1'd0;
reg uartwishbonebridge_stb = 1'd0;
wire uartwishbonebridge_ack;
reg uartwishbonebridge_we = 1'd0;
reg [2:0] uartwishbonebridge_cti = 3'd0;
reg [1:0] uartwishbonebridge_bte = 2'd0;
wire uartwishbonebridge_err;
reg [2:0] uartwishbonebridge_byte_counter = 3'd0;
reg uartwishbonebridge_byte_counter_reset = 1'd0;
reg uartwishbonebridge_byte_counter_ce = 1'd0;
reg [2:0] uartwishbonebridge_word_counter = 3'd0;
reg uartwishbonebridge_word_counter_reset = 1'd0;
reg uartwishbonebridge_word_counter_ce = 1'd0;
reg [7:0] uartwishbonebridge_cmd = 8'd0;
reg uartwishbonebridge_cmd_ce = 1'd0;
reg [7:0] uartwishbonebridge_length = 8'd0;
reg uartwishbonebridge_length_ce = 1'd0;
reg [31:0] uartwishbonebridge_address = 32'd0;
reg uartwishbonebridge_address_ce = 1'd0;
reg [31:0] uartwishbonebridge_data = 32'd0;
reg uartwishbonebridge_rx_data_ce = 1'd0;
reg uartwishbonebridge_tx_data_ce = 1'd0;
wire uartwishbonebridge_reset;
wire uartwishbonebridge_wait;
wire uartwishbonebridge_done;
reg [23:0] uartwishbonebridge_count = 24'd10000000;
reg uartwishbonebridge_is_ongoing = 1'd0;
reg [56:0] dna_status = 57'd0;
wire dna_do;
reg [6:0] dna_cnt = 7'd0;
reg [11:0] xadc_temperature_status = 12'd0;
reg [11:0] xadc_vccint_status = 12'd0;
reg [11:0] xadc_vccaux_status = 12'd0;
reg [11:0] xadc_vccbram_status = 12'd0;
wire [7:0] xadc_alarm;
wire xadc_ot;
wire xadc_busy;
wire [6:0] xadc_channel;
wire xadc_eoc;
wire xadc_eos;
wire [15:0] xadc_data;
wire xadc_drdy;
reg [15:0] leds_storage_full = 16'd0;
wire [15:0] leds_storage;
reg leds_re = 1'd0;
reg [7:0] gpioout0_storage_full = 8'd0;
wire [7:0] gpioout0_storage;
reg gpioout0_re = 1'd0;
reg gpioout1_storage_full = 1'd0;
wire gpioout1_storage;
reg gpioout1_re = 1'd0;
reg gpioout2_storage_full = 1'd0;
wire gpioout2_storage;
reg gpioout2_re = 1'd0;
reg gpioout3_storage_full = 1'd0;
wire gpioout3_storage;
reg gpioout3_re = 1'd0;
reg gpioout4_storage_full = 1'd0;
wire gpioout4_storage;
reg gpioout4_re = 1'd0;
wire [15:0] switches_status;
wire [4:0] buttons_status;
reg r_enable_storage_full = 1'd0;
wire r_enable_storage;
reg r_enable_re = 1'd0;
reg [31:0] r_width_storage_full = 32'd0;
wire [31:0] r_width_storage;
reg r_width_re = 1'd0;
reg [31:0] r_period_storage_full = 32'd0;
wire [31:0] r_period_storage;
reg r_period_re = 1'd0;
wire r_enable;
wire [31:0] r_width;
wire [31:0] r_period;
reg [31:0] r_count = 32'd0;
reg g_enable_storage_full = 1'd0;
wire g_enable_storage;
reg g_enable_re = 1'd0;
reg [31:0] g_width_storage_full = 32'd0;
wire [31:0] g_width_storage;
reg g_width_re = 1'd0;
reg [31:0] g_period_storage_full = 32'd0;
wire [31:0] g_period_storage;
reg g_period_re = 1'd0;
wire g_enable;
wire [31:0] g_width;
wire [31:0] g_period;
reg [31:0] g_count = 32'd0;
reg b_enable_storage_full = 1'd0;
wire b_enable_storage;
reg b_enable_re = 1'd0;
reg [31:0] b_width_storage_full = 32'd0;
wire [31:0] b_width_storage;
reg b_width_re = 1'd0;
reg [31:0] b_period_storage_full = 32'd0;
wire [31:0] b_period_storage;
reg b_period_re = 1'd0;
wire b_enable;
wire [31:0] b_width;
wire [31:0] b_period;
reg [31:0] b_count = 32'd0;
wire adxl362_spimastercore_config_offline;
wire [1:0] adxl362_spimastercore_config_padding0;
wire adxl362_spimastercore_config_cs_polarity;
wire adxl362_spimastercore_config_clk_polarity;
wire adxl362_spimastercore_config_clk_phase;
wire adxl362_spimastercore_config_lsb_first;
wire adxl362_spimastercore_config_half_duplex;
wire [7:0] adxl362_spimastercore_config_padding1;
wire [7:0] adxl362_spimastercore_config_div_write;
wire [7:0] adxl362_spimastercore_config_div_read;
wire [15:0] adxl362_spimastercore_xfer_cs;
wire [5:0] adxl362_spimastercore_xfer_write_length;
wire [1:0] adxl362_spimastercore_xfer_padding0;
wire [5:0] adxl362_spimastercore_xfer_read_length;
wire [1:0] adxl362_spimastercore_xfer_padding1;
wire adxl362_spimastercore_start;
reg adxl362_spimastercore_active = 1'd0;
reg adxl362_spimastercore_pending0 = 1'd0;
wire [31:0] adxl362_spimastercore_mosi_data;
wire [31:0] adxl362_spimastercore_miso_data;
reg [7:0] adxl362_spimastercore_spimachine_spiclockgen_load = 8'd0;
wire adxl362_spimastercore_spimachine_spiclockgen_bias0;
wire adxl362_spimastercore_spimachine_spiclockgen_edge;
reg adxl362_spimastercore_spimachine_spiclockgen_clk = 1'd1;
reg [7:0] adxl362_spimastercore_spimachine_spiclockgen = 8'd0;
reg adxl362_spimastercore_spimachine_spiclockgen_bias1 = 1'd0;
wire adxl362_spimastercore_spimachine_spiclockgen_zero;
wire adxl362_spimastercore_spimachine_cg_ce;
reg [31:0] adxl362_spimastercore_spimachine_data = 32'd0;
wire adxl362_spimastercore_spimachine_o;
wire adxl362_spimastercore_spimachine_i;
wire adxl362_spimastercore_spimachine_lsb;
reg adxl362_spimastercore_spimachine_shift = 1'd0;
reg adxl362_spimastercore_spimachine_sample = 1'd0;
wire adxl362_spimastercore_spimachine_reg_ce;
reg [5:0] adxl362_spimastercore_spimachine_n_read = 6'd0;
reg [5:0] adxl362_spimastercore_spimachine_n_write = 6'd0;
wire adxl362_spimastercore_spimachine_read;
wire adxl362_spimastercore_spimachine_write;
wire adxl362_spimastercore_spimachine_done0;
wire adxl362_spimastercore_spimachine_bits_ce;
wire [7:0] adxl362_spimastercore_spimachine0;
wire [7:0] adxl362_spimastercore_spimachine1;
wire adxl362_spimastercore_spimachine_clk_phase;
wire adxl362_spimastercore_spimachine_start;
wire adxl362_spimastercore_spimachine_cs;
wire adxl362_spimastercore_spimachine_oe;
wire adxl362_spimastercore_spimachine_done1;
wire adxl362_spimastercore_spimachine_fsm_ce;
reg adxl362_spimastercore_spimachine_write0 = 1'd0;
reg adxl362_spimastercore_spimachine_fsm_is_ongoing0 = 1'd0;
reg adxl362_spimastercore_spimachine_fsm_is_ongoing1 = 1'd0;
reg adxl362_spimastercore_pending1 = 1'd0;
reg [15:0] adxl362_spimastercore0 = 16'd0;
reg [31:0] adxl362_spimastercore1 = 32'd0;
reg [31:0] adxl362_spimastercore2 = 32'd0;
wire adxl362_spimastercore_cs_n_t_o;
wire adxl362_spimastercore_cs_n_t_oe;
wire adxl362_spimastercore_cs_n_t_i;
wire adxl362_spimastercore_clk_t_o;
wire adxl362_spimastercore_clk_t_oe;
wire adxl362_spimastercore_clk_t_i;
wire adxl362_spimastercore_mosi_t_o;
wire adxl362_spimastercore_mosi_t_oe;
wire adxl362_spimastercore_mosi_t_i;
reg [31:0] adxl362_config_storage_full = 32'd0;
wire [31:0] adxl362_config_storage;
reg adxl362_config_re = 1'd0;
reg [31:0] adxl362_xfer_storage_full = 32'd0;
wire [31:0] adxl362_xfer_storage;
reg adxl362_xfer_re = 1'd0;
wire adxl362_start_re;
wire adxl362_start_r;
reg adxl362_start_w = 1'd0;
wire adxl362_active_status;
wire adxl362_pending_status;
reg [31:0] adxl362_mosi_data_storage_full = 32'd0;
wire [31:0] adxl362_mosi_data_storage;
reg adxl362_mosi_data_re = 1'd0;
wire [31:0] adxl362_miso_data_status;
reg [3:0] display_sel_storage_full = 4'd0;
wire [3:0] display_sel_storage;
reg display_sel_re = 1'd0;
reg [3:0] display_value_storage_full = 4'd0;
wire [3:0] display_value_storage;
reg display_value_re = 1'd0;
wire display_write_re;
wire display_write_r;
reg display_write_w = 1'd0;
wire [5:0] display_cs0;
wire [6:0] display_abcdefg0;
reg [4:0] display_values0 = 5'd0;
reg [4:0] display_values1 = 5'd0;
reg [4:0] display_values2 = 5'd0;
reg [4:0] display_values3 = 5'd0;
reg [4:0] display_values4 = 5'd0;
reg [4:0] display_values5 = 5'd0;
wire [5:0] display_cs1;
wire [6:0] display_abcdefg1;
reg [3:0] display_value = 4'd0;
reg [6:0] display_abcdefg2 = 7'd0;
reg display_enable = 1'd1;
wire display_ce;
reg [16:0] display_counter = 17'd0;
reg [5:0] display_cs2 = 6'd1;
reg probe_PWM_enable_storage_full = 1'd0;
wire probe_PWM_enable_storage;
reg probe_PWM_enable_re = 1'd0;
reg [31:0] probe_PWM_width_storage_full = 32'd0;
wire [31:0] probe_PWM_width_storage;
reg probe_PWM_width_re = 1'd0;
reg [31:0] probe_PWM_period_storage_full = 32'd0;
wire [31:0] probe_PWM_period_storage;
reg probe_PWM_period_re = 1'd0;
wire probe_PWM_enable;
wire [31:0] probe_PWM_width;
wire [31:0] probe_PWM_period;
reg [31:0] probe_PWM_count = 32'd0;
wire probeSPI_spimastercore_config_offline;
wire [1:0] probeSPI_spimastercore_config_padding0;
wire probeSPI_spimastercore_config_cs_polarity;
wire probeSPI_spimastercore_config_clk_polarity;
wire probeSPI_spimastercore_config_clk_phase;
wire probeSPI_spimastercore_config_lsb_first;
wire probeSPI_spimastercore_config_half_duplex;
wire [7:0] probeSPI_spimastercore_config_padding1;
wire [7:0] probeSPI_spimastercore_config_div_write;
wire [7:0] probeSPI_spimastercore_config_div_read;
wire [15:0] probeSPI_spimastercore_xfer_cs;
wire [5:0] probeSPI_spimastercore_xfer_write_length;
wire [1:0] probeSPI_spimastercore_xfer_padding0;
wire [5:0] probeSPI_spimastercore_xfer_read_length;
wire [1:0] probeSPI_spimastercore_xfer_padding1;
wire probeSPI_spimastercore_start;
reg probeSPI_spimastercore_active = 1'd0;
reg probeSPI_spimastercore_pending0 = 1'd0;
wire [31:0] probeSPI_spimastercore_mosi_data;
wire [31:0] probeSPI_spimastercore_miso_data;
reg [7:0] probeSPI_spimastercore_spimachine_spiclockgen_load = 8'd0;
wire probeSPI_spimastercore_spimachine_spiclockgen_bias0;
wire probeSPI_spimastercore_spimachine_spiclockgen_edge;
reg probeSPI_spimastercore_spimachine_spiclockgen_clk = 1'd1;
reg [7:0] probeSPI_spimastercore_spimachine_spiclockgen = 8'd0;
reg probeSPI_spimastercore_spimachine_spiclockgen_bias1 = 1'd0;
wire probeSPI_spimastercore_spimachine_spiclockgen_zero;
wire probeSPI_spimastercore_spimachine_cg_ce;
reg [31:0] probeSPI_spimastercore_spimachine_data = 32'd0;
wire probeSPI_spimastercore_spimachine_o;
wire probeSPI_spimastercore_spimachine_i;
wire probeSPI_spimastercore_spimachine_lsb;
reg probeSPI_spimastercore_spimachine_shift = 1'd0;
reg probeSPI_spimastercore_spimachine_sample = 1'd0;
wire probeSPI_spimastercore_spimachine_reg_ce;
reg [5:0] probeSPI_spimastercore_spimachine_n_read = 6'd0;
reg [5:0] probeSPI_spimastercore_spimachine_n_write = 6'd0;
wire probeSPI_spimastercore_spimachine_read;
wire probeSPI_spimastercore_spimachine_write;
wire probeSPI_spimastercore_spimachine_done0;
wire probeSPI_spimastercore_spimachine_bits_ce;
wire [7:0] probeSPI_spimastercore_spimachine0;
wire [7:0] probeSPI_spimastercore_spimachine1;
wire probeSPI_spimastercore_spimachine_clk_phase;
wire probeSPI_spimastercore_spimachine_start;
wire probeSPI_spimastercore_spimachine_cs;
wire probeSPI_spimastercore_spimachine_oe;
wire probeSPI_spimastercore_spimachine_done1;
wire probeSPI_spimastercore_spimachine_fsm_ce;
reg probeSPI_spimastercore_spimachine_write0 = 1'd0;
reg probeSPI_spimastercore_spimachine_fsm_is_ongoing0 = 1'd0;
reg probeSPI_spimastercore_spimachine_fsm_is_ongoing1 = 1'd0;
reg probeSPI_spimastercore_pending1 = 1'd0;
reg [15:0] probeSPI_spimastercore0 = 16'd0;
reg [31:0] probeSPI_spimastercore1 = 32'd0;
reg [31:0] probeSPI_spimastercore2 = 32'd0;
wire probeSPI_spimastercore_cs_n_t_o;
wire probeSPI_spimastercore_cs_n_t_oe;
wire probeSPI_spimastercore_cs_n_t_i;
wire probeSPI_spimastercore_clk_t_o;
wire probeSPI_spimastercore_clk_t_oe;
wire probeSPI_spimastercore_clk_t_i;
wire probeSPI_spimastercore_mosi_t_o;
wire probeSPI_spimastercore_mosi_t_oe;
wire probeSPI_spimastercore_mosi_t_i;
reg [31:0] probeSPI_config_storage_full = 32'd0;
wire [31:0] probeSPI_config_storage;
reg probeSPI_config_re = 1'd0;
reg [31:0] probeSPI_xfer_storage_full = 32'd0;
wire [31:0] probeSPI_xfer_storage;
reg probeSPI_xfer_re = 1'd0;
wire probeSPI_start_re;
wire probeSPI_start_r;
reg probeSPI_start_w = 1'd0;
wire probeSPI_active_status;
wire probeSPI_pending_status;
reg [31:0] probeSPI_mosi_data_storage_full = 32'd0;
wire [31:0] probeSPI_mosi_data_storage;
reg probeSPI_mosi_data_re = 1'd0;
wire [31:0] probeSPI_miso_data_status;
reg [2:0] uartwishbonebridge_state = 3'd0;
reg [2:0] uartwishbonebridge_next_state = 3'd0;
reg [1:0] spimaster0_state = 2'd0;
reg [1:0] spimaster0_next_state = 2'd0;
reg [1:0] spimaster1_state = 2'd0;
reg [1:0] spimaster1_next_state = 2'd0;
wire [29:0] shared_adr;
wire [31:0] shared_dat_w;
reg [31:0] shared_dat_r = 32'd0;
wire [3:0] shared_sel;
wire shared_cyc;
wire shared_stb;
reg shared_ack = 1'd0;
wire shared_we;
wire [2:0] shared_cti;
wire [1:0] shared_bte;
wire shared_err;
wire request;
wire grant;
reg [1:0] slave_sel = 2'd0;
reg [1:0] slave_sel_r = 2'd0;
reg error = 1'd0;
wire wait_1;
wire done;
reg [16:0] count = 17'd65536;
wire [13:0] interface0_bank_bus_adr;
wire interface0_bank_bus_we;
wire [31:0] interface0_bank_bus_dat_w;
reg [31:0] interface0_bank_bus_dat_r = 32'd0;
wire csrbank0_config0_re;
wire [31:0] csrbank0_config0_r;
wire [31:0] csrbank0_config0_w;
wire csrbank0_xfer0_re;
wire [31:0] csrbank0_xfer0_r;
wire [31:0] csrbank0_xfer0_w;
wire csrbank0_active_re;
wire csrbank0_active_r;
wire csrbank0_active_w;
wire csrbank0_pending_re;
wire csrbank0_pending_r;
wire csrbank0_pending_w;
wire csrbank0_mosi_data0_re;
wire [31:0] csrbank0_mosi_data0_r;
wire [31:0] csrbank0_mosi_data0_w;
wire csrbank0_miso_data_re;
wire [31:0] csrbank0_miso_data_r;
wire [31:0] csrbank0_miso_data_w;
wire csrbank0_sel;
wire [13:0] interface1_bank_bus_adr;
wire interface1_bank_bus_we;
wire [31:0] interface1_bank_bus_dat_w;
reg [31:0] interface1_bank_bus_dat_r = 32'd0;
wire csrbank1_in_re;
wire [4:0] csrbank1_in_r;
wire [4:0] csrbank1_in_w;
wire csrbank1_sel;
wire [13:0] interface2_bank_bus_adr;
wire interface2_bank_bus_we;
wire [31:0] interface2_bank_bus_dat_w;
reg [31:0] interface2_bank_bus_dat_r = 32'd0;
wire csrbank2_scratch0_re;
wire [31:0] csrbank2_scratch0_r;
wire [31:0] csrbank2_scratch0_w;
wire csrbank2_bus_errors_re;
wire [31:0] csrbank2_bus_errors_r;
wire [31:0] csrbank2_bus_errors_w;
wire csrbank2_sel;
wire [13:0] interface3_bank_bus_adr;
wire interface3_bank_bus_we;
wire [31:0] interface3_bank_bus_dat_w;
reg [31:0] interface3_bank_bus_dat_r = 32'd0;
wire csrbank3_sel0_re;
wire [3:0] csrbank3_sel0_r;
wire [3:0] csrbank3_sel0_w;
wire csrbank3_value0_re;
wire [3:0] csrbank3_value0_r;
wire [3:0] csrbank3_value0_w;
wire csrbank3_sel;
wire [13:0] interface4_bank_bus_adr;
wire interface4_bank_bus_we;
wire [31:0] interface4_bank_bus_dat_w;
reg [31:0] interface4_bank_bus_dat_r = 32'd0;
wire csrbank4_id1_re;
wire [24:0] csrbank4_id1_r;
wire [24:0] csrbank4_id1_w;
wire csrbank4_id0_re;
wire [31:0] csrbank4_id0_r;
wire [31:0] csrbank4_id0_w;
wire csrbank4_sel;
wire [13:0] sram_bus_adr;
wire sram_bus_we;
wire [31:0] sram_bus_dat_w;
reg [31:0] sram_bus_dat_r = 32'd0;
wire [5:0] adr;
wire [7:0] dat_r;
wire sel;
reg sel_r = 1'd0;
wire [13:0] interface5_bank_bus_adr;
wire interface5_bank_bus_we;
wire [31:0] interface5_bank_bus_dat_w;
reg [31:0] interface5_bank_bus_dat_r = 32'd0;
wire csrbank5_D0_D8_out0_re;
wire [7:0] csrbank5_D0_D8_out0_r;
wire [7:0] csrbank5_D0_D8_out0_w;
wire csrbank5_CS_out0_re;
wire csrbank5_CS_out0_r;
wire csrbank5_CS_out0_w;
wire csrbank5_RS_out0_re;
wire csrbank5_RS_out0_r;
wire csrbank5_RS_out0_w;
wire csrbank5_RD_out0_re;
wire csrbank5_RD_out0_r;
wire csrbank5_RD_out0_w;
wire csrbank5_WR_out0_re;
wire csrbank5_WR_out0_r;
wire csrbank5_WR_out0_w;
wire csrbank5_sel;
wire [13:0] interface6_bank_bus_adr;
wire interface6_bank_bus_we;
wire [31:0] interface6_bank_bus_dat_w;
reg [31:0] interface6_bank_bus_dat_r = 32'd0;
wire csrbank6_out0_re;
wire [15:0] csrbank6_out0_r;
wire [15:0] csrbank6_out0_w;
wire csrbank6_sel;
wire [13:0] interface7_bank_bus_adr;
wire interface7_bank_bus_we;
wire [31:0] interface7_bank_bus_dat_w;
reg [31:0] interface7_bank_bus_dat_r = 32'd0;
wire csrbank7_config0_re;
wire [31:0] csrbank7_config0_r;
wire [31:0] csrbank7_config0_w;
wire csrbank7_xfer0_re;
wire [31:0] csrbank7_xfer0_r;
wire [31:0] csrbank7_xfer0_w;
wire csrbank7_active_re;
wire csrbank7_active_r;
wire csrbank7_active_w;
wire csrbank7_pending_re;
wire csrbank7_pending_r;
wire csrbank7_pending_w;
wire csrbank7_mosi_data0_re;
wire [31:0] csrbank7_mosi_data0_r;
wire [31:0] csrbank7_mosi_data0_w;
wire csrbank7_miso_data_re;
wire [31:0] csrbank7_miso_data_r;
wire [31:0] csrbank7_miso_data_w;
wire csrbank7_sel;
wire [13:0] interface8_bank_bus_adr;
wire interface8_bank_bus_we;
wire [31:0] interface8_bank_bus_dat_w;
reg [31:0] interface8_bank_bus_dat_r = 32'd0;
wire csrbank8_enable0_re;
wire csrbank8_enable0_r;
wire csrbank8_enable0_w;
wire csrbank8_width0_re;
wire [31:0] csrbank8_width0_r;
wire [31:0] csrbank8_width0_w;
wire csrbank8_period0_re;
wire [31:0] csrbank8_period0_r;
wire [31:0] csrbank8_period0_w;
wire csrbank8_sel;
wire [13:0] interface9_bank_bus_adr;
wire interface9_bank_bus_we;
wire [31:0] interface9_bank_bus_dat_w;
reg [31:0] interface9_bank_bus_dat_r = 32'd0;
wire csrbank9_r_enable0_re;
wire csrbank9_r_enable0_r;
wire csrbank9_r_enable0_w;
wire csrbank9_r_width0_re;
wire [31:0] csrbank9_r_width0_r;
wire [31:0] csrbank9_r_width0_w;
wire csrbank9_r_period0_re;
wire [31:0] csrbank9_r_period0_r;
wire [31:0] csrbank9_r_period0_w;
wire csrbank9_g_enable0_re;
wire csrbank9_g_enable0_r;
wire csrbank9_g_enable0_w;
wire csrbank9_g_width0_re;
wire [31:0] csrbank9_g_width0_r;
wire [31:0] csrbank9_g_width0_w;
wire csrbank9_g_period0_re;
wire [31:0] csrbank9_g_period0_r;
wire [31:0] csrbank9_g_period0_w;
wire csrbank9_b_enable0_re;
wire csrbank9_b_enable0_r;
wire csrbank9_b_enable0_w;
wire csrbank9_b_width0_re;
wire [31:0] csrbank9_b_width0_r;
wire [31:0] csrbank9_b_width0_w;
wire csrbank9_b_period0_re;
wire [31:0] csrbank9_b_period0_r;
wire [31:0] csrbank9_b_period0_w;
wire csrbank9_sel;
wire [13:0] interface10_bank_bus_adr;
wire interface10_bank_bus_we;
wire [31:0] interface10_bank_bus_dat_w;
reg [31:0] interface10_bank_bus_dat_r = 32'd0;
wire csrbank10_in_re;
wire [15:0] csrbank10_in_r;
wire [15:0] csrbank10_in_w;
wire csrbank10_sel;
wire [13:0] interface11_bank_bus_adr;
wire interface11_bank_bus_we;
wire [31:0] interface11_bank_bus_dat_w;
reg [31:0] interface11_bank_bus_dat_r = 32'd0;
wire csrbank11_temperature_re;
wire [11:0] csrbank11_temperature_r;
wire [11:0] csrbank11_temperature_w;
wire csrbank11_vccint_re;
wire [11:0] csrbank11_vccint_r;
wire [11:0] csrbank11_vccint_w;
wire csrbank11_vccaux_re;
wire [11:0] csrbank11_vccaux_r;
wire [11:0] csrbank11_vccaux_w;
wire csrbank11_vccbram_re;
wire [11:0] csrbank11_vccbram_r;
wire [11:0] csrbank11_vccbram_w;
wire csrbank11_sel;
reg [29:0] array_muxed0 = 30'd0;
reg [31:0] array_muxed1 = 32'd0;
reg [3:0] array_muxed2 = 4'd0;
reg array_muxed3 = 1'd0;
reg array_muxed4 = 1'd0;
reg array_muxed5 = 1'd0;
reg [2:0] array_muxed6 = 3'd0;
reg [1:0] array_muxed7 = 2'd0;
(* register_balancing = "no", shreg_extract = "no" *) reg xilinxmultiregimpl0_regs0 = 1'd0;
(* register_balancing = "no", shreg_extract = "no" *) reg xilinxmultiregimpl0_regs1 = 1'd0;
(* register_balancing = "no", shreg_extract = "no" *) reg [15:0] xilinxmultiregimpl1_regs0 = 16'd0;
(* register_balancing = "no", shreg_extract = "no" *) reg [15:0] xilinxmultiregimpl1_regs1 = 16'd0;
wire xilinxmultiregimpl1;
(* register_balancing = "no", shreg_extract = "no" *) reg [4:0] xilinxmultiregimpl2_regs0 = 5'd0;
(* register_balancing = "no", shreg_extract = "no" *) reg [4:0] xilinxmultiregimpl2_regs1 = 5'd0;
wire xilinxmultiregimpl2;

assign display_cs_n = (~display_cs0);
assign display_abcdefg = (~display_abcdefg0);
assign basesoc_bus_error = error;
assign basesoc_reset = basesoc_reset_reset_re;
assign basesoc_bus_errors_status = basesoc_bus_errors;
always @(*) begin
	basesoc_sram_we <= 4'd0;
	basesoc_sram_we[0] <= (((basesoc_sram_bus_cyc & basesoc_sram_bus_stb) & basesoc_sram_bus_we) & basesoc_sram_bus_sel[0]);
	basesoc_sram_we[1] <= (((basesoc_sram_bus_cyc & basesoc_sram_bus_stb) & basesoc_sram_bus_we) & basesoc_sram_bus_sel[1]);
	basesoc_sram_we[2] <= (((basesoc_sram_bus_cyc & basesoc_sram_bus_stb) & basesoc_sram_bus_we) & basesoc_sram_bus_sel[2]);
	basesoc_sram_we[3] <= (((basesoc_sram_bus_cyc & basesoc_sram_bus_stb) & basesoc_sram_bus_we) & basesoc_sram_bus_sel[3]);
end
assign basesoc_sram_adr = basesoc_sram_bus_adr[9:0];
assign basesoc_sram_bus_dat_r = basesoc_sram_dat_r;
assign basesoc_sram_dat_w = basesoc_sram_bus_dat_w;
assign sys_clk = clk100;
assign por_clk = clk100;
assign sys_rst = int_rst;
assign uartwishbonebridge_reset = uartwishbonebridge_done;
assign uartwishbonebridge_rx_ready = 1'd1;
assign uartwishbonebridge_adr = (uartwishbonebridge_address + uartwishbonebridge_word_counter);
assign uartwishbonebridge_dat_w = uartwishbonebridge_data;
assign uartwishbonebridge_sel = 4'd15;
always @(*) begin
	uartwishbonebridge_tx_payload_data <= 8'd0;
	case (uartwishbonebridge_byte_counter)
		1'd0: begin
			uartwishbonebridge_tx_payload_data <= uartwishbonebridge_data[31:24];
		end
		1'd1: begin
			uartwishbonebridge_tx_payload_data <= uartwishbonebridge_data[23:16];
		end
		2'd2: begin
			uartwishbonebridge_tx_payload_data <= uartwishbonebridge_data[15:8];
		end
		default: begin
			uartwishbonebridge_tx_payload_data <= uartwishbonebridge_data[7:0];
		end
	endcase
end
assign uartwishbonebridge_wait = (~uartwishbonebridge_is_ongoing);
assign uartwishbonebridge_tx_last = ((uartwishbonebridge_byte_counter == 2'd3) & (uartwishbonebridge_word_counter == (uartwishbonebridge_length - 1'd1)));
always @(*) begin
	uartwishbonebridge_word_counter_reset <= 1'd0;
	uartwishbonebridge_is_ongoing <= 1'd0;
	uartwishbonebridge_next_state <= 3'd0;
	uartwishbonebridge_word_counter_ce <= 1'd0;
	uartwishbonebridge_tx_data_ce <= 1'd0;
	uartwishbonebridge_tx_valid <= 1'd0;
	uartwishbonebridge_cyc <= 1'd0;
	uartwishbonebridge_cmd_ce <= 1'd0;
	uartwishbonebridge_stb <= 1'd0;
	uartwishbonebridge_length_ce <= 1'd0;
	uartwishbonebridge_we <= 1'd0;
	uartwishbonebridge_address_ce <= 1'd0;
	uartwishbonebridge_rx_data_ce <= 1'd0;
	uartwishbonebridge_byte_counter_reset <= 1'd0;
	uartwishbonebridge_byte_counter_ce <= 1'd0;
	uartwishbonebridge_next_state <= uartwishbonebridge_state;
	case (uartwishbonebridge_state)
		1'd1: begin
			if (uartwishbonebridge_rx_valid) begin
				uartwishbonebridge_length_ce <= 1'd1;
				uartwishbonebridge_next_state <= 2'd2;
			end
		end
		2'd2: begin
			if (uartwishbonebridge_rx_valid) begin
				uartwishbonebridge_address_ce <= 1'd1;
				uartwishbonebridge_byte_counter_ce <= 1'd1;
				if ((uartwishbonebridge_byte_counter == 2'd3)) begin
					if ((uartwishbonebridge_cmd == 1'd1)) begin
						uartwishbonebridge_next_state <= 2'd3;
					end else begin
						if ((uartwishbonebridge_cmd == 2'd2)) begin
							uartwishbonebridge_next_state <= 3'd5;
						end
					end
					uartwishbonebridge_byte_counter_reset <= 1'd1;
				end
			end
		end
		2'd3: begin
			if (uartwishbonebridge_rx_valid) begin
				uartwishbonebridge_rx_data_ce <= 1'd1;
				uartwishbonebridge_byte_counter_ce <= 1'd1;
				if ((uartwishbonebridge_byte_counter == 2'd3)) begin
					uartwishbonebridge_next_state <= 3'd4;
					uartwishbonebridge_byte_counter_reset <= 1'd1;
				end
			end
		end
		3'd4: begin
			uartwishbonebridge_stb <= 1'd1;
			uartwishbonebridge_we <= 1'd1;
			uartwishbonebridge_cyc <= 1'd1;
			if (uartwishbonebridge_ack) begin
				uartwishbonebridge_word_counter_ce <= 1'd1;
				if ((uartwishbonebridge_word_counter == (uartwishbonebridge_length - 1'd1))) begin
					uartwishbonebridge_next_state <= 1'd0;
				end else begin
					uartwishbonebridge_next_state <= 2'd3;
				end
			end
		end
		3'd5: begin
			uartwishbonebridge_stb <= 1'd1;
			uartwishbonebridge_we <= 1'd0;
			uartwishbonebridge_cyc <= 1'd1;
			if (uartwishbonebridge_ack) begin
				uartwishbonebridge_tx_data_ce <= 1'd1;
				uartwishbonebridge_next_state <= 3'd6;
			end
		end
		3'd6: begin
			uartwishbonebridge_tx_valid <= 1'd1;
			if (uartwishbonebridge_tx_ready) begin
				uartwishbonebridge_byte_counter_ce <= 1'd1;
				if ((uartwishbonebridge_byte_counter == 2'd3)) begin
					uartwishbonebridge_word_counter_ce <= 1'd1;
					if ((uartwishbonebridge_word_counter == (uartwishbonebridge_length - 1'd1))) begin
						uartwishbonebridge_next_state <= 1'd0;
					end else begin
						uartwishbonebridge_next_state <= 3'd5;
						uartwishbonebridge_byte_counter_reset <= 1'd1;
					end
				end
			end
		end
		default: begin
			if (uartwishbonebridge_rx_valid) begin
				uartwishbonebridge_cmd_ce <= 1'd1;
				if (((uartwishbonebridge_rx_payload_data == 1'd1) | (uartwishbonebridge_rx_payload_data == 2'd2))) begin
					uartwishbonebridge_next_state <= 1'd1;
				end
				uartwishbonebridge_byte_counter_reset <= 1'd1;
				uartwishbonebridge_word_counter_reset <= 1'd1;
			end
			uartwishbonebridge_is_ongoing <= 1'd1;
		end
	endcase
end
assign uartwishbonebridge_done = (uartwishbonebridge_count == 1'd0);
assign {user_led15, user_led14, user_led13, user_led12, user_led11, user_led10, user_led9, user_led8, user_led7, user_led6, user_led5, user_led4, user_led3, user_led2, user_led1, user_led0} = leds_storage;
assign r_enable = r_enable_storage;
assign r_width = r_width_storage;
assign r_period = r_period_storage;
assign g_enable = g_enable_storage;
assign g_width = g_width_storage;
assign g_period = g_period_storage;
assign b_enable = b_enable_storage;
assign b_width = b_width_storage;
assign b_period = b_period_storage;
assign {adxl362_spimastercore_config_div_read, adxl362_spimastercore_config_div_write, adxl362_spimastercore_config_padding1, adxl362_spimastercore_config_half_duplex, adxl362_spimastercore_config_lsb_first, adxl362_spimastercore_config_clk_phase, adxl362_spimastercore_config_clk_polarity, adxl362_spimastercore_config_cs_polarity, adxl362_spimastercore_config_padding0, adxl362_spimastercore_config_offline} = adxl362_config_storage;
assign {adxl362_spimastercore_xfer_padding1, adxl362_spimastercore_xfer_read_length, adxl362_spimastercore_xfer_padding0, adxl362_spimastercore_xfer_write_length, adxl362_spimastercore_xfer_cs} = adxl362_xfer_storage;
assign adxl362_spimastercore_start = (adxl362_start_re & adxl362_start_r);
assign adxl362_active_status = adxl362_spimastercore_active;
assign adxl362_pending_status = adxl362_spimastercore_pending0;
assign adxl362_spimastercore_mosi_data = adxl362_mosi_data_storage;
assign adxl362_miso_data_status = adxl362_spimastercore_miso_data;
assign adxl362_spimastercore_miso_data = adxl362_spimastercore1;
assign adxl362_spimastercore_spimachine_start = (adxl362_spimastercore_pending1 & ((~adxl362_spimastercore_spimachine_cs) | adxl362_spimastercore_spimachine_done1));
assign adxl362_spimastercore_spimachine_clk_phase = adxl362_spimastercore_config_clk_phase;
assign adxl362_spimastercore_spimachine_lsb = adxl362_spimastercore_config_lsb_first;
assign adxl362_spimastercore_spimachine0 = adxl362_spimastercore_config_div_write;
assign adxl362_spimastercore_spimachine1 = adxl362_spimastercore_config_div_read;
assign adxl362_spimastercore_cs_n_t_oe = (~adxl362_spimastercore_config_offline);
assign adxl362_spimastercore_cs_n_t_o = ((adxl362_spimastercore0 & {16{adxl362_spimastercore_spimachine_cs}}) ^ {16{(~adxl362_spimastercore_config_cs_polarity)}});
assign adxl362_spimastercore_clk_t_oe = (~adxl362_spimastercore_config_offline);
assign adxl362_spimastercore_clk_t_o = ((adxl362_spimastercore_spimachine_spiclockgen_clk & adxl362_spimastercore_spimachine_cs) ^ adxl362_spimastercore_config_clk_polarity);
assign adxl362_spimastercore_mosi_t_oe = (((~adxl362_spimastercore_config_offline) & adxl362_spimastercore_spimachine_cs) & (adxl362_spimastercore_spimachine_oe | (~adxl362_spimastercore_config_half_duplex)));
assign adxl362_spimastercore_mosi_t_o = adxl362_spimastercore_spimachine_o;
assign adxl362_spimastercore_spimachine_i = (adxl362_spimastercore_config_half_duplex ? adxl362_spimastercore_mosi_t_i : adxl362_spi_miso);
assign adxl362_spimastercore_spimachine_cg_ce = ((adxl362_spimastercore_spimachine_start | adxl362_spimastercore_spimachine_cs) | (~adxl362_spimastercore_spimachine_spiclockgen_edge));
always @(*) begin
	adxl362_spimastercore_spimachine_spiclockgen_load <= 8'd0;
	if ((adxl362_spimastercore_spimachine_write | (~adxl362_spimastercore_spimachine_read))) begin
		adxl362_spimastercore_spimachine_spiclockgen_load <= adxl362_spimastercore_spimachine0;
	end else begin
		adxl362_spimastercore_spimachine_spiclockgen_load <= adxl362_spimastercore_spimachine1;
	end
end
assign adxl362_spimastercore_spimachine_spiclockgen_bias0 = adxl362_spimastercore_spimachine_clk_phase;
assign adxl362_spimastercore_spimachine_fsm_ce = adxl362_spimastercore_spimachine_spiclockgen_edge;
assign adxl362_spimastercore_spimachine_cs = (~adxl362_spimastercore_spimachine_fsm_is_ongoing0);
assign adxl362_spimastercore_spimachine_reg_ce = adxl362_spimastercore_spimachine_spiclockgen_edge;
assign adxl362_spimastercore_spimachine_bits_ce = (adxl362_spimastercore_spimachine_spiclockgen_edge & adxl362_spimastercore_spimachine_sample);
assign adxl362_spimastercore_spimachine_done1 = ((adxl362_spimastercore_spimachine_spiclockgen_edge & adxl362_spimastercore_spimachine_done0) & adxl362_spimastercore_spimachine_fsm_is_ongoing1);
assign adxl362_spimastercore_spimachine_oe = (adxl362_spimastercore_spimachine_write0 | adxl362_spimastercore_spimachine_write);
assign adxl362_spimastercore_spimachine_spiclockgen_zero = (adxl362_spimastercore_spimachine_spiclockgen == 1'd0);
assign adxl362_spimastercore_spimachine_spiclockgen_edge = (adxl362_spimastercore_spimachine_spiclockgen_zero & (~adxl362_spimastercore_spimachine_spiclockgen_bias1));
assign adxl362_spimastercore_spimachine_o = (adxl362_spimastercore_spimachine_lsb ? adxl362_spimastercore_spimachine_data[0] : adxl362_spimastercore_spimachine_data[31]);
assign adxl362_spimastercore_spimachine_write = (adxl362_spimastercore_spimachine_n_write != 1'd0);
assign adxl362_spimastercore_spimachine_read = (adxl362_spimastercore_spimachine_n_read != 1'd0);
assign adxl362_spimastercore_spimachine_done0 = (~(adxl362_spimastercore_spimachine_write | adxl362_spimastercore_spimachine_read));
always @(*) begin
	adxl362_spimastercore_spimachine_shift <= 1'd0;
	adxl362_spimastercore_spimachine_fsm_is_ongoing0 <= 1'd0;
	spimaster0_next_state <= 2'd0;
	adxl362_spimastercore_spimachine_fsm_is_ongoing1 <= 1'd0;
	adxl362_spimastercore_spimachine_sample <= 1'd0;
	spimaster0_next_state <= spimaster0_state;
	case (spimaster0_state)
		1'd1: begin
			adxl362_spimastercore_spimachine_sample <= 1'd1;
			spimaster0_next_state <= 2'd2;
		end
		2'd2: begin
			if ((adxl362_spimastercore_spimachine_done0 & (~adxl362_spimastercore_spimachine_start))) begin
				if (adxl362_spimastercore_spimachine_clk_phase) begin
					spimaster0_next_state <= 1'd0;
				end else begin
					spimaster0_next_state <= 2'd3;
				end
			end else begin
				adxl362_spimastercore_spimachine_shift <= (~adxl362_spimastercore_spimachine_start);
				spimaster0_next_state <= 1'd1;
			end
			adxl362_spimastercore_spimachine_fsm_is_ongoing1 <= 1'd1;
		end
		2'd3: begin
			if (adxl362_spimastercore_spimachine_done0) begin
				spimaster0_next_state <= 1'd0;
			end else begin
				spimaster0_next_state <= 1'd1;
			end
		end
		default: begin
			if (adxl362_spimastercore_spimachine_start) begin
				if (adxl362_spimastercore_spimachine_clk_phase) begin
					spimaster0_next_state <= 2'd3;
				end else begin
					spimaster0_next_state <= 1'd1;
				end
			end
			adxl362_spimastercore_spimachine_fsm_is_ongoing0 <= 1'd1;
		end
	endcase
end
assign display_cs0 = display_cs1;
assign display_abcdefg0 = display_abcdefg1;
assign display_abcdefg1 = display_abcdefg2;
assign display_cs1 = display_cs2;
always @(*) begin
	display_value <= 4'd0;
	case (display_cs1)
		1'd1: begin
			display_value <= display_values0;
		end
		2'd2: begin
			display_value <= display_values1;
		end
		3'd4: begin
			display_value <= display_values2;
		end
		4'd8: begin
			display_value <= display_values3;
		end
		5'd16: begin
			display_value <= display_values4;
		end
		6'd32: begin
			display_value <= display_values5;
		end
	endcase
end
always @(*) begin
	display_abcdefg2 <= 7'd0;
	case (display_value)
		1'd0: begin
			display_abcdefg2 <= 6'd63;
		end
		1'd1: begin
			display_abcdefg2 <= 3'd6;
		end
		2'd2: begin
			display_abcdefg2 <= 7'd91;
		end
		2'd3: begin
			display_abcdefg2 <= 7'd79;
		end
		3'd4: begin
			display_abcdefg2 <= 7'd102;
		end
		3'd5: begin
			display_abcdefg2 <= 7'd109;
		end
		3'd6: begin
			display_abcdefg2 <= 7'd125;
		end
		3'd7: begin
			display_abcdefg2 <= 3'd7;
		end
		4'd8: begin
			display_abcdefg2 <= 7'd127;
		end
		4'd9: begin
			display_abcdefg2 <= 7'd111;
		end
		4'd10: begin
			display_abcdefg2 <= 7'd119;
		end
		4'd11: begin
			display_abcdefg2 <= 7'd124;
		end
		4'd12: begin
			display_abcdefg2 <= 6'd57;
		end
		4'd13: begin
			display_abcdefg2 <= 7'd94;
		end
		4'd14: begin
			display_abcdefg2 <= 7'd121;
		end
		4'd15: begin
			display_abcdefg2 <= 7'd113;
		end
	endcase
end
assign display_ce = (display_counter == 1'd0);
assign probe_PWM_enable = probe_PWM_enable_storage;
assign probe_PWM_width = probe_PWM_width_storage;
assign probe_PWM_period = probe_PWM_period_storage;
assign {probeSPI_spimastercore_config_div_read, probeSPI_spimastercore_config_div_write, probeSPI_spimastercore_config_padding1, probeSPI_spimastercore_config_half_duplex, probeSPI_spimastercore_config_lsb_first, probeSPI_spimastercore_config_clk_phase, probeSPI_spimastercore_config_clk_polarity, probeSPI_spimastercore_config_cs_polarity, probeSPI_spimastercore_config_padding0, probeSPI_spimastercore_config_offline} = probeSPI_config_storage;
assign {probeSPI_spimastercore_xfer_padding1, probeSPI_spimastercore_xfer_read_length, probeSPI_spimastercore_xfer_padding0, probeSPI_spimastercore_xfer_write_length, probeSPI_spimastercore_xfer_cs} = probeSPI_xfer_storage;
assign probeSPI_spimastercore_start = (probeSPI_start_re & probeSPI_start_r);
assign probeSPI_active_status = probeSPI_spimastercore_active;
assign probeSPI_pending_status = probeSPI_spimastercore_pending0;
assign probeSPI_spimastercore_mosi_data = probeSPI_mosi_data_storage;
assign probeSPI_miso_data_status = probeSPI_spimastercore_miso_data;
assign probeSPI_spimastercore_miso_data = probeSPI_spimastercore1;
assign probeSPI_spimastercore_spimachine_start = (probeSPI_spimastercore_pending1 & ((~probeSPI_spimastercore_spimachine_cs) | probeSPI_spimastercore_spimachine_done1));
assign probeSPI_spimastercore_spimachine_clk_phase = probeSPI_spimastercore_config_clk_phase;
assign probeSPI_spimastercore_spimachine_lsb = probeSPI_spimastercore_config_lsb_first;
assign probeSPI_spimastercore_spimachine0 = probeSPI_spimastercore_config_div_write;
assign probeSPI_spimastercore_spimachine1 = probeSPI_spimastercore_config_div_read;
assign probeSPI_spimastercore_cs_n_t_oe = (~probeSPI_spimastercore_config_offline);
assign probeSPI_spimastercore_cs_n_t_o = ((probeSPI_spimastercore0 & {16{probeSPI_spimastercore_spimachine_cs}}) ^ {16{(~probeSPI_spimastercore_config_cs_polarity)}});
assign probeSPI_spimastercore_clk_t_oe = (~probeSPI_spimastercore_config_offline);
assign probeSPI_spimastercore_clk_t_o = ((probeSPI_spimastercore_spimachine_spiclockgen_clk & probeSPI_spimastercore_spimachine_cs) ^ probeSPI_spimastercore_config_clk_polarity);
assign probeSPI_spimastercore_mosi_t_oe = (((~probeSPI_spimastercore_config_offline) & probeSPI_spimastercore_spimachine_cs) & (probeSPI_spimastercore_spimachine_oe | (~probeSPI_spimastercore_config_half_duplex)));
assign probeSPI_spimastercore_mosi_t_o = probeSPI_spimastercore_spimachine_o;
assign probeSPI_spimastercore_spimachine_i = (probeSPI_spimastercore_config_half_duplex ? probeSPI_spimastercore_mosi_t_i : SPIprueba_miso);
assign probeSPI_spimastercore_spimachine_cg_ce = ((probeSPI_spimastercore_spimachine_start | probeSPI_spimastercore_spimachine_cs) | (~probeSPI_spimastercore_spimachine_spiclockgen_edge));
always @(*) begin
	probeSPI_spimastercore_spimachine_spiclockgen_load <= 8'd0;
	if ((probeSPI_spimastercore_spimachine_write | (~probeSPI_spimastercore_spimachine_read))) begin
		probeSPI_spimastercore_spimachine_spiclockgen_load <= probeSPI_spimastercore_spimachine0;
	end else begin
		probeSPI_spimastercore_spimachine_spiclockgen_load <= probeSPI_spimastercore_spimachine1;
	end
end
assign probeSPI_spimastercore_spimachine_spiclockgen_bias0 = probeSPI_spimastercore_spimachine_clk_phase;
assign probeSPI_spimastercore_spimachine_fsm_ce = probeSPI_spimastercore_spimachine_spiclockgen_edge;
assign probeSPI_spimastercore_spimachine_cs = (~probeSPI_spimastercore_spimachine_fsm_is_ongoing0);
assign probeSPI_spimastercore_spimachine_reg_ce = probeSPI_spimastercore_spimachine_spiclockgen_edge;
assign probeSPI_spimastercore_spimachine_bits_ce = (probeSPI_spimastercore_spimachine_spiclockgen_edge & probeSPI_spimastercore_spimachine_sample);
assign probeSPI_spimastercore_spimachine_done1 = ((probeSPI_spimastercore_spimachine_spiclockgen_edge & probeSPI_spimastercore_spimachine_done0) & probeSPI_spimastercore_spimachine_fsm_is_ongoing1);
assign probeSPI_spimastercore_spimachine_oe = (probeSPI_spimastercore_spimachine_write0 | probeSPI_spimastercore_spimachine_write);
assign probeSPI_spimastercore_spimachine_spiclockgen_zero = (probeSPI_spimastercore_spimachine_spiclockgen == 1'd0);
assign probeSPI_spimastercore_spimachine_spiclockgen_edge = (probeSPI_spimastercore_spimachine_spiclockgen_zero & (~probeSPI_spimastercore_spimachine_spiclockgen_bias1));
assign probeSPI_spimastercore_spimachine_o = (probeSPI_spimastercore_spimachine_lsb ? probeSPI_spimastercore_spimachine_data[0] : probeSPI_spimastercore_spimachine_data[31]);
assign probeSPI_spimastercore_spimachine_write = (probeSPI_spimastercore_spimachine_n_write != 1'd0);
assign probeSPI_spimastercore_spimachine_read = (probeSPI_spimastercore_spimachine_n_read != 1'd0);
assign probeSPI_spimastercore_spimachine_done0 = (~(probeSPI_spimastercore_spimachine_write | probeSPI_spimastercore_spimachine_read));
always @(*) begin
	probeSPI_spimastercore_spimachine_fsm_is_ongoing1 <= 1'd0;
	probeSPI_spimastercore_spimachine_shift <= 1'd0;
	probeSPI_spimastercore_spimachine_fsm_is_ongoing0 <= 1'd0;
	probeSPI_spimastercore_spimachine_sample <= 1'd0;
	spimaster1_next_state <= 2'd0;
	spimaster1_next_state <= spimaster1_state;
	case (spimaster1_state)
		1'd1: begin
			probeSPI_spimastercore_spimachine_sample <= 1'd1;
			spimaster1_next_state <= 2'd2;
		end
		2'd2: begin
			if ((probeSPI_spimastercore_spimachine_done0 & (~probeSPI_spimastercore_spimachine_start))) begin
				if (probeSPI_spimastercore_spimachine_clk_phase) begin
					spimaster1_next_state <= 1'd0;
				end else begin
					spimaster1_next_state <= 2'd3;
				end
			end else begin
				probeSPI_spimastercore_spimachine_shift <= (~probeSPI_spimastercore_spimachine_start);
				spimaster1_next_state <= 1'd1;
			end
			probeSPI_spimastercore_spimachine_fsm_is_ongoing1 <= 1'd1;
		end
		2'd3: begin
			if (probeSPI_spimastercore_spimachine_done0) begin
				spimaster1_next_state <= 1'd0;
			end else begin
				spimaster1_next_state <= 1'd1;
			end
		end
		default: begin
			if (probeSPI_spimastercore_spimachine_start) begin
				if (probeSPI_spimastercore_spimachine_clk_phase) begin
					spimaster1_next_state <= 2'd3;
				end else begin
					spimaster1_next_state <= 1'd1;
				end
			end
			probeSPI_spimastercore_spimachine_fsm_is_ongoing0 <= 1'd1;
		end
	endcase
end
assign shared_adr = array_muxed0;
assign shared_dat_w = array_muxed1;
assign shared_sel = array_muxed2;
assign shared_cyc = array_muxed3;
assign shared_stb = array_muxed4;
assign shared_we = array_muxed5;
assign shared_cti = array_muxed6;
assign shared_bte = array_muxed7;
assign uartwishbonebridge_dat_r = shared_dat_r;
assign uartwishbonebridge_ack = (shared_ack & (grant == 1'd0));
assign uartwishbonebridge_err = (shared_err & (grant == 1'd0));
assign request = {uartwishbonebridge_cyc};
assign grant = 1'd0;
always @(*) begin
	slave_sel <= 2'd0;
	slave_sel[0] <= (shared_adr[28:26] == 1'd1);
	slave_sel[1] <= (shared_adr[28:26] == 3'd6);
end
assign basesoc_sram_bus_adr = shared_adr;
assign basesoc_sram_bus_dat_w = shared_dat_w;
assign basesoc_sram_bus_sel = shared_sel;
assign basesoc_sram_bus_stb = shared_stb;
assign basesoc_sram_bus_we = shared_we;
assign basesoc_sram_bus_cti = shared_cti;
assign basesoc_sram_bus_bte = shared_bte;
assign basesoc_wishbone2csr_adr = shared_adr;
assign basesoc_wishbone2csr_dat_w = shared_dat_w;
assign basesoc_wishbone2csr_sel = shared_sel;
assign basesoc_wishbone2csr_stb = shared_stb;
assign basesoc_wishbone2csr_we = shared_we;
assign basesoc_wishbone2csr_cti = shared_cti;
assign basesoc_wishbone2csr_bte = shared_bte;
assign basesoc_sram_bus_cyc = (shared_cyc & slave_sel[0]);
assign basesoc_wishbone2csr_cyc = (shared_cyc & slave_sel[1]);
assign shared_err = (basesoc_sram_bus_err | basesoc_wishbone2csr_err);
assign wait_1 = ((shared_stb & shared_cyc) & (~shared_ack));
always @(*) begin
	shared_ack <= 1'd0;
	error <= 1'd0;
	shared_dat_r <= 32'd0;
	shared_ack <= (basesoc_sram_bus_ack | basesoc_wishbone2csr_ack);
	shared_dat_r <= (({32{slave_sel_r[0]}} & basesoc_sram_bus_dat_r) | ({32{slave_sel_r[1]}} & basesoc_wishbone2csr_dat_r));
	if (done) begin
		shared_dat_r <= 32'd4294967295;
		shared_ack <= 1'd1;
		error <= 1'd1;
	end
end
assign done = (count == 1'd0);
assign csrbank0_sel = (interface0_bank_bus_adr[13:9] == 4'd14);
assign csrbank0_config0_r = interface0_bank_bus_dat_w[31:0];
assign csrbank0_config0_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[2:0] == 1'd0));
assign csrbank0_xfer0_r = interface0_bank_bus_dat_w[31:0];
assign csrbank0_xfer0_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[2:0] == 1'd1));
assign adxl362_start_r = interface0_bank_bus_dat_w[0];
assign adxl362_start_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[2:0] == 2'd2));
assign csrbank0_active_r = interface0_bank_bus_dat_w[0];
assign csrbank0_active_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[2:0] == 2'd3));
assign csrbank0_pending_r = interface0_bank_bus_dat_w[0];
assign csrbank0_pending_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[2:0] == 3'd4));
assign csrbank0_mosi_data0_r = interface0_bank_bus_dat_w[31:0];
assign csrbank0_mosi_data0_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[2:0] == 3'd5));
assign csrbank0_miso_data_r = interface0_bank_bus_dat_w[31:0];
assign csrbank0_miso_data_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[2:0] == 3'd6));
assign adxl362_config_storage = adxl362_config_storage_full[31:0];
assign csrbank0_config0_w = adxl362_config_storage_full[31:0];
assign adxl362_xfer_storage = adxl362_xfer_storage_full[31:0];
assign csrbank0_xfer0_w = adxl362_xfer_storage_full[31:0];
assign csrbank0_active_w = adxl362_active_status;
assign csrbank0_pending_w = adxl362_pending_status;
assign adxl362_mosi_data_storage = adxl362_mosi_data_storage_full[31:0];
assign csrbank0_mosi_data0_w = adxl362_mosi_data_storage_full[31:0];
assign csrbank0_miso_data_w = adxl362_miso_data_status[31:0];
assign csrbank1_sel = (interface1_bank_bus_adr[13:9] == 4'd13);
assign csrbank1_in_r = interface1_bank_bus_dat_w[4:0];
assign csrbank1_in_re = ((csrbank1_sel & interface1_bank_bus_we) & (interface1_bank_bus_adr[0] == 1'd0));
assign csrbank1_in_w = buttons_status[4:0];
assign csrbank2_sel = (interface2_bank_bus_adr[13:9] == 1'd0);
assign basesoc_reset_reset_r = interface2_bank_bus_dat_w[0];
assign basesoc_reset_reset_re = ((csrbank2_sel & interface2_bank_bus_we) & (interface2_bank_bus_adr[1:0] == 1'd0));
assign csrbank2_scratch0_r = interface2_bank_bus_dat_w[31:0];
assign csrbank2_scratch0_re = ((csrbank2_sel & interface2_bank_bus_we) & (interface2_bank_bus_adr[1:0] == 1'd1));
assign csrbank2_bus_errors_r = interface2_bank_bus_dat_w[31:0];
assign csrbank2_bus_errors_re = ((csrbank2_sel & interface2_bank_bus_we) & (interface2_bank_bus_adr[1:0] == 2'd2));
assign basesoc_storage = basesoc_storage_full[31:0];
assign csrbank2_scratch0_w = basesoc_storage_full[31:0];
assign csrbank2_bus_errors_w = basesoc_bus_errors_status[31:0];
assign csrbank3_sel = (interface3_bank_bus_adr[13:9] == 4'd15);
assign csrbank3_sel0_r = interface3_bank_bus_dat_w[3:0];
assign csrbank3_sel0_re = ((csrbank3_sel & interface3_bank_bus_we) & (interface3_bank_bus_adr[1:0] == 1'd0));
assign csrbank3_value0_r = interface3_bank_bus_dat_w[3:0];
assign csrbank3_value0_re = ((csrbank3_sel & interface3_bank_bus_we) & (interface3_bank_bus_adr[1:0] == 1'd1));
assign display_write_r = interface3_bank_bus_dat_w[0];
assign display_write_re = ((csrbank3_sel & interface3_bank_bus_we) & (interface3_bank_bus_adr[1:0] == 2'd2));
assign display_sel_storage = display_sel_storage_full[3:0];
assign csrbank3_sel0_w = display_sel_storage_full[3:0];
assign display_value_storage = display_value_storage_full[3:0];
assign csrbank3_value0_w = display_value_storage_full[3:0];
assign csrbank4_sel = (interface4_bank_bus_adr[13:9] == 4'd8);
assign csrbank4_id1_r = interface4_bank_bus_dat_w[24:0];
assign csrbank4_id1_re = ((csrbank4_sel & interface4_bank_bus_we) & (interface4_bank_bus_adr[0] == 1'd0));
assign csrbank4_id0_r = interface4_bank_bus_dat_w[31:0];
assign csrbank4_id0_re = ((csrbank4_sel & interface4_bank_bus_we) & (interface4_bank_bus_adr[0] == 1'd1));
assign csrbank4_id1_w = dna_status[56:32];
assign csrbank4_id0_w = dna_status[31:0];
assign sel = (sram_bus_adr[13:9] == 3'd4);
always @(*) begin
	sram_bus_dat_r <= 32'd0;
	if (sel_r) begin
		sram_bus_dat_r <= dat_r;
	end
end
assign adr = sram_bus_adr[5:0];
assign csrbank5_sel = (interface5_bank_bus_adr[13:9] == 5'd18);
assign csrbank5_D0_D8_out0_r = interface5_bank_bus_dat_w[7:0];
assign csrbank5_D0_D8_out0_re = ((csrbank5_sel & interface5_bank_bus_we) & (interface5_bank_bus_adr[2:0] == 1'd0));
assign csrbank5_CS_out0_r = interface5_bank_bus_dat_w[0];
assign csrbank5_CS_out0_re = ((csrbank5_sel & interface5_bank_bus_we) & (interface5_bank_bus_adr[2:0] == 1'd1));
assign csrbank5_RS_out0_r = interface5_bank_bus_dat_w[0];
assign csrbank5_RS_out0_re = ((csrbank5_sel & interface5_bank_bus_we) & (interface5_bank_bus_adr[2:0] == 2'd2));
assign csrbank5_RD_out0_r = interface5_bank_bus_dat_w[0];
assign csrbank5_RD_out0_re = ((csrbank5_sel & interface5_bank_bus_we) & (interface5_bank_bus_adr[2:0] == 2'd3));
assign csrbank5_WR_out0_r = interface5_bank_bus_dat_w[0];
assign csrbank5_WR_out0_re = ((csrbank5_sel & interface5_bank_bus_we) & (interface5_bank_bus_adr[2:0] == 3'd4));
assign gpioout0_storage = gpioout0_storage_full[7:0];
assign csrbank5_D0_D8_out0_w = gpioout0_storage_full[7:0];
assign gpioout1_storage = gpioout1_storage_full;
assign csrbank5_CS_out0_w = gpioout1_storage_full;
assign gpioout2_storage = gpioout2_storage_full;
assign csrbank5_RS_out0_w = gpioout2_storage_full;
assign gpioout3_storage = gpioout3_storage_full;
assign csrbank5_RD_out0_w = gpioout3_storage_full;
assign gpioout4_storage = gpioout4_storage_full;
assign csrbank5_WR_out0_w = gpioout4_storage_full;
assign csrbank6_sel = (interface6_bank_bus_adr[13:9] == 4'd11);
assign csrbank6_out0_r = interface6_bank_bus_dat_w[15:0];
assign csrbank6_out0_re = ((csrbank6_sel & interface6_bank_bus_we) & (interface6_bank_bus_adr[0] == 1'd0));
assign leds_storage = leds_storage_full[15:0];
assign csrbank6_out0_w = leds_storage_full[15:0];
assign csrbank7_sel = (interface7_bank_bus_adr[13:9] == 5'd17);
assign csrbank7_config0_r = interface7_bank_bus_dat_w[31:0];
assign csrbank7_config0_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[2:0] == 1'd0));
assign csrbank7_xfer0_r = interface7_bank_bus_dat_w[31:0];
assign csrbank7_xfer0_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[2:0] == 1'd1));
assign probeSPI_start_r = interface7_bank_bus_dat_w[0];
assign probeSPI_start_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[2:0] == 2'd2));
assign csrbank7_active_r = interface7_bank_bus_dat_w[0];
assign csrbank7_active_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[2:0] == 2'd3));
assign csrbank7_pending_r = interface7_bank_bus_dat_w[0];
assign csrbank7_pending_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[2:0] == 3'd4));
assign csrbank7_mosi_data0_r = interface7_bank_bus_dat_w[31:0];
assign csrbank7_mosi_data0_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[2:0] == 3'd5));
assign csrbank7_miso_data_r = interface7_bank_bus_dat_w[31:0];
assign csrbank7_miso_data_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[2:0] == 3'd6));
assign probeSPI_config_storage = probeSPI_config_storage_full[31:0];
assign csrbank7_config0_w = probeSPI_config_storage_full[31:0];
assign probeSPI_xfer_storage = probeSPI_xfer_storage_full[31:0];
assign csrbank7_xfer0_w = probeSPI_xfer_storage_full[31:0];
assign csrbank7_active_w = probeSPI_active_status;
assign csrbank7_pending_w = probeSPI_pending_status;
assign probeSPI_mosi_data_storage = probeSPI_mosi_data_storage_full[31:0];
assign csrbank7_mosi_data0_w = probeSPI_mosi_data_storage_full[31:0];
assign csrbank7_miso_data_w = probeSPI_miso_data_status[31:0];
assign csrbank8_sel = (interface8_bank_bus_adr[13:9] == 5'd16);
assign csrbank8_enable0_r = interface8_bank_bus_dat_w[0];
assign csrbank8_enable0_re = ((csrbank8_sel & interface8_bank_bus_we) & (interface8_bank_bus_adr[1:0] == 1'd0));
assign csrbank8_width0_r = interface8_bank_bus_dat_w[31:0];
assign csrbank8_width0_re = ((csrbank8_sel & interface8_bank_bus_we) & (interface8_bank_bus_adr[1:0] == 1'd1));
assign csrbank8_period0_r = interface8_bank_bus_dat_w[31:0];
assign csrbank8_period0_re = ((csrbank8_sel & interface8_bank_bus_we) & (interface8_bank_bus_adr[1:0] == 2'd2));
assign probe_PWM_enable_storage = probe_PWM_enable_storage_full;
assign csrbank8_enable0_w = probe_PWM_enable_storage_full;
assign probe_PWM_width_storage = probe_PWM_width_storage_full[31:0];
assign csrbank8_width0_w = probe_PWM_width_storage_full[31:0];
assign probe_PWM_period_storage = probe_PWM_period_storage_full[31:0];
assign csrbank8_period0_w = probe_PWM_period_storage_full[31:0];
assign csrbank9_sel = (interface9_bank_bus_adr[13:9] == 4'd10);
assign csrbank9_r_enable0_r = interface9_bank_bus_dat_w[0];
assign csrbank9_r_enable0_re = ((csrbank9_sel & interface9_bank_bus_we) & (interface9_bank_bus_adr[3:0] == 1'd0));
assign csrbank9_r_width0_r = interface9_bank_bus_dat_w[31:0];
assign csrbank9_r_width0_re = ((csrbank9_sel & interface9_bank_bus_we) & (interface9_bank_bus_adr[3:0] == 1'd1));
assign csrbank9_r_period0_r = interface9_bank_bus_dat_w[31:0];
assign csrbank9_r_period0_re = ((csrbank9_sel & interface9_bank_bus_we) & (interface9_bank_bus_adr[3:0] == 2'd2));
assign csrbank9_g_enable0_r = interface9_bank_bus_dat_w[0];
assign csrbank9_g_enable0_re = ((csrbank9_sel & interface9_bank_bus_we) & (interface9_bank_bus_adr[3:0] == 2'd3));
assign csrbank9_g_width0_r = interface9_bank_bus_dat_w[31:0];
assign csrbank9_g_width0_re = ((csrbank9_sel & interface9_bank_bus_we) & (interface9_bank_bus_adr[3:0] == 3'd4));
assign csrbank9_g_period0_r = interface9_bank_bus_dat_w[31:0];
assign csrbank9_g_period0_re = ((csrbank9_sel & interface9_bank_bus_we) & (interface9_bank_bus_adr[3:0] == 3'd5));
assign csrbank9_b_enable0_r = interface9_bank_bus_dat_w[0];
assign csrbank9_b_enable0_re = ((csrbank9_sel & interface9_bank_bus_we) & (interface9_bank_bus_adr[3:0] == 3'd6));
assign csrbank9_b_width0_r = interface9_bank_bus_dat_w[31:0];
assign csrbank9_b_width0_re = ((csrbank9_sel & interface9_bank_bus_we) & (interface9_bank_bus_adr[3:0] == 3'd7));
assign csrbank9_b_period0_r = interface9_bank_bus_dat_w[31:0];
assign csrbank9_b_period0_re = ((csrbank9_sel & interface9_bank_bus_we) & (interface9_bank_bus_adr[3:0] == 4'd8));
assign r_enable_storage = r_enable_storage_full;
assign csrbank9_r_enable0_w = r_enable_storage_full;
assign r_width_storage = r_width_storage_full[31:0];
assign csrbank9_r_width0_w = r_width_storage_full[31:0];
assign r_period_storage = r_period_storage_full[31:0];
assign csrbank9_r_period0_w = r_period_storage_full[31:0];
assign g_enable_storage = g_enable_storage_full;
assign csrbank9_g_enable0_w = g_enable_storage_full;
assign g_width_storage = g_width_storage_full[31:0];
assign csrbank9_g_width0_w = g_width_storage_full[31:0];
assign g_period_storage = g_period_storage_full[31:0];
assign csrbank9_g_period0_w = g_period_storage_full[31:0];
assign b_enable_storage = b_enable_storage_full;
assign csrbank9_b_enable0_w = b_enable_storage_full;
assign b_width_storage = b_width_storage_full[31:0];
assign csrbank9_b_width0_w = b_width_storage_full[31:0];
assign b_period_storage = b_period_storage_full[31:0];
assign csrbank9_b_period0_w = b_period_storage_full[31:0];
assign csrbank10_sel = (interface10_bank_bus_adr[13:9] == 4'd12);
assign csrbank10_in_r = interface10_bank_bus_dat_w[15:0];
assign csrbank10_in_re = ((csrbank10_sel & interface10_bank_bus_we) & (interface10_bank_bus_adr[0] == 1'd0));
assign csrbank10_in_w = switches_status[15:0];
assign csrbank11_sel = (interface11_bank_bus_adr[13:9] == 4'd9);
assign csrbank11_temperature_r = interface11_bank_bus_dat_w[11:0];
assign csrbank11_temperature_re = ((csrbank11_sel & interface11_bank_bus_we) & (interface11_bank_bus_adr[1:0] == 1'd0));
assign csrbank11_vccint_r = interface11_bank_bus_dat_w[11:0];
assign csrbank11_vccint_re = ((csrbank11_sel & interface11_bank_bus_we) & (interface11_bank_bus_adr[1:0] == 1'd1));
assign csrbank11_vccaux_r = interface11_bank_bus_dat_w[11:0];
assign csrbank11_vccaux_re = ((csrbank11_sel & interface11_bank_bus_we) & (interface11_bank_bus_adr[1:0] == 2'd2));
assign csrbank11_vccbram_r = interface11_bank_bus_dat_w[11:0];
assign csrbank11_vccbram_re = ((csrbank11_sel & interface11_bank_bus_we) & (interface11_bank_bus_adr[1:0] == 2'd3));
assign csrbank11_temperature_w = xadc_temperature_status[11:0];
assign csrbank11_vccint_w = xadc_vccint_status[11:0];
assign csrbank11_vccaux_w = xadc_vccaux_status[11:0];
assign csrbank11_vccbram_w = xadc_vccbram_status[11:0];
assign interface0_bank_bus_adr = basesoc_interface_adr;
assign interface1_bank_bus_adr = basesoc_interface_adr;
assign interface2_bank_bus_adr = basesoc_interface_adr;
assign interface3_bank_bus_adr = basesoc_interface_adr;
assign interface4_bank_bus_adr = basesoc_interface_adr;
assign interface5_bank_bus_adr = basesoc_interface_adr;
assign interface6_bank_bus_adr = basesoc_interface_adr;
assign interface7_bank_bus_adr = basesoc_interface_adr;
assign interface8_bank_bus_adr = basesoc_interface_adr;
assign interface9_bank_bus_adr = basesoc_interface_adr;
assign interface10_bank_bus_adr = basesoc_interface_adr;
assign interface11_bank_bus_adr = basesoc_interface_adr;
assign sram_bus_adr = basesoc_interface_adr;
assign interface0_bank_bus_we = basesoc_interface_we;
assign interface1_bank_bus_we = basesoc_interface_we;
assign interface2_bank_bus_we = basesoc_interface_we;
assign interface3_bank_bus_we = basesoc_interface_we;
assign interface4_bank_bus_we = basesoc_interface_we;
assign interface5_bank_bus_we = basesoc_interface_we;
assign interface6_bank_bus_we = basesoc_interface_we;
assign interface7_bank_bus_we = basesoc_interface_we;
assign interface8_bank_bus_we = basesoc_interface_we;
assign interface9_bank_bus_we = basesoc_interface_we;
assign interface10_bank_bus_we = basesoc_interface_we;
assign interface11_bank_bus_we = basesoc_interface_we;
assign sram_bus_we = basesoc_interface_we;
assign interface0_bank_bus_dat_w = basesoc_interface_dat_w;
assign interface1_bank_bus_dat_w = basesoc_interface_dat_w;
assign interface2_bank_bus_dat_w = basesoc_interface_dat_w;
assign interface3_bank_bus_dat_w = basesoc_interface_dat_w;
assign interface4_bank_bus_dat_w = basesoc_interface_dat_w;
assign interface5_bank_bus_dat_w = basesoc_interface_dat_w;
assign interface6_bank_bus_dat_w = basesoc_interface_dat_w;
assign interface7_bank_bus_dat_w = basesoc_interface_dat_w;
assign interface8_bank_bus_dat_w = basesoc_interface_dat_w;
assign interface9_bank_bus_dat_w = basesoc_interface_dat_w;
assign interface10_bank_bus_dat_w = basesoc_interface_dat_w;
assign interface11_bank_bus_dat_w = basesoc_interface_dat_w;
assign sram_bus_dat_w = basesoc_interface_dat_w;
assign basesoc_interface_dat_r = ((((((((((((interface0_bank_bus_dat_r | interface1_bank_bus_dat_r) | interface2_bank_bus_dat_r) | interface3_bank_bus_dat_r) | interface4_bank_bus_dat_r) | interface5_bank_bus_dat_r) | interface6_bank_bus_dat_r) | interface7_bank_bus_dat_r) | interface8_bank_bus_dat_r) | interface9_bank_bus_dat_r) | interface10_bank_bus_dat_r) | interface11_bank_bus_dat_r) | sram_bus_dat_r);
always @(*) begin
	array_muxed0 <= 30'd0;
	case (grant)
		default: begin
			array_muxed0 <= uartwishbonebridge_adr;
		end
	endcase
end
always @(*) begin
	array_muxed1 <= 32'd0;
	case (grant)
		default: begin
			array_muxed1 <= uartwishbonebridge_dat_w;
		end
	endcase
end
always @(*) begin
	array_muxed2 <= 4'd0;
	case (grant)
		default: begin
			array_muxed2 <= uartwishbonebridge_sel;
		end
	endcase
end
always @(*) begin
	array_muxed3 <= 1'd0;
	case (grant)
		default: begin
			array_muxed3 <= uartwishbonebridge_cyc;
		end
	endcase
end
always @(*) begin
	array_muxed4 <= 1'd0;
	case (grant)
		default: begin
			array_muxed4 <= uartwishbonebridge_stb;
		end
	endcase
end
always @(*) begin
	array_muxed5 <= 1'd0;
	case (grant)
		default: begin
			array_muxed5 <= uartwishbonebridge_we;
		end
	endcase
end
always @(*) begin
	array_muxed6 <= 3'd0;
	case (grant)
		default: begin
			array_muxed6 <= uartwishbonebridge_cti;
		end
	endcase
end
always @(*) begin
	array_muxed7 <= 2'd0;
	case (grant)
		default: begin
			array_muxed7 <= uartwishbonebridge_bte;
		end
	endcase
end
assign uartwishbonebridge_rx_rx = xilinxmultiregimpl0_regs1;
assign switches_status = xilinxmultiregimpl1_regs1;
assign xilinxmultiregimpl1 = {user_sw15, user_sw14, user_sw13, user_sw12, user_sw11, user_sw10, user_sw9, user_sw8, user_sw7, user_sw6, user_sw5, user_sw4, user_sw3, user_sw2, user_sw1, user_sw0};
assign buttons_status = xilinxmultiregimpl2_regs1;
assign xilinxmultiregimpl2 = {user_btn4, user_btn3, user_btn2, user_btn1, user_btn0};

always @(posedge por_clk) begin
	int_rst <= (~cpu_reset);
end

always @(posedge sys_clk) begin
	if ((basesoc_bus_errors != 32'd4294967295)) begin
		if (basesoc_bus_error) begin
			basesoc_bus_errors <= (basesoc_bus_errors + 1'd1);
		end
	end
	basesoc_sram_bus_ack <= 1'd0;
	if (((basesoc_sram_bus_cyc & basesoc_sram_bus_stb) & (~basesoc_sram_bus_ack))) begin
		basesoc_sram_bus_ack <= 1'd1;
	end
	basesoc_interface_we <= 1'd0;
	basesoc_interface_dat_w <= basesoc_wishbone2csr_dat_w;
	basesoc_interface_adr <= basesoc_wishbone2csr_adr;
	basesoc_wishbone2csr_dat_r <= basesoc_interface_dat_r;
	if ((basesoc_wishbone2csr_counter == 1'd1)) begin
		basesoc_interface_we <= basesoc_wishbone2csr_we;
	end
	if ((basesoc_wishbone2csr_counter == 2'd2)) begin
		basesoc_wishbone2csr_ack <= 1'd1;
	end
	if ((basesoc_wishbone2csr_counter == 2'd3)) begin
		basesoc_wishbone2csr_ack <= 1'd0;
	end
	if ((basesoc_wishbone2csr_counter != 1'd0)) begin
		basesoc_wishbone2csr_counter <= (basesoc_wishbone2csr_counter + 1'd1);
	end else begin
		if ((basesoc_wishbone2csr_cyc & basesoc_wishbone2csr_stb)) begin
			basesoc_wishbone2csr_counter <= 1'd1;
		end
	end
	if (uartwishbonebridge_byte_counter_reset) begin
		uartwishbonebridge_byte_counter <= 1'd0;
	end else begin
		if (uartwishbonebridge_byte_counter_ce) begin
			uartwishbonebridge_byte_counter <= (uartwishbonebridge_byte_counter + 1'd1);
		end
	end
	if (uartwishbonebridge_word_counter_reset) begin
		uartwishbonebridge_word_counter <= 1'd0;
	end else begin
		if (uartwishbonebridge_word_counter_ce) begin
			uartwishbonebridge_word_counter <= (uartwishbonebridge_word_counter + 1'd1);
		end
	end
	if (uartwishbonebridge_cmd_ce) begin
		uartwishbonebridge_cmd <= uartwishbonebridge_rx_payload_data;
	end
	if (uartwishbonebridge_length_ce) begin
		uartwishbonebridge_length <= uartwishbonebridge_rx_payload_data;
	end
	if (uartwishbonebridge_address_ce) begin
		uartwishbonebridge_address <= {uartwishbonebridge_address[23:0], uartwishbonebridge_rx_payload_data};
	end
	if (uartwishbonebridge_rx_data_ce) begin
		uartwishbonebridge_data <= {uartwishbonebridge_data[23:0], uartwishbonebridge_rx_payload_data};
	end else begin
		if (uartwishbonebridge_tx_data_ce) begin
			uartwishbonebridge_data <= uartwishbonebridge_dat_r;
		end
	end
	uartwishbonebridge_tx_ready <= 1'd0;
	if (((uartwishbonebridge_tx_valid & (~uartwishbonebridge_tx_tx_busy)) & (~uartwishbonebridge_tx_ready))) begin
		uartwishbonebridge_tx_tx_reg <= uartwishbonebridge_tx_payload_data;
		uartwishbonebridge_tx_tx_bitcount <= 1'd0;
		uartwishbonebridge_tx_tx_busy <= 1'd1;
		serial_tx <= 1'd0;
	end else begin
		if ((uartwishbonebridge_tx_uart_clk_txen & uartwishbonebridge_tx_tx_busy)) begin
			uartwishbonebridge_tx_tx_bitcount <= (uartwishbonebridge_tx_tx_bitcount + 1'd1);
			if ((uartwishbonebridge_tx_tx_bitcount == 4'd8)) begin
				serial_tx <= 1'd1;
			end else begin
				if ((uartwishbonebridge_tx_tx_bitcount == 4'd9)) begin
					serial_tx <= 1'd1;
					uartwishbonebridge_tx_tx_busy <= 1'd0;
					uartwishbonebridge_tx_ready <= 1'd1;
				end else begin
					serial_tx <= uartwishbonebridge_tx_tx_reg[0];
					uartwishbonebridge_tx_tx_reg <= {1'd0, uartwishbonebridge_tx_tx_reg[7:1]};
				end
			end
		end
	end
	if (uartwishbonebridge_tx_tx_busy) begin
		{uartwishbonebridge_tx_uart_clk_txen, uartwishbonebridge_tx_phase_accumulator_tx} <= (uartwishbonebridge_tx_phase_accumulator_tx + uartwishbonebridge_storage);
	end else begin
		{uartwishbonebridge_tx_uart_clk_txen, uartwishbonebridge_tx_phase_accumulator_tx} <= 1'd0;
	end
	uartwishbonebridge_rx_valid <= 1'd0;
	uartwishbonebridge_rx_rx_r <= uartwishbonebridge_rx_rx;
	if ((~uartwishbonebridge_rx_rx_busy)) begin
		if (((~uartwishbonebridge_rx_rx) & uartwishbonebridge_rx_rx_r)) begin
			uartwishbonebridge_rx_rx_busy <= 1'd1;
			uartwishbonebridge_rx_rx_bitcount <= 1'd0;
		end
	end else begin
		if (uartwishbonebridge_rx_uart_clk_rxen) begin
			uartwishbonebridge_rx_rx_bitcount <= (uartwishbonebridge_rx_rx_bitcount + 1'd1);
			if ((uartwishbonebridge_rx_rx_bitcount == 1'd0)) begin
				if (uartwishbonebridge_rx_rx) begin
					uartwishbonebridge_rx_rx_busy <= 1'd0;
				end
			end else begin
				if ((uartwishbonebridge_rx_rx_bitcount == 4'd9)) begin
					uartwishbonebridge_rx_rx_busy <= 1'd0;
					if (uartwishbonebridge_rx_rx) begin
						uartwishbonebridge_rx_payload_data <= uartwishbonebridge_rx_rx_reg;
						uartwishbonebridge_rx_valid <= 1'd1;
					end
				end else begin
					uartwishbonebridge_rx_rx_reg <= {uartwishbonebridge_rx_rx, uartwishbonebridge_rx_rx_reg[7:1]};
				end
			end
		end
	end
	if (uartwishbonebridge_rx_rx_busy) begin
		{uartwishbonebridge_rx_uart_clk_rxen, uartwishbonebridge_rx_phase_accumulator_rx} <= (uartwishbonebridge_rx_phase_accumulator_rx + uartwishbonebridge_storage);
	end else begin
		{uartwishbonebridge_rx_uart_clk_rxen, uartwishbonebridge_rx_phase_accumulator_rx} <= 32'd2147483648;
	end
	uartwishbonebridge_state <= uartwishbonebridge_next_state;
	if (uartwishbonebridge_reset) begin
		uartwishbonebridge_state <= 3'd0;
	end
	if (uartwishbonebridge_wait) begin
		if ((~uartwishbonebridge_done)) begin
			uartwishbonebridge_count <= (uartwishbonebridge_count - 1'd1);
		end
	end else begin
		uartwishbonebridge_count <= 24'd10000000;
	end
	if ((dna_cnt < 7'd114)) begin
		dna_cnt <= (dna_cnt + 1'd1);
		if (dna_cnt[0]) begin
			dna_status <= {dna_status, dna_do};
		end
	end
	if (xadc_drdy) begin
		case (xadc_channel)
			1'd0: begin
				xadc_temperature_status <= (xadc_data >>> 3'd4);
			end
			1'd1: begin
				xadc_vccint_status <= (xadc_data >>> 3'd4);
			end
			2'd2: begin
				xadc_vccaux_status <= (xadc_data >>> 3'd4);
			end
			3'd6: begin
				xadc_vccbram_status <= (xadc_data >>> 3'd4);
			end
		endcase
	end
	r_count <= (r_count + 1'd1);
	if (r_enable) begin
		if ((r_count < r_width)) begin
			user_rgb_led0_r <= 1'd1;
		end else begin
			user_rgb_led0_r <= 1'd0;
		end
		if ((r_count == r_period)) begin
			r_count <= 1'd0;
		end
	end else begin
		r_count <= 1'd0;
		user_rgb_led0_r <= 1'd0;
	end
	g_count <= (g_count + 1'd1);
	if (g_enable) begin
		if ((g_count < g_width)) begin
			user_rgb_led0_g <= 1'd1;
		end else begin
			user_rgb_led0_g <= 1'd0;
		end
		if ((g_count == g_period)) begin
			g_count <= 1'd0;
		end
	end else begin
		g_count <= 1'd0;
		user_rgb_led0_g <= 1'd0;
	end
	b_count <= (b_count + 1'd1);
	if (b_enable) begin
		if ((b_count < b_width)) begin
			user_rgb_led0_b <= 1'd1;
		end else begin
			user_rgb_led0_b <= 1'd0;
		end
		if ((b_count == b_period)) begin
			b_count <= 1'd0;
		end
	end else begin
		b_count <= 1'd0;
		user_rgb_led0_b <= 1'd0;
	end
	if (adxl362_spimastercore_spimachine_done1) begin
		adxl362_spimastercore1 <= adxl362_spimastercore_spimachine_data;
	end
	if (adxl362_spimastercore_spimachine_start) begin
		adxl362_spimastercore0 <= adxl362_spimastercore_xfer_cs;
		adxl362_spimastercore_spimachine_n_write <= adxl362_spimastercore_xfer_write_length;
		adxl362_spimastercore_spimachine_n_read <= adxl362_spimastercore_xfer_read_length;
		adxl362_spimastercore_spimachine_data <= adxl362_spimastercore2;
		adxl362_spimastercore_pending1 <= 1'd0;
	end
	if (adxl362_spimastercore_start) begin
		adxl362_spimastercore2 <= adxl362_spimastercore_mosi_data;
		adxl362_spimastercore_pending1 <= 1'd1;
	end
	adxl362_spimastercore_active <= adxl362_spimastercore_spimachine_cs;
	adxl362_spimastercore_pending0 <= adxl362_spimastercore_pending1;
	if ((adxl362_spimastercore_spimachine_spiclockgen_edge & adxl362_spimastercore_spimachine_shift)) begin
		adxl362_spimastercore_spimachine_write0 <= adxl362_spimastercore_spimachine_write;
	end
	if (adxl362_spimastercore_spimachine_cg_ce) begin
		if (adxl362_spimastercore_spimachine_spiclockgen_zero) begin
			adxl362_spimastercore_spimachine_spiclockgen_bias1 <= 1'd0;
		end else begin
			adxl362_spimastercore_spimachine_spiclockgen <= (adxl362_spimastercore_spimachine_spiclockgen - 1'd1);
		end
		if (adxl362_spimastercore_spimachine_spiclockgen_edge) begin
			adxl362_spimastercore_spimachine_spiclockgen <= adxl362_spimastercore_spimachine_spiclockgen_load[7:1];
			adxl362_spimastercore_spimachine_spiclockgen_bias1 <= (adxl362_spimastercore_spimachine_spiclockgen_load[0] & (adxl362_spimastercore_spimachine_spiclockgen_clk ^ adxl362_spimastercore_spimachine_spiclockgen_bias0));
			adxl362_spimastercore_spimachine_spiclockgen_clk <= (~adxl362_spimastercore_spimachine_spiclockgen_clk);
		end
	end
	if (adxl362_spimastercore_spimachine_reg_ce) begin
		if (adxl362_spimastercore_spimachine_lsb) begin
			if (adxl362_spimastercore_spimachine_shift) begin
				adxl362_spimastercore_spimachine_data[30:0] <= adxl362_spimastercore_spimachine_data[31:1];
			end
			if (adxl362_spimastercore_spimachine_sample) begin
				adxl362_spimastercore_spimachine_data[0] <= adxl362_spimastercore_spimachine_i;
			end
		end else begin
			if (adxl362_spimastercore_spimachine_shift) begin
				adxl362_spimastercore_spimachine_data[31:1] <= adxl362_spimastercore_spimachine_data[30:0];
			end
			if (adxl362_spimastercore_spimachine_sample) begin
				adxl362_spimastercore_spimachine_data[0] <= adxl362_spimastercore_spimachine_i;
			end
		end
	end
	if (adxl362_spimastercore_spimachine_bits_ce) begin
		if (adxl362_spimastercore_spimachine_write) begin
			adxl362_spimastercore_spimachine_n_write <= (adxl362_spimastercore_spimachine_n_write - 1'd1);
		end else begin
			if (adxl362_spimastercore_spimachine_read) begin
				adxl362_spimastercore_spimachine_n_read <= (adxl362_spimastercore_spimachine_n_read - 1'd1);
			end
		end
	end
	if (adxl362_spimastercore_spimachine_fsm_ce) begin
		spimaster0_state <= spimaster0_next_state;
	end
	if (display_write_re) begin
		case (display_sel_storage)
			1'd0: begin
				display_values0 <= display_value_storage;
			end
			1'd1: begin
				display_values1 <= display_value_storage;
			end
			2'd2: begin
				display_values2 <= display_value_storage;
			end
			2'd3: begin
				display_values3 <= display_value_storage;
			end
			3'd4: begin
				display_values4 <= display_value_storage;
			end
			3'd5: begin
				display_values5 <= display_value_storage;
			end
		endcase
	end
	if (display_ce) begin
		display_cs2[1] <= display_cs2[0];
		display_cs2[2] <= display_cs2[1];
		display_cs2[3] <= display_cs2[2];
		display_cs2[4] <= display_cs2[3];
		display_cs2[5] <= display_cs2[4];
		display_cs2[0] <= display_cs2[5];
	end
	if (((~display_enable) | display_ce)) begin
		display_counter <= 17'd99999;
	end else begin
		display_counter <= (display_counter - 1'd1);
	end
	probe_PWM_count <= (probe_PWM_count + 1'd1);
	if (probe_PWM_enable) begin
		if ((probe_PWM_count < probe_PWM_width)) begin
			out_probe0 <= 1'd1;
		end else begin
			out_probe0 <= 1'd0;
		end
		if ((probe_PWM_count == probe_PWM_period)) begin
			probe_PWM_count <= 1'd0;
		end
	end else begin
		probe_PWM_count <= 1'd0;
		out_probe0 <= 1'd0;
	end
	if (probeSPI_spimastercore_spimachine_done1) begin
		probeSPI_spimastercore1 <= probeSPI_spimastercore_spimachine_data;
	end
	if (probeSPI_spimastercore_spimachine_start) begin
		probeSPI_spimastercore0 <= probeSPI_spimastercore_xfer_cs;
		probeSPI_spimastercore_spimachine_n_write <= probeSPI_spimastercore_xfer_write_length;
		probeSPI_spimastercore_spimachine_n_read <= probeSPI_spimastercore_xfer_read_length;
		probeSPI_spimastercore_spimachine_data <= probeSPI_spimastercore2;
		probeSPI_spimastercore_pending1 <= 1'd0;
	end
	if (probeSPI_spimastercore_start) begin
		probeSPI_spimastercore2 <= probeSPI_spimastercore_mosi_data;
		probeSPI_spimastercore_pending1 <= 1'd1;
	end
	probeSPI_spimastercore_active <= probeSPI_spimastercore_spimachine_cs;
	probeSPI_spimastercore_pending0 <= probeSPI_spimastercore_pending1;
	if ((probeSPI_spimastercore_spimachine_spiclockgen_edge & probeSPI_spimastercore_spimachine_shift)) begin
		probeSPI_spimastercore_spimachine_write0 <= probeSPI_spimastercore_spimachine_write;
	end
	if (probeSPI_spimastercore_spimachine_cg_ce) begin
		if (probeSPI_spimastercore_spimachine_spiclockgen_zero) begin
			probeSPI_spimastercore_spimachine_spiclockgen_bias1 <= 1'd0;
		end else begin
			probeSPI_spimastercore_spimachine_spiclockgen <= (probeSPI_spimastercore_spimachine_spiclockgen - 1'd1);
		end
		if (probeSPI_spimastercore_spimachine_spiclockgen_edge) begin
			probeSPI_spimastercore_spimachine_spiclockgen <= probeSPI_spimastercore_spimachine_spiclockgen_load[7:1];
			probeSPI_spimastercore_spimachine_spiclockgen_bias1 <= (probeSPI_spimastercore_spimachine_spiclockgen_load[0] & (probeSPI_spimastercore_spimachine_spiclockgen_clk ^ probeSPI_spimastercore_spimachine_spiclockgen_bias0));
			probeSPI_spimastercore_spimachine_spiclockgen_clk <= (~probeSPI_spimastercore_spimachine_spiclockgen_clk);
		end
	end
	if (probeSPI_spimastercore_spimachine_reg_ce) begin
		if (probeSPI_spimastercore_spimachine_lsb) begin
			if (probeSPI_spimastercore_spimachine_shift) begin
				probeSPI_spimastercore_spimachine_data[30:0] <= probeSPI_spimastercore_spimachine_data[31:1];
			end
			if (probeSPI_spimastercore_spimachine_sample) begin
				probeSPI_spimastercore_spimachine_data[0] <= probeSPI_spimastercore_spimachine_i;
			end
		end else begin
			if (probeSPI_spimastercore_spimachine_shift) begin
				probeSPI_spimastercore_spimachine_data[31:1] <= probeSPI_spimastercore_spimachine_data[30:0];
			end
			if (probeSPI_spimastercore_spimachine_sample) begin
				probeSPI_spimastercore_spimachine_data[0] <= probeSPI_spimastercore_spimachine_i;
			end
		end
	end
	if (probeSPI_spimastercore_spimachine_bits_ce) begin
		if (probeSPI_spimastercore_spimachine_write) begin
			probeSPI_spimastercore_spimachine_n_write <= (probeSPI_spimastercore_spimachine_n_write - 1'd1);
		end else begin
			if (probeSPI_spimastercore_spimachine_read) begin
				probeSPI_spimastercore_spimachine_n_read <= (probeSPI_spimastercore_spimachine_n_read - 1'd1);
			end
		end
	end
	if (probeSPI_spimastercore_spimachine_fsm_ce) begin
		spimaster1_state <= spimaster1_next_state;
	end
	slave_sel_r <= slave_sel;
	if (wait_1) begin
		if ((~done)) begin
			count <= (count - 1'd1);
		end
	end else begin
		count <= 17'd65536;
	end
	interface0_bank_bus_dat_r <= 1'd0;
	if (csrbank0_sel) begin
		case (interface0_bank_bus_adr[2:0])
			1'd0: begin
				interface0_bank_bus_dat_r <= csrbank0_config0_w;
			end
			1'd1: begin
				interface0_bank_bus_dat_r <= csrbank0_xfer0_w;
			end
			2'd2: begin
				interface0_bank_bus_dat_r <= adxl362_start_w;
			end
			2'd3: begin
				interface0_bank_bus_dat_r <= csrbank0_active_w;
			end
			3'd4: begin
				interface0_bank_bus_dat_r <= csrbank0_pending_w;
			end
			3'd5: begin
				interface0_bank_bus_dat_r <= csrbank0_mosi_data0_w;
			end
			3'd6: begin
				interface0_bank_bus_dat_r <= csrbank0_miso_data_w;
			end
		endcase
	end
	if (csrbank0_config0_re) begin
		adxl362_config_storage_full[31:0] <= csrbank0_config0_r;
	end
	adxl362_config_re <= csrbank0_config0_re;
	if (csrbank0_xfer0_re) begin
		adxl362_xfer_storage_full[31:0] <= csrbank0_xfer0_r;
	end
	adxl362_xfer_re <= csrbank0_xfer0_re;
	if (csrbank0_mosi_data0_re) begin
		adxl362_mosi_data_storage_full[31:0] <= csrbank0_mosi_data0_r;
	end
	adxl362_mosi_data_re <= csrbank0_mosi_data0_re;
	interface1_bank_bus_dat_r <= 1'd0;
	if (csrbank1_sel) begin
		case (interface1_bank_bus_adr[0])
			1'd0: begin
				interface1_bank_bus_dat_r <= csrbank1_in_w;
			end
		endcase
	end
	interface2_bank_bus_dat_r <= 1'd0;
	if (csrbank2_sel) begin
		case (interface2_bank_bus_adr[1:0])
			1'd0: begin
				interface2_bank_bus_dat_r <= basesoc_reset_reset_w;
			end
			1'd1: begin
				interface2_bank_bus_dat_r <= csrbank2_scratch0_w;
			end
			2'd2: begin
				interface2_bank_bus_dat_r <= csrbank2_bus_errors_w;
			end
		endcase
	end
	if (csrbank2_scratch0_re) begin
		basesoc_storage_full[31:0] <= csrbank2_scratch0_r;
	end
	basesoc_re <= csrbank2_scratch0_re;
	interface3_bank_bus_dat_r <= 1'd0;
	if (csrbank3_sel) begin
		case (interface3_bank_bus_adr[1:0])
			1'd0: begin
				interface3_bank_bus_dat_r <= csrbank3_sel0_w;
			end
			1'd1: begin
				interface3_bank_bus_dat_r <= csrbank3_value0_w;
			end
			2'd2: begin
				interface3_bank_bus_dat_r <= display_write_w;
			end
		endcase
	end
	if (csrbank3_sel0_re) begin
		display_sel_storage_full[3:0] <= csrbank3_sel0_r;
	end
	display_sel_re <= csrbank3_sel0_re;
	if (csrbank3_value0_re) begin
		display_value_storage_full[3:0] <= csrbank3_value0_r;
	end
	display_value_re <= csrbank3_value0_re;
	interface4_bank_bus_dat_r <= 1'd0;
	if (csrbank4_sel) begin
		case (interface4_bank_bus_adr[0])
			1'd0: begin
				interface4_bank_bus_dat_r <= csrbank4_id1_w;
			end
			1'd1: begin
				interface4_bank_bus_dat_r <= csrbank4_id0_w;
			end
		endcase
	end
	sel_r <= sel;
	interface5_bank_bus_dat_r <= 1'd0;
	if (csrbank5_sel) begin
		case (interface5_bank_bus_adr[2:0])
			1'd0: begin
				interface5_bank_bus_dat_r <= csrbank5_D0_D8_out0_w;
			end
			1'd1: begin
				interface5_bank_bus_dat_r <= csrbank5_CS_out0_w;
			end
			2'd2: begin
				interface5_bank_bus_dat_r <= csrbank5_RS_out0_w;
			end
			2'd3: begin
				interface5_bank_bus_dat_r <= csrbank5_RD_out0_w;
			end
			3'd4: begin
				interface5_bank_bus_dat_r <= csrbank5_WR_out0_w;
			end
		endcase
	end
	if (csrbank5_D0_D8_out0_re) begin
		gpioout0_storage_full[7:0] <= csrbank5_D0_D8_out0_r;
	end
	gpioout0_re <= csrbank5_D0_D8_out0_re;
	if (csrbank5_CS_out0_re) begin
		gpioout1_storage_full <= csrbank5_CS_out0_r;
	end
	gpioout1_re <= csrbank5_CS_out0_re;
	if (csrbank5_RS_out0_re) begin
		gpioout2_storage_full <= csrbank5_RS_out0_r;
	end
	gpioout2_re <= csrbank5_RS_out0_re;
	if (csrbank5_RD_out0_re) begin
		gpioout3_storage_full <= csrbank5_RD_out0_r;
	end
	gpioout3_re <= csrbank5_RD_out0_re;
	if (csrbank5_WR_out0_re) begin
		gpioout4_storage_full <= csrbank5_WR_out0_r;
	end
	gpioout4_re <= csrbank5_WR_out0_re;
	interface6_bank_bus_dat_r <= 1'd0;
	if (csrbank6_sel) begin
		case (interface6_bank_bus_adr[0])
			1'd0: begin
				interface6_bank_bus_dat_r <= csrbank6_out0_w;
			end
		endcase
	end
	if (csrbank6_out0_re) begin
		leds_storage_full[15:0] <= csrbank6_out0_r;
	end
	leds_re <= csrbank6_out0_re;
	interface7_bank_bus_dat_r <= 1'd0;
	if (csrbank7_sel) begin
		case (interface7_bank_bus_adr[2:0])
			1'd0: begin
				interface7_bank_bus_dat_r <= csrbank7_config0_w;
			end
			1'd1: begin
				interface7_bank_bus_dat_r <= csrbank7_xfer0_w;
			end
			2'd2: begin
				interface7_bank_bus_dat_r <= probeSPI_start_w;
			end
			2'd3: begin
				interface7_bank_bus_dat_r <= csrbank7_active_w;
			end
			3'd4: begin
				interface7_bank_bus_dat_r <= csrbank7_pending_w;
			end
			3'd5: begin
				interface7_bank_bus_dat_r <= csrbank7_mosi_data0_w;
			end
			3'd6: begin
				interface7_bank_bus_dat_r <= csrbank7_miso_data_w;
			end
		endcase
	end
	if (csrbank7_config0_re) begin
		probeSPI_config_storage_full[31:0] <= csrbank7_config0_r;
	end
	probeSPI_config_re <= csrbank7_config0_re;
	if (csrbank7_xfer0_re) begin
		probeSPI_xfer_storage_full[31:0] <= csrbank7_xfer0_r;
	end
	probeSPI_xfer_re <= csrbank7_xfer0_re;
	if (csrbank7_mosi_data0_re) begin
		probeSPI_mosi_data_storage_full[31:0] <= csrbank7_mosi_data0_r;
	end
	probeSPI_mosi_data_re <= csrbank7_mosi_data0_re;
	interface8_bank_bus_dat_r <= 1'd0;
	if (csrbank8_sel) begin
		case (interface8_bank_bus_adr[1:0])
			1'd0: begin
				interface8_bank_bus_dat_r <= csrbank8_enable0_w;
			end
			1'd1: begin
				interface8_bank_bus_dat_r <= csrbank8_width0_w;
			end
			2'd2: begin
				interface8_bank_bus_dat_r <= csrbank8_period0_w;
			end
		endcase
	end
	if (csrbank8_enable0_re) begin
		probe_PWM_enable_storage_full <= csrbank8_enable0_r;
	end
	probe_PWM_enable_re <= csrbank8_enable0_re;
	if (csrbank8_width0_re) begin
		probe_PWM_width_storage_full[31:0] <= csrbank8_width0_r;
	end
	probe_PWM_width_re <= csrbank8_width0_re;
	if (csrbank8_period0_re) begin
		probe_PWM_period_storage_full[31:0] <= csrbank8_period0_r;
	end
	probe_PWM_period_re <= csrbank8_period0_re;
	interface9_bank_bus_dat_r <= 1'd0;
	if (csrbank9_sel) begin
		case (interface9_bank_bus_adr[3:0])
			1'd0: begin
				interface9_bank_bus_dat_r <= csrbank9_r_enable0_w;
			end
			1'd1: begin
				interface9_bank_bus_dat_r <= csrbank9_r_width0_w;
			end
			2'd2: begin
				interface9_bank_bus_dat_r <= csrbank9_r_period0_w;
			end
			2'd3: begin
				interface9_bank_bus_dat_r <= csrbank9_g_enable0_w;
			end
			3'd4: begin
				interface9_bank_bus_dat_r <= csrbank9_g_width0_w;
			end
			3'd5: begin
				interface9_bank_bus_dat_r <= csrbank9_g_period0_w;
			end
			3'd6: begin
				interface9_bank_bus_dat_r <= csrbank9_b_enable0_w;
			end
			3'd7: begin
				interface9_bank_bus_dat_r <= csrbank9_b_width0_w;
			end
			4'd8: begin
				interface9_bank_bus_dat_r <= csrbank9_b_period0_w;
			end
		endcase
	end
	if (csrbank9_r_enable0_re) begin
		r_enable_storage_full <= csrbank9_r_enable0_r;
	end
	r_enable_re <= csrbank9_r_enable0_re;
	if (csrbank9_r_width0_re) begin
		r_width_storage_full[31:0] <= csrbank9_r_width0_r;
	end
	r_width_re <= csrbank9_r_width0_re;
	if (csrbank9_r_period0_re) begin
		r_period_storage_full[31:0] <= csrbank9_r_period0_r;
	end
	r_period_re <= csrbank9_r_period0_re;
	if (csrbank9_g_enable0_re) begin
		g_enable_storage_full <= csrbank9_g_enable0_r;
	end
	g_enable_re <= csrbank9_g_enable0_re;
	if (csrbank9_g_width0_re) begin
		g_width_storage_full[31:0] <= csrbank9_g_width0_r;
	end
	g_width_re <= csrbank9_g_width0_re;
	if (csrbank9_g_period0_re) begin
		g_period_storage_full[31:0] <= csrbank9_g_period0_r;
	end
	g_period_re <= csrbank9_g_period0_re;
	if (csrbank9_b_enable0_re) begin
		b_enable_storage_full <= csrbank9_b_enable0_r;
	end
	b_enable_re <= csrbank9_b_enable0_re;
	if (csrbank9_b_width0_re) begin
		b_width_storage_full[31:0] <= csrbank9_b_width0_r;
	end
	b_width_re <= csrbank9_b_width0_re;
	if (csrbank9_b_period0_re) begin
		b_period_storage_full[31:0] <= csrbank9_b_period0_r;
	end
	b_period_re <= csrbank9_b_period0_re;
	interface10_bank_bus_dat_r <= 1'd0;
	if (csrbank10_sel) begin
		case (interface10_bank_bus_adr[0])
			1'd0: begin
				interface10_bank_bus_dat_r <= csrbank10_in_w;
			end
		endcase
	end
	interface11_bank_bus_dat_r <= 1'd0;
	if (csrbank11_sel) begin
		case (interface11_bank_bus_adr[1:0])
			1'd0: begin
				interface11_bank_bus_dat_r <= csrbank11_temperature_w;
			end
			1'd1: begin
				interface11_bank_bus_dat_r <= csrbank11_vccint_w;
			end
			2'd2: begin
				interface11_bank_bus_dat_r <= csrbank11_vccaux_w;
			end
			2'd3: begin
				interface11_bank_bus_dat_r <= csrbank11_vccbram_w;
			end
		endcase
	end
	if (sys_rst) begin
		basesoc_storage_full <= 32'd305419896;
		basesoc_re <= 1'd0;
		basesoc_bus_errors <= 32'd0;
		basesoc_sram_bus_ack <= 1'd0;
		basesoc_interface_adr <= 14'd0;
		basesoc_interface_we <= 1'd0;
		basesoc_interface_dat_w <= 32'd0;
		basesoc_wishbone2csr_dat_r <= 32'd0;
		basesoc_wishbone2csr_ack <= 1'd0;
		basesoc_wishbone2csr_counter <= 2'd0;
		serial_tx <= 1'd1;
		uartwishbonebridge_tx_ready <= 1'd0;
		uartwishbonebridge_tx_uart_clk_txen <= 1'd0;
		uartwishbonebridge_tx_phase_accumulator_tx <= 32'd0;
		uartwishbonebridge_tx_tx_reg <= 8'd0;
		uartwishbonebridge_tx_tx_bitcount <= 4'd0;
		uartwishbonebridge_tx_tx_busy <= 1'd0;
		uartwishbonebridge_rx_valid <= 1'd0;
		uartwishbonebridge_rx_payload_data <= 8'd0;
		uartwishbonebridge_rx_uart_clk_rxen <= 1'd0;
		uartwishbonebridge_rx_phase_accumulator_rx <= 32'd0;
		uartwishbonebridge_rx_rx_r <= 1'd0;
		uartwishbonebridge_rx_rx_reg <= 8'd0;
		uartwishbonebridge_rx_rx_bitcount <= 4'd0;
		uartwishbonebridge_rx_rx_busy <= 1'd0;
		uartwishbonebridge_count <= 24'd10000000;
		dna_status <= 57'd0;
		dna_cnt <= 7'd0;
		xadc_temperature_status <= 12'd0;
		xadc_vccint_status <= 12'd0;
		xadc_vccaux_status <= 12'd0;
		xadc_vccbram_status <= 12'd0;
		leds_storage_full <= 16'd0;
		leds_re <= 1'd0;
		gpioout0_storage_full <= 8'd0;
		gpioout0_re <= 1'd0;
		gpioout1_storage_full <= 1'd0;
		gpioout1_re <= 1'd0;
		gpioout2_storage_full <= 1'd0;
		gpioout2_re <= 1'd0;
		gpioout3_storage_full <= 1'd0;
		gpioout3_re <= 1'd0;
		gpioout4_storage_full <= 1'd0;
		gpioout4_re <= 1'd0;
		user_rgb_led0_r <= 1'd0;
		user_rgb_led0_g <= 1'd0;
		user_rgb_led0_b <= 1'd0;
		r_enable_storage_full <= 1'd0;
		r_enable_re <= 1'd0;
		r_width_storage_full <= 32'd0;
		r_width_re <= 1'd0;
		r_period_storage_full <= 32'd0;
		r_period_re <= 1'd0;
		r_count <= 32'd0;
		g_enable_storage_full <= 1'd0;
		g_enable_re <= 1'd0;
		g_width_storage_full <= 32'd0;
		g_width_re <= 1'd0;
		g_period_storage_full <= 32'd0;
		g_period_re <= 1'd0;
		g_count <= 32'd0;
		b_enable_storage_full <= 1'd0;
		b_enable_re <= 1'd0;
		b_width_storage_full <= 32'd0;
		b_width_re <= 1'd0;
		b_period_storage_full <= 32'd0;
		b_period_re <= 1'd0;
		b_count <= 32'd0;
		adxl362_spimastercore_active <= 1'd0;
		adxl362_spimastercore_pending0 <= 1'd0;
		adxl362_spimastercore_spimachine_spiclockgen_clk <= 1'd1;
		adxl362_spimastercore_spimachine_spiclockgen <= 8'd0;
		adxl362_spimastercore_spimachine_spiclockgen_bias1 <= 1'd0;
		adxl362_spimastercore_spimachine_data <= 32'd0;
		adxl362_spimastercore_spimachine_n_read <= 6'd0;
		adxl362_spimastercore_spimachine_n_write <= 6'd0;
		adxl362_spimastercore_spimachine_write0 <= 1'd0;
		adxl362_spimastercore_pending1 <= 1'd0;
		adxl362_spimastercore0 <= 16'd0;
		adxl362_spimastercore1 <= 32'd0;
		adxl362_spimastercore2 <= 32'd0;
		adxl362_config_storage_full <= 32'd0;
		adxl362_config_re <= 1'd0;
		adxl362_xfer_storage_full <= 32'd0;
		adxl362_xfer_re <= 1'd0;
		adxl362_mosi_data_storage_full <= 32'd0;
		adxl362_mosi_data_re <= 1'd0;
		display_sel_storage_full <= 4'd0;
		display_sel_re <= 1'd0;
		display_value_storage_full <= 4'd0;
		display_value_re <= 1'd0;
		display_values0 <= 5'd0;
		display_values1 <= 5'd0;
		display_values2 <= 5'd0;
		display_values3 <= 5'd0;
		display_values4 <= 5'd0;
		display_values5 <= 5'd0;
		display_counter <= 17'd0;
		display_cs2 <= 6'd1;
		out_probe0 <= 1'd0;
		probe_PWM_enable_storage_full <= 1'd0;
		probe_PWM_enable_re <= 1'd0;
		probe_PWM_width_storage_full <= 32'd0;
		probe_PWM_width_re <= 1'd0;
		probe_PWM_period_storage_full <= 32'd0;
		probe_PWM_period_re <= 1'd0;
		probe_PWM_count <= 32'd0;
		probeSPI_spimastercore_active <= 1'd0;
		probeSPI_spimastercore_pending0 <= 1'd0;
		probeSPI_spimastercore_spimachine_spiclockgen_clk <= 1'd1;
		probeSPI_spimastercore_spimachine_spiclockgen <= 8'd0;
		probeSPI_spimastercore_spimachine_spiclockgen_bias1 <= 1'd0;
		probeSPI_spimastercore_spimachine_data <= 32'd0;
		probeSPI_spimastercore_spimachine_n_read <= 6'd0;
		probeSPI_spimastercore_spimachine_n_write <= 6'd0;
		probeSPI_spimastercore_spimachine_write0 <= 1'd0;
		probeSPI_spimastercore_pending1 <= 1'd0;
		probeSPI_spimastercore0 <= 16'd0;
		probeSPI_spimastercore1 <= 32'd0;
		probeSPI_spimastercore2 <= 32'd0;
		probeSPI_config_storage_full <= 32'd0;
		probeSPI_config_re <= 1'd0;
		probeSPI_xfer_storage_full <= 32'd0;
		probeSPI_xfer_re <= 1'd0;
		probeSPI_mosi_data_storage_full <= 32'd0;
		probeSPI_mosi_data_re <= 1'd0;
		uartwishbonebridge_state <= 3'd0;
		spimaster0_state <= 2'd0;
		spimaster1_state <= 2'd0;
		slave_sel_r <= 2'd0;
		count <= 17'd65536;
		interface0_bank_bus_dat_r <= 32'd0;
		interface1_bank_bus_dat_r <= 32'd0;
		interface2_bank_bus_dat_r <= 32'd0;
		interface3_bank_bus_dat_r <= 32'd0;
		interface4_bank_bus_dat_r <= 32'd0;
		sel_r <= 1'd0;
		interface5_bank_bus_dat_r <= 32'd0;
		interface6_bank_bus_dat_r <= 32'd0;
		interface7_bank_bus_dat_r <= 32'd0;
		interface8_bank_bus_dat_r <= 32'd0;
		interface9_bank_bus_dat_r <= 32'd0;
		interface10_bank_bus_dat_r <= 32'd0;
		interface11_bank_bus_dat_r <= 32'd0;
	end
	xilinxmultiregimpl0_regs0 <= serial_rx;
	xilinxmultiregimpl0_regs1 <= xilinxmultiregimpl0_regs0;
	xilinxmultiregimpl1_regs0 <= {user_sw15, user_sw14, user_sw13, user_sw12, user_sw11, user_sw10, user_sw9, user_sw8, user_sw7, user_sw6, user_sw5, user_sw4, user_sw3, user_sw2, user_sw1, user_sw0};
	xilinxmultiregimpl1_regs1 <= xilinxmultiregimpl1_regs0;
	xilinxmultiregimpl2_regs0 <= {user_btn4, user_btn3, user_btn2, user_btn1, user_btn0};
	xilinxmultiregimpl2_regs1 <= xilinxmultiregimpl2_regs0;
end

reg [31:0] mem[0:1023];
reg [9:0] memadr;
always @(posedge sys_clk) begin
	if (basesoc_sram_we[0])
		mem[basesoc_sram_adr][7:0] <= basesoc_sram_dat_w[7:0];
	if (basesoc_sram_we[1])
		mem[basesoc_sram_adr][15:8] <= basesoc_sram_dat_w[15:8];
	if (basesoc_sram_we[2])
		mem[basesoc_sram_adr][23:16] <= basesoc_sram_dat_w[23:16];
	if (basesoc_sram_we[3])
		mem[basesoc_sram_adr][31:24] <= basesoc_sram_dat_w[31:24];
	memadr <= basesoc_sram_adr;
end

assign basesoc_sram_dat_r = mem[memadr];

reg [7:0] mem_1[0:43];
reg [5:0] memadr_1;
always @(posedge sys_clk) begin
	memadr_1 <= adr;
end

assign dat_r = mem_1[memadr_1];

initial begin
	$readmemh("mem_1.init", mem_1);
end

DNA_PORT DNA_PORT(
	.CLK(dna_cnt[0]),
	.DIN(dna_status[56]),
	.READ((dna_cnt < 2'd2)),
	.SHIFT(1'd1),
	.DOUT(dna_do)
);

XADC #(
	.INIT_40(16'd36864),
	.INIT_41(14'd12016),
	.INIT_42(11'd1024),
	.INIT_48(15'd18177),
	.INIT_49(4'd15),
	.INIT_4A(15'd18176),
	.INIT_4B(1'd0),
	.INIT_4C(1'd0),
	.INIT_4D(1'd0),
	.INIT_4E(1'd0),
	.INIT_4F(1'd0),
	.INIT_50(16'd46573),
	.INIT_51(15'd22937),
	.INIT_52(16'd41287),
	.INIT_53(16'd56797),
	.INIT_54(16'd43322),
	.INIT_55(15'd20753),
	.INIT_56(16'd37355),
	.INIT_57(16'd44622),
	.INIT_58(15'd22937),
	.INIT_5C(15'd20753)
) XADC (
	.CONVST(1'd0),
	.CONVSTCLK(1'd0),
	.DADDR(xadc_channel),
	.DCLK(sys_clk),
	.DEN(xadc_eoc),
	.DI(1'd0),
	.DWE(1'd0),
	.RESET(sys_rst),
	.VAUXN(1'd0),
	.VAUXP(1'd1),
	.VN(1'd0),
	.VP(1'd1),
	.ALM(xadc_alarm),
	.BUSY(xadc_busy),
	.CHANNEL(xadc_channel),
	.DO(xadc_data),
	.DRDY(xadc_drdy),
	.EOC(xadc_eoc),
	.EOS(xadc_eos),
	.OT(xadc_ot)
);

assign adxl362_spi_cs_n = adxl362_spimastercore_cs_n_t_oe ? adxl362_spimastercore_cs_n_t_o : 1'bz;
assign adxl362_spimastercore_cs_n_t_i = adxl362_spi_cs_n;

assign adxl362_spi_clk = adxl362_spimastercore_clk_t_oe ? adxl362_spimastercore_clk_t_o : 1'bz;
assign adxl362_spimastercore_clk_t_i = adxl362_spi_clk;

assign adxl362_spi_mosi = adxl362_spimastercore_mosi_t_oe ? adxl362_spimastercore_mosi_t_o : 1'bz;
assign adxl362_spimastercore_mosi_t_i = adxl362_spi_mosi;

assign SPIprueba_cs_n = probeSPI_spimastercore_cs_n_t_oe ? probeSPI_spimastercore_cs_n_t_o : 1'bz;
assign probeSPI_spimastercore_cs_n_t_i = SPIprueba_cs_n;

assign SPIprueba_clk = probeSPI_spimastercore_clk_t_oe ? probeSPI_spimastercore_clk_t_o : 1'bz;
assign probeSPI_spimastercore_clk_t_i = SPIprueba_clk;

assign SPIprueba_mosi = probeSPI_spimastercore_mosi_t_oe ? probeSPI_spimastercore_mosi_t_o : 1'bz;
assign probeSPI_spimastercore_mosi_t_i = SPIprueba_mosi;

endmodule
