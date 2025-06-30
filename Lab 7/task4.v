`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2024 03:49:17 PM
// Design Name: 
// Module Name: task4
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


module task4(
    input clk, load, ShiftEn, ShiftIn,
    input [3:0] ParallelIn,
    output [3:0] RegContent,
    output ShiftOut);
    reg [3:0] shift_reg;
    // assign ShiftOut = 0;
    always @(posedge clk) begin
        if (load) begin
            shift_reg <= ParallelIn;
            
        end else if (ShiftEn) begin
            shift_reg <= {shift_reg[2:0], ShiftIn};
        end
        // ShiftOut = shift_reg[3];
        // RegContent = shift_reg;
    end
    assign ShiftOut = shift_reg[3];
    assign RegContent = shift_reg;
endmodule
