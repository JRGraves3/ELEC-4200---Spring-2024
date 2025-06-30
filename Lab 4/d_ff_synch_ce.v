`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2024 10:04:31 PM
// Design Name: 
// Module Name: d_ff_synch_ce
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


module d_ff_synch_ce(
    input D, Clk, ce, reset,
    output reg Q);
    
    always @ (posedge Clk) begin
        if (reset) Q <= 0;
        else begin
            if (ce) Q <= D;
        end
    end
endmodule
