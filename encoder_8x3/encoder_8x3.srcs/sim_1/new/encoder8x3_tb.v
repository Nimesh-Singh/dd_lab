`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.09.2023 00:04:32
// Design Name: 
// Module Name: encoder8x3_tb
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


module encoder8x3_tb;
  reg [7:0]x;
  wire [2:0]y;

  // instantiate the model: creating
  // instance for block diagram
  encoder_8x3 encode(x,y);
  initial begin
      x=1; #5
      x=2; #5
      x=4; #5
      x=8; #5
      x=16; #5
      x=32; #5
      x=64; #5
      x=128; #5
                                       
      $finish;
    end
endmodule

