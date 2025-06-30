`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2024 03:51:48 PM
// Design Name: 
// Module Name: gated_sr_latch
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


module gated_sr_latch(
    input R, S, Enable,
    output Q, Qbar);
    
    wire a, b;
    
    assign a = R && Enable;
    assign b = S && Enable;
    assign Q = ~(a | Qbar);
    assign Qbar = ~(b | Q);
    
endmodule
