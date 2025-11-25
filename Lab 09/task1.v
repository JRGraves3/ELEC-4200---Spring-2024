`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2024 08:51:01 PM
// Design Name: 
// Module Name: task1
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


module task1(input Enable, output out);
    //(* ALLOW_COMBINATIONAL_LOOPS = "TRUE" *)
    (* DONT_TOUCH = "TRUE" *) wire w0, w1, w2, w3, w4, w5;
    and #5 (w0, Enable, w5);
    not #5 (w1, w0);
    not #5 (w2, w1);
    not #5 (w3, w2);
    not #5 (w4, w3);
    not #5 (w5, w4);
    assign out = w5;
endmodule
