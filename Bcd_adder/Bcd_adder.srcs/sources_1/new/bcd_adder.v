`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2023 00:05:27
// Design Name: 
// Module Name: bcd_adder
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




module bcd_adder(input [3:0] a,b,input cin, output [3:0] sum,output cout);

wire c1,c2,c3,c4,c5;
wire [3:0]x,z;
and (c1, z[3], z[2]);
and (c2, z[3], z[1]);
or  (cout, c3, c1,c2);
xor (c5, cout, cout);

assign x[2] = cout;
assign x[1] = cout;
assign x[3] = c5;
assign x[0] = c5;


//four bit adder body from instance of full_adder
four_bits_adder f1(.sum(z), .cout(c3), .a(a), .b(b),.cint(cin));
four_bits_adder f2 (.sum(sum), .cout(c4), .a(x), .b(z), .cint(cin));

endmodule


module four_bits_adder(
input [3:0] a,b,
output [3:0] sum,
output cout,
input [2:0] cint); 
   full_adder fa1(a[0], b[0], sum[0], 0, cint[0]);
   full_adder fa2(a[1], b[1], sum[1], cint[0], cint[1]);
   full_adder fa3(a[2], b[2], sum[2], cint[1], cint[2]);
   full_adder fa4(a[3], b[3], sum[3], cint[2], cout);
endmodule


module full_adder(a,b,sum,cin,cout);
input a,b,cin;
output sum,cout;

wire x1,x2,x3;
xor a1(x1,a,b);
and a2(x2,a,b);
and a3(x3,x1,cin);
or a4(cout,x2,x3);
xor a5(sum,x1,cin);

endmodule