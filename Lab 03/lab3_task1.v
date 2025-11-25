`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/31/2024 05:24:22 PM
// Design Name: 
// Module Name: lab3_task1
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


module lab3_task1(
    input [2:0] x,
    output reg [7:0] y);
    always @ * begin
        y[0] = (~x[0] & ~x[1] & ~x[2]);
        y[1] = (x[0] & ~x[1] & ~x[2]);
        y[2] = (~x[0] & x[1] & ~x[2]);
        y[3] = (x[0] & x[1] & ~x[2]);
        y[4] = (~x[0] & ~x[1] & x[2]);
        y[5] = (x[0] & ~x[1] & x[2]);
        y[6] = (~x[0] & x[1] & x[2]);
        y[7] = (x[0] & x[1] & x[2]);
    end
endmodule

module decoder_3to8_dataflow_tb();
    reg [2:0] x;
	wire [7:0] y;
	integer k;
    lab3_task1 DUT (.x(x), .y(y));   
    initial
    begin
      x = 0; 
	for (k=0; k < 8; k=k+1)
		#5 x=k;
	#10;
    end

endmodule
