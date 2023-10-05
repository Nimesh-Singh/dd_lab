`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2023 01:25:11
// Design Name: 
// Module Name: Audc_4bits_tb
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

module Audc_4bits_tb;

    // Inputs
    reg clk;
    reg rst;
    reg UpDown;

    // Outputs
    wire [3:0] count;

    // Instantiate the Unit Under Test (UUT)
    Audc_4bits dut(clk,rst,Updown,count);

//Generate clock with 10 ns clk period.
    initial begin clk = 0;
    forever #5 clk = ~clk;
    end
    
    initial begin
        // Apply Inputs
        rst=1;
        #100
        rst = 0;
        #50
        UpDown = 0;
        #300;
        UpDown = 1;
      #300;
        rst = 1;
        #100
        rst = 0;  
        #30
        $finish;
    end
      
endmodule
