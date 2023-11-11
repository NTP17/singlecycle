`timescale 1ps/1ps

module singlecycle_tb;

    logic clk_i, rst_ni;
    logic [31:0] io_sw_i;
    logic [12:0] pc_debug_o;
    logic [31:0] io_lcd_o, io_ledg_o, io_ledr_o, io_hex0_o, io_hex1_o, io_hex2_o, io_hex3_o, io_hex4_o, io_hex5_o, io_hex6_o, io_hex7_o;
	
	singlecycle dut (
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.io_sw_i(io_sw_i),
		.pc_debug_o(pc_debug_o),
		.io_lcd_o(io_lcd_o),
		.io_ledg_o(io_ledg_o),
		.io_ledr_o(io_ledr_o),
		.io_hex0_o(io_hex0_o),
		.io_hex1_o(io_hex1_o),
		.io_hex2_o(io_hex2_o),
	   .io_hex3_o(io_hex3_o),
		.io_hex4_o(io_hex4_o),
		.io_hex5_o(io_hex5_o),
		.io_hex6_o(io_hex6_o),
	   .io_hex7_o(io_hex7_o));
	
	initial begin
		rst_ni       = 1'b0;
      io_sw_i      = 32'h3;
		$dumpfile("singlecycledump.vcd");
		$dumpvars;
	end
	
	initial begin
    clk_i = 1'b0;
	 forever #5 clk_i = !clk_i;
   end
	
	initial begin
		#5
      rst_ni   = 1'b1;
		#2
      io_sw_i = 32'h80000513;#10
      io_sw_i = 32'h81000593;#10
      io_sw_i = 32'h82000613;#10
      io_sw_i = 32'h83000693;#10
      io_sw_i = 32'h84000713;#10
      io_sw_i = 32'h85000793;#10
      io_sw_i = 32'h86000813;#10
      io_sw_i = 32'h87000893;#10
      io_sw_i = 32'h88000913;#10
      io_sw_i = 32'h89000993;#10
      io_sw_i = 32'h8a000a13;#10
      io_sw_i = 32'h90000a93;#10
      io_sw_i = 32'h03f00113;#10
      io_sw_i = 32'h00200023;#10
      io_sw_i = 32'h00600113;#10
      io_sw_i = 32'h00200223;#10
      io_sw_i = 32'h05b00113;#10
      io_sw_i = 32'h00200423;#10
      io_sw_i = 32'h04f00113;#10
      io_sw_i = 32'h00200623;#10
      io_sw_i = 32'h06600113;#10
      io_sw_i = 32'h00200823;#10
      io_sw_i = 32'h06d00113;#10
      io_sw_i = 32'h00200a23;#10
      io_sw_i = 32'h07d00113;#10
      io_sw_i = 32'h00200c23;#10
      io_sw_i = 32'h00700113;#10
      io_sw_i = 32'h00200e23;#10
      io_sw_i = 32'h07f00113;#10
      io_sw_i = 32'h02200023;#10
      io_sw_i = 32'h06f00113;#10
      io_sw_i = 32'h02200223;#10
      io_sw_i = 32'h07700113;#10
      io_sw_i = 32'h02200423;#10
      io_sw_i = 32'h07c00113;#10
      io_sw_i = 32'h02200623;#10
      io_sw_i = 32'h03900113;#10
      io_sw_i = 32'h02200823;#10
      io_sw_i = 32'h05e00113;#10
      io_sw_i = 32'h02200a23;#10
      io_sw_i = 32'h07900113;#10
      io_sw_i = 32'h02200c23;#10
      io_sw_i = 32'h07100113;#10
      io_sw_i = 32'h02200e23;#10
      io_sw_i = 32'h800001b7;#10
      io_sw_i = 32'h43818193;#10
      io_sw_i = 32'h003a2023;#10
      io_sw_i = 32'h03800193;#10
      io_sw_i = 32'h003a1023;#10
      io_sw_i = 32'h40c00193;#10
      io_sw_i = 32'h003a1023;#10
      io_sw_i = 32'h00c00193;#10
      io_sw_i = 32'h003a1023;#10
      io_sw_i = 32'h15500113;#10
      io_sw_i = 32'h00299023;#10
      io_sw_i = 32'h00000103;#10
      io_sw_i = 32'h00288023;#10
      io_sw_i = 32'h00400103;#10
      io_sw_i = 32'h00280023;#10
      io_sw_i = 32'h00800103;#10
      io_sw_i = 32'h00278023;#10
      io_sw_i = 32'h00c00103;#10
      io_sw_i = 32'h00270023;#10
      io_sw_i = 32'h01000103;#10
      io_sw_i = 32'h00268023;#10
      io_sw_i = 32'h01400103;#10
      io_sw_i = 32'h00260023;#10
      io_sw_i = 32'h01800103;#10
      io_sw_i = 32'h00258023;#10
      io_sw_i = 32'h01c00103;#10
      io_sw_i = 32'h00250023;#10
      io_sw_i = 32'h40100193;#10
      io_sw_i = 32'h003a1023;#10
      io_sw_i = 32'h00100193;#10
      io_sw_i = 32'h003a1023;#10
      io_sw_i = 32'h63000293;#10
      io_sw_i = 32'h23000313;#10
      io_sw_i = 32'h005001b3;#10
      io_sw_i = 32'h003a1023;#10
      io_sw_i = 32'h006001b3;#10
      io_sw_i = 32'h003a1023;#10
      io_sw_i = 32'h00128293;#10
      io_sw_i = 32'h00130313;#10
      io_sw_i = 32'h4c000193;#10
      io_sw_i = 32'h003a1023;#10
      io_sw_i = 32'h0c000193;#10
      io_sw_i = 32'h003a1023;#10
      io_sw_i = 32'h005001b3;#10
      io_sw_i = 32'h003a1023;#10
      io_sw_i = 32'h006001b3;#10
      io_sw_i = 32'h003a1023;#10
      io_sw_i = 32'h00128293;#10
      io_sw_i = 32'h00130313;#10
      io_sw_i = 32'h0aa00113;#10
      io_sw_i = 32'h00299023;#10
      io_sw_i = 32'h02000103;#10
      io_sw_i = 32'h00288023;#10
      io_sw_i = 32'h02400103;#10
      io_sw_i = 32'h00280023;#10
      io_sw_i = 32'h02800103;#10
      io_sw_i = 32'h00278023;#10
      io_sw_i = 32'h02c00103;#10
      io_sw_i = 32'h00270023;#10
      io_sw_i = 32'h03000103;#10
      io_sw_i = 32'h00268023;#10
      io_sw_i = 32'h03400103;#10
      io_sw_i = 32'h00260023;#10
      io_sw_i = 32'h03800103;#10
      io_sw_i = 32'h00258023;#10
      io_sw_i = 32'h03c00103;#10
      io_sw_i = 32'h00250023;#10
      io_sw_i = 32'h40100193;#10
      io_sw_i = 32'h003a1023;#10
      io_sw_i = 32'h00100193;#10
      io_sw_i = 32'h003a1023;#10
      io_sw_i = 32'h005001b3;#10
      io_sw_i = 32'h003a1023;#10
      io_sw_i = 32'h006001b3;#10
      io_sw_i = 32'h003a1023;#10
      io_sw_i = 32'h00128293;#10
      io_sw_i = 32'h00130313;#10
      io_sw_i = 32'h4c000193;#10
      io_sw_i = 32'h003a1023;#10
      io_sw_i = 32'h0c000193;#10
      io_sw_i = 32'h003a1023;#10
      io_sw_i = 32'h005001b3;#10
      io_sw_i = 32'h003a1023;#10
      io_sw_i = 32'h006001b3;#10
      io_sw_i = 32'h003a1023;#10
      io_sw_i = 32'h000a9f03;#10
      io_sw_i = 32'h01e92023;#10
      io_sw_i = 32'hff9ff06f;#10
      
		//rs1_data updated
		//assert (rs1_data == 32'h13579bdf) $display("PASSED"); else $error("Assertion failed");

	   #50	$finish;
		
	end
	   

endmodule 