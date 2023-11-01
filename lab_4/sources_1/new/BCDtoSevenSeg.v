`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/30 14:43:09
// Design Name: 
// Module Name: BCDtoSevenSeg
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


module BCDtoSevenSeg(BCDIn, a, b, c, d, e, f, g);

input [3:0] BCDIn;
output a, b, c, d, e, f, g;

reg a, b, c, d, e, f, g;

always @ (BCDIn)
begin
    init_zero(a, b, c, d, e, f, g);
    case (BCDIn)
        4'd0 : begin a = 1; b = 1; c = 1; d = 1; e = 1; f = 1; end
        4'd1 : begin b = 1; c = 1; end
        4'd2 : begin a = 1; b = 1; d = 1; e = 1; g = 1; end
        4'd3 : begin a = 1; b = 1; c = 1; d = 1; g = 1; end
        4'd4 : begin b = 1; c = 1; f = 1; g = 1; end
        4'd5 : begin a = 1; c = 1; d = 1; f = 1; g = 1; end
        4'd6 : begin a = 1; c = 1; d = 1; e = 1; f = 1; g = 1; end
        4'd7 : begin a = 1; b = 1; c = 1; end
        4'd8 : begin a = 1; b = 1; c = 1; d = 1; e = 1; f = 1; g = 1; end
        4'd9 : begin a = 1; b = 1; c = 1; d = 1; f = 1; g = 1; end
    endcase
end        

task init_zero;
output a, b, c, d, e, f, g;
begin
    a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0;
end
endtask

endmodule














