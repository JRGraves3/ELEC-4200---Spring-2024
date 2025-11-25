`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2024 10:35:01 PM
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(
    input CLK100MHZ, // 100 MHz => changed to 5 MHz
    output reg divided_clk = 0); // 500 Hz
    integer counter_value = 0;
    
    localparam DIVISOR = 4999999;
    // DIVISOR = 100MHz/(2*desired Frequency) - 1
    // for 500 Hz desired => DIVISOR = 4999
    // for 1 second on => DIVISOR = 4999999
    
    always @(posedge CLK100MHZ) begin
        if (counter_value == DIVISOR) counter_value = 0; // reset
        else counter_value <= counter_value + 1; // increment
    end
    
    always @(posedge CLK100MHZ) begin
        if (counter_value == DIVISOR) divided_clk <= ~divided_clk; // toggle
        else divided_clk <= divided_clk; // store
    end
endmodule
