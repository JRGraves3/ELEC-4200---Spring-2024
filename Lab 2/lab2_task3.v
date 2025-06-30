`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/25/2024 11:08:39 AM
// Design Name: 
// Module Name: lab2_task3
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


module lab2_task3(
    input [3:0] SW,
    output reg [4:0] LED
    );
    
    always @(SW)
        case(SW)
            4'b0000 :   LED = 5'b00011;
            4'b0001 :   LED = 5'b00101;
            4'b0010 :   LED = 5'b00110;
            4'b0011 :   LED = 5'b01001;
            4'b0100 :   LED = 5'b01010;
            4'b0101 :   LED = 5'b01100;
            4'b0110 :   LED = 5'b10001;
            4'b0111 :   LED = 5'b10010;
            4'b1000 :   LED = 5'b10100;
            4'b1001 :   LED = 5'b11000;
            default :   LED = 5'b00000;
        endcase
endmodule
