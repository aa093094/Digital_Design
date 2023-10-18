`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/16 15:54:50
// Design Name: 
// Module Name: MyComparatorBeh
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


module MyComparatorBeh(A, B, nRST, CLK, A_lt_B, A_gt_B, A_eq_B);

input [3:0] A, B;
input nRST, CLK;

output A_lt_B, A_gt_B, A_eq_B;

reg A_lt_B, A_gt_B, A_eq_B;

initial
begin
    A_lt_B = 0;
    A_gt_B = 0;
    A_eq_B = 0;
end

always @ (negedge CLK)
begin
    if(nRST == 0)
    begin
        A_lt_B <= 0;
        A_gt_B <= 0;
        A_eq_B <= 0;
    end
end    

always @ (posedge CLK)
begin
        if(nRST == 1)
        begin
            if(A>B)
            begin
                A_lt_B <= 0;
                A_gt_B <= 1;
                A_eq_B <= 0;
            end
            else if(A==B)
            begin
                A_lt_B <= 0;
                A_gt_B <= 0;
                A_eq_B <= 1;
            end
            else
            begin
                A_lt_B <= 1;
                A_gt_B <= 0;
                A_eq_B <= 0;
            end
        end
end        
endmodule













