`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2023 09:59:10
// Design Name: 
// Module Name: alu
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


module alu(
input [3:0]a,b,select,
output [3:0]c,
output cout
    );
    reg [4:0] result;
    assign {cout,c}=result;
    always @(*)
    begin 
    case (select)
    
    4'b0000:
    result=a+b;
    4'b0001:
    result=a-b;
    4'b0010:
    result=a*b;
    4'b0011:
    result=a/b;
    4'b0100:
    result=a|b;
    4'b0101:
    result=a&b;
    4'b0110:
    result=a^b;
    4'b0111:
    result=~(a|b);
    4'b1000:
    result=~(a&b);
    4'b1001:
    result=~(a^b);
    default:result=a+b;
    endcase
    end
endmodule
