`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2023 22:34:35
// Design Name: 
// Module Name: ripplecarry
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


module ripplecarry(input [7:0]a,[7:0]b,
input cin,
output [7:0]sum,
output cout);

///always @(a or b or cin)
//{cout,sum}=a+b+cin;



wire [6:0]c;
fulladder f0(a[0],b[0],cin,sum[0],c[0]);
fulladder f1(a[1],b[1],c[0],sum[1],c[1]);
fulladder f2(a[2],b[2],c[1],sum[2],c[2]);
fulladder f3(a[3],b[3],c[2],sum[3],c[3]);
fulladder f4(a[4],b[4],c[3],sum[4],c[4]);
fulladder f5(a[5],b[5],c[4],sum[5],c[5]);
fulladder f6(a[6],b[6],c[5],sum[6],c[6]);
fulladder f7(a[7],b[7],c[6],sum[7],cout);
endmodule

module fulladder(input a,b,cin,output sum,cout);
assign {cout,sum}=a+b+cin;
endmodule

