`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/25/2024 11:18:16 AM
// Design Name: 
// Module Name: lab2_task4
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


module lab2_task4(
    input a, b, cin,
    output s, cout
    );
    
    assign s = (a ^ b ^ cin);
    assign cout = (a & b) | (cin & (a ^ b));
    
endmodule

module lab2_task4_part2(
    input [3:0] a, b,
    input cin,
    output [3:0] s,
    output cout
    );
    
    wire w1, w2, w3;
    
    lab2_task4 f1(a[0], b[0], cin, s[0], w1);
    lab2_task4 f2(a[1], b[1], w1, s[1], w2);
    lab2_task4 f3(a[2], b[2], w2, s[2], w3);
    lab2_task4 f4(a[3], b[3], w3, s[3], cout);
    
endmodule


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: fulladder_dataflow_tb
//////////////////////////////////////////////////////////////////////////////////

module fulladder_dataflow_tb(
    );
    
    reg a, b, cin;
	wire cout, s;
    
    lab2_task4_part2 DUT (.a(a), .b(b), .cin(cin), .cout(cout), .s(s));
    
 
    initial
    begin
      a = 0; b = 0; cin = 0;
	#10 a = 1;
	#10 b = 1; a = 0;
	#10 a = 1;
	#10 cin = 1; a = 0; b = 0;
	#10 a = 1;
	#10 b = 1; a = 0;
	#10 a = 1;
	#10;
    end

endmodule
