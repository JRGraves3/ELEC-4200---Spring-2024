`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2024 05:36:12 PM
// Design Name: 
// Module Name: d_ff_synch
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


module d_ff_synch(
    input Clk, D, reset,
    output reg Q);
    always @ (posedge Clk) begin
        if (reset) begin
            Q <= 0;
        end else begin
            Q <= D;
        end
    end
endmodule
