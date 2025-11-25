`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/17/2024 07:18:44 PM
// Design Name: 
// Module Name: Mux21_2bit_task2
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


module Mux21_2bit_task2(
    input [1:0] x, y,
    input s,
    output [1:0] m
    );
    
    wire [1:0] a, b;
    
    and A11(a[0], x[0], s);
    and A12(a[1], x[1], s);
    and A21(b[0], y[0], ~s);
    and A22(b[1], y[1], ~s);
    or A31(m[0], a[0], b[0]);
    or A32(m[1], a[1], b[1]);
    
endmodule
