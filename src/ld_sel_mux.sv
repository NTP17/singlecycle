module ld_sel_mux (
	input [31:0] LW,
	input [7:0] LB, LBU,
	input [15:0] LH, LHU,
	input [2:0] ld_sel,
	output [31:0] ld_data
);

	assign ld_data = (ld_sel == 3'h0) ? {24'b0,LBU} :
	                 (ld_sel == 3'h1) ? {16'b0,LHU} :
					 (ld_sel == 3'h2 || ld_sel == 3'h3) ? {{24{LB[7]}},LB} :
					 (ld_sel == 3'h4 || ld_sel == 3'h5) ? {{16{LH[15]}},LH} :
					 (ld_sel == 3'h6) ? LW : LW;

endmodule