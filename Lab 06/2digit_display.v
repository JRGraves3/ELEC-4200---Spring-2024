`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// Yuxi Zhao
// Create Date: 10/24/2020 12:34:51 AM
// Design Name: 
// Module Name: 2digit_display
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


module twodigit_display(
    input pulse, //500Hz clock
    input [3:0] m_out, //first digit
    input [3:0] z, //second digit
    output reg [7:0] AN, 
    output reg [6:0] seg0 //7 segment display
    );
	reg [3:0] display;
        always @(pulse)
        begin
            if (pulse)
            begin
                AN = 8'b11111110;
                display=m_out;
            end
        else
            begin
                AN = 8'b11111101;
	display=z;
            end
        end   

	always @(display)
	case(display)
                    0   :seg0=7'b0000001;
                    1   :seg0=7'b1001111;
                    2   :seg0=7'b0010010;
                    3   :seg0=7'b0000110;
                    4   :seg0=7'b1001100;
                    5   :seg0=7'b0100100;
                    6   :seg0=7'b0100000;
                    7   :seg0=7'b0001111;
                    8   :seg0=7'b0000000;
                    9   :seg0=7'b0000100;
                    default: seg0=7'bx;
	endcase
endmodule

