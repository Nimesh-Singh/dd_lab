`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2023 15:49:58
// Design Name: 
// Module Name: Mux16to1_tb
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


module Mux16to1_tb;
wire c;
reg[15:0]a;
reg[3:0]select;
integer i;
Mux16to1 dut(c,a,select);
initial begin
a=234;
for(i=0;i<15;i=i+1)
    begin
    select=i; #2;
    end
  
a=3127;
  for(i=0;i<15;i=i+1)
      begin
      select=i; #2;
      end
    $finish;  
end 
endmodule
