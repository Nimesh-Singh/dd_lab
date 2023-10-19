`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.10.2023 23:40:36
// Design Name: 
// Module Name: booth_multiplier_tb
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



module booth_multiplier_tb;
  wire [31:0] Y;
  reg [15:0] A, B;
  
  booth_multiplier dut(.Z(Y),.X(A),.Y(B));
  
  initial begin
     
    A = 2; B = 2; #10;                   
    A = 3; B = 4; #10;  
    A = 5; B = -4; #10;
    A = 0; B = 0; #10; 
    A = 15; B = 15; #10;
    A = 215; B = 434; #10;
    A = 77; B = 120; #10; 
    A = -1341; B = 687; #10;
    $finish;
  end
endmodule 