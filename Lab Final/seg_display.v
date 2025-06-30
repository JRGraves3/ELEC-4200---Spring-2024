`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2024 09:03:46 AM
// Design Name: 
// Module Name: seg_display
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


module seg_display(
    input clk,
    input [3:0] ones, tens, hundreds,
    output reg [7:0] TurnOn,
    output reg [6:0] seg_out
    );
    reg [1:0] count;
    reg [3:0] display;
    // set count to 0
    initial begin
        count = 0;
    end
    
    // count driver
    always @(posedge clk) begin
        if (count != 2) count = count + 1;
        else count = 0;
    end
    
    // which digit will display
    always @(count) begin
        case(count)
            0       : begin
                      display = ones;
                      TurnOn = 8'b11111110;
                      end
            1       : begin
                      display = tens;
                      TurnOn = 8'b11111101;
                      end
            2       : begin
                      display = hundreds;
                      TurnOn = 8'b11111011;
                      end
        endcase
    end
    
    // segment bits
    always @* begin
        case(display)
            0       : seg_out = 7'b1000000;
            1       : seg_out = 7'b1111001;
            2       : seg_out = 7'b0100100;
            3       : seg_out = 7'b0110000;
            4       : seg_out = 7'b0011001;
            5       : seg_out = 7'b0010010;
            6       : seg_out = 7'b0000010;
            7       : seg_out = 7'b1111000;
            8       : seg_out = 7'b0000000;
            9       : seg_out = 7'b0010000;
            default : seg_out = 7'bx;
        endcase
    end
endmodule
