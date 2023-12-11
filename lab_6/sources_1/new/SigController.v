`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/13 15:22:43
// Design Name: 
// Module Name: SigController
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


module SigController(X, clock, clear, y2rdelay, r2gdelay, hwy, cntry);

input X, clock, clear;
input [2:0] y2rdelay, r2gdelay;

output [1:0] hwy, cntry;
reg [1:0] hwy, cntry;

reg [2:0] y2rcounter, r2gcounter;

initial
begin
    hwy = 0;
    cntry = 0;
    y2rcounter = 0;
    r2gcounter = 0;
end

parameter RED = 2'd0,
           YELLOW = 2'd1,
           GREEN = 2'd2;

parameter s0 = 3'd0,
           s1 = 3'd1,
           s2 = 3'd2,
           s3 = 3'd3,
           s4 = 3'd4;
           
reg [2:0] state, next_state;

always @ (posedge clock)
    if (clear)
        state <= s0;
    else
        state <= next_state;
        
always @ (state)
begin
    hwy = GREEN;
    cntry = RED;
    case(state)
        s0: ;
        s1: hwy = YELLOW;
        s2: hwy = RED;
        s3: begin
                hwy = RED;
                cntry = GREEN;
            end
        s4: begin
                hwy = RED;
                cntry = YELLOW;
            end
    endcase
end

always @ (state or X)
begin
    case (state)
        s0: if(X)
                next_state = s1;
            else
                next_state = s0;
        s1: begin
                while (y2rcounter < y2rdelay)
                     @ (posedge clock) y2rcounter = y2rcounter + 1;
                next_state = s2;
                @ (posedge clock) y2rcounter = y2rcounter + 1;
                y2rcounter = 0;
            end
        s2: begin
                while (r2gcounter < r2gdelay)
                     @ (posedge clock) r2gcounter = r2gcounter + 1;
                next_state = s3;
                @ (posedge clock) r2gcounter = r2gcounter + 1;
                r2gcounter = 0;
            end
        s3: if(X)
                next_state = s3;
            else
                next_state = s4;
        s4: begin
                while (y2rcounter < y2rdelay)
                     @ (posedge clock) y2rcounter = y2rcounter + 1;
                next_state = s0;
                @ (posedge clock) y2rcounter = y2rcounter + 1;
                y2rcounter = 0;
            end
        default: next_state = s0;
    endcase
end           

endmodule







