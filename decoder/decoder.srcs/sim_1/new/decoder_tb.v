`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2023 14:45:06
// Design Name: 
// Module Name: decoder_tb
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


module decoder_tb;

reg [1:0]x;
wire [3:0]y;

decoder2x4  decode(x,y);
initial begin
x[1]=0; x[0]=0; #005
x[1]=0; x[0]=1; #005
x[1]=1; x[0]=0; #005
x[1]=1; x[0]=1; #005
$stop;
$finish();
end
endmodule

