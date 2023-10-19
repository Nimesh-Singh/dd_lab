`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.10.2023 23:55:41
// Design Name: 
// Module Name: mba_tb
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


module mba_tb;

    // Inputs
    reg [7:0] A;
    reg [7:0] B;
    reg clock;

    // Outputs
    wire [15:0] p;


    // Instantiate the Unit Under Test (UUT)
    modified_bm dut (
        .p(p), 
        .a(A), 
        .b(B), 
        .clock(clock)
    );

    initial clock = 0;
    always #5 clock = ~clock;

    initial begin
    A = 2; B = 2; #10;                   
    A = 3; B = 4; #10;  
    A = 5; B = -4; #10;
    A = 0; B = 0; #10; 
    A = 15; B = 15; #10;
    A = 215; B = 434; #10;
    A = 77; B = 120; #10; 
    A = -1341; B = 687; #10;
    $finish;
    end   
endmodule
