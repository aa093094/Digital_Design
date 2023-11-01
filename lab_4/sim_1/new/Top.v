`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/30 15:03:43
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

reg [3:0] BCDIN;
wire A, B, C, D, E, F, G;

BCDtoSevenSeg BtoSS(.BCDIn(BCDIN), .a(A), .b(B), .c(C), .d(D), .e(E), .f(F), .g(G));

initial
begin
    $monitor($time, " BCDIn = %d --> a=%b, b=%b, c=%b, d=%b, e=%b, f=%b, g=%b", BCDIN, A, B, C, D, E, F, G);
    BCDIN = 0;
    #10 BCDIN = 1;
    #10 BCDIN = 2;
    #10 BCDIN = 3;
    #10 BCDIN = 4;
    #10 BCDIN = 5;
    #10 BCDIN = 6;
    #10 BCDIN = 7;
    #10 BCDIN = 8;
    #10 BCDIN = 9;
    #10 BCDIN = 10;
    #10 BCDIN = 11;
    #10 BCDIN = 12;
    #10 BCDIN = 13;
    #10 BCDIN = 14;
    #10 BCDIN = 15;
    #10 $finish;
end

endmodule
