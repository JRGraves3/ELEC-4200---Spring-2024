`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2024 04:34:43 PM
// Design Name: 
// Module Name: task5
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


module task5(
    input clk, ShiftEn, ShiftIn,
    output [3:0] ParallelOut,
    output ShiftOut);
    reg [3:0] shift_reg;
    
    always @(posedge clk) begin
        if (ShiftEn) begin shift_reg <= {shift_reg[2:0], ShiftIn}; end
        // ParallelOut <= shift_reg;
    end
    assign ShiftOut = shift_reg[3];
    assign ParallelOut = shift_reg;
endmodule
