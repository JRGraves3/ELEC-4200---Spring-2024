`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2024 05:18:02 PM
// Design Name: 
// Module Name: three_d
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


module three_d(
    input Clk, D,
    output reg Qa, Qb, Qc);
    
    always @ * begin
        if (Clk) Qa <= D;
    end
    
    always @(posedge Clk) begin
        Qb <= D;
    end
    
    always @(negedge Clk) begin
        Qc <= D;
    end
    
endmodule
