`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2023 00:23:58
// Design Name: 
// Module Name: bcd_adder_tb
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


module bcd_adder_tb;
reg [3:0] in1, in2;
reg cin;
wire [3:0] s;
wire c;
  bcd_adder dut(.a(in1), .b(in2), .cout(c), .sum(s),.cin(cin));
/* task printInfo;
input [7:0] A, B, S;
input Ci, Co;
   begin
      $display ("A = %b, B = %b, Ci = %b, S = %b, Cout = %b", A, B, Ci, S, Co);
   end
endtask */
initial
    begin
      in1=4'd5; in2=4'd6; cin=0;#10;
      in1=4'd1; in2=4'd6; cin=0;#10;
      in1=4'd5; in2=4'd2; cin=1;#10;
      in1=4'd5; in2=4'd7; cin=1;#10;
      in1=4'd3; in2=4'd8; cin=1;#10;
      in1=4'd0; in2=4'd6; cin=0;#10;
      in1=4'd9; in2=4'd6; cin=1;#10;
      in1=4'b0100; in2=4'b0110; cin=0;#10;
      $finish;
    end
endmodule
