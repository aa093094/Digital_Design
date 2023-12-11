`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/20 14:54:08
// Design Name: 
// Module Name: fsmac
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

`define ONETOONE    2
`define ONETOZERO   1

module fsmac(CLK, nRST, X_IN, Y_OUT);

input CLK, nRST, X_IN;
output Y_OUT;
reg Y_OUT;

parameter s0 = 2'd0,
           s1 = 2'd1,
           s2 = 2'd2,
           s3 = 2'd3;
           
reg [1:0] state;
reg [1:0] next_state;

initial
    Y_OUT = 1'b0;

always @ (posedge CLK)
    if (!nRST)
        state <= s0;
    else
        state <= next_state;
        
always @ (state)
begin
    case(state)
        s0 : Y_OUT = 1'b0;
        s1 : Y_OUT = 1'b1;
        s2 : Y_OUT = 1'b0;
        s3 : Y_OUT = 1'b0;
    endcase
end

always @ (state or X_IN)
begin
    case (state)
        s0: if(X_IN)
                next_state = s1;
        s1: begin
                repeat(`ONETOONE) @ (posedge CLK);
                next_state = s2;
            end
        s2: next_state = s3;
        s3: if(X_IN)
                next_state = s1;
            else
                next_state = s0;
        default: next_state = s0;
    endcase
end

always @ (CLK)
    if(state == s2)
        next_state <= s3;

endmodule









