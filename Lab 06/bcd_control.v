`timescale 1ns / 1ps

module bcd_control(
    input [3:0] digit1, digit2, digit3, digit4,
    input [1:0] refreshcounter,
    output reg [3:0] one_dig = 0);
    
    always @(refreshcounter) begin
        case(refreshcounter)
            2'b00   : one_dig = digit1;
            2'b01   : one_dig = digit2;
            2'b10   : one_dig = digit3;
            2'b11   : one_dig = digit4;
        endcase
    end
endmodule
