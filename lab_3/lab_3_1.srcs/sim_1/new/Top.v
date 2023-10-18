`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/16 16:18:06
// Design Name: 
// Module Name: Top
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


module Top;

reg [3:0] a, b;
reg nrst, clk;

wire a_lt_b, a_gt_b, a_eq_b;

MyComparatorBeh compB(.CLK(clk), .A(a), .B(b), .nRST(nrst), .A_lt_B(a_lt_b), .A_gt_B(a_gt_b), .A_eq_B(a_eq_b));

always
begin
    #5 clk = ~clk;
end

initial
begin
    $monitor($time, " A = %h, B = %h, A_lt_B = %b, A_gt_B = %b, A_eq_B = %b", a, b, a_lt_b, a_gt_b, a_eq_b);
    a = 4'h0; b = 4'h1; nrst = 1'b0; clk = 1'b0;
    #10 a = 4'hf; nrst = 1'b1; b = 4'h3;
    #10 a = 4'ha; b = 4'hb;
    #10 a = 4'h0; b = 4'h0;
    #10 a = 4'h7; b = 4'hd;
    #10 a = 4'h9; b = 4'h9;
    #10 $finish;
end
endmodule







