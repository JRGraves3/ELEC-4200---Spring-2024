`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/31/2024 09:11:01 PM
// Design Name: 
// Module Name: lab3_task5
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


module lab3_task5(
    input [1:0] a, b,
    output [3:0] out);
    wire [3:0] x;
    assign x = (a*b);
/*    assign x[0] = a[0];
    assign x[1] = a[1];
    assign x[2] = b[0];
    assign x[3] = b[1];*/
    ROM_2x2 R1(.ROM_data(out), .ROM_addr(x));
endmodule

module ROM_2x2(
    output [3:0] ROM_data,
    input [3:0] ROM_addr);
    reg [3:0] ROM2 [9:0];
    assign ROM_data = ROM2[ROM_addr];
    initial begin
        $readmemb ("ROM2.mem", ROM2, 0, 9);
    end
endmodule
