`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/28 16:04:17
// Design Name: 
// Module Name: wave_gernerator
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


module wave_generator(
    input clk,
    input reset_n,
    
    input [3:0] dds_cs,
    
    input [2:0] wave_cs_0,
    input [2:0] mul_0,
    input [2:0] wave_cs_1,
    input [2:0] mul_1,
    input [2:0] wave_cs_2,
    input [2:0] mul_2,
    input [2:0] wave_cs_3,
    input [2:0] mul_3,
    
    input [3:0] n,
    
    output [15:0] q
    );
    
    wire [15:0] q_0, q_1, q_2, q_3;
    wire sub_clk;
    
    divider divider(.clk(clk),.reset_n(reset_n),.n(n),.out(sub_clk));
    
    wave_top dds_0(.clk(sub_clk), .reset_n(reset_n), .dds_cs(dds_cs[0]), .wave_cs(wave_cs_0), .mul(mul_0), .q(q_0));
    
    wave_top dds_1(.clk(sub_clk), .reset_n(reset_n), .dds_cs(dds_cs[1]), .wave_cs(wave_cs_1), .mul(mul_1), .q(q_1));
    
    wave_top dds_2(.clk(sub_clk), .reset_n(reset_n), .dds_cs(dds_cs[2]), .wave_cs(wave_cs_2), .mul(mul_2), .q(q_2));
    
    wave_top dds_3(.clk(sub_clk), .reset_n(reset_n), .dds_cs(dds_cs[3]), .wave_cs(wave_cs_3), .mul(mul_3), .q(q_3));
    
    wave_adder adder(.q_in0(q_0), .q_in1(q_1), .q_in2(q_2), .q_in3(q_3), .q_out(q));

endmodule
