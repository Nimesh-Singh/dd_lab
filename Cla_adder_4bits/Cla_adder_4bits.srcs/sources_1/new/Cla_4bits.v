`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2023 12:50:28
// Design Name: 
// Module Name: Cla_4bits
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


module Cla_4bits(
input [3:0]a,b,
input cin,
output reg [3:0] sum,
output reg cout,pg,gg);

wire [3:0]a,b;
wire cin;
reg [4:0] g,p,c;
integer n;

always @(a or b or cin)
begin
c[0]=cin;
for (n=0;n<=3;n=n+1) 
begin
g[n] = a[n] & b[n];
p[n] = a[n] ^ b[n];
sum[n] = p[n] ^ c[n];
c[n+1] = g[n] | (p[n] & c[n]);
end

cout = c[4];
pg = p[3] & p[2] & p[1] & p[0]; // Group Propagate
gg = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]); // Group Generate
end

endmodule

