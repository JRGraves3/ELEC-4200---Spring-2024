`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2024 04:42:12 PM
// Design Name: 
// Module Name: binary_to_bcd
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


module binary_to_bcd(
    input CLK100MHZ,
    input [3:0] in,
    output reg [6:0] out,
    output reg [7:0] turnon = 8'b11111111);
    wire divided_clk;
    reg [3:0] tens = 0, ones;
    reg [6:0] out_ones, out_tens;
    
    reg [21:0] refresh_counter = 0;
    
    
    clock_divider A(.CLK100MHZ(CLK100MHZ), .divided_clk(divided_clk));
    
    always @(posedge divided_clk) begin
        if (in < 10) begin
            // turnon <= 8'b11111110;
            tens <= 0;
            case(in)
                0       : out_ones <= 7'b1000000;
                1       : out_ones <= 7'b1111001;
                2       : out_ones <= 7'b0100100;
                3       : out_ones <= 7'b0110000;
                4       : out_ones <= 7'b0011001;
                5       : out_ones <= 7'b0010010;
                6       : out_ones <= 7'b0000010;
                7       : out_ones <= 7'b1111000;
                8       : out_ones <= 7'b0000000;
                9       : out_ones <= 7'b0010000;
                default : out_ones <= 7'bx;
            endcase
        end else begin
            // turnon <= 8'b11111101;
            case(in)
                /*0       : begin tens <= 0; ones <= 0; end
                1       : begin tens <= 0; ones <= 1; end
                2       : begin tens <= 0; ones <= 2; end
                3       : begin tens <= 0; ones <= 3; end
                4       : begin tens <= 0; ones <= 4; end
                5       : begin tens <= 0; ones <= 5; end
                6       : begin tens <= 0; ones <= 6; end
                7       : begin tens <= 0; ones <= 7; end
                8       : begin tens <= 0; ones <= 8; end
                9       : begin tens <= 0; ones <= 9; end*/
                10      : begin tens <= 1; ones <= 0; end
                11      : begin tens <= 1; ones <= 1; end
                12      : begin tens <= 1; ones <= 2; end
                13      : begin tens <= 1; ones <= 3; end
                14      : begin tens <= 1; ones <= 4; end
                15      : begin tens <= 1; ones <= 5; end
                default : begin tens <= 0; ones <= 0; end
            endcase
            case(ones)
                0       : out_ones <= 7'b1000000;
                1       : out_ones <= 7'b1111001;
                2       : out_ones <= 7'b0100100;
                3       : out_ones <= 7'b0110000;
                4       : out_ones <= 7'b0011001;
                5       : out_ones <= 7'b0010010;
                6       : out_ones <= 7'b0000010;
                7       : out_ones <= 7'b1111000;
                8       : out_ones <= 7'b0000000;
                9       : out_ones <= 7'b0010000;
                default : out_ones <= 7'bx;
            endcase
            case(tens)
                0       : out_tens <= 7'b1111111;
                1       : out_tens <= 7'b1111001;
                default : out_tens <= 7'bx;
            endcase
        end
    end
    
    always @(posedge divided_clk) begin
        if(turnon == 8'b11111111) begin
            turnon <= 8'b11111110;
            out <= out_ones;
        end else if(turnon == 8'b11111110) begin
            turnon <= 8'b11111101;
            out <= out_tens;
        end else begin
            turnon <= 8'b11111110;
            out <= out_ones;
        end
    end
endmodule
