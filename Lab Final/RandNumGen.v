`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2024 11:43:58 AM
// Design Name: 
// Module Name: RandNumGen
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


module RandNumGen(
    input clk, reset,
    output [5:0] rnd
    );
    wire [5:0] Q;
    
    D_FF D0(.clk(clk), .reset(reset), .D(Q[1]), .Q(Q[0]));
    D_FF D1(.clk(clk), .reset(reset), .D(Q[2]), .Q(Q[1]));
    D_FF D2(.clk(clk), .reset(reset), .D(Q[3]), .Q(Q[2]));
    D_FF D3(.clk(clk), .reset(reset), .D(Q[4]), .Q(Q[3]));
    D_FF D4(.clk(clk), .reset(reset), .D(Q[5]), .Q(Q[4]));
    D_FF D5(.clk(clk), .reset(reset), .D(~(Q[4]^Q[3])), .Q(Q[5]));
    
    assign rnd = Q;
endmodule
