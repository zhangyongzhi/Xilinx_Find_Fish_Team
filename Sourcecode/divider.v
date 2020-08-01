`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/19 15:48:57
// Design Name: 
// Module Name: test
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


module divider(
    input          clk,
    input          reset_n,
    input [3 : 0]  n,
    output         out
    );
    
    reg [3 : 0] count_n, count_p, count_n1;
    reg div_out_n, div_out_p, div_out_n1;
    
    wire div_n;
    
    assign div_n = n[0];
    
    always @(posedge clk, negedge reset_n) begin
        if(!reset_n) begin
            count_n <= 4'b0;
            div_out_n <= 1'b0;
            end
        else if(count_n == 4'b0) begin
            count_n <= count_n + 1'b1;
            div_out_n <= 0;
            end
        else if(count_n == n / 2 ) begin
            count_n <= count_n + 1'b1;
            div_out_n <= ~div_out_n;
            end
        else if(count_n == n - 1) begin
            count_n <= 0;
            div_out_n <= ~div_out_n;
            end            
        else
            count_n <= count_n + 1'b1;
    end
    
        always @(posedge clk, negedge reset_n) begin
        if(!reset_n) begin
            count_n1 <= 4'b0;
            div_out_n1 <= 1'b0;
            end
        else if(count_n == 4'b0) begin
            count_n1 <= count_n1 + 1'b1;
            div_out_n1 <= 0;
            end
        else if(count_n1 == n / 2 - 1) begin
            count_n1 <= count_n1 + 1'b1;
            div_out_n1 <= ~div_out_n1;
            end
        else if(count_n1 == n - 1) begin
            count_n1 <= 0;
            div_out_n1 <= ~div_out_n1;
            end            
        else
            count_n1 <= count_n1 + 1'b1;
    end
    
        always @(negedge clk, negedge reset_n) begin
        if(!reset_n) begin
            count_p <= 4'b0;
            div_out_p <= 1'b0;
            end
        else if(count_p == 4'b0) begin
            count_p <= count_p + 1'b1;
            div_out_p <= 0;
            end
        else if(count_p == n / 2 ) begin
            count_p <= count_p + 1'b1;
            div_out_p <= ~div_out_p;
            end
        else if(count_p == n - 1) begin
            count_p <= 0;
            div_out_p <= ~div_out_p;
            end            
        else
            count_p <= count_p + 1'b1;
    end
    
    assign out = div_n ? (div_out_n | div_out_p) : div_out_n1;
    
endmodule
