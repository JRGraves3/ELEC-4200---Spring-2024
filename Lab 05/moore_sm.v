`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2024 04:59:42 PM
// Design Name: 
// Module Name: moore_sm
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


module moore_sm(
    output reg yout,
    input clk, reset,
    input [1:0] ain);
    reg [1:0] x;
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
    always @(posedge clk or posedge reset) begin
        if (reset) begin yout <= 1'b0; x <= ain; end
    end
    
    always @(posedge clk) begin
        case(ain)
             S0         : begin if (x == S1) yout = 1'b0;
                          else if (x == S2) yout = ~yout;
                          else if (x == S3) yout = 1'b1;
                          else x = S0;
                          end
             default    : x = ain;
        endcase
        x <= ain;
    end
endmodule
