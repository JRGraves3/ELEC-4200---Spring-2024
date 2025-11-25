`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2024 10:28:47 PM
// Design Name: 
// Module Name: t_ff
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


module t_ff(
    input Clk, reset_n, T,
    output reg Q);
    
    always @(negedge Clk) begin
        if (!reset_n)
            Q <= 1'b0;
        else if (T)
            Q <= ~Q;
    end
endmodule
