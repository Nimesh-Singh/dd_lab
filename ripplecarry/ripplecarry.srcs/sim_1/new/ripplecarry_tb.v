`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2023 22:45:44
// Design Name: 
// Module Name: ripplecarry_tb
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


module ripplecarry_tb();
reg [7:0]a;
reg [7:0]b;
reg cin;
wire [7:0]sum;
wire cout;

ripplecarry dut(a,b,cin,sum,cout);
initial begin
a=2;b=4;cin=0;#5
a=12;b=17;cin=0;#5
a=27;b=35;cin=1;#5
a=38;b=6;cin=0;#5
a=69;b=50;cin=1;#5
a=90;b=11;cin=1;#5
a=78;b=101;cin=1;#5
a=145;b=134;cin=0;#5
$finish;
end
endmodule
