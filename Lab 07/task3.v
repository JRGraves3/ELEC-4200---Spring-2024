`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2024 03:33:03 PM
// Design Name: 
// Module Name: task3
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


module task3(
    input clk, ShiftIn,
    output ShiftOut);
    reg [2:0] shift_reg;
    
    always @(posedge clk)
        shift_reg <= {shift_reg[1:0], ShiftIn};
    assign ShiftOut = shift_reg[2];
endmodule
