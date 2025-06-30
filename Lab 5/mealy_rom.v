`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2024 07:32:28 PM
// Design Name: 
// Module Name: mealy_rom
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


module mealy_rom(
    input clk, reset,
    output reg [2:0] count);
    reg [2:0] ROM_data;
    reg [2:0] ROM_addr;
    reg [2:0] ROM [2:0];
    integer i;
    
    initial $readmemb ("ROM.mem", ROM, 0, 5);
    
    always @(posedge reset) begin
        if (reset) ROM_data = ROM[3'b000];
        count = ROM_data;
    end
    
    always @(posedge clk) begin
        if (ROM_addr <= 3'b101)
            ROM_data = ROM[ROM_addr];
        else begin
            ROM_addr = 3'b000;
            ROM_data = ROM[ROM_addr];
        end
        ROM_addr = ROM_addr + 1;
        count = ROM_data;
    end
    
   // assign count = ROM[ROM_addr];
endmodule
