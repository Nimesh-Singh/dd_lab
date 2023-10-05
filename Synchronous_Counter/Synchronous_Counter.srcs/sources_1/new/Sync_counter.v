`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.10.2023 19:01:37
// Design Name: 
// Module Name: Sync_counter
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



module Sync_counter(t,clock,reset,q,qb);
input t,clock, reset;
output [7:0]q,qb;
wire [6:1]x;
tff T0(t,clock, reset,q[0],qb[0]);
tff T1(q[0],clock, reset,q[1],qb[1]);
and A1(x[1],q[0],q[1]);
tff T2(x[1],clock, reset,q[2],qb[2]);
and A2(x[2],q[2],x[1]);
tff T3(x[2],clock,reset,q[3],qb[3]);
and A3(x[3],q[3],x[2]);
tff T4(x[3],clock,reset,q[4],qb[4]);
and A4(x[4],q[4],x[3]);
tff T5(x[4],clock,reset,q[5],qb[5]);
and A5(x[5],q[5],x[4]);
tff T6(x[5],clock,reset,q[6],qb[6]);
and A6(x[6],q[6],x[5]);
tff T7(x[6],clock,reset,q[7],qb[7]);
endmodule


module tff(t,clock,reset,q,qb);
input t,clock,reset;
output reg q,qb;
always@(posedge clock)
begin
case({reset,t})
2'b00 :q=q;
2'b01 :q=~q;
default: q=0;
endcase
qb<=~q;
end
endmodule