`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/25 17:05:59
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

reg [3:0] bcdin;
wire [9:0] decout;

BCDtoDecimal BtoD(.BCDIn(bcdin), .DECOut(decout));

initial
begin
    $monitor($time, " BCDIn = %d --> DECOut = %b", bcdin, decout);
    bcdin = 4'b0000;
    #10 bcdin = 4'b0001;
    #10 bcdin = 4'b0010;
    #10 bcdin = 4'b0011;
    #10 bcdin = 4'b0100;
    #10 bcdin = 4'b0101;
    #10 bcdin = 4'b0110;
    #10 bcdin = 4'b0111;
    #10 bcdin = 4'b1000;
    #10 bcdin = 4'b1001;
    #10 bcdin = 4'b1010;
    #10 bcdin = 4'b1011;
    #10 bcdin = 4'b1100;
    #10 bcdin = 4'b1101;
    #10 bcdin = 4'b1110;
    #10 bcdin = 4'b1111;
    #10 bcdin = 4'b0000; 
    #10 $finish;
end    

endmodule





