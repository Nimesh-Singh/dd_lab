`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2023 23:47:46
// Design Name: 
// Module Name: Comparator_8bits_tb
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


module Comparator_8bits_tb;
reg [7:0]a;
reg [7:0]b;
wire lt,eq,gt;

Comparator_8bits dut(a,b,lt,eq,gt);
initial begin

a=25;   b=192; #2
a=115;  b=51; #2
a=34;   b=39; #2
a=254;   b=254; #2
a=8'b11111100;   b=8'b11111011; #2;
$finish;

end
endmodule
