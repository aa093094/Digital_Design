`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/06 14:54:22
// Design Name: 
// Module Name: Seqdetector
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


module Seqdetector(CLK, nRST, X, Y);

input CLK, nRST, X;
output Y;
reg Y;

parameter s0 = 2'd0,
           s1 = 2'd1,
           s2 = 2'd2,
           s3 = 2'd3;
           
reg [1:0] state;
reg [1:0] next_state;

initial
begin
    state <= s0;
    next_state <= s0;
end

always @ (negedge nRST)
    state <= s0;

always @ (posedge CLK)
    state <= next_state;

always @ (state)
begin
    if(state == s3)
        Y = 1;
    else
        Y = 0;
end

always @ (state or X)
begin
    case (state)
        s0: if(X)
                next_state = s1;
            else
                next_state = s0;
        s1: if(X)
                next_state = s2;
            else
                next_state = s0;
        s2: if(X)
                next_state = s3;
            else
                next_state = s0;
        s3: if(X)
                next_state = s3;
            else
                next_state = s0;
        default: next_state = s0;
    endcase
end

endmodule












