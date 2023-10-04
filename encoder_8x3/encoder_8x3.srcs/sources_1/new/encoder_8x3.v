`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2023 23:16:07
// Design Name: 
// Module Name: encoder_8x3
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


module encoder_8x3(
    input [7:0]x,
    output [2:0]y);
  
    assign y[0]=(x[1]|x[3]|x[5]|x[7]);
    assign y[1]=(x[2]|x[3]|x[6]|x[7]);
    assign y[2]=(x[4]|x[5]|x[6]|x[7]);
    
endmodule
