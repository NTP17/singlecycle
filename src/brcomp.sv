module brcomp (
	input [31:0] rs1_data, rs2_data,
	input br_unsigned,
	output br_less, br_equal
);

	wire [32:0] ua, ub, uc;
	wire [31:0] c;
	wire less, uless;
	
	assign ua = {1'b0,rs1_data};
	assign ub = {1'b0,rs2_data};
	assign uc =       ua + ~      ub + 33'h1;
	assign  c = rs1_data + ~rs2_data + 32'h1;
	
	assign less  =  (c[31]) ? 1 : 0;
	assign uless = (uc[32]) ? 1 : 0;
	
	assign br_less = (br_unsigned) ? uless : less;
	
	assign br_equal = ~|c;

endmodule