`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/28 14:21:31
// Design Name: 
// Module Name: wave_top
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


module wave_top(
    input         clk,
    input         reset_n,
    input         dds_cs,
    input  [2 :0] wave_cs,
    input  [2 :0] mul,
    output [15:0] q
    );
    
    wire sin_en   = (wave_cs == 3'd0);
    wire tri_en   = (wave_cs == 3'd1);
    wire squ_en   = (wave_cs == 3'd2);
    wire noi_en   = (wave_cs == 3'd3);
    wire saw_en   = (wave_cs == 3'd4);
    
    wire [7:0] q_sin;
    wire [7:0] q_tri;
    wire [7:0] q_squ;
    wire [7:0] q_noi;
    wire [7:0] q_saw;
    
    dds_sin dds_sin   (.clk(clk), .rst_n(reset_n), .dds_en(sin_en), .q(q_sin));
    dds_tri dds_tri   (.clk(clk), .rst_n(reset_n), .dds_en(tri_en), .q(q_tri));
    dds_squ dds_squ   (.clk(clk), .rst_n(reset_n), .dds_en(squ_en), .q(q_squ));
    dds_noi dds_noi   (.clk(clk), .rst_n(reset_n), .dds_en(noi_en), .q(q_noi));
    dds_saw dds_saw   (.clk(clk), .rst_n(reset_n), .dds_en(saw_en), .q(q_saw));
    
    assign q = (((q_sin & {8{sin_en}}) | (q_tri & {8{tri_en}}) | (q_squ & {8{squ_en}}) | (q_noi & {8{noi_en}}) | (q_saw & {8{saw_en}})) * (mul + 1'b1)) & {16{dds_cs}};
    
endmodule
