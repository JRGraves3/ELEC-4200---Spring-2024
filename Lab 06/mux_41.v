`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2024 03:33:18 PM
// Design Name: 
// Module Name: mux_41
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


module mux_41(
    input A, B, C, D, s1, s0,
    output reg Y);
    
    always @* begin
        if(s1 == 0 & s0 == 0) Y = A;
        else if(s1 == 0 & s0 == 1) Y = B;
        else if(s1 == 1 & s0 == 0) Y = C;
        else Y = D;
    end
endmodule
