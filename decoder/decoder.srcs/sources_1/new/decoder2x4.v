`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2023 14:39:51
// Design Name: 
// Module Name: decoder2x4
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


module decoder2x4(
    input [1:0]x,
    output [3:0]y
    );
    
    assign y[0]= (~x[1]&~x[0]);
    assign y[1]= (~x[1]&x[0]);
    assign y[2]= (x[1]&~x[0]);
    assign y[3]= (x[1]&x[0]);
    
    
endmodule
