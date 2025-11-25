`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2024 05:31:10 PM
// Design Name: 
// Module Name: task6
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

module tff(
    input wire clk, t, Enable, Clear_n,
    output reg Q);
    
    always @(posedge clk) begin
        if (~Clear_n) Q <= 0;
        else if(Enable)
            if (t) Q <= ~Q;
    end
endmodule

module task6(
    input clk, Enable, Clear_n,
    output [7:0] Q);
    wire t_in;
    wire [6:0] x;
    assign t_in = 1'b1;
    
    tff ff0 (.clk(clk), .t(t_in), .Enable(Enable), .Clear_n(Clear_n), .Q(Q[0]));
    and A1(x[0], Q[0], Enable);
    tff ff1 (.clk(clk), .t(x[0]), .Enable(Enable), .Clear_n(Clear_n), .Q(Q[1]));
    and A2(x[1], Q[1], x[0]);
    tff ff2 (.clk(clk), .t(x[1]), .Enable(Enable), .Clear_n(Clear_n), .Q(Q[2]));
    and A3(x[2], Q[2], x[1]);
    tff ff3 (.clk(clk), .t(x[2]), .Enable(Enable), .Clear_n(Clear_n), .Q(Q[3]));
    and A4(x[3], Q[3], x[2]);
    tff ff4 (.clk(clk), .t(x[3]), .Enable(Enable), .Clear_n(Clear_n), .Q(Q[4]));
    and A5(x[4], Q[4], x[3]);
    tff ff5 (.clk(clk), .t(x[4]), .Enable(Enable), .Clear_n(Clear_n), .Q(Q[5]));
    and A6(x[5], Q[5], x[4]);
    tff ff6 (.clk(clk), .t(x[5]), .Enable(Enable), .Clear_n(Clear_n), .Q(Q[6]));
    and A7(x[6], Q[6], x[5]);
    tff ff7 (.clk(clk), .t(x[6]), .Enable(Enable), .Clear_n(Clear_n), .Q(Q[7]));
endmodule
