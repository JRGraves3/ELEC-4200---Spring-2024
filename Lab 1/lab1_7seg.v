`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2024 02:25:18 PM
// Design Name: 
// Module Name: lab1_7seg
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


module lab1_7seg(
    input [3:0] In,
    output [7:0] TurnOn,
    output reg [6:0] Out
    );
    
    assign TurnOn = 8'b11111110;
    
    always @(In) begin
        case(In)
            4'b0000 :   Out = 7'b0000001; // 0
            4'b0001 :   Out = 7'b1001111; // 1
            4'b0010 :   Out = 7'b0010010; // 2
            4'b0011 :   Out = 7'b0000110; // 3
            4'b0100 :   Out = 7'b1001100; // 4
            4'b0101 :   Out = 7'b0100100; // 5
            4'b0110 :   Out = 7'b0100000; // 6
            4'b0111 :   Out = 7'b0001111; // 7
            4'b1000 :   Out = 7'b0000000; // 8
            4'b1001 :   Out = 7'b0000100; // 9
            default :   Out = 7'b1111111; // All segments on
        endcase
    end
    
endmodule
