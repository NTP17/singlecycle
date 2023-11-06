module instr_rom (
	input	 [12:0] pc,
	output [31:0] instr
);

	reg [31:0] mem [0:11'h7ff];

	initial $readmemh("../mem/LCD_test.mem", mem);
	//initial $readmemh("../mem/HEX_test.mem", mem);
	//initial $readmemh("../mem/LEDG_test.mem", mem);
	//initial $readmemh("../mem/LEDR_SW_test.mem", mem);

	assign instr = mem[pc[12:2]];

endmodule
