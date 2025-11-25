`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/17/2024 10:13:58 PM
// Design Name: 
// Module Name: Mux31_using_mux21_task5
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


module Mux31_using_mux21_task5(
    input x, y, z, s1, s2,
    output m
    );
    
    wire out;
    assign out = (~s1)?x:y;
    assign m = (~s2)?out:z;
    //if (s1 == 0) begin
    //    if (s2 == 0) begin
    //        assign m = x;
    //    end else begin
    //        assign m = y;
    //    end
    //end else begin
    //    assign m = z;
    //end
    
endmodule
