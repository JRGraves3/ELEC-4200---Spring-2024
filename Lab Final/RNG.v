`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2024 01:54:20 PM
// Design Name: 
// Module Name: RNG
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


module RNG(
    input clk, reset,
    output [4:0] rnd
    );
    wire [4:0] Q;
    D_FF D0(.clk(clk), .reset(reset), .D(Q[1]), .Q(Q[0]));
    D_FF D1(.clk(clk), .reset(reset), .D(Q[2]), .Q(Q[1]));
    D_FF D2(.clk(clk), .reset(reset), .D(Q[3]), .Q(Q[2]));
    D_FF D3(.clk(clk), .reset(reset), .D(Q[4]), .Q(Q[3]));
    //D_FF D4(.clk(clk), .reset(reset), .D(Q[5]), .Q(Q[4]));
    D_FF D5(.clk(clk), .reset(reset), .D(~(Q[4]^Q[2])), .Q(Q[4]));
    assign rnd = Q;
endmodule
