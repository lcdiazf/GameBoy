/* Machine-generated using Migen */
module top(
	input sys_clk,
	input sys_rst
);

reg [15:0] lcd_i80_DATA_storage = 16'd0;
reg [31:0] lcd_i80_NUMBER_storage = 32'd0;
reg [7:0] lcd_i80_ADDR_storage = 8'd0;
wire lcd_i80_status;
reg [1:0] lcd_i80_START_storage = 2'd0;
reg [1:0] lcd_i80_SENDONE_storage = 2'd0;
reg lcd_i80_CS__storage = 1'd0;
wire [7:0] lcd_i80_db_;
wire lcd_i80_rs_;
wire lcd_i80_rd_;
wire lcd_i80_wr_;
wire lcd_i80_rst_;
wire lcd_i80_cs_;
wire [15:0] lcd_i80_data;
wire [7:0] lcd_i80_addr;
reg lcd_i80_busy = 1'd0;
wire [1:0] lcd_i80_start;
wire [19:0] lcd_i80_number;
wire [1:0] lcd_i80_sendone;
reg [7:0] lcd_i80_db = 8'd0;
reg lcd_i80_rs = 1'd0;
reg lcd_i80_rd = 1'd0;
reg lcd_i80_wr = 1'd0;
reg lcd_i80_rst = 1'd0;
reg [23:0] lcd_i80_count = 24'd0;
reg [3:0] lcd_i80_manage = 4'd0;
reg [3:0] lcd_i80_count2 = 4'd0;
reg [23:0] lcd_i80_count3 = 24'd0;
reg [23:0] lcd_i80_count4 = 24'd0;
reg [3:0] lcd_i80_count5 = 4'd0;
reg [3:0] lcd_i80_count6 = 4'd0;
reg [2:0] lcd_i80_count7 = 3'd0;
reg [3:0] lcd_i80_countwr = 4'd0;
reg [2:0] lcd_i80_manage_ant = 3'd0;
reg [19:0] lcd_i80_counter_regs = 20'd0;
reg [3:0] lcd_i80_state = 4'd0;
reg [3:0] lcd_i80_next_state;
reg lcd_i80_rs_next_value0;
reg lcd_i80_rs_next_value_ce0;
reg lcd_i80_rd_next_value1;
reg lcd_i80_rd_next_value_ce1;
reg lcd_i80_wr_next_value2;
reg lcd_i80_wr_next_value_ce2;
reg [7:0] lcd_i80_db_next_value3;
reg lcd_i80_db_next_value_ce3;
reg lcd_i80_busy_next_value4;
reg lcd_i80_busy_next_value_ce4;
reg [3:0] lcd_i80_count2_next_value5;
reg lcd_i80_count2_next_value_ce5;
reg [23:0] lcd_i80_count_next_value6;
reg lcd_i80_count_next_value_ce6;
reg [19:0] lcd_i80_counter_regs_next_value7;
reg lcd_i80_counter_regs_next_value_ce7;
reg lcd_i80_rst_next_value8;
reg lcd_i80_rst_next_value_ce8;
reg [3:0] lcd_i80_manage_next_value9;
reg lcd_i80_manage_next_value_ce9;
reg [2:0] lcd_i80_manage_ant_next_value10;
reg lcd_i80_manage_ant_next_value_ce10;
reg [3:0] lcd_i80_countwr_next_value11;
reg lcd_i80_countwr_next_value_ce11;
reg [23:0] lcd_i80_count3_next_value12;
reg lcd_i80_count3_next_value_ce12;
reg [23:0] lcd_i80_count4_next_value13;
reg lcd_i80_count4_next_value_ce13;
reg [3:0] lcd_i80_count5_next_value14;
reg lcd_i80_count5_next_value_ce14;
reg [3:0] lcd_i80_count6_next_value15;
reg lcd_i80_count6_next_value_ce15;
reg [2:0] lcd_i80_count7_next_value16;
reg lcd_i80_count7_next_value_ce16;

// synthesis translate_off
reg dummy_s;
initial dummy_s <= 1'd0;
// synthesis translate_on

