`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2024 09:16:33 AM
// Design Name: 
// Module Name: bcd
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


module bcd(
    input clk,
    input [9:0] in,
    output reg [6:0] out,
    output reg [3:0] ones, tens, hundreds
    );
    wire divided_clk;
    //reg [3:0] ones, tens, hundreds;
    reg [6:0] out_ones, out_tens, out_hundreds;
    reg [9:0] temp;
    
    reg [21:0] refresh_counter = 0;
    
    
    clock_divider A1(.clk(clk), .divided_clk(divided_clk));
    
    always @(posedge divided_clk) begin
        if (in < 10) begin
            hundreds <= 0;
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
        end else if (in < 100) begin
            case(in)
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
    
    /*always @(posedge divided_clk) begin
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
    end*/
endmodule