`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2024 04:31:46 PM
// Design Name: 
// Module Name: multiplier_3x3
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


module multiplier_3x3(
    input clk, start,
    input [2:0] multiplicand, multiplier,
    output reg done,
    output reg [5:0] product
    );
    reg [5:0] shift_product, shift_and;
    reg [2:0] shift_count, shift_ier;
    reg [3:0] state;
    reg lsb;
    integer i = 0;
    parameter [3:0] START = 4'b0001, SHIFT = 4'b0010, ADD = 4'b0100, DONE = 4'b1000;
    
    initial begin
        shift_product = 6'b0;
        shift_count = 3'b0;
        lsb = 0;
    end
    
    always @(posedge clk) begin
        if (start) begin
            state = START;
            product = 6'b0;
        end
        case(state)
            START: begin
                if(start) begin
                    shift_and = {3'b0, multiplicand};
                    shift_ier = multiplier;
                    shift_count = 3'b000;
                    state = SHIFT;
                end
            end
            SHIFT: begin
                shift_product = 6'b0;
                case(shift_ier[lsb])
                    1'b1: begin 
                          shift_product = shift_and;
                          shift_and = shift_and << 1;
                          end
                    1'b0: shift_and = shift_and << 1;
                endcase
                state = ADD;
            end
            ADD: begin
                product = product + shift_product;
                if (shift_ier == 0) begin
                    state = DONE;
                end else begin
                    shift_ier = shift_ier >> 1;
                    state = SHIFT;
                end
            end
            DONE: begin
                if(done) state = DONE;
            end
        endcase
    end
    
    always @(posedge clk) begin
        if (state == DONE) done = 1;
        else done = 0;
    end
endmodule

/*module multiplier_control(
    //input clk, lsb, cnt_done,
    output reg start, shift, add, done);
    parameter [3:0] START = 4'b0001, SHIFT = 4'b0010, ADD = 4'b0100, DONE = 4'b1000;
    reg [3:0] state;
    
    always @(posedge clk) begin
        case(state)
            START   : begin
                      start <= 1;
                      shift <= 0;
                      add <= 0;
                      done <= 0;
                      if (lsb) state <= SHIFT;
                      end
            SHIFT   : begin
                      start <= 0;
                      shift <= 1;
                      add <= 0;
                      done <= 0;
                      if (lsb) state <= ADD;
                      end
            ADD     : begin
                      start <= 0;
                      shift <= 0;
                      add <= 1;
                      done <= 0;
                      if (lsb) state <= DONE;
                      end
            DONE    : begin
                      start <= 0;
                      shift <= 0;
                      add <= 0;
                      done <= 1;
                      if (lsb) state <= START;
                      end
            default : state <= START;
        endcase
    end
endmodule*/