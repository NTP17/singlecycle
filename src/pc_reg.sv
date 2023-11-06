module pc_reg (
	input clk, rstn,
	input [12:0] nxt_pc,
	output logic [12:0] pc
);

	always_ff @ (posedge clk, negedge rstn)
		if (!rstn) pc = 0;
		else pc = {nxt_pc[12:1],1'b0};

endmodule