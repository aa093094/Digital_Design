`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/16 17:24:03
// Design Name: 
// Module Name: BCDtoDecimalBeh
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


module BCDtoDecimalBeh(BCDIn, CLK, nRST, DECOut);

input [3:0] BCDIn;
input CLK, nRST;

output [9:0] DECOut;
reg [9:0] DECOut;

always @ (negedge CLK)
begin
    if(nRST == 0)
    begin
        DECOut = 10'b0000000000;
    end
end

always @ (posedge CLK)
begin
    if(nRST == 1)
    begin
    if(BCDIn >= 10)
        DECOut = 10'b0000000000;
    else if(BCDIn == 9)
        DECOut = 10'b1000000000;
    else if(BCDIn == 8)
        DECOut = 10'b0100000000;
    else if(BCDIn == 7)
        DECOut = 10'b0010000000;
    else if(BCDIn == 6)
        DECOut = 10'b0001000000;
    else if(BCDIn == 5)
        DECOut = 10'b0000100000;
    else if(BCDIn == 4)
        DECOut = 10'b0000010000;
    else if(BCDIn == 3)
        DECOut = 10'b0000001000;
    else if(BCDIn == 2)
        DECOut = 10'b0000000100;
    else if(BCDIn == 1)
        DECOut = 10'b0000000010;
    else
        DECOut = 10'b0000000001;
    end
end
endmodule





