`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2023 15:38:13
// Design Name: 
// Module Name: Mux16to1
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


module Mux16to1(
output c,input [15:0]a,input [3:0]select);
wire [3:0] ta;

Mux4to1 Mux1(ta[0],a[3:0],select[1:0]);
Mux4to1 Mux2(ta[1],a[7:4],select[1:0]);
Mux4to1 Mux3(ta[2],a[11:8],select[1:0]);
Mux4to1 Mux4(ta[3],a[15:12],select[1:0]);
Mux4to1 Mux5(c,ta,select[3:2]);

endmodule

module Mux4to1(
output c,input [3:0] a, input [1:0]select);

wire x1,x2,x3,x4;
wire s0n,s1n;
not n1(s0n,select[0]);
not n2(s1n,select[1]);

and a1(x1,a[0],s1n,s0n);
and a2(x2,a[1],s1n,select[0]);
and a3(x3,a[2],select[1],s0n);
and a4(x4,a[3],select[1],select[0]);

or or1(c,x1,x2,x3,x4);

endmodule