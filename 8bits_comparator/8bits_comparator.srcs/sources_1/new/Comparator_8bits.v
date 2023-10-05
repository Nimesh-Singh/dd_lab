`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2023 23:34:20
// Design Name: 
// Module Name: Comparator_8bits
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


module Comparator_8bits(
input [7:0]a,[7:0]b,
output lt,eq,gt
    );
    wire lt1,lt2,lt3,lt4,lt5,lt6,lt7,lt8;
    wire gt1,gt2,gt3,gt4,gt5,gt6,gt7,gt8;
    wire eq1,eq2,eq3,eq4,eq5,eq6,eq7,eq8;
    
Comparator_1bit c1(a[7],b[7],lt1,eq1,gt1);
Comparator_1bit c2(a[6],b[6],lt2,eq2,gt2);
Comparator_1bit c3(a[5],b[5],lt3,eq3,gt3);
Comparator_1bit c4(a[4],b[4],lt4,eq4,gt4);
Comparator_1bit c5(a[3],b[3],lt5,eq5,gt5);
Comparator_1bit c6(a[2],b[2],lt6,eq6,gt6);
Comparator_1bit c7(a[1],b[1],lt7,eq7,gt7);
Comparator_1bit c8(a[0],b[0],lt8,eq8,gt8);

assign eq=eq1&eq2&eq3&eq4&eq5&eq6&eq7&eq8;
assign lt=(lt1)|(lt2&eq1)|(lt3&eq1&eq2)|(lt4&eq1&eq2&eq3)|(lt5&eq1&eq2&eq3&eq4)|(lt6&eq1&eq2&eq3&eq4&eq5)|(lt7&eq1&eq2&eq3&eq4&eq5&eq6)|(lt8&eq1&eq2&eq3&eq4&eq5&eq6&eq7);
assign gt=~eq&~lt;


    
endmodule


module Comparator_1bit(
input a,b, 
output lt,eq,gt);

   assign lt= a<b;
   assign gt=a>b;
   assign eq=a==b;

endmodule   
