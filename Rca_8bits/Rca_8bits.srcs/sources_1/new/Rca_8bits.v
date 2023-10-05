`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2023 13:23:26
// Design Name: 
// Module Name: Rca_8bits
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




module Rca_8bits
(
	input [7:0] a,
	input [7:0] b,
	input  cin,

	output reg[7:0] sum,
	output reg[7:0] cout
);
    wire [7:0] a,b;
	integer i;
	
 always @(a or b or cin)
 begin
  sum[0] = a[0] ^ b[0] ^ cin;
  cout[0] = (a[0] & b[0]) | (cin & (a[0] ^ b[0]));
	
	for(i=1; i<8; i=i+1) 
	begin                                                 
		 sum[i] = a[i] ^ b[i] ^ cout[i-1];                               
		 cout[i] = (a[i] & b[i]) | (cout[i-1] & (a[i] ^ b[i]));
	end
end
endmodule
