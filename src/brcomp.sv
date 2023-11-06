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
	
	assign br_equal = ~(c[0]  | c[1]  | c[2]  | c[3]  | c[4]  | c[5]  | c[6]  | c[7]
	                  | c[8]  | c[9]  | c[10] | c[11] | c[12] | c[13] | c[14] | c[15]
                      | c[16] | c[17] | c[18] | c[19] | c[20] | c[21] | c[22] | c[23]
	                  | c[24] | c[25] | c[26] | c[27] | c[28] | c[29] | c[30] | c[31]);

endmodule