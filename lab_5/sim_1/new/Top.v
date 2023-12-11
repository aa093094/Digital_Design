`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/06 15:14:20
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

wire y;
reg clk, nrst, x;

Seqdetector SD(.CLK(clk), .nRST(nrst), .X(x), .Y(y));

initial
begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

initial
begin
    nrst = 1'b0;
    #20 nrst = 1'b1;
end

initial
begin
    $monitor($time, " X = %b, Y = %b", x, y);
    x = 0;
    #40 x = 1;
    #10 x = 0;
    #10 x = 1;
    #40 x = 0;
    #20 x = 1;
    #60 x = 0;
    #10 $finish;
end

endmodule















