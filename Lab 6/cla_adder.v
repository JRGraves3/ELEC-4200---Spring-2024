`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2024 10:32:36 AM
// Design Name: 
// Module Name: cla_adder
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


module cla_adder(
    input [3:0] a, b,
    input cin,
    output [3:0] sum,
    output cout);
    parameter inv_del = 1, ao_del = 3, xor_del = 4, del = 2;
    wire [3:0] p, g;
    wire [4:0] c;
    wire [3:0] pc;
    wire [5:0] pg;
    
    xor #(xor_del + del) X1(p[0], a[0], b[0]);
    xor #(xor_del + del) X2(p[1], a[1], b[1]);
    xor #(xor_del + del) X3(p[2], a[2], b[2]);
    xor #(xor_del + del) X4(p[3], a[3], b[3]);
    
    and #(ao_del + del) A1(g[0], a[0], b[0]);
    and #(ao_del + del) A2(g[1], a[1], b[1]);
    and #(ao_del + del) A3(g[2], a[2], b[2]);
    and #(ao_del + del) A4(g[3], a[3], b[3]);
    
    and #(ao_del + del) A5(pc[0], p[0], cin);
    and #(ao_del + del) A6(pc[1], p[1], p[0], cin);
    and #(ao_del + del) A7(pc[2], p[2], p[1], p[0], cin);
    and #(ao_del + del) A8(pc[3], p[3], p[2], p[1], p[0], cin);
    
    and #(ao_del + del) A9(pg[0], p[1], g[0]);
    and #(ao_del + del) A10(pg[1], p[2], p[1], g[0]);
    and #(ao_del + del) A11(pg[2], p[3], p[2], p[1], g[0]);
    and #(ao_del + del) A12(pg[3], p[2], g[1]);
    and #(ao_del + del) A13(pg[4], p[3], p[2], g[1]);
    and #(ao_del + del) A14(pg[5], p[3], g[2]);
    
    assign c[0] = cin;
    or #(ao_del + del) O1(c[1], g[0], pc[0]);
    or #(ao_del + del) O2(c[2], g[1], pg[0], pc[1]);
    or #(ao_del + del) O3(c[3], g[2], pg[3], pg[1], pc[2]);
    or #(ao_del + del) O4(c[4], g[3], pg[5], pg[4], pg[2], pc[3]);
    assign cout = c[4];
    
    xor #(xor_del + del) X5(sum[0], p[0], c[0]);
    xor #(xor_del + del) X6(sum[1], p[1], c[1]);
    xor #(xor_del + del) X7(sum[2], p[2], c[2]);
    xor #(xor_del + del) X8(sum[3], p[3], c[3]);
    
    
endmodule
