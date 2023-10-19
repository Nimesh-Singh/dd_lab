`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2023 00:06:13
// Design Name: 
// Module Name: vedic_multiplier_tb
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


module vedic_multiplier_tb;

	// Inputs
	reg [15:0] a;
	reg [15:0] b;

	// Outputs
	wire [31:0] c;

	// Instantiate the Unit Under Test (UUT)
	vedic_multiplier dut (a,b,c);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		#100;
		
		a = 16'd12;
		b = 16'd12;
		#100;
		
		a = 16'd15;
		b = 16'd13;
		#100;
		
		a = 16'd24;
		b = 16'd2;
		#100;
		
		a = 16'd200;
		b = 16'd21;
		#100;
		
		a = 16'd36;
		b = 16'd48;
		#100;
		
		a = 16'd3226;
		b = 16'd4801;
		#100;
		
		a = 16'd11736;
		b = 16'd9868;
		#100;
		
		a = 16'b1000010101010111;
		b = 16'd3117;
		#100;
		
		a = 16'd48763;
		b = 16'd64973;
		#100;
        
	$finish;
	end
      
endmodule
