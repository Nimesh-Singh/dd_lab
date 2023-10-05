`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2023 10:05:10
// Design Name: 
// Module Name: alu_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// Revision:// 

// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu_tb;
reg [3:0]a,b,select;
wire cout;
wire [3:0]c;
integer i;
alu dut(a,b,select,c,cout);
initial 
 begin
 a=0;b=0;select=0; #100
 
 a=11;b=9;

 for (i=0;i<15;i=i+1)
  begin:count
  select=i; 
  #10;
  if (i>15)
      disable count;
  end
  
 $finish();
 end
endmodule
