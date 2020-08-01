`timescale 1ns/1ps

module dds_tb;

	reg clk, rst_n;
	reg [2:0] dds_cs;
	reg [2:0] mul;
	wire [15:0] q;
	
	initial begin
		clk = 1;
		rst_n = 0;
		#200.1
		rst_n = 1;  mul    = 3'b0;
		            dds_cs = 3'd0;
		#10_000_000 dds_cs = 3'd1; mul    = 3'b0;
		#10_000_000 mul    = 3'b1;
		#10_000_000 dds_cs = 3'd2; mul    = 3'b0;
		#10_000_000 mul    = 3'b1;
		#10_000_000 dds_cs = 3'd3; mul    = 3'b0;
		#10_000_000 mul    = 3'b1;
		#10_000_000 dds_cs = 3'd4; mul    = 3'b0;
		#10_000_000 mul    = 3'b1;
		#10_000_000 $stop;
		
//		#50_000_000 $stop;
	end 

	wave_top wave_dut(
		.clk(clk), 
		.reset_n(rst_n),
		.dds_cs(dds_cs),
		.mul(mul),
		.q(q)
	);
	
	always #10 clk = ~clk;

endmodule 