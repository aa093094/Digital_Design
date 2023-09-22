`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/18 16:00:32
// Design Name: 
// Module Name: D_latch
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


module D_latch(D, En, Q, Qbar);

output Q, Qbar;
input D, En;
wire S, R, Dbar;
not n5(Dbar, D);

nand n3(S, En, D);
nand n4(R, En, Dbar);

SR_latch m1(Q, Qbar, S, R);

endmodule










