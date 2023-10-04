`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.10.2023 19:11:14
// Design Name: 
// Module Name: Kga_tb
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


module Kga_tb;
reg [3:0]a,b;
reg cin;
wire [3:0] s;
wire cout;

Kga dut(.a(a),.b(b),.cin(cin),.sum(s),.carryout(cout));

initial begin 
a=0000;
b=0001;
cin=0;
#5
$finish;
end
endmodule
