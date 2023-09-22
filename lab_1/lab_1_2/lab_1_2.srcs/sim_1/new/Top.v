`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/18 16:16:15
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

wire q, qbar;
reg d, en;

D_latch m1(.D(d), .En(en), .Q(q), .Qbar(qbar));

initial
begin
    $monitor($time, " D = %b, En = %b, Q = %b, Qbar = %b", d, en, q, qbar);
    d = 1'b0; en = 1'b0;
    #5 d = 1'b1;
    #5 d = 1'b0;
    #2 en = 1'b1;
    #3 d = 1'b1;
    #5 d = 1'b0;
    #5 d = 1'b1;
    #2 en = 1'b0;
    #3 d = 1'b0;
    #5 $finish;
 end

endmodule




