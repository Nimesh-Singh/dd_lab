`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2023 23:35:25
// Design Name: 
// Module Name: Sync_Counter_tb
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

module Sync_Counter_tb;
  reg t;
  reg clock, reset;
  wire [7:0] q,qb;
 
 Sync_counter dut(t,clock,reset,q,qb);
    
  initial begin
    clock = 0; reset = 0; 
    t= 1;
    #4; reset = 1;
    #80;
    reset = 0;
    #4; reset = 1; t= 0;
    #50;
    $finish;
  end
  
  always #2 clock = ~clock;
  
  endmodule