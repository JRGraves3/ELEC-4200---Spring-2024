`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/31/2024 06:10:44 PM
// Design Name: 
// Module Name: lab3_task2
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

module IC_74138(
    input g1, g2a_n, g2b_n,
    input [2:0] x,
    output reg [7:0] y);
    always @ * begin
        case({g1, g2a_n, g2b_n, x})
            6'b100_000  : y = 8'b11111110;
            6'b100_001  : y = 8'b11111101;
            6'b100_010  : y = 8'b11111011;
            6'b100_011  : y = 8'b11110111;
            6'b100_100  : y = 8'b11101111;
            6'b100_101  : y = 8'b11011111;
            6'b100_110  : y = 8'b10111111;
            6'b100_111  : y = 8'b01111111;
            default     : y = 8'b11111111;
        endcase
    end
endmodule

/*module decoder_74138_dataflow_tb();
    reg [2:0] x;
	reg g1, g2a_n, g2b_n;
	wire [7:0] y;
	integer k;
    IC_74138 DUT (.g1(g1), .g2a_n(g2a_n), .g2b_n(g2b_n), .x(x), .y(y));   
    initial begin
        x = 0; g1 = 0; g2a_n = 1; g2b_n = 1;
        for (k=0; k < 8; k=k+1)
            #5 x=k;
	    #10; x = 0; g1 = 1; g2a_n = 0; g2b_n = 1;
        for (k=0; k < 8; k=k+1)
            #5 x=k;
        #10; x = 0; g1 = 0; g2a_n = 1; g2b_n = 0;
        for (k=0; k < 8; k=k+1)
            #5 x=k;
        #10; x = 0; g1 = 1; g2a_n = 0; g2b_n = 0;
        for (k=0; k < 8; k=k+1)
            #5 x=k;
        #10;
    end
endmodule*/
