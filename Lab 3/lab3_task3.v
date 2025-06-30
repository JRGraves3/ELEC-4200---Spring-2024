`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/31/2024 06:35:02 PM
// Design Name: 
// Module Name: lab3_task3
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


module lab3_task3(
    input [7:0] v,
    input E1,
    output reg [2:0] y,
    output reg E0, GS);
    reg [4:0] n;
    always @ * begin
        if (E1) begin
            y = 3'b111; GS = 1'b1; E0 = 1'b1;
        end else begin
            if (~v[0]) begin
                y = 3'b000; GS = 1'b0; E0 = 1'b1;
            end else if (~v[1]) begin
                y = 3'b001; GS = 1'b0; E0 = 1'b1;
            end else if (~v[2]) begin
                y = 3'b010; GS = 1'b0; E0 = 1'b1;
            end else if (~v[3]) begin
                y = 3'b011; GS = 1'b0; E0 = 1'b1;
            end else if (~v[4]) begin
                y = 3'b100; GS = 1'b0; E0 = 1'b1;
            end else if (~v[5]) begin
                y = 3'b101; GS = 1'b0; E0 = 1'b1;
            end else if (~v[6]) begin
                y = 3'b110; GS = 1'b0; E0 = 1'b1;
            end else if (~v[7]) begin
                y = 3'b111; GS = 1'b0; E0 = 1'b1;
            end else begin
                y = 3'b111; GS = 1'b1; E0 = 1'b0;
            end
        end
    end
endmodule
