module wrapper (
    input CLOCK_50,
    input  [17:0] SW,
	input  [3:0]  KEY,
	output [17:0] LEDR,
	output [8:0]  LEDG,
	output [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
	output [7:0]  LCD_DATA,
	output LCD_ON, LCD_RW, LCD_EN, LCD_RS,
    output [12:0] pc_debug
);

	logic clk_div;
	logic [31:0] imm;
    logic [31:0] lcd_wire, ledg_wire, ledr_wire, hex0_wire, hex1_wire, hex2_wire, hex3_wire, hex4_wire, hex5_wire, hex6_wire, hex7_wire;
	 
	clock_divider genclk (
        .clkin(CLOCK_50),
		  .reset(SW[17]),
		  .clkout(clk_div)
   );	
	singlecycle riscv32i (
        //.clk_i(!KEY[0]),
        .clk_i(/*CLOCK_50*/clk_div),
        .rst_ni(SW[17]),
        .io_sw_i({15'b0,SW[16:0]}),
        .pc_debug_o(/*LEDR[12:0]*/pc_debug),
        .io_lcd_o(lcd_wire),
        .io_ledg_o(ledg_wire),
        .io_ledr_o(ledr_wire),
        .io_hex0_o(hex0_wire),
        .io_hex1_o(hex1_wire),
        .io_hex2_o(hex2_wire),
        .io_hex3_o(hex3_wire),
        .io_hex4_o(hex4_wire),
        .io_hex5_o(hex5_wire),
        .io_hex6_o(hex6_wire),
        .io_hex7_o(hex7_wire)
	);

    assign LCD_ON = lcd_wire[31];
    assign LCD_EN = lcd_wire[10];
    assign LCD_RS = lcd_wire[9];
    assign LCD_RW = lcd_wire[8];
    assign LCD_DATA = lcd_wire[7:0];
    assign HEX0 = ~hex0_wire[6:0];
    assign HEX1 = ~hex1_wire[6:0];
    assign HEX2 = ~hex2_wire[6:0];
    assign HEX3 = ~hex3_wire[6:0];
    assign HEX4 = ~hex4_wire[6:0];
    assign HEX5 = ~hex5_wire[6:0];
    assign HEX6 = ~hex6_wire[6:0];
    assign HEX7 = ~hex7_wire[6:0];
    assign LEDG = ledg_wire[8:0];
    assign LEDR = ledr_wire[17:0];

endmodule