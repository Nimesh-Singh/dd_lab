`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2023 00:19:35
// Design Name: 
// Module Name: Audc_4bits
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

module Audc_4bits (clk, rst, UpDown, count);
input clk, rst;
input  UpDown ; // UpDwn = 1 for Up counter and 0 for Down Counter
output [3:0] count;
reg [3:0] count = 0; // initially counter set to 0
 
always @ (posedge clk )
begin
if (rst)
count <= 0;
end

always @( posedge clk )
begin
if (UpDown == 1 && count >= 0  && count <= 15)
count = count + 1;
else if ( UpDown == 0 && count >= 0 && count <=15) 
count = count - 1;
end
endmodule
