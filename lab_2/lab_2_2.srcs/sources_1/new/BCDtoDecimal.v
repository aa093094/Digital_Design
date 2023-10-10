`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/25 16:55:34
// Design Name: 
// Module Name: BCDtoDecimal
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


module BCDtoDecimal(BCDIn, DECOut);

input [3:0] BCDIn;
output [9:0] DECOut;

assign DECOut = (BCDIn >= 4'b1010) ? 10'b11_1111_1111 : 
((BCDIn == 4'b1001) ? 10'b10_0000_0000 : 
((BCDIn == 4'b1000) ? 10'b01_0000_0000 : 
((BCDIn == 4'b0111) ? 10'b00_1000_0000 : 
((BCDIn == 4'b0110) ? 10'b00_0100_0000 : 
((BCDIn == 4'b0101) ? 10'b00_0010_0000 : 
((BCDIn == 4'b0100) ? 10'b00_0001_0000 : 
((BCDIn == 4'b0011) ? 10'b00_0000_1000 : 
((BCDIn == 4'b0010) ? 10'b00_0000_0100 : 
((BCDIn == 4'b0001) ? 10'b00_0000_0010 : 
10'b00_0000_0001)))))))));

endmodule





