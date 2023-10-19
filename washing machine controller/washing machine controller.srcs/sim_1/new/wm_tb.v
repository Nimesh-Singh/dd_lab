`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2023 22:16:01
// Design Name: 
// Module Name: wm_tb
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
module wm_tb;
    reg clock;
    reg sig_Lid_Closed;
    reg sig_Coin;
    reg sig_Cancel;
    reg sig_Time_Out;
    reg sig_Out_Of_Balance;
    reg sig_Motor_Failure;
    wire [2:0] state;

washing_machine_controller dut(
    .clock(clock),
    .sig_Lid_Closed(sig_Lid_Closed),
    .sig_Coin(sig_Coin),
    .sig_Cancel(sig_Cancel),
    .sig_Time_Out(sig_Time_Out),
    .sig_Out_Of_Balance(sig_Out_Of_Balance),
    .sig_Motor_Failure(sig_Motor_Failure),
    .state(state)
    );

    always #5 clock = ~ clock;

    initial begin 

        clock = 0;
        sig_Coin = 1;
        sig_Lid_Closed = 1; #500;
        $finish;
    end

endmodule