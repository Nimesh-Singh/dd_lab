`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2023 00:05:47
// Design Name: 
// Module Name: vedic_multiplier
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
 module vedic_multiplier(a,b,c);
input [15:0]a;
input [15:0]b;
output [31:0]c;

wire [15:0]q0;	
wire [15:0]q1;	
wire [15:0]q2;
wire [15:0]q3;	
wire [31:0]c;
wire [15:0]temp1;
wire [23:0]temp2;
wire [23:0]temp3;
wire [23:0]temp4;
wire [15:0]q4;
wire [23:0]q5;
wire [23:0]q6;
// using 4 8x8 multipliers
vedic_8X8 z1(a[7:0],b[7:0],q0[15:0]);
vedic_8X8 z2(a[15:8],b[7:0],q1[15:0]);
vedic_8X8 z3(a[7:0],b[15:8],q2[15:0]);
vedic_8X8 z4(a[15:8],b[15:8],q3[15:0]);

// stage 1 adders 
assign temp1 ={8'b0,q0[15:8]};
add_16_bit z5(q1[15:0],temp1,q4);
assign temp2 ={8'b0,q2[15:0]};
assign temp3 ={q3[15:0],8'b0};
add_24_bit z6(temp2,temp3,q5);
assign temp4={8'b0,q4[15:0]};

//stage 2 adder
add_24_bit z7(temp4,q5,q6);
// fnal output assignment 
assign c[7:0]=q0[7:0];
assign c[31:8]=q6[23:0];

endmodule


module vedic_8X8(a,b,c);
   
input [7:0]a;
input [7:0]b;
output [15:0]c;

wire [15:0]q0;	
wire [15:0]q1;	
wire [15:0]q2;
wire [15:0]q3;	
wire [15:0]c;
wire [7:0]temp1;
wire [11:0]temp2;
wire [11:0]temp3;
wire [11:0]temp4;
wire [7:0]q4;
wire [11:0]q5;
wire [11:0]q6;
// using 4 4x4 multipliers
vedic_4_x_4 z1(a[3:0],b[3:0],q0[15:0]);
vedic_4_x_4 z2(a[7:4],b[3:0],q1[15:0]);
vedic_4_x_4 z3(a[3:0],b[7:4],q2[15:0]);
vedic_4_x_4 z4(a[7:4],b[7:4],q3[15:0]);

// stage 1 adders 
assign temp1 ={4'b0,q0[7:4]};
add_8_bit z5(q1[7:0],temp1,q4);
assign temp2 ={4'b0,q2[7:0]};
assign temp3 ={q3[7:0],4'b0};
add_12_bit z6(temp2,temp3,q5);
assign temp4={4'b0,q4[7:0]};
// stage 2 adder
add_12_bit z7(temp4,q5,q6);
// fnal output assignment 
assign c[3:0]=q0[3:0];
assign c[15:4]=q6[11:0];

endmodule

module vedic_4_x_4(
a,b,c
    );
input [3:0]a;
input [3:0]b;
output [7:0]c;

wire [3:0]q0;	
wire [3:0]q1;	
wire [3:0]q2;
wire [3:0]q3;	
wire [7:0]c;
wire [3:0]temp1;
wire [5:0]temp2;
wire [5:0]temp3;
wire [5:0]temp4;
wire [3:0]q4;
wire [5:0]q5;
wire [5:0]q6;
// using 4 2x2 multipliers
vedic_2_x_2 z1(a[1:0],b[1:0],q0[3:0]);
vedic_2_x_2 z2(a[3:2],b[1:0],q1[3:0]);
vedic_2_x_2 z3(a[1:0],b[3:2],q2[3:0]);
vedic_2_x_2 z4(a[3:2],b[3:2],q3[3:0]);
// stage 1 adders 
assign temp1 ={2'b0,q0[3:2]};
add_4_bit z5(q1[3:0],temp1,q4);
assign temp2 ={2'b0,q2[3:0]};
assign temp3 ={q3[3:0],2'b0};
add_6_bit z6(temp2,temp3,q5);
assign temp4={2'b0,q4[3:0]};
// stage 2 adder 
add_6_bit z7(temp4,q5,q6);
// fnal output assignment 
assign c[1:0]=q0[1:0];
assign c[7:2]=q6[5:0];

endmodule


module vedic_2_x_2(a,b,c);
input [1:0]a;
input [1:0]b;
output [3:0]c;
wire [3:0]c;
wire [3:0]temp;
//stage 1
// four multiplication operation of bits accourding to vedic logic done using and gates 
assign c[0]=a[0]&b[0]; 
assign temp[0]=a[1]&b[0];
assign temp[1]=a[0]&b[1];
assign temp[2]=a[1]&b[1];
//stage two 
// using two half adders 
ha z1(temp[0],temp[1],c[1],temp[3]);
ha z2(temp[2],temp[3],c[2],c[3]);
endmodule


module ha(input a,b,output sum,cout);
assign {cout,sum}=a+b;
endmodule

module add_4_bit(input[3:0] a,b,output [3:0]c);
assign c=a+b;
endmodule


module add_6_bit(input[5:0] a,b,output [5:0]c);
assign c=a+b;
endmodule

module add_8_bit(input[7:0] a,b,output [7:0]c);
assign c=a+b;
endmodule

module add_12_bit(input [11:0]a,b, output [11:0]c);
assign c=a+b;
endmodule

module add_16_bit(input[15:0] a,b,output [15:0]c);
assign c=a+b;
endmodule

module add_24_bit(input[23:0] a,b,output [23:0]c);
assign c=a+b;
endmodule

