`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/25 16:11:54
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
wire a_lt_b, a_gt_b, a_eq_b;

MyComparatorGate comp(.A(a), .B(b), .A_lt_B(a_lt_b), .A_gt_B(a_gt_b), .A_eq_B(a_eq_b));

initial
begin
    $monitor($time, " A = %h, B = %h, A_lt_B = %b, A_gt_B = %b, A_eq_B = %b", a, b, a_lt_b, a_gt_b, a_eq_b);  
    a = 4'h0; b = 4'h1;
    #10 a = 4'hf; b = 4'h3;
    #10 a = 4'ha; b = 4'hb;
    #10 a = 4'h0; b = 4'h0;
    #10 a = 4'h7; b = 4'hd;
    #10 a = 4'h9; b = 4'h9;
    #10 $finish;
end

endmodule








