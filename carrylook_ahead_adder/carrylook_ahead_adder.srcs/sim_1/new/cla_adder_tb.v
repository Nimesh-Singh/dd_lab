`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.09.2023 09:31:35
// Design Name: 
// Module Name: cla_adder_tb
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


module cla_adder_tb;
reg [3:0]a,b;
reg cin;
wire [3:0]sum;
wire cout;

cla_adder dut(a,b,cin,sum,cout);
initial begin
a=0;b=0;cin=0; #5
a=3;b=5;cin=0; #5
a=4;b=7;cin=1; #5
a=8;b=9;cin=0; #5
a=11;b=14;cin=1; #5
$finish;
end
endmodule
