`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/20 15:07:24
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

reg clk, nrst, x_in;
wire y_out;

fsmac FS(.CLK(clk), .nRST(nrst), .X_IN(x_in), .Y_OUT(y_out));

initial
    $monitor($time, " X_IN = %b Y_OUT = %b", x_in, y_out);
    
initial
begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

initial
begin
    nrst = 1'b0;
    repeat(2) @ (negedge clk);
    nrst = 1'b1;
end

initial
begin
    x_in = 0;
    #40 x_in = 1;
    #80 x_in = 0;
    #40 x_in = 1;
    #20 x_in = 0;
    #100 $finish;
end    
   
endmodule




