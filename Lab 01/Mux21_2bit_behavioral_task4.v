`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/17/2024 10:06:30 PM
// Design Name: 
// Module Name: Mux21_2bit_behavioral_task4
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


module Mux21_2bit_behavioral_task4(
    input [1:0] x, y,
    input s,
    output reg [1:0] m
    );
    
    always @ (x or y or s) begin
        if(s)
            m = x;
        else
            m = y;
        end
    
endmodule
