`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/28 16:18:59
// Design Name: 
// Module Name: wave_generator_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module wave_generator_tb(

    );
    reg clk;
    reg reset_n;
    
    reg [3:0] dds_cs;
    
    reg [2:0] wave_cs_0;
    reg [2:0] mul_0;
    reg [2:0] wave_cs_1;
    reg [2:0] mul_1;
    reg [2:0] wave_cs_2;
    reg [2:0] mul_2;
    reg [2:0] wave_cs_3;
    reg [2:0] mul_3;
    
    wire [15:0] q;
    
    initial begin
		clk = 1;
 reset_n = 0;
		#200.1 
 reset_n = 1; 
		
		            dds_cs = 4'b0001; wave_cs_0 = 3'b0; mul_0 =  3'b0;
		#10_000_000 dds_cs = 4'b0011; wave_cs_1 = 3'b1; mul_1 =  3'b0;
		
		
		#10_000_000 $stop;
		
//		#50_000_000 $stop;
	end 
    
    wave_generator wave_generator_tb(.clk(clk), .reset_n(reset_n), .dds_cs(dds_cs),.wave_cs_0(wave_cs_0), .mul_0(mul_0), .wave_cs_1(wave_cs_1), .mul_1(mul_1), .wave_cs_2(wave_cs_2), .mul_2(mul_2), .wave_cs_3(wave_cs_3), .mul_3(mul_3), .q(q));
    
    always #10 clk = ~clk;
    
endmodule
