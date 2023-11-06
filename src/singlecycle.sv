module singlecycle (
    input clk_i, rst_ni,
    input [31:0] io_sw_i,
    output [12:0] pc_debug_o,
    output [31:0] io_lcd_o, io_ledg_o, io_ledr_o, io_hex0_o, io_hex1_o, io_hex2_o, io_hex3_o, io_hex4_o, io_hex5_o, io_hex6_o, io_hex7_o
);

    logic [31:0] alu_data, instr, imm, rs1_data, rs2_data, operand_a, operand_b, ld_raw, ld_data, wb_data;
    logic [12:0] pc_four, nxt_pc, pc;
    logic [4:0] rs1_addr, rs2_addr, rd_addr;
    logic [3:0] alu_op, byte_en;
    logic [1:0] wb_sel;
    logic [2:0] ld_sel;
    logic br_sel, rd_wren, br_unsigned, br_less, br_equal, op_a_sel, op_b_sel, mem_wren;

    assign pc_debug_o = pc;

    ctrl_unit cu (
        .instr(instr),
        .br_less(br_less),
        .br_equal(br_equal),
        .br_sel(br_sel),
        .rd_wren(rd_wren),
        .br_unsigned(br_unsigned),
        .op_a_sel(op_a_sel),
        .op_b_sel(op_b_sel),
        .mem_wren(mem_wren),
        .alu_op(alu_op),
        .byte_en(byte_en),
        .wb_sel(wb_sel),
        .ld_sel(ld_sel)
    );

    br_mux brm (.br_sel(br_sel), .alu_data(alu_data), .pc_four(pc_four), .nxt_pc(nxt_pc));

    add4 plus4 (.pc_in(pc), .pc_out(pc_four));

    pc_reg pcr (.clk(clk_i), .rstn(rst_ni), .nxt_pc(nxt_pc), .pc(pc));

    instr_rom im (.pc(pc), .instr(instr));

    reg_dec rd (.instr(instr), .rs1_addr(rs1_addr), .rs2_addr(rs2_addr), .rd_addr(rd_addr));

    immGen ig (.instr(instr), .imm(imm));

    regfile rf (
        .clk_i(clk_i),
        .rst_ni(rst_ni),
        .rs1_addr(rs1_addr),
        .rs2_addr(rs2_addr),
        .rd_addr(rd_addr),
        .rd_data(wb_data),
        .rd_wren(rd_wren),
        .rs1_data(rs1_data),
        .rs2_data(rs2_data)
    );

    brcomp brc (.rs1_data(rs1_data), .rs2_data(rs2_data), .br_unsigned(br_unsigned), .br_less(br_less), .br_equal(br_equal));

    op_a_mux oam (.pc(pc), .rs1_data(rs1_data), .op_a_sel(op_a_sel), .operand_a(operand_a));

    op_b_mux obm (.imm(imm), .rs2_data(rs2_data), .op_b_sel(op_b_sel), .operand_b(operand_b));

    alu ula (.operand_a(operand_a), .operand_b(operand_b), .alu_op(alu_op), .alu_data(alu_data));

    lsu usl (
        .clk_i(clk_i),
        .rst_ni(rst_ni),
        .st_en(mem_wren),
        .addr(alu_data[11:0]),
		  .byte_en(byte_en),
        .st_data(rs2_data),
        .io_sw(io_sw_i),
        .ld_data(ld_raw),
        .io_lcd(io_lcd_o),
        .io_ledg(io_ledg_o),
        .io_ledr(io_ledr_o),
        .io_hex0(io_hex0_o),
        .io_hex1(io_hex1_o),
        .io_hex2(io_hex2_o),
        .io_hex3(io_hex3_o),
        .io_hex4(io_hex4_o),
        .io_hex5(io_hex5_o),
        .io_hex6(io_hex6_o),
        .io_hex7(io_hex7_o)
    );

    ld_sel_mux lsm (
        .LW(ld_raw),
        .LB(ld_raw[7:0]),
        .LBU(ld_raw[7:0]),
        .LH(ld_raw[15:0]),
        .LHU(ld_raw[15:0]),
        .ld_sel(ld_sel),
        .ld_data(ld_data));

    wb_mux wbm (.pc_four(pc_four), .alu_data(alu_data), .ld_data(ld_data), .wb_sel(wb_sel), .wb_data(wb_data));

endmodule