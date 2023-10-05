`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2023 09:01:56
// Design Name: 
// Module Name: Usr_16bits
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

module Usr_16bits(clr,clk,select,parin,out);
input clr,clk;
input [1:0]select;
input [15:0]parin;
output reg[15:0]out;

always @(posedge clk)
begin

if(clr)
out=0;

else
begin
case(select)
2'b00: out=out;
2'b01: out={parin[0],parin[15:1]};
2'b10: out={parin[14:0],parin[15]};
2'b11: out=parin;
endcase
end

end
endmodule
