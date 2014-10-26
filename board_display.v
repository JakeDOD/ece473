module board_display(
	input wire [0:4] address_disp,
	input wire [31:0] lcd_line1_in, lcd_line2_in,
	input wire [0:4] pc_in,
	input wire count_clock, count_reset,
	input wire lcd_reset, lcd_clock,
	
	output wire [6:0] HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0,
	output wire LCD_RS, LCD_EN, LCD_RW,
	output wire [7:0] LCD_DATA);
	
	wire [3:0] hex7_in, hex6_in, hex5_in, hex4_in, hex3_in, hex2_in, hex1_in, hex0_in;
	
	binaryToBCD(address_disp[0:4],hex7_in[3:0],hex6_in[3:0]);
	binaryToBCD(pc_in[0:4],hex5_in[3:0],hex4_in[3:0]);
	
	count(count_clock,count_reset,hex0_in[3:0],hex1_in[3:0],hex2_in[3:0],hex3_in[3:0]);
	
	hexdigit(hex7_in,HEX7);
	hexdigit(hex6_in,HEX6);
	hexdigit(hex5_in,HEX5);
	hexdigit(hex4_in,HEX4);
	hexdigit(hex3_in,HEX3);
	hexdigit(hex2_in,HEX2);
	hexdigit(hex1_in,HEX1);
	hexdigit(hex0_in,HEX0);
	
	LCD_Display(lcd_reset, lcd_clock, lcd_line1_in, lcd_line2_in, LCD_RS, LCD_EN, LCD_RW, LCD_DATA[7:0]);

endmodule	