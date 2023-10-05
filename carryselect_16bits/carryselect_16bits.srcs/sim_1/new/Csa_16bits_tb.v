`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.09.2023 23:39:10
// Design Name: 
// Module Name: Csa_16bits_tb
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

module Csa_16bits_tb;
 reg [15:0] a,b;
 reg Cin;
 wire [15:0] sum;
 wire Cout;
 
 Csa_16bits dut(a,b,Cin,sum,Cout);
 initial begin
 Cin=1'b0; a=16'b0011110100110110; b=16'b10001100010011; #10
 a=16'b1001101010110010; b=16'b0011110001101010;
 #10
 Cin=1'b1; a=16'b1101010101110011; b=16'b1100101110001; #10
 a=16'b1111110000001111; b=16'b1000001111001110;
 #10 
 $finish;
 
 end
 endmodule 

