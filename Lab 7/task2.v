`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2024 02:15:25 PM
// Design Name: 
// Module Name: task2
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


module task2(
    input [3:0] D,
    input reset, set1, load, clk,
    output reg [3:0] Q);
    always @(posedge clk)
        if (reset) Q <= 0;
        else if (set1) Q <= 4'b1111;
        else if (load) Q <= D;
endmodule
