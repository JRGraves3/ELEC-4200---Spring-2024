`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2024 10:26:46 AM
// Design Name: 
// Module Name: task8
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


module task8(
    input clk, Enable, Clear, Load,
    output [3:0] Q);
    reg [3:0] count;
    wire cnt_done;
    
    assign cnt_done = ~| count;
    assign Q = count;
    
    always @(posedge clk) begin
        if (Clear) count <= 0;
        else if (Enable) begin
            if (Load | cnt_done) count <= 4'b1010; // decimal 10
            else count <= count - 1;
        end
    end
endmodule
