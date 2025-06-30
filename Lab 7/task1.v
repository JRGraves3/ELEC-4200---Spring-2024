`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2024 01:53:52 PM
// Design Name: 
// Module Name: task1
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


module task1(
    input clk, load, reset,
    input [3:0] D,
    output reg [3:0] Q);
    always @(posedge clk)
        if (reset) Q <= 4'b0;
        else if (load) Q <= D;
endmodule
