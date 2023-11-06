module hwtb (
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7
);

	logic [31:0] raw;

	immGen ig (
		.instr(32'hff9ff06f),
		.imm(raw)
	);

	binto7seg disp0 (
		.bits(raw[3:0]),
		.segs(HEX0)
	);
	binto7seg disp1 (
		.bits(raw[7:4]),
		.segs(HEX1)
	);
	
	binto7seg disp2 (
		.bits(raw[11:8]),
		.segs(HEX2)
	);

	binto7seg disp3 (
		.bits(raw[15:12]),
		.segs(HEX3)
	);

	binto7seg disp4 (
		.bits(raw[19:16]),
		.segs(HEX4)
	);

	binto7seg disp5 (
		.bits(raw[23:20]),
		.segs(HEX5)
	);

	binto7seg disp6 (
		.bits(raw[27:24]),
		.segs(HEX6)
	);

	binto7seg disp7 (
		.bits(raw[31:28]),
		.segs(HEX7)
	);

endmodule