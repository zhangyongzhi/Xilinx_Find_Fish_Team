`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/28 15:59:44
// Design Name: 
// Module Name: wave_adder
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


module wave_adder(
    input  [15:0] q_in0,
    input  [15:0] q_in1,
    input  [15:0] q_in2,
    input  [15:0] q_in3,
    
    output [15:0] q_out
    );
    
    assign q_out = q_in0 + q_in1 + q_in2 + q_in3;
    
    
endmodule
