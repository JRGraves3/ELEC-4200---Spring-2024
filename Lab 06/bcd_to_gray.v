`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2024 09:37:34 PM
// Design Name: 
// Module Name: bcd_to_gray
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


module bcd_to_gray(
    input [3:0] bcd,
    input enable,
    output reg [3:0] gray,
    output reg wrong);
    
    always @* begin
        if(enable) begin
            wrong = 1'b0;
            case(bcd)
                0       : gray = 4'b0000;
                1       : gray = 4'b0001;
                2       : gray = 4'b0011;
                3       : gray = 4'b0010;
                4       : gray = 4'b0110;
                5       : gray = 4'b0111;
                6       : gray = 4'b0101;
                7       : gray = 4'b0100;
                8       : gray = 4'b1100;
                9       : gray = 4'b1101;
                default : begin gray = 4'b1111; wrong = 1'b1; end
            endcase
        end else begin
            gray = 4'b1111;
            wrong = 1'b1;
        end
    end
endmodule
