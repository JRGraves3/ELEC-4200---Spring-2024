`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/17/2024 07:09:21 PM
// Design Name: 
// Module Name: Mux21_task1
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


module Mux21_task1(
    input x,
    input y,
    input s,
    output m
    );
    wire a, b;
    and (a, x, s);
    and (b, y, ~s);
    or (m, a, b);
endmodule
