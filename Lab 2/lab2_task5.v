`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/25/2024 12:35:38 PM
// Design Name: 
// Module Name: lab2_task5
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


module lab2_task5(
    input a, b, cin,
    output s, cout
//    output [7:0] TurnOn,
//    output reg [6:0] Out,
//    output reg [3:0] m
    );
    
//    assign TurnOn = 8'b11111110;
    
    assign s = (a ^ b ^ cin);
    assign cout = (a & b) | (cin & (a ^ b));
    
    
endmodule

module lab2_task5_add(
    input [3:0] a, b,
    input cin,
    output [3:0] s,
    output cout,
    output [6:0] Out,
    output [7:0] TurnOn
    );
    
    wire w1, w2, w3;
    
    assign TurnOn = 8'b11111110;
    
    lab2_task5 f1(.a(a[0]), .b(b[0]), .cin(cin), .s(s[0]), .cout(w1));
    lab2_task5 f2(.a(a[1]), .b(b[1]), .cin(w1), .s(s[1]), .cout(w2));
    lab2_task5 f3(.a(a[2]), .b(b[2]), .cin(w2), .s(s[2]), .cout(w3));
    lab2_task5 f4(.a(a[3]), .b(b[3]), .cin(w3), .s(s[3]), .cout(cout));
    
    lab2_task5_LED f5(.v(s), .z(1'bx), .m(4'bx), .Out(Out));
endmodule

module lab2_task5_LED(
    input [3:0] v,
    output reg z,
    output reg [3:0] m,
    output reg [6:0] Out
    );
    
    always @ * begin
        if(v >= 4'b1010) begin
            z = 1'b1;
            case(v)
                4'b1010 :   m = 4'b0000; // 0 
                4'b1011 :   m = 4'b0001; // 1 
                4'b1100 :   m = 4'b0010; // 2 
                4'b1101 :   m = 4'b0011; // 3 
                4'b1110 :   m = 4'b0100; // 4 
                default :   m = 4'b0101; // 5
            endcase
        end else begin
            m = v;
            z = 1'b0;
        end
        if (m == 4'b0000) begin
            Out = 7'b0000001; // 0
        end else if(m == 4'b0001) begin
            Out = 7'b1001111; // 1
        end else if(m == 4'b0010) begin
            Out = 7'b0010010; // 2
        end else if(m == 4'b0011) begin
            Out = 7'b0000110; // 3
        end else if(m == 4'b0100) begin
            Out = 7'b1001100; // 4
        end else if(m == 4'b0101) begin
            Out = 7'b0100100; // 5
        end else if(m == 4'b0110) begin
            Out = 7'b0100000; // 6
        end else if(m == 4'b0111) begin
            Out = 7'b0001111; // 7
        end else if(m == 4'b1000) begin
            Out = 7'b0000000; // 8
        end else if(m == 4'b1001) begin
            Out = 7'b0000100;
        end
    end
endmodule

module L2T5tb(

    );
    
    reg [3:0] a, b;
    reg cin;
    wire [6:0] control;
    wire [7:0] TurnOn;
    wire z;
    
    integer i, k; 
    
    lab2_task5_add DUT (.a(a), .b(b), .cin(cin), .control(control), .TurnOn(TurnOn), .z(z));
    
    initial begin
        a = 0; b = 0; cin = 0;
        for (i = 0; i < 10; i = i + 1)
            #10 a = i;
        for (k = 0; k < 10; k = k + 1)
            #10 b = k;
        #10 cin = 1;
    end
endmodule