`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/17/2024 09:40:52 PM
// Design Name: 
// Module Name: Mux21_2bit_dataflow_task3
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

module Mux21_2bit_dataflow_task3(
    input [1:0] x, y,
    input s,
    output [1:0] m);
    
    assign #3 m = (s)?x:y;
    
endmodule


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: mux_2bit_2_to_1_dataflow_tb
//////////////////////////////////////////////////////////////////////////////////

module mux_2bit_2_to_1_dataflow_tb(
    );
    
    reg [1:0] x, y;
	reg s;
    wire [1:0] m;
    
    Mux21_2bit_dataflow_task3 DUT (.x(x), .y(y), .s(s), .m(m));
    
 
    initial
    begin
      x = 0; y = 0; s = 0;
      #3 x = 1;
      #3 y = 1;
      #3 x = 3; y = 0;
      #3 x = 2; y = 3;
      #3 s = 1;
      #3 x = 1;
      #3 y = 1;
      #3 x = 3; y = 0;
      #3 x = 2; y = 3;
	#20;
    end

endmodule