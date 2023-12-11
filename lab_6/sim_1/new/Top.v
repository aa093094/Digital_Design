`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/13 15:49:43
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

wire [1:0] MAIN_SIG, CNTRY_SIG;
reg [2:0] Y2RDELAY, R2GDELAY;
reg CAR_ON_CNTRY_RD;
reg CLOCK, CLEAR;

SigController SC(.hwy(MAIN_SIG), .cntry(CNTRY_SIG), .X(CAR_ON_CNTRY_RD), .clock(CLOCK), .clear(CLEAR), .y2rdelay(Y2RDELAY), .r2gdelay(R2GDELAY));

initial
    $monitor($time, " Main Sig = %b Country sig = %b Car_on_cntry = %b", MAIN_SIG, CNTRY_SIG, CAR_ON_CNTRY_RD);

initial
begin
    CLOCK = 1'b0;
    forever #5 CLOCK = ~CLOCK;
end

initial
begin
    CLEAR = 1'b1;
    #5 CLEAR = 1'b0;
end

initial
begin
    CAR_ON_CNTRY_RD = 1'b0;
    Y2RDELAY = 3;
    R2GDELAY = 2;
    
    repeat(20) @ (negedge CLOCK); CAR_ON_CNTRY_RD = 1'b1;
    repeat(10) @ (negedge CLOCK); CAR_ON_CNTRY_RD = 1'b0;
    
    repeat(20) @ (negedge CLOCK); CAR_ON_CNTRY_RD = 1'b1;
    repeat(10) @ (negedge CLOCK); CAR_ON_CNTRY_RD = 1'b0;
    
    repeat(20) @ (negedge CLOCK); CAR_ON_CNTRY_RD = 1'b1;
    repeat(10) @ (negedge CLOCK); CAR_ON_CNTRY_RD = 1'b0;
    
    repeat(10) @ (negedge CLOCK); $stop;
end
endmodule




