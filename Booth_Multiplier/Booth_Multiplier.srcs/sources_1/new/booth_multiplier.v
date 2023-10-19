`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2023 23:25:42
// Design Name: 
// Module Name: booth_multiplier
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

module booth_multiplier(X, Y, Z);
input signed [15:0] X, Y;
output signed [31:0] Z;
reg signed [31:0] Z;
reg [1:0] temp;
integer i;
reg E1;
reg [15:0] Y1;
always @ (X, Y)
begin
Z = 32'd0;
E1 = 1'd0;
Y1 = - Y;
Z[15:0]=X;
for (i = 0; i < 16; i = i + 1)
begin
temp = {X[i], E1};
case (temp)
2'd2 : Z [31 : 16] = Z [31 : 16] + Y1;
2'd1 : Z [31 : 16] = Z [31 : 16] + Y;
default : begin end
endcase
Z = Z >> 1;
Z[31] = Z[30];
E1 = X[i];
end

end
endmodule
