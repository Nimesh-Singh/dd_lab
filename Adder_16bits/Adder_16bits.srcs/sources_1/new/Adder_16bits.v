`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.10.2023 15:11:46
// Design Name: 
// Module Name: Adder_16bits
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



module Adder_16bits(
 input [15:0] a,b,
 input Cin,
 output [15:0] sum,
 output Cout );
 wire w1;
 Rca_8bits R1(a[7:0],b[7:0],Cin,sum[7:0],w1);
 kogge_stone K1(a[15:8],b[15:8],sum[15:8],w1,Cout);
endmodule


module Rca_8bits(
 input [7:0] a,b,
 input Cin,
 output [7:0] sum,
 output Cout );
 wire w1,w2,w3,w4,w5,w6,w7;
 fulladder F1(a[0],b[0],Cin,sum[0],w1);
 fulladder F2(a[1],b[1],w1,sum[1],w2);
 fulladder F3(a[2],b[2],w2,sum[2],w3);
 fulladder F4(a[3],b[3],w3,sum[3],w4);
 fulladder F5(a[4],b[4],w4,sum[4],w5);
 fulladder F6(a[5],b[5],w5,sum[5],w6);
 fulladder F7(a[6],b[6],w6,sum[6],w7);
 fulladder F8(a[7],b[7],w7,sum[7],Cout);
endmodule

module fulladder(a,b,c_in,sum,c_out);
 input a,b,c_in;
 output sum,c_out;
 wire w1,w2,w3;
 xor(w1,a,b);
 and(w2,a,b);
 xor(sum,w1,c_in);
 and(w3,w1,c_in);
 or(c_out,w3,w2);
endmodule 

module kogge_stone (x, y, sum, cin, cout);
 input [7:0] x, y; output [7:0] sum;
 input cin; output cout;
 wire [7:0] G_Z, P_Z, G_A, P_A,G_B, P_B,G_C, P_C;
 
//level 1
GC level_0A(cin, P_Z[0], G_Z[0], G_A[0]);
BC level_1A(G_Z[0], P_Z[1], G_Z[1], P_Z[0], G_A[1], P_A[1]);
BC level_2A(G_Z[1], P_Z[2], G_Z[2], P_Z[1], G_A[2], P_A[2]);
BC level_3A(G_Z[2], P_Z[3], G_Z[3], P_Z[2], G_A[3], P_A[3]);
BC level_4A(G_Z[3], P_Z[4], G_Z[4], P_Z[3], G_A[4], P_A[4]);
BC level_5A(G_Z[4], P_Z[5], G_Z[5], P_Z[4], G_A[5], P_A[5]);
BC level_6A(G_Z[5], P_Z[6], G_Z[6], P_Z[5], G_A[6], P_A[6]);
BC level_7A(G_Z[6], P_Z[7], G_Z[7], P_Z[6], G_A[7], P_A[7]);
 
 //level 2
GC level_1B(cin, P_A[1], G_A[1], G_B[1]);
GC level_2B(G_A[0], P_A[2], G_A[2], G_B[2]);
BC level_3B(G_A[1], P_A[3], G_A[3], P_A[1], G_B[3], P_B[3]);
BC level_4B(G_A[2], P_A[4], G_A[4], P_A[2], G_B[4], P_B[4]);
BC level_5B(G_A[3], P_A[5], G_A[5], P_A[3], G_B[5], P_B[5]);
BC level_6B(G_A[4], P_A[6], G_A[6], P_A[4], G_B[6], P_B[6]);
BC level_7B(G_A[5], P_A[7], G_A[7], P_A[5], G_B[7], P_B[7]); 

//level 3
GC level_3C(cin, P_B[3], G_B[3], G_C[3]);
GC level_4C(G_A[0], P_B[4], G_B[4], G_C[4]);
GC level_5C(G_B[1], P_B[5], G_B[5], G_C[5]);
GC level_6C(G_B[2], P_B[6], G_B[6], G_C[6]);
BC level_7C(G_B[3], P_B[7], G_B[7], P_B[3], G_C[7], P_C[7]);
GC level_7D(cin, P_C[7], G_C[7], cout);
 
 //xor with and
and_xor level_Z0(x[0], y[0], P_Z[0], G_Z[0]);
and_xor level_Z1(x[1], y[1], P_Z[1], G_Z[1]);
and_xor level_Z2(x[2], y[2], P_Z[2], G_Z[2]);
and_xor level_Z3(x[3], y[3], P_Z[3], G_Z[3]);
and_xor level_Z4(x[4], y[4], P_Z[4], G_Z[4]);
and_xor level_Z5(x[5], y[5], P_Z[5], G_Z[5]);
and_xor level_Z6(x[6], y[6], P_Z[6], G_Z[6]);
and_xor level_Z7(x[7], y[7], P_Z[7], G_Z[7]);

//outputs
 xor(sum[0], cin, P_Z[0]);
 xor(sum[1], G_A[0], P_Z[1]);
 xor(sum[2], G_B[1], P_Z[2]);
 xor(sum[3], G_B[2], P_Z[3]);
 xor(sum[4], G_C[3], P_Z[4]);
 xor(sum[5], G_C[4], P_Z[5]);
 xor(sum[6], G_C[5], P_Z[6]);
 xor(sum[7], G_C[6], P_Z[7]);
 endmodule
 
 
//Verilog code for grey cell :
module GC(Gkj, Pik, Gik, G);
 input Gkj, Pik, Gik;
 output G;
 wire Y;
 and(Y, Gkj, Pik);
 or(G, Y, Gik);
 endmodule
 
//Verilog code for black cell :
module BC(Gkj, Pik, Gik, Pkj, G, P);
 input Gkj, Pik, Gik, Pkj;
 output G, P;
 wire Y;
 and(Y, Gkj, Pik);
 or(G, Gik, Y);
 and(P, Pkj, Pik);
endmodule

//Verilog code for XOR block:
module and_xor(a, b, p, g);
 input a, b;
 output p, g;
 xor(p, a, b);
 and(g, a, b);
endmodule 


