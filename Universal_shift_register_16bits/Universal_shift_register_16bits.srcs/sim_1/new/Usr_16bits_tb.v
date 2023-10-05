`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2023 09:05:13
// Design Name: 
// Module Name: Usr_16bits_tb
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

module Usr_16bits_tb;

reg [15:0]parin;
reg clr;
reg clk;
reg [1:0]sel;
wire [15:0]out;

Usr_16bits uut(.parin(parin),.clr(clr),.clk(clk),.select(sel),.out(out));

initial  begin 
clk=0;
repeat(100)
#20 clk=~clk;
end

initial  begin
parin=16'b1110101010000111;
sel=2'b01;
clr=1'b0;
#40;

parin=16'b1001010101011011;
sel=2'b10;
clr=1'b0;
#40;

parin=16'b0000101010110101;
sel=2'b11;
clr=1'b0;
#40;
$finish;
end
endmodule
