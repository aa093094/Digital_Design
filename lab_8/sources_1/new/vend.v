`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/27 15:01:02
// Design Name: 
// Module Name: vend
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


module vend(coin, clock, reset, newspaper);

input [1:0] coin;
input clock;
input reset;
output newspaper;
wire newspaper;

wire [1:0] NEXT_STATE;
reg [1:0] PRES_STATE;

parameter s0 = 2'b00,
          s5 = 2'b01,
          s10 = 2'b10,
          s15 = 2'b11;
assign {newspaper, NEXT_STATE} = fsm(coin, PRES_STATE);

always @ (posedge clock)
begin
    if (reset == 1'b1)
        PRES_STATE <= s0;
    else
        PRES_STATE <= NEXT_STATE;
end

function [2:0] fsm;
    input [1:0] fsm_coin;
    input [1:0] fsm_PRES_STATE;
    
    reg fsm_newspaper;
    reg [1:0] fsm_NEXT_STATE;
    
begin
    case (fsm_PRES_STATE)
    s0: begin
            if (fsm_coin == 2'b10)
            begin
                fsm_newspaper = 1'b0;
                fsm_NEXT_STATE = s10;
            end
            else if (fsm_coin == 2'b01)
            begin
                fsm_newspaper = 1'b0;
                fsm_NEXT_STATE = s5;
            end
            else
            begin
                fsm_newspaper = 1'b0;
                fsm_NEXT_STATE = s0;
            end
        end
    s5: begin
            if (fsm_coin == 2'b10)
            begin
                fsm_newspaper = 1'b0;
                fsm_NEXT_STATE = s15;
            end
            else if (fsm_coin == 2'b01)
            begin
                fsm_newspaper = 1'b0;
                fsm_NEXT_STATE = s10;
            end
            else
            begin
                fsm_newspaper = 1'b0;
                fsm_NEXT_STATE = s5;
            end
        end
    s10: begin
            if (fsm_coin == 2'b10)
            begin
                fsm_newspaper = 1'b0;
                fsm_NEXT_STATE = s15;
            end
            else if (fsm_coin == 2'b01)
            begin
                fsm_newspaper = 1'b0;
                fsm_NEXT_STATE = s15;
            end
            else
            begin
                fsm_newspaper = 1'b0;
                fsm_NEXT_STATE = s10;
            end
        end
    s15: begin
            fsm_newspaper = 1'b1;
            fsm_NEXT_STATE = s0;
        end
    endcase
    fsm = {fsm_newspaper, fsm_NEXT_STATE};
end 
endfunction

endmodule
