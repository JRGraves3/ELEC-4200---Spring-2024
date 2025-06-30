`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2024 04:35:10 PM
// Design Name: 
// Module Name: multiplier_4x4
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


module multiplier_4x4(
    input CLK100MHZ, start,
    input [3:0] addr_and, addr_ier,
    output reg done,
    output reg [7:0] TurnOn,
    output reg [6:0] seg_out
    );
    reg [3:0] multiplicand, multiplier; // numbers begin multiplied
    reg [7:0] product, shift_and, shift_ier, shift_product; // answer and temp holders
    reg [6:0] ones_prod, tens_prod, hund_prod; // sev-seg output for each digit
    parameter [3:0] START = 4'b0001, SHIFT = 4'b0010, ADD = 4'b0100, DONE = 4'b1000, WAIT = 4'b1111;
    reg [3:0] state;
    reg lsb;
    wire divided_clk;
    
    clock_divider c0(.CLK100MHZ(CLK100MHZ), .divided_clk(divided_clk));
    
    initial TurnOn = 8'b00000001;
    
    reg [3:0] ROM [15:0];
    initial $readmemb ("ROM.mem", ROM, 0, 15);
    
    
    always @(posedge CLK100MHZ) begin // get multiplicand and multiplier
        if (start) begin
            multiplicand = ROM[addr_and];
            multiplier = ROM[addr_ier + 16];
            state = START;
            product = 6'b0;
        end else state = WAIT;
    end
    
    // multiplication
    always @(posedge CLK100MHZ) begin
        case(state)
            START: begin
                if(start) begin
                    shift_and = {3'b0, multiplicand};
                    shift_ier = multiplier;
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
                else state = WAIT;
            end
            WAIT: begin
                state = WAIT;
            end
        endcase
    end
    
    // get ones, tens, and hundreds place and sev-seg value
    always @* begin
        case(product)
            0: begin
               ones_prod = 7'b0000010;
               tens_prod = 7'b0000100;
               hund_prod = 7'b0001000;
               end
            1: begin
               ones_prod = 7'b1001111;
               tens_prod = 7'b0000001;
               hund_prod = 7'b0000001;
               end
            2: begin
               ones_prod = 7'b0010010;
               tens_prod = 7'b0000001;
               hund_prod = 7'b0000001;
               end
            3: begin
               ones_prod = 7'b0000110;
               tens_prod = 7'b0000001;
               hund_prod = 7'b0000001;
               end
            4: begin
               ones_prod = 7'b1001100;
               tens_prod = 7'b0000001;
               hund_prod = 7'b0000001;
               end
            5: begin
               ones_prod = 7'b0100100;
               tens_prod = 7'b0000001;
               hund_prod = 7'b0000001;
               end
            6: begin
               ones_prod = 7'b0100000;
               tens_prod = 7'b0000001;
               hund_prod = 7'b0000001;
               end
            7: begin
               ones_prod = 7'b0001111;
               tens_prod = 7'b0000001;
               hund_prod = 7'b0000001;
               end
            8: begin
               ones_prod = 7'b0000000;
               tens_prod = 7'b0000001;
               hund_prod = 7'b0000001;
               end
            9: begin
               ones_prod = 7'b0000100;
               tens_prod = 7'b0000001;
               hund_prod = 7'b0000001;
               end
            10: begin
               ones_prod = 7'b0000001;
               tens_prod = 7'b1001111;
               hund_prod = 7'b0000001;
               end
            11: begin
               ones_prod = 7'b1001111;
               tens_prod = 7'b1001111;
               hund_prod = 7'b0000001;
               end
            12: begin
               ones_prod = 7'b0010010;
               tens_prod = 7'b1001111;
               hund_prod = 7'b0000001;
               end
            13: begin
               ones_prod = 7'b0000110;
               tens_prod = 7'b1001111;
               hund_prod = 7'b0000001;
               end
            14: begin
               ones_prod = 7'b1001100;
               tens_prod = 7'b1001111;
               hund_prod = 7'b0000001;
               end
            15: begin
               ones_prod = 7'b0100100;
               tens_prod = 7'b1001111;
               hund_prod = 7'b0000001;
               end
            16: begin 
               ones_prod = 7'b0100000;
               tens_prod = 7'b1001111;
               hund_prod = 7'b0000001;
               end
            17: begin 
               ones_prod = 7'b1001111;
               tens_prod = 7'b1001111;
               hund_prod = 7'b0000001;
               end
            18: begin 
               ones_prod = 7'b0000000;
               tens_prod = 7'b1001111;
               hund_prod = 7'b0000001;
               end
            19: begin 
               ones_prod = 7'b0000100;
               tens_prod = 7'b1001111;
               hund_prod = 7'b0000001;
               end
            20: begin 
               ones_prod = 7'b0000001;
               tens_prod = 7'b0010010;
               hund_prod = 7'b0000001;
               end
            21: begin 
               ones_prod = 7'b1001111;
               tens_prod = 7'b0010010;
               hund_prod = 7'b0000001;
               end
            22: begin 
               ones_prod = 7'b0010010;
               tens_prod = 7'b0010010;
               hund_prod = 7'b0000001;
               end
            23: begin 
               ones_prod = 7'b0000110;
               tens_prod = 7'b0010010;
               hund_prod = 7'b0000001;
               end
            24: begin 
               ones_prod = 7'b1001100;
               tens_prod = 7'b0010010;
               hund_prod = 7'b0000001;
               end
            25: begin 
               ones_prod = 7'b0100100;
               tens_prod = 7'b0010010;
               hund_prod = 7'b0000001;
               end
            26: begin 
               ones_prod = 7'b0100000;
               tens_prod = 7'b0010010;
               hund_prod = 7'b0000001;
               end
            27: begin 
               ones_prod = 7'b0001111;
               tens_prod = 7'b0010010;
               hund_prod = 7'b0000001;
               end
            28: begin 
               ones_prod = 7'b0000000;
               tens_prod = 7'b0010010;
               hund_prod = 7'b0000001;
               end
            29: begin 
               ones_prod = 7'b0000100;
               tens_prod = 7'b0010010;
               hund_prod = 7'b0000001;
               end
            30: begin 
               ones_prod = 7'b0000001;
               tens_prod = 7'b0000110;
               hund_prod = 7'b0000001;
               end
            31: begin 
               ones_prod = 7'b1001111;
               tens_prod = 7'b0000110;
               hund_prod = 7'b0000001;
               end
            32: begin
               ones_prod = 7'b0010010;
               tens_prod = 7'b0000110;
               hund_prod = 7'b0000001;
               end 
            33: begin 
               ones_prod = 7'b0000110;
               tens_prod = 7'b0000110;
               hund_prod = 7'b0000001;
               end
            34: begin 
               ones_prod = 7'b1001100;
               tens_prod = 7'b0000110;
               hund_prod = 7'b0000001;
               end
            35: begin 
                ones_prod = 7'b0100100;
                tens_prod = 7'b0000110;
                hund_prod = 7'b0000001;
                end
            36: begin 
                ones_prod = 7'b0100000;
                tens_prod = 7'b0000110;
                hund_prod = 7'b0000001;
                end
                37: begin 
                ones_prod = 7'b1001111;
                tens_prod = 7'b0000110;
                hund_prod = 7'b0000001;
                end
            38: begin 
                ones_prod = 7'b0000000;
                tens_prod = 7'b0000110;
                hund_prod = 7'b0000001;
                end
            39: begin 
                ones_prod = 7'b0000100;
                tens_prod = 7'b0000110;
                hund_prod = 7'b0000001;
                end
            40: begin 
                ones_prod = 7'b0000001;
                tens_prod = 7'b1001100;
                hund_prod = 7'b0000001;
                end
            41: begin 
                ones_prod = 7'b1001111;
                tens_prod = 7'b1001100;
                hund_prod = 7'b0000001;
                end
            42: begin 
                ones_prod = 7'b0010010;
                tens_prod = 7'b1001100;
                hund_prod = 7'b0000001;
                end
            43: begin 
                ones_prod = 7'b0000110;
                tens_prod = 7'b1001100;
                hund_prod = 7'b0000001;
                end
            44: begin 
                ones_prod = 7'b1001100;
                tens_prod = 7'b1001100;
                hund_prod = 7'b0000001;
                end
            45: begin 
                ones_prod = 7'b0100100;
                tens_prod = 7'b1001100;
                hund_prod = 7'b0000001;
                end
            46: begin 
                ones_prod = 7'b0100000;
                tens_prod = 7'b1001100;
                hund_prod = 7'b0000001;
                end
            47: begin 
                ones_prod = 7'b0001111;
                tens_prod = 7'b1001100;
                hund_prod = 7'b0000001;
                end
            48: begin 
                ones_prod = 7'b0000000;
                tens_prod = 7'b1001100;
                hund_prod = 7'b0000001;
                end
            49: begin 
                ones_prod = 7'b0000100;
                tens_prod = 7'b1001100;
                hund_prod = 7'b0000001;
                end
            50: begin 
                ones_prod = 7'b0000001;
                tens_prod = 7'b0100100;
                hund_prod = 7'b0000001;
                end
            51: begin 
                ones_prod = 7'b1001111;
                tens_prod = 7'b0100100;
                hund_prod = 7'b0000001;
                end
            52: begin 
                ones_prod = 7'b0010010;
                tens_prod = 7'b0100100;
                hund_prod = 7'b0000001;
                end
            53: begin 
                ones_prod = 7'b0000110;
                tens_prod = 7'b0100100;
                hund_prod = 7'b0000001;
                end
            54: begin 
                ones_prod = 7'b1001100;
                tens_prod = 7'b0100100;
                hund_prod = 7'b0000001;
                end
            55: begin 
                ones_prod = 7'b0100100;
                tens_prod = 7'b0100100;
                hund_prod = 7'b0000001;
                end
            56: begin 
                ones_prod = 7'b0100000;
                tens_prod = 7'b0100100;
                hund_prod = 7'b0000001;
                end
            57: begin 
                ones_prod = 7'b0001111;
                tens_prod = 7'b0100100;
                hund_prod = 7'b0000001;
                end
            58: begin 
                ones_prod = 7'b0000000;
                tens_prod = 7'b0100100;
                hund_prod = 7'b0000001;
                end
            59: begin 
                ones_prod = 7'b0000100;
                tens_prod = 7'b0100100;
                hund_prod = 7'b0000001;
                end
            60: begin 
                ones_prod = 7'b0000001;
                tens_prod = 7'b0100000;
                hund_prod = 7'b0000001;
                end
            61: begin 
                ones_prod = 7'b1001111;
                tens_prod = 7'b0100000;
                hund_prod = 7'b0000001;
                end
            62: begin 
                ones_prod = 7'b0010010;
                tens_prod = 7'b0100000;
                hund_prod = 7'b0000001;
                end
            63: begin 
                ones_prod = 7'b0000110;
                tens_prod = 7'b0100000;
                hund_prod = 7'b0000001;
                end
            64: begin 
                ones_prod = 7'b1001100;
                tens_prod = 7'b0100000;
                hund_prod = 7'b0000001;
                end
            65: begin 
                ones_prod = 7'b0100100;
                tens_prod = 7'b0100000;
                hund_prod = 7'b0000001;
                end
            66: begin 
                ones_prod = 7'b0100000;
                tens_prod = 7'b0100000;
                hund_prod = 7'b0000001;
                end
            67: begin 
                ones_prod = 7'b0001111;
                tens_prod = 7'b0100000;
                hund_prod = 7'b0000001;
                end
            68: begin 
                ones_prod = 7'b0000000;
                tens_prod = 7'b0100000;
                hund_prod = 7'b0000001;
                end
            69: begin 
                ones_prod = 7'b0000100;
                tens_prod = 7'b0100000;
                hund_prod = 7'b0000001;
                end
            70: begin 
                ones_prod = 7'b0000001;
                tens_prod = 7'b0001111;
                hund_prod = 7'b0000001;
                end
            71: begin 
                ones_prod = 7'b1001111;
                tens_prod = 7'b0001111;
                hund_prod = 7'b0000001;
                end
            72: begin 
                ones_prod = 7'b0010010;
                tens_prod = 7'b0001111;
                hund_prod = 7'b0000001;
                end
            73: begin 
                ones_prod = 7'b0000110;
                tens_prod = 7'b0001111;
                hund_prod = 7'b0000001;
                end
            74: begin 
                ones_prod = 7'b1001100;
                tens_prod = 7'b0001111;
                hund_prod = 7'b0000001;
                end
            75: begin 
                ones_prod = 7'b0100100;
                tens_prod = 7'b0001111;
                hund_prod = 7'b0000001;
                end
            76: begin 
                ones_prod = 7'b0100000;
                tens_prod = 7'b0001111;
                hund_prod = 7'b0000001;
                end
            77: begin 
                ones_prod = 7'b0001111;
                tens_prod = 7'b0001111;
                hund_prod = 7'b0000001;
                end
            78: begin 
                ones_prod = 7'b0000000;
                tens_prod = 7'b0001111;
                hund_prod = 7'b0000001;
                end
            79: begin 
                ones_prod = 7'b0000100;
                tens_prod = 7'b0001111;
                hund_prod = 7'b0000001;
                end
            80: begin 
                ones_prod = 7'b0000001;
                tens_prod = 7'b0000000;
                hund_prod = 7'b0000001;
                end
            81: begin 
                ones_prod = 7'b1001111;
                tens_prod = 7'b0000000;
                hund_prod = 7'b0000001;
                end
            82: begin 
                ones_prod = 7'b0010010;
                tens_prod = 7'b0000000;
                hund_prod = 7'b0000001;
                end
            83: begin 
                ones_prod = 7'b0000110;
                tens_prod = 7'b0000000;
                hund_prod = 7'b0000001;
                end
            84: begin 
                ones_prod = 7'b1001100;
                tens_prod = 7'b0000000;
                hund_prod = 7'b0000001;
                end
            85: begin 
                ones_prod = 7'b0100100;
                tens_prod = 7'b0000000;
                hund_prod = 7'b0000001;
                end
            86: begin 
                ones_prod = 7'b0100000;
                tens_prod = 7'b0000000;
                hund_prod = 7'b0000001;
                end
            87: begin 
                ones_prod = 7'b0001111;
                tens_prod = 7'b0000000;
                hund_prod = 7'b0000001;
                end
            88: begin 
                ones_prod = 7'b0000000;
                tens_prod = 7'b0000000;
                hund_prod = 7'b0000001;
                end
            89: begin 
                ones_prod = 7'b0000100;
                tens_prod = 7'b0000000;
                hund_prod = 7'b0000001;
                end
            90: begin 
                ones_prod = 7'b0000001;
                tens_prod = 7'b0000100;
                hund_prod = 7'b0000001;
                end
            91: begin 
                ones_prod = 7'b1001111;
                tens_prod = 7'b0000100;
                hund_prod = 7'b0000001;
                end
            92: begin 
                ones_prod = 7'b0010010;
                tens_prod = 7'b0000100;
                hund_prod = 7'b0000001;
                end
            93: begin 
                ones_prod = 7'b0000110;
                tens_prod = 7'b0000100;
                hund_prod = 7'b0000001;
                end
            94: begin 
                ones_prod = 7'b1001100;
                tens_prod = 7'b0000100;
                hund_prod = 7'b0000001;
                end
            95: begin 
                ones_prod = 7'b0100100;
                tens_prod = 7'b0000100;
                hund_prod = 7'b0000001;
                end
            96: begin 
                ones_prod = 7'b0100000;
                tens_prod = 7'b0000100;
                hund_prod = 7'b0000001;
                end
            97: begin 
                ones_prod = 7'b0001111;
                tens_prod = 7'b0000100;
                hund_prod = 7'b0000001;
                end
            98: begin 
                ones_prod = 7'b0000000;
                tens_prod = 7'b0000100;
                hund_prod = 7'b0000001;
                end
            99: begin 
                ones_prod = 7'b0000100;
                tens_prod = 7'b0000100;
                hund_prod = 7'b0000001;
                end
            100: begin 
                ones_prod = 7'b0000001;
                tens_prod = 7'b0000001;
                hund_prod = 7'b1001111;
                end
            101: begin 
                ones_prod = 7'b1001111;
                tens_prod = 7'b0000001;
                hund_prod = 7'b1001111;
                end
            102: begin 
                ones_prod = 7'b0010010;
                tens_prod = 7'b0000001;
                hund_prod = 7'b1001111;
                end
            103: begin 
                ones_prod = 7'b0000110;
                tens_prod = 7'b0000001;
                hund_prod = 7'b1001111;
                end
            104: begin 
                ones_prod = 7'b1001100;
                tens_prod = 7'b0000001;
                hund_prod = 7'b1001111;
                end
            105: begin 
                ones_prod = 7'b0100100;
                tens_prod = 7'b0000001;
                hund_prod = 7'b1001111;
                end
            106: begin 
                ones_prod = 7'b0100000;
                tens_prod = 7'b0000001;
                hund_prod = 7'b1001111;
                end
            107: begin 
                ones_prod = 7'b0001111;
                tens_prod = 7'b0000001;
                hund_prod = 7'b1001111;
                end
            108: begin 
                ones_prod = 7'b0000000;
                tens_prod = 7'b0000001;
                hund_prod = 7'b1001111;
                end
            109: begin 
                ones_prod = 7'b0000100;
                tens_prod = 7'b0000001;
                hund_prod = 7'b1001111;
                end
            110: begin 
                ones_prod = 7'b0000001;
                tens_prod = 7'b1001111;
                hund_prod = 7'b1001111;
                end
            111: begin 
                ones_prod = 7'b1001111;
                tens_prod = 7'b1001111;
                hund_prod = 7'b1001111;
                end
            112: begin 
                ones_prod = 7'b0010010;
                tens_prod = 7'b1001111;
                hund_prod = 7'b1001111;
                end
            113: begin 
                ones_prod = 7'b0000110;
                tens_prod = 7'b1001111;
                hund_prod = 7'b1001111;
                end
            114: begin 
                ones_prod = 7'b1001100;
                tens_prod = 7'b1001111;
                hund_prod = 7'b1001111;
                end
            115: begin 
                ones_prod = 7'b0100100;
                tens_prod = 7'b1001111;
                hund_prod = 7'b1001111;
                end
            116: begin 
                ones_prod = 7'b0100000;
                tens_prod = 7'b1001111;
                hund_prod = 7'b1001111;
                end
            117: begin 
                ones_prod = 7'b0001111;
                tens_prod = 7'b1001111;
                hund_prod = 7'b1001111;
                end
            118: begin 
                ones_prod = 7'b0000000;
                tens_prod = 7'b1001111;
                hund_prod = 7'b1001111;
                end
            119: begin 
                ones_prod = 7'b0000100;
                tens_prod = 7'b1001111;
                hund_prod = 7'b1001111;
                end
            120: begin 
                ones_prod = 7'b0000001;
                tens_prod = 7'b0010010;
                hund_prod = 7'b1001111;
                end
            121: begin 
                ones_prod = 7'b1001111;
                tens_prod = 7'b0010010;
                hund_prod = 7'b1001111;
                end
            122: begin 
                ones_prod = 7'b0010010;
                tens_prod = 7'b0010010;
                hund_prod = 7'b1001111;
                end
            123: begin 
                ones_prod = 7'b0000110;
                tens_prod = 7'b0010010;
                hund_prod = 7'b1001111;
                end
            124: begin 
                ones_prod = 7'b1001100;
                tens_prod = 7'b0010010;
                hund_prod = 7'b1001111;
                end
            125: begin 
                ones_prod = 7'b0100100;
                tens_prod = 7'b0010010;
                hund_prod = 7'b1001111;
                end
            126: begin 
                ones_prod = 7'b0100000;
                tens_prod = 7'b0010010;
                hund_prod = 7'b1001111;
                end
            127: begin 
                ones_prod = 7'b0001111;
                tens_prod = 7'b0010010;
                hund_prod = 7'b1001111;
                end
            128: begin 
                ones_prod = 7'b0000000;
                tens_prod = 7'b0010010;
                hund_prod = 7'b1001111;
                end
            129: begin 
                ones_prod = 7'b0000100;
                tens_prod = 7'b0010010;
                hund_prod = 7'b1001111;
                end
            130: begin 
                ones_prod = 7'b0000001;
                tens_prod = 7'b0000110;
                hund_prod = 7'b1001111;
                end
            131: begin 
                ones_prod = 7'b1001111;
                tens_prod = 7'b0000110;
                hund_prod = 7'b1001111;
                end
            132: begin
                ones_prod = 7'b0010010;
                tens_prod = 7'b0000110;
                hund_prod = 7'b1001111;
                end 
            133: begin 
                ones_prod = 7'b0000110;
                tens_prod = 7'b0000110;
                hund_prod = 7'b1001111;
                end
            134: begin 
                ones_prod = 7'b1001100;
                tens_prod = 7'b0000110;
                hund_prod = 7'b1001111;
                end
            135: begin 
                ones_prod = 7'b0100100;
                tens_prod = 7'b0000110;
                hund_prod = 7'b1001111;
                end
            136: begin 
                ones_prod = 7'b0100000;
                tens_prod = 7'b0000110;
                hund_prod = 7'b1001111;
                end
            137: begin 
                ones_prod = 7'b0001111;
                tens_prod = 7'b0000110;
                hund_prod = 7'b1001111;
                end
            138: begin 
                ones_prod = 7'b0000000;
                tens_prod = 7'b0000110;
                hund_prod = 7'b1001111;
                end
            139: begin 
                ones_prod = 7'b0000100;
                tens_prod = 7'b0000110;
                hund_prod = 7'b1001111;
                end
            140: begin 
                ones_prod = 7'b0000001;
                tens_prod = 7'b1001100;
                hund_prod = 7'b1001111;
                end
            141: begin 
                ones_prod = 7'b1001111;
                tens_prod = 7'b1001100;
                hund_prod = 7'b1001111;
                end
            142: begin 
                ones_prod = 7'b0010010;
                tens_prod = 7'b1001100;
                hund_prod = 7'b1001111;
                end
            143: begin 
                ones_prod = 7'b0000110;
                tens_prod = 7'b1001100;
                hund_prod = 7'b1001111;
                end
            144: begin 
            ones_prod = 7'b1001100;
            tens_prod = 7'b1001100;
            hund_prod = 7'b1001111;
            end
            145: begin 
            ones_prod = 7'b0100100;
            tens_prod = 7'b1001100;
            hund_prod = 7'b1001111;
            end
            146: begin 
            ones_prod = 7'b0100000;
            tens_prod = 7'b1001100;
            hund_prod = 7'b1001111;
            end
            147: begin 
            ones_prod = 7'b0001111;
            tens_prod = 7'b1001100;
            hund_prod = 7'b1001111;
            end
            148: begin 
            ones_prod = 7'b0000000;
            tens_prod = 7'b1001100;
            hund_prod = 7'b1001111;
            end
            149: begin 
            ones_prod = 7'b0000100;
            tens_prod = 7'b1001100;
            hund_prod = 7'b1001111;
            end
            150: begin 
            ones_prod = 7'b0000001;
            tens_prod = 7'b0100100;
            hund_prod = 7'b1001111;
            end
            151: begin 
            ones_prod = 7'b1001111;
            tens_prod = 7'b0100100;
            hund_prod = 7'b1001111;
            end
            152: begin 
            ones_prod = 7'b0010010;
            tens_prod = 7'b0100100;
            hund_prod = 7'b1001111;
            end
            153: begin 
            ones_prod = 7'b0000110;
            tens_prod = 7'b0100100;
            hund_prod = 7'b1001111;
            end
            154: begin 
            ones_prod = 7'b1001100;
            tens_prod = 7'b0100100;
            hund_prod = 7'b1001111;
            end
            155: begin 
            ones_prod = 7'b0100100;
            tens_prod = 7'b0100100;
            hund_prod = 7'b1001111;
            end
            156: begin 
            ones_prod = 7'b0100000;
            tens_prod = 7'b0100100;
            hund_prod = 7'b1001111;
            end
            157: begin 
            ones_prod = 7'b0001111;
            tens_prod = 7'b0100100;
            hund_prod = 7'b1001111;
            end
            158: begin 
            ones_prod = 7'b0000000;
            tens_prod = 7'b0100100;
            hund_prod = 7'b1001111;
            end
            159: begin 
            ones_prod = 7'b0000100;
            tens_prod = 7'b0100100;
            hund_prod = 7'b1001111;
            end
            160: begin 
            ones_prod = 7'b0000001;
            tens_prod = 7'b0100000;
            hund_prod = 7'b1001111;
            end
            161: begin
            ones_prod = 7'b1001111;
            tens_prod = 7'b0100000;
            hund_prod = 7'b1001111;
            end 
            162: begin 
            ones_prod = 7'b0010010;
            tens_prod = 7'b0100000;
            hund_prod = 7'b1001111;
            end
            163: begin 
            ones_prod = 7'b0000110;
            tens_prod = 7'b0100000;
            hund_prod = 7'b1001111;
            end
            164: begin 
            ones_prod = 7'b1001100;
            tens_prod = 7'b0100000;
            hund_prod = 7'b1001111;
            end
            165: begin 
            ones_prod = 7'b0100100;
            tens_prod = 7'b0100000;
            hund_prod = 7'b1001111;
            end
            166: begin 
            ones_prod = 7'b0100000;
            tens_prod = 7'b0100000;
            hund_prod = 7'b1001111;
            end
            167: begin 
            ones_prod = 7'b0001111;
            tens_prod = 7'b0100000;
            hund_prod = 7'b1001111;
            end
            168: begin 
            ones_prod = 7'b0000000;
            tens_prod = 7'b0100000;
            hund_prod = 7'b1001111;
            end
            169: begin 
            ones_prod = 7'b0000100;
            tens_prod = 7'b0100000;
            hund_prod = 7'b1001111;
            end
            170: begin 
            ones_prod = 7'b0000001;
            tens_prod = 7'b0001111;
            hund_prod = 7'b1001111;
            end
            171: begin 
            ones_prod = 7'b1001111;
            tens_prod = 7'b0001111;
            hund_prod = 7'b1001111;
            end
            172: begin 
            ones_prod = 7'b0010010;
            tens_prod = 7'b0001111;
            hund_prod = 7'b1001111;
            end
            173: begin 
            ones_prod = 7'b0000110;
            tens_prod = 7'b0001111;
            hund_prod = 7'b1001111;
            end
            174: begin 
            ones_prod = 7'b1001100;
            tens_prod = 7'b0001111;
            hund_prod = 7'b1001111;
            end
            175: begin 
            ones_prod = 7'b0100100;
            tens_prod = 7'b0001111;
            hund_prod = 7'b1001111;
            end
            176: begin 
            ones_prod = 7'b0100000;
            tens_prod = 7'b0001111;
            hund_prod = 7'b1001111;
            end
            177: begin 
            ones_prod = 7'b0001111;
            tens_prod = 7'b0001111;
            hund_prod = 7'b1001111;
            end
            178: begin 
            ones_prod = 7'b0000000;
            tens_prod = 7'b0001111;
            hund_prod = 7'b1001111;
            end
            179: begin 
            ones_prod = 7'b0000100;
            tens_prod = 7'b0001111;
            hund_prod = 7'b1001111;
            end
            180: begin 
            ones_prod = 7'b0000001;
            tens_prod = 7'b0000000;
            hund_prod = 7'b1001111;
            end
            181: begin 
            ones_prod = 7'b1001111;
            tens_prod = 7'b0000000;
            hund_prod = 7'b1001111;
            end
            182: begin 
            ones_prod = 7'b0010010;
            tens_prod = 7'b0000000;
            hund_prod = 7'b1001111;
            end
            183: begin 
            ones_prod = 7'b0000110;
            tens_prod = 7'b0000000;
            hund_prod = 7'b1001111;
            end
            184: begin 
            ones_prod = 7'b1001100;
            tens_prod = 7'b0000000;
            hund_prod = 7'b1001111;
            end
            185: begin 
            ones_prod = 7'b0100100;
            tens_prod = 7'b0000000;
            hund_prod = 7'b1001111;
            end
            186: begin 
            ones_prod = 7'b0100000;
            tens_prod = 7'b0000000;
            hund_prod = 7'b1001111;
            end
            187: begin 
            ones_prod = 7'b0001111;
            tens_prod = 7'b0000000;
            hund_prod = 7'b1001111;
            end
            188: begin 
            ones_prod = 7'b0000000;
            tens_prod = 7'b0000000;
            hund_prod = 7'b1001111;
            end
            189: begin 
            ones_prod = 7'b0000100;
            tens_prod = 7'b0000000;
            hund_prod = 7'b1001111;
            end
            190: begin 
            ones_prod = 7'b0000001;
            tens_prod = 7'b0000100;
            hund_prod = 7'b1001111;
            end
            191: begin 
            ones_prod = 7'b1001111;
            tens_prod = 7'b0000100;
            hund_prod = 7'b1001111;
            end
            192: begin 
            ones_prod = 7'b0010010;
            tens_prod = 7'b0000100;
            hund_prod = 7'b1001111;
            end
            193: begin 
            ones_prod = 7'b0000110;
            tens_prod = 7'b0000100;
            hund_prod = 7'b1001111;
            end
            194: begin 
            ones_prod = 7'b1001100;
            tens_prod = 7'b0000100;
            hund_prod = 7'b1001111;
            end
            195: begin 
            ones_prod = 7'b0100100;
            tens_prod = 7'b0000100;
            hund_prod = 7'b1001111;
            end
            196: begin 
            ones_prod = 7'b0100000;
            tens_prod = 7'b0000100;
            hund_prod = 7'b1001111;
            end
            197: begin 
            ones_prod = 7'b0001111;
            tens_prod = 7'b0000100;
            hund_prod = 7'b1001111;
            end
            198: begin 
            ones_prod = 7'b0000000;
            tens_prod = 7'b0000100;
            hund_prod = 7'b1001111;
            end
            199: begin 
            ones_prod = 7'b0000100;
            tens_prod = 7'b0000100;
            hund_prod = 7'b1001111;
            end
            200: begin 
            ones_prod = 7'b0000001;
            tens_prod = 7'b0000001;
            hund_prod = 7'b0010010;
            end
            201: begin 
            ones_prod = 7'b1001111;
            tens_prod = 7'b0000001;
            hund_prod = 7'b0010010;
            end
            202: begin 
            ones_prod = 7'b0010010;
            tens_prod = 7'b0000001;
            hund_prod = 7'b0010010;
            end
            203: begin 
            ones_prod = 7'b0000110;
            tens_prod = 7'b0000001;
            hund_prod = 7'b0010010;
            end
            204: begin 
            ones_prod = 7'b1001100;
            tens_prod = 7'b0000001;
            hund_prod = 7'b0010010;
            end
            205: begin 
            ones_prod = 7'b0100100;
            tens_prod = 7'b0000001;
            hund_prod = 7'b0010010;
            end
            206: begin 
            ones_prod = 7'b0100000;
            tens_prod = 7'b0000001;
            hund_prod = 7'b0010010;
            end
            207: begin 
            ones_prod = 7'b0001111;
            tens_prod = 7'b0000001;
            hund_prod = 7'b0010010;
            end
            208: begin 
            ones_prod = 7'b0000000;
            tens_prod = 7'b0000001;
            hund_prod = 7'b0010010;
            end
            209: begin 
            ones_prod = 7'b0000100;
            tens_prod = 7'b0000001;
            hund_prod = 7'b0010010;
            end
            210: begin 
            ones_prod = 7'b0000001;
            tens_prod = 7'b1001111;
            hund_prod = 7'b0010010;
            end
            211: begin 
            ones_prod = 7'b1001111;
            tens_prod = 7'b1001111;
            hund_prod = 7'b0010010;
            end
            212: begin 
            ones_prod = 7'b0010010;
            tens_prod = 7'b1001111;
            hund_prod = 7'b0010010;
            end
            213: begin 
            ones_prod = 7'b0000110;
            tens_prod = 7'b1001111;
            hund_prod = 7'b0010010;
            end
            214: begin 
            ones_prod = 7'b1001100;
            tens_prod = 7'b1001111;
            hund_prod = 7'b0010010;
            end
            215: begin 
            ones_prod = 7'b0100100;
            tens_prod = 7'b1001111;
            hund_prod = 7'b0010010;
            end
            216: begin 
            ones_prod = 7'b0100000;
            tens_prod = 7'b1001111;
            hund_prod = 7'b0010010;
            end
            217: begin 
            ones_prod = 7'b0001111;
            tens_prod = 7'b1001111;
            hund_prod = 7'b0010010;
            end
            218: begin 
            ones_prod = 7'b0000000;
            tens_prod = 7'b1001111;
            hund_prod = 7'b0010010;
            end
            219: begin 
            ones_prod = 7'b0000100;
            tens_prod = 7'b1001111;
            hund_prod = 7'b0010010;
            end
            220: begin 
            ones_prod = 7'b0000001;
            tens_prod = 7'b0010010;
            hund_prod = 7'b0010010;
            end
            221: begin 
            ones_prod = 7'b1001111;
            tens_prod = 7'b0010010;
            hund_prod = 7'b0010010;
            end
            222: begin 
            ones_prod = 7'b0010010;
            tens_prod = 7'b0010010;
            hund_prod = 7'b0010010;
            end
            223: begin 
            ones_prod = 7'b0000110;
            tens_prod = 7'b0010010;
            hund_prod = 7'b0010010;
            end
            224: begin 
            ones_prod = 7'b1001100;
            tens_prod = 7'b0010010;
            hund_prod = 7'b0010010;
            end
            225: begin 
            ones_prod = 7'b0100100;
            tens_prod = 7'b0010010;
            hund_prod = 7'b0010010;
            end
            226: begin 
            ones_prod = 7'b0100000;
            tens_prod = 7'b0010010;
            hund_prod = 7'b0010010;
            end
            227: begin 
            ones_prod = 7'b0001111;
            tens_prod = 7'b0010010;
            hund_prod = 7'b0010010;
            end
            228: begin 
            ones_prod = 7'b0000000;
            tens_prod = 7'b0010010;
            hund_prod = 7'b0010010;
            end
            229: begin 
            ones_prod = 7'b0000100;
            tens_prod = 7'b0010010;
            hund_prod = 7'b0010010;
            end
            230: begin 
            ones_prod = 7'b0000001;
            tens_prod = 7'b0000110;
            hund_prod = 7'b0010010;
            end
            231: begin 
            ones_prod = 7'b1001111;
            tens_prod = 7'b0000110;
            hund_prod = 7'b0010010;
            end
            232: begin 
            ones_prod = 7'b0010010;
            tens_prod = 7'b0000110;
            hund_prod = 7'b0010010;
            end
            233: begin 
            ones_prod = 7'b0000110;
            tens_prod = 7'b0000110;
            hund_prod = 7'b0010010;
            end
            234: begin 
            ones_prod = 7'b1001100;
            tens_prod = 7'b0000110;
            hund_prod = 7'b0010010;
            end
            235: begin 
            ones_prod = 7'b0100100;
            tens_prod = 7'b0000110;
            hund_prod = 7'b0010010;
            end
            236: begin 
            ones_prod = 7'b0100000;
            tens_prod = 7'b0000110;
            hund_prod = 7'b0010010;
            end
            237: begin 
            ones_prod = 7'b0001111;
            tens_prod = 7'b0000110;
            hund_prod = 7'b0010010;
            end
            238: begin 
            ones_prod = 7'b0000000;
            tens_prod = 7'b0000110;
            hund_prod = 7'b0010010;
            end
            239: begin 
            ones_prod = 7'b0000100;
            tens_prod = 7'b0000110;
            hund_prod = 7'b0010010;
            end
            240: begin 
            ones_prod = 7'b0000001;
            tens_prod = 7'b1001100;
            hund_prod = 7'b0010010;
            end
            241: begin 
            ones_prod = 7'b1001111;
            tens_prod = 7'b1001100;
            hund_prod = 7'b0010010;
            end
            242: begin 
            ones_prod = 7'b0010010;
            tens_prod = 7'b1001100;
            hund_prod = 7'b0010010;
            end
            243: begin 
            ones_prod = 7'b0000110;
            tens_prod = 7'b1001100;
            hund_prod = 7'b0010010;
            end
            244: begin 
            ones_prod = 7'b1001100;
            tens_prod = 7'b1001100;
            hund_prod = 7'b0010010;
            end
            245: begin 
            ones_prod = 7'b0100100;
            tens_prod = 7'b1001100;
            hund_prod = 7'b0010010;
            end
            246: begin 
            ones_prod = 7'b0100000;
            tens_prod = 7'b1001100;
            hund_prod = 7'b0010010;
            end
            247: begin 
            ones_prod = 7'b0001111;
            tens_prod = 7'b1001100;
            hund_prod = 7'b0010010;
            end
            248: begin 
            ones_prod = 7'b0000000;
            tens_prod = 7'b1001100;
            hund_prod = 7'b0010010;
            end
            249: begin 
            ones_prod = 7'b0000100;
            tens_prod = 7'b1001100;
            hund_prod = 7'b0010010;
            end
            250: begin 
            ones_prod = 7'b0000001;
            tens_prod = 7'b0100100;
            hund_prod = 7'b0010010;
            end
            251: begin 
            ones_prod = 7'b1001111;
            tens_prod = 7'b0100100;
            hund_prod = 7'b0010010;
            end
            252: begin 
            ones_prod = 7'b0010010;
            tens_prod = 7'b0100100;
            hund_prod = 7'b0010010;
            end
            253: begin 
            ones_prod = 7'b0000110;
            tens_prod = 7'b0100100;
            hund_prod = 7'b0010010;
            end
            254: begin 
            ones_prod = 7'b1001100;
            tens_prod = 7'b0100100;
            hund_prod = 7'b0010010;
            end
            255: begin 
            ones_prod = 7'b0100100;
            tens_prod = 7'b0100100;
            hund_prod = 7'b0010010;
            end
            default: begin
            ones_prod = 7'b1111111;
            tens_prod = 7'b1111111;
            hund_prod = 7'b1111111;
            end
        endcase
    end
    
    
    always @(posedge divided_clk) begin // refresh rate for seven segment
        case(TurnOn)
            8'b11111110: begin
                TurnOn <= 8'b11111101;
                seg_out <= ones_prod;
                end
            8'b11111101: begin
                TurnOn <= 8'b11111011;
                seg_out <= tens_prod;
                end
            8'b11111011: begin
                TurnOn <= 8'b11111110;
                seg_out <= hund_prod;
                end
            default: TurnOn = 8'b11111110;
        endcase
    end
    
    /*always @* begin // display seven segment digit
        case(TurnOn)
            8'b11111110: seg_out = ones_prod;
            8'b11111101: seg_out = tens_prod;
            8'b11111011: seg_out = hund_prod;
        endcase
    end*/
endmodule
