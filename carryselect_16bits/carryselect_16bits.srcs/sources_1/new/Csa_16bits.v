`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.09.2023 23:23:33
// Design Name: 
// Module Name: Csa_16bits
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

module Csa_16bits(input [15:0] a,b,input Cin,output [15:0]sum,output Cout);
wire [15:0]sum;
wire Cout;
wire [15:0] s0,s1,c0,c1;
//assuming carry in 0
fulladder fa1(a[0],b[0],0,s0[0],c0[0]);
fulladder fa2(a[1],b[1],c0[0],s0[1],c0[1]);
fulladder fa3(a[2],b[2],c0[1],s0[2],c0[2]);
fulladder fa4(a[3],b[3],c0[2],s0[3],c0[3]);
fulladder fa5(a[4],b[4],c0[3],s0[4],c0[4]);
fulladder fa6(a[5],b[5],c0[4],s0[5],c0[5]);
fulladder fa7(a[6],b[6],c0[5],s0[6],c0[6]);
fulladder fa8(a[7],b[7],c0[6],s0[7],c0[7]);
fulladder fa9(a[8],b[8],c0[7],s0[8],c0[8]);
fulladder fa10(a[9],b[9],c0[8],s0[9],c0[9]);
fulladder fa11(a[10],b[10],c0[9],s0[10],c0[10]);
fulladder fa12(a[11],b[11],c0[10],s0[11],c0[11]);
fulladder fa13(a[12],b[12],c0[11],s0[12],c0[12]);
fulladder fa14(a[13],b[13],c0[12],s0[13],c0[13]);
fulladder fa15(a[14],b[14],c0[13],s0[14],c0[14]);
fulladder fa16(a[15],b[15],c0[14],s0[15],c0[15]);

//assuming carry in 1
fulladder faa1(a[0],b[0],1,s1[0],c1[0]);
fulladder faa2(a[1],b[1],c1[0],s1[1],c1[1]);
fulladder faa3(a[2],b[2],c1[1],s1[2],c1[2]);
fulladder faa4(a[3],b[3],c1[2],s1[3],c1[3]);
fulladder faa5(a[4],b[4],c1[3],s1[4],c1[4]);
fulladder faa6(a[5],b[5],c1[4],s1[5],c1[5]);
fulladder faa7(a[6],b[6],c1[5],s1[6],c1[6]);
fulladder faa8(a[7],b[7],c1[6],s1[7],c1[7]);
fulladder faa9(a[8],b[8],c1[7],s1[8],c1[8]);
fulladder faa10(a[9],b[9],c1[8],s1[9],c1[9]);
fulladder faa11(a[10],b[10],c1[9],s1[10],c1[10]);
fulladder faa12(a[11],b[11],c1[10],s1[11],c1[11]);
fulladder faa13(a[12],b[12],c1[11],s1[12],c1[12]);
fulladder faa14(a[13],b[13],c1[12],s1[13],c1[13]);
fulladder faa15(a[14],b[14],c1[13],s1[14],c1[14]);
fulladder faa16(a[15],b[15],c1[14],s1[15],c1[15]);

//select either carry 1 or 0 using carry out of FA
//mux for sum select
mux m0(s0[0],s1[0],Cin,sum[0]);
mux m1(s0[1],s1[1],Cin,sum[1]);
mux m2(s0[2],s1[2],Cin,sum[2]);
mux m3(s0[3],s1[3],Cin,sum[3]);
mux m4(s0[4],s1[4],Cin,sum[4]);
mux m5(s0[5],s1[5],Cin,sum[5]);
mux m6(s0[6],s1[6],Cin,sum[6]);
mux m7(s0[7],s1[7],Cin,sum[7]);
mux m8(s0[8],s1[8],Cin,sum[8]);
mux m9(s0[9],s1[9],Cin,sum[9]);
mux m10(s0[10],s1[10],Cin,sum[10]);
mux m11(s0[11],s1[11],Cin,sum[11]);
mux m12(s0[12],s1[12],Cin,sum[12]);
mux m13(s0[13],s1[13],Cin,sum[13]);
mux m14(s0[14],s1[14],Cin,sum[14]);
mux m15(s0[15],s1[15],Cin,sum[15]);


//mux for carry select
mux m16(c0[15],c1[15],Cin,Cout);
endmodule


module fulladder (input a, b, c, output sum, carry);
wire d,e,f;
xor(sum,a,b,c);
and(d,a,b);
and(e,b,c);
and(f,a,c);
or(carry,d,e,f);
endmodule


module mux(
input a,b,s,
output q);
wire q;
assign q=s?b:a;
endmodule