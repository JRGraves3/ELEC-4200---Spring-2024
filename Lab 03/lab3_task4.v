`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/31/2024 06:59:00 PM
// Design Name: 
// Module Name: lab3_task4
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


module lab3_task4(
    input [1:0] a, b,
    output Lt, Gt, Eq);
    wire [2:0] w;
    wire [3:0] x;
    assign x[0] = a[0];
    assign x[1] = a[1];
    assign x[2] = b[0];
    assign x[3] = b[1];
    ROM_4x2 R1(.ROM_data(w), .ROM_addr(x));
    assign Lt = w[2];
    assign Gt = w[1];
    assign Eq = w[0];
endmodule

module ROM_4x2(
    output [2:0] ROM_data,
    input [3:0] ROM_addr);
    reg [2:0] ROM [15:0];
    assign ROM_data = ROM[ROM_addr];
    initial begin
        $readmemb ("ROM.mem", ROM, 0, 15);
    end
endmodule

/*module tb();
    reg [1:0] a1, b1;
    reg lt, gt, eq;
    
    labr_task4 DUT (.a(a1), .b(b1), .Lt(lt), .Gt(gt), .Eq(eq));
    
    initial begin
        a1 = 2'b00; b1 = 2'b00;
        #10 a1 = 2'b01;
        #10 a1 = 2'b10;
        #10 a1 = 2'b11;
        #10 a1 = 2'b00; b1 = 2'b01;
        #10 a1 = 2'b01;
        #10 a1 = 2'b10;
        #10 a1 = 2'b11;
        #10 a1 = 2'b00; b1 = 2'b10;
        #10 a1 = 2'b01;
        #10 a1 = 2'b10;
        #10 a1 = 2'b11;
        #10 a1 = 2'b00; b1 = 2'b11;
    end
endmodule*/