assign lcd_i80_data = lcd_i80_DATA_storage;
assign lcd_i80_sendone = lcd_i80_SENDONE_storage;
assign lcd_i80_addr = lcd_i80_ADDR_storage;
assign lcd_i80_number = lcd_i80_NUMBER_storage;
assign lcd_i80_status = lcd_i80_busy;
assign lcd_i80_start = lcd_i80_START_storage;
assign lcd_i80_db_ = lcd_i80_db;
assign lcd_i80_cs_ = lcd_i80_CS__storage;
assign lcd_i80_rs_ = lcd_i80_rs;
assign lcd_i80_rd_ = lcd_i80_rd;
assign lcd_i80_wr_ = lcd_i80_wr;
assign lcd_i80_rst_ = lcd_i80_rst;

// synthesis translate_off
reg dummy_d;
// synthesis translate_on
always @(*) begin
	lcd_i80_next_state <= 4'd0;
	lcd_i80_rs_next_value0 <= 1'd0;
	lcd_i80_rs_next_value_ce0 <= 1'd0;
	lcd_i80_rd_next_value1 <= 1'd0;
	lcd_i80_rd_next_value_ce1 <= 1'd0;
	lcd_i80_wr_next_value2 <= 1'd0;
	lcd_i80_wr_next_value_ce2 <= 1'd0;
	lcd_i80_db_next_value3 <= 8'd0;
	lcd_i80_db_next_value_ce3 <= 1'd0;
	lcd_i80_busy_next_value4 <= 1'd0;
	lcd_i80_busy_next_value_ce4 <= 1'd0;
	lcd_i80_count2_next_value5 <= 4'd0;
	lcd_i80_count2_next_value_ce5 <= 1'd0;
	lcd_i80_count_next_value6 <= 24'd0;
	lcd_i80_count_next_value_ce6 <= 1'd0;
	lcd_i80_counter_regs_next_value7 <= 20'd0;
	lcd_i80_counter_regs_next_value_ce7 <= 1'd0;
	lcd_i80_rst_next_value8 <= 1'd0;
	lcd_i80_rst_next_value_ce8 <= 1'd0;
	lcd_i80_manage_next_value9 <= 4'd0;
	lcd_i80_manage_next_value_ce9 <= 1'd0;
	lcd_i80_manage_ant_next_value10 <= 3'd0;
	lcd_i80_manage_ant_next_value_ce10 <= 1'd0;
	lcd_i80_countwr_next_value11 <= 4'd0;
	lcd_i80_countwr_next_value_ce11 <= 1'd0;
	lcd_i80_count3_next_value12 <= 24'd0;
	lcd_i80_count3_next_value_ce12 <= 1'd0;
	lcd_i80_count4_next_value13 <= 24'd0;
	lcd_i80_count4_next_value_ce13 <= 1'd0;
	lcd_i80_count5_next_value14 <= 4'd0;
	lcd_i80_count5_next_value_ce14 <= 1'd0;
	lcd_i80_count6_next_value15 <= 4'd0;
	lcd_i80_count6_next_value_ce15 <= 1'd0;
	lcd_i80_count7_next_value16 <= 3'd0;
	lcd_i80_count7_next_value_ce16 <= 1'd0;
	lcd_i80_next_state <= lcd_i80_state;
	case (lcd_i80_state)
		1'd1: begin
			lcd_i80_rs_next_value0 <= 1'd0;
			lcd_i80_rs_next_value_ce0 <= 1'd1;
			lcd_i80_db_next_value3 <= 1'd0;
			lcd_i80_db_next_value_ce3 <= 1'd1;
			lcd_i80_busy_next_value4 <= 1'd1;
			lcd_i80_busy_next_value_ce4 <= 1'd1;
			lcd_i80_manage_next_value9 <= 3'd5;
			lcd_i80_manage_next_value_ce9 <= 1'd1;
			lcd_i80_manage_ant_next_value10 <= 3'd5;
			lcd_i80_manage_ant_next_value_ce10 <= 1'd1;
			lcd_i80_count2_next_value5 <= 1'd0;
			lcd_i80_count2_next_value_ce5 <= 1'd1;
			lcd_i80_next_state <= 3'd6;
		end
		2'd2: begin
			lcd_i80_rs_next_value0 <= 1'd0;
			lcd_i80_rs_next_value_ce0 <= 1'd1;
			lcd_i80_db_next_value3 <= lcd_i80_addr;
			lcd_i80_db_next_value_ce3 <= 1'd1;
			lcd_i80_busy_next_value4 <= 1'd1;
			lcd_i80_busy_next_value_ce4 <= 1'd1;
			lcd_i80_manage_next_value9 <= 1'd1;
			lcd_i80_manage_next_value_ce9 <= 1'd1;
			lcd_i80_manage_ant_next_value10 <= 1'd1;
			lcd_i80_manage_ant_next_value_ce10 <= 1'd1;
			lcd_i80_count2_next_value5 <= 1'd0;
			lcd_i80_count2_next_value_ce5 <= 1'd1;
			lcd_i80_next_state <= 3'd6;
		end
		2'd3: begin
			lcd_i80_busy_next_value4 <= 1'd1;
			lcd_i80_busy_next_value_ce4 <= 1'd1;
			lcd_i80_wr_next_value2 <= (~lcd_i80_wr);
			lcd_i80_wr_next_value_ce2 <= 1'd1;
			lcd_i80_manage_next_value9 <= 2'd2;
			lcd_i80_manage_next_value_ce9 <= 1'd1;
			lcd_i80_countwr_next_value11 <= 1'd0;
			lcd_i80_countwr_next_value_ce11 <= 1'd1;
			lcd_i80_count2_next_value5 <= 1'd0;
			lcd_i80_count2_next_value_ce5 <= 1'd1;
			if ((lcd_i80_wr == 1'd1)) begin
				lcd_i80_next_state <= 4'd8;
			end
			if ((lcd_i80_wr == 1'd0)) begin
				lcd_i80_next_state <= 3'd6;
			end
		end
		3'd4: begin
			lcd_i80_busy_next_value4 <= 1'd1;
			lcd_i80_busy_next_value_ce4 <= 1'd1;
			lcd_i80_rs_next_value0 <= 1'd1;
			lcd_i80_rs_next_value_ce0 <= 1'd1;
			lcd_i80_db_next_value3 <= (lcd_i80_data >>> 4'd8);
			lcd_i80_db_next_value_ce3 <= 1'd1;
			lcd_i80_manage_next_value9 <= 2'd3;
			lcd_i80_manage_next_value_ce9 <= 1'd1;
			lcd_i80_manage_ant_next_value10 <= 2'd3;
			lcd_i80_manage_ant_next_value_ce10 <= 1'd1;
			lcd_i80_count2_next_value5 <= 1'd0;
			lcd_i80_count2_next_value_ce5 <= 1'd1;
			lcd_i80_next_state <= 3'd6;
		end
		3'd5: begin
			lcd_i80_busy_next_value4 <= 1'd1;
			lcd_i80_busy_next_value_ce4 <= 1'd1;
			lcd_i80_rs_next_value0 <= 1'd1;
			lcd_i80_rs_next_value_ce0 <= 1'd1;
			lcd_i80_db_next_value3 <= lcd_i80_data;
			lcd_i80_db_next_value_ce3 <= 1'd1;
			lcd_i80_manage_next_value9 <= 3'd4;
			lcd_i80_manage_next_value_ce9 <= 1'd1;
			lcd_i80_manage_ant_next_value10 <= 3'd4;
			lcd_i80_manage_ant_next_value_ce10 <= 1'd1;
			lcd_i80_count2_next_value5 <= 1'd0;
			lcd_i80_count2_next_value_ce5 <= 1'd1;
			lcd_i80_counter_regs_next_value7 <= (lcd_i80_counter_regs + 1'd1);
			lcd_i80_counter_regs_next_value_ce7 <= 1'd1;
			lcd_i80_next_state <= 3'd6;
		end
		3'd6: begin
			lcd_i80_count2_next_value5 <= (lcd_i80_count2 + 1'd1);
			lcd_i80_count2_next_value_ce5 <= 1'd1;
			if ((lcd_i80_count2 < 4'd10)) begin
				lcd_i80_next_state <= 3'd6;
			end
			if ((lcd_i80_count2 >= 4'd10)) begin
				if ((lcd_i80_manage == 1'd0)) begin
					if ((lcd_i80_sendone == 1'd1)) begin
						lcd_i80_next_state <= 2'd2;
					end
					if ((lcd_i80_sendone == 2'd3)) begin
						lcd_i80_next_state <= 2'd2;
					end
					if ((lcd_i80_sendone == 1'd0)) begin
						lcd_i80_next_state <= 1'd1;
					end
					if ((lcd_i80_sendone == 2'd2)) begin
						lcd_i80_next_state <= 1'd1;
					end
				end
				if ((lcd_i80_manage == 1'd1)) begin
					lcd_i80_next_state <= 2'd3;
				end
				if ((lcd_i80_manage == 2'd2)) begin
					if ((lcd_i80_manage_ant == 1'd1)) begin
						if ((lcd_i80_sendone == 1'd0)) begin
							lcd_i80_next_state <= 3'd4;
						end
						if ((lcd_i80_sendone == 2'd2)) begin
							lcd_i80_next_state <= 1'd0;
						end
						if ((lcd_i80_sendone == 1'd1)) begin
							lcd_i80_next_state <= 3'd5;
						end
						if ((lcd_i80_sendone == 2'd3)) begin
							lcd_i80_next_state <= 1'd0;
						end
					end
					if ((lcd_i80_manage_ant == 2'd3)) begin
						lcd_i80_next_state <= 3'd5;
					end
					if ((lcd_i80_manage_ant == 3'd4)) begin
						if ((lcd_i80_counter_regs < lcd_i80_number)) begin
							if ((lcd_i80_sendone == 1'd0)) begin
								lcd_i80_next_state <= 3'd4;
							end
							if ((lcd_i80_sendone == 1'd1)) begin
								lcd_i80_next_state <= 3'd5;
							end
						end
						if ((lcd_i80_counter_regs >= lcd_i80_number)) begin
							lcd_i80_next_state <= 3'd7;
						end
					end
					if ((lcd_i80_manage_ant == 3'd5)) begin
						lcd_i80_next_state <= 2'd2;
					end
				end
				if ((lcd_i80_manage == 2'd3)) begin
					lcd_i80_next_state <= 2'd3;
				end
				if ((lcd_i80_manage == 3'd4)) begin
					lcd_i80_next_state <= 2'd3;
				end
				if ((lcd_i80_manage == 3'd5)) begin
					lcd_i80_next_state <= 2'd3;
				end
			end
		end
		3'd7: begin
			lcd_i80_countwr_next_value11 <= (lcd_i80_countwr + 1'd1);
			lcd_i80_countwr_next_value_ce11 <= 1'd1;
			if ((lcd_i80_countwr < 2'd3)) begin
				lcd_i80_next_state <= 3'd7;
			end
			if ((lcd_i80_countwr >= 2'd3)) begin
				lcd_i80_next_state <= 1'd0;
			end
		end
		4'd8: begin
			lcd_i80_countwr_next_value11 <= (lcd_i80_countwr + 1'd1);
			lcd_i80_countwr_next_value_ce11 <= 1'd1;
			if ((lcd_i80_countwr < 4'd10)) begin
				lcd_i80_next_state <= 4'd8;
			end
			if ((lcd_i80_countwr >= 4'd10)) begin
				lcd_i80_next_state <= 2'd3;
			end
		end
		4'd9: begin
			lcd_i80_busy_next_value4 <= 1'd1;
			lcd_i80_busy_next_value_ce4 <= 1'd1;
			lcd_i80_rst_next_value8 <= 1'd1;
			lcd_i80_rst_next_value_ce8 <= 1'd1;
			lcd_i80_wr_next_value2 <= 1'd1;
			lcd_i80_wr_next_value_ce2 <= 1'd1;
			lcd_i80_rd_next_value1 <= 1'd1;
			lcd_i80_rd_next_value_ce1 <= 1'd1;
			lcd_i80_count_next_value6 <= (lcd_i80_count + 1'd1);
			lcd_i80_count_next_value_ce6 <= 1'd1;
			lcd_i80_count3_next_value12 <= 1'd0;
			lcd_i80_count3_next_value_ce12 <= 1'd1;
			if ((lcd_i80_count < 3'd5)) begin
				lcd_i80_next_state <= 4'd9;
			end
			if ((lcd_i80_count >= 3'd5)) begin
				lcd_i80_next_state <= 4'd10;
			end
		end
		4'd10: begin
			lcd_i80_busy_next_value4 <= 1'd1;
			lcd_i80_busy_next_value_ce4 <= 1'd1;
			lcd_i80_rst_next_value8 <= 1'd0;
			lcd_i80_rst_next_value_ce8 <= 1'd1;
			lcd_i80_count3_next_value12 <= (lcd_i80_count3 + 1'd1);
			lcd_i80_count3_next_value_ce12 <= 1'd1;
			if ((lcd_i80_count3 < 18'd200000)) begin
				lcd_i80_next_state <= 4'd10;
			end
			if ((lcd_i80_count3 >= 18'd200000)) begin
				lcd_i80_count4_next_value13 <= 1'd0;
				lcd_i80_count4_next_value_ce13 <= 1'd1;
				lcd_i80_next_state <= 4'd11;
			end
		end
		4'd11: begin
			lcd_i80_busy_next_value4 <= 1'd1;
			lcd_i80_busy_next_value_ce4 <= 1'd1;
			lcd_i80_rst_next_value8 <= 1'd1;
			lcd_i80_rst_next_value_ce8 <= 1'd1;
			lcd_i80_rs_next_value0 <= 1'd0;
			lcd_i80_rs_next_value_ce0 <= 1'd1;
			lcd_i80_db_next_value3 <= 1'd0;
			lcd_i80_db_next_value_ce3 <= 1'd1;
			lcd_i80_count4_next_value13 <= (lcd_i80_count4 + 1'd1);
			lcd_i80_count4_next_value_ce13 <= 1'd1;
			if ((lcd_i80_count4 < 4'd10)) begin
				lcd_i80_next_state <= 4'd11;
			end
			if ((lcd_i80_count4 >= 4'd10)) begin
				lcd_i80_count5_next_value14 <= 1'd0;
				lcd_i80_count5_next_value_ce14 <= 1'd1;
				lcd_i80_count6_next_value15 <= 1'd0;
				lcd_i80_count6_next_value_ce15 <= 1'd1;
				lcd_i80_next_state <= 4'd12;
			end
		end
		4'd12: begin
			lcd_i80_busy_next_value4 <= 1'd1;
			lcd_i80_busy_next_value_ce4 <= 1'd1;
			lcd_i80_rst_next_value8 <= 1'd1;
			lcd_i80_rst_next_value_ce8 <= 1'd1;
			lcd_i80_count5_next_value14 <= (lcd_i80_count5 + 1'd1);
			lcd_i80_count5_next_value_ce14 <= 1'd1;
			if ((lcd_i80_count5 < 3'd5)) begin
				lcd_i80_next_state <= 4'd12;
			end
			if ((lcd_i80_count5 >= 3'd5)) begin
				lcd_i80_wr_next_value2 <= (~lcd_i80_wr);
				lcd_i80_wr_next_value_ce2 <= 1'd1;
				lcd_i80_count6_next_value15 <= (lcd_i80_count6 + 1'd1);
				lcd_i80_count6_next_value_ce15 <= 1'd1;
				if ((lcd_i80_count6 < 3'd5)) begin
					lcd_i80_next_state <= 4'd12;
				end
				if ((lcd_i80_count6 >= 3'd5)) begin
					lcd_i80_count_next_value6 <= 1'd0;
					lcd_i80_count_next_value_ce6 <= 1'd1;
					lcd_i80_count6_next_value15 <= 1'd0;
					lcd_i80_count6_next_value_ce15 <= 1'd1;
					lcd_i80_count7_next_value16 <= 1'd0;
					lcd_i80_count7_next_value_ce16 <= 1'd1;
					lcd_i80_next_state <= 4'd13;
				end
			end
		end
		4'd13: begin
			lcd_i80_count7_next_value16 <= (lcd_i80_count7 + 1'd1);
			lcd_i80_count7_next_value_ce16 <= 1'd1;
			if ((lcd_i80_count7 < 2'd2)) begin
				lcd_i80_next_state <= 4'd13;
			end
			if ((lcd_i80_count7 >= 2'd2)) begin
				lcd_i80_next_state <= 1'd0;
			end
		end
		default: begin
			lcd_i80_rs_next_value0 <= 1'd1;
			lcd_i80_rs_next_value_ce0 <= 1'd1;
			lcd_i80_rd_next_value1 <= 1'd1;
			lcd_i80_rd_next_value_ce1 <= 1'd1;
			lcd_i80_wr_next_value2 <= 1'd1;
			lcd_i80_wr_next_value_ce2 <= 1'd1;
			lcd_i80_db_next_value3 <= 1'd0;
			lcd_i80_db_next_value_ce3 <= 1'd1;
			lcd_i80_busy_next_value4 <= 1'd0;
			lcd_i80_busy_next_value_ce4 <= 1'd1;
			lcd_i80_count2_next_value5 <= 1'd0;
			lcd_i80_count2_next_value_ce5 <= 1'd1;
			lcd_i80_count_next_value6 <= 1'd0;
			lcd_i80_count_next_value_ce6 <= 1'd1;
			lcd_i80_counter_regs_next_value7 <= 1'd0;
			lcd_i80_counter_regs_next_value_ce7 <= 1'd1;
			lcd_i80_rst_next_value8 <= 1'd1;
			lcd_i80_rst_next_value_ce8 <= 1'd1;
			lcd_i80_manage_next_value9 <= 1'd0;
			lcd_i80_manage_next_value_ce9 <= 1'd1;
			if ((lcd_i80_start == 1'd1)) begin
				lcd_i80_next_state <= 3'd6;
			end
			if ((lcd_i80_start == 2'd3)) begin
				lcd_i80_next_state <= 4'd9;
			end
		end
	endcase
// synthesis translate_off
	dummy_d <= dummy_s;
// synthesis translate_on
end

always @(posedge sys_clk) begin
	lcd_i80_state <= lcd_i80_next_state;
	if (lcd_i80_rs_next_value_ce0) begin
		lcd_i80_rs <= lcd_i80_rs_next_value0;
	end
	if (lcd_i80_rd_next_value_ce1) begin
		lcd_i80_rd <= lcd_i80_rd_next_value1;
	end
	if (lcd_i80_wr_next_value_ce2) begin
		lcd_i80_wr <= lcd_i80_wr_next_value2;
	end
	if (lcd_i80_db_next_value_ce3) begin
		lcd_i80_db <= lcd_i80_db_next_value3;
	end
	if (lcd_i80_busy_next_value_ce4) begin
		lcd_i80_busy <= lcd_i80_busy_next_value4;
	end
	if (lcd_i80_count2_next_value_ce5) begin
		lcd_i80_count2 <= lcd_i80_count2_next_value5;
	end
	if (lcd_i80_count_next_value_ce6) begin
		lcd_i80_count <= lcd_i80_count_next_value6;
	end
	if (lcd_i80_counter_regs_next_value_ce7) begin
		lcd_i80_counter_regs <= lcd_i80_counter_regs_next_value7;
	end
	if (lcd_i80_rst_next_value_ce8) begin
		lcd_i80_rst <= lcd_i80_rst_next_value8;
	end
	if (lcd_i80_manage_next_value_ce9) begin
		lcd_i80_manage <= lcd_i80_manage_next_value9;
	end
	if (lcd_i80_manage_ant_next_value_ce10) begin
		lcd_i80_manage_ant <= lcd_i80_manage_ant_next_value10;
	end
	if (lcd_i80_countwr_next_value_ce11) begin
		lcd_i80_countwr <= lcd_i80_countwr_next_value11;
	end
	if (lcd_i80_count3_next_value_ce12) begin
		lcd_i80_count3 <= lcd_i80_count3_next_value12;
	end
	if (lcd_i80_count4_next_value_ce13) begin
		lcd_i80_count4 <= lcd_i80_count4_next_value13;
	end
	if (lcd_i80_count5_next_value_ce14) begin
		lcd_i80_count5 <= lcd_i80_count5_next_value14;
	end
	if (lcd_i80_count6_next_value_ce15) begin
		lcd_i80_count6 <= lcd_i80_count6_next_value15;
	end
	if (lcd_i80_count7_next_value_ce16) begin
		lcd_i80_count7 <= lcd_i80_count7_next_value16;
	end
	if (sys_rst) begin
		lcd_i80_busy <= 1'd0;
		lcd_i80_db <= 8'd0;
		lcd_i80_rs <= 1'd0;
		lcd_i80_rd <= 1'd0;
		lcd_i80_wr <= 1'd0;
		lcd_i80_rst <= 1'd0;
		lcd_i80_count <= 24'd0;
		lcd_i80_manage <= 4'd0;
		lcd_i80_count2 <= 4'd0;
		lcd_i80_count3 <= 24'd0;
		lcd_i80_count4 <= 24'd0;
		lcd_i80_count5 <= 4'd0;
		lcd_i80_count6 <= 4'd0;
		lcd_i80_count7 <= 3'd0;
		lcd_i80_countwr <= 4'd0;
		lcd_i80_manage_ant <= 3'd0;
		lcd_i80_counter_regs <= 20'd0;
		lcd_i80_state <= 4'd0;
	end
end

endmodule
