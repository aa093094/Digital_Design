`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/25 15:47:41
// Design Name: 
// Module Name: MyComparatorGate
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


module MyComparatorGate(A, B, A_lt_B, A_gt_B, A_eq_B);

input [3:0] A, B;
output A_lt_B, A_gt_B, A_eq_B;

wire A0bar, A1bar, A2bar, A3bar;
wire B0bar, B1bar, B2bar, B3bar;
wire sa1, sa2, sa3, sa4, sa5, sa6, sa7, sa8;
wire sx1, sx2, sx3, sx4;
wire sa9, sa10, sa11, sa12, sa13, sa14;

not (A0bar, A[0]);
not (A1bar, A[1]);
not (A2bar, A[2]);
not (A3bar, A[3]);
not (B0bar, B[0]);
not (B1bar, B[1]);
not (B2bar, B[2]);
not (B3bar, B[3]);

and a1(sa1, A[0], B0bar);
and a2(sa2, A0bar, B[0]);
and a3(sa3, A[1], B1bar);
and a4(sa4, A1bar, B[1]);
and a5(sa5, A[2], B2bar);
and a6(sa6, A2bar, B[2]);
and a7(sa7, A[3], B3bar);
and a8(sa8, A3bar, B[3]);

nor x1(sx1, sa1, sa2);
nor x2(sx2, sa3, sa4);
nor x3(sx3, sa5, sa6);
nor x4(sx4, sa7, sa8);

and eq(A_eq_B, sx1, sx2, sx3, sx4);

and a9(sa9, sa1, sx2, sx3, sx4);
and a10(sa10, sa2, sx2, sx3, sx4);
and a11(sa11, sa3, sx3, sx4);
and a12(sa12, sa4, sx3, sx4);
and a13(sa13, sa5, sx4);
and a14(sa14, sa6, sx4);

or lt(A_lt_B, sa10, sa12, sa14, sa8);
or gt(A_gt_B, sa9, sa11, sa13, sa7);

endmodule









