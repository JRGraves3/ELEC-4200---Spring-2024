`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2024 04:02:55 PM
// Design Name: 
// Module Name: pulse_generator
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


module pulse_generator(
    input CLK100MHZ, enable, reset,
    output reg Q);
    
    parameter DIVIDER = 80000000;
    reg [26:0] count = 0;
    
    always @(posedge CLK100MHZ) begin
        if(reset) begin
            count <=0;
            Q <= 0;
        end else if (enable) begin
            if (count == DIVIDER - 1) begin
                Q <= ~Q;
                count <= 0;
            end else begin
                count <= count + 1;
            end
        end
    end
endmodule
