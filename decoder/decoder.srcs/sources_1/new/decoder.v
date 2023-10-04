`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2023 12:52:20
// Design Name: 
// Module Name: decoder
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


module decoder(
    input x,
    input y,
    input en,
    output a0,
    output a1,
    output a2,
    output a3
    );
    
    assign a0= (en&(~y)&(~x));
    assign a1= (en&(~y)&x);
    assign a2= (en&y&(~x));
    assign a3= (en&y&x);
    
    
endmodule
