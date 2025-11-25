`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/25/2024 10:37:09 AM
// Design Name: 
// Module Name: lab2_task2
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


module lab2_task2(
    input [3:0] v,
    output reg z,
    output reg [3:0] m,
    output reg [6:0] Out,
    output TurnOn);
    
    assign TurnOn = 1'b0;
    
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
        /*case(v)
            4'b0000 :   Out = 7'b0000001; // 0 
            4'b0001 :   Out = 7'b1001111; // 1 
            4'b0010 :   Out = 7'b0010010; // 2 
            4'b0011 :   Out = 7'b0000110; // 3 
            4'b0100 :   Out = 7'b1001100; // 4 
            4'b0101 :   Out = 7'b0100100; // 5 
            4'b0110 :   Out = 7'b0100000; // 6 
            4'b0111 :   Out = 7'b0001111; // 7 
            4'b1000 :   Out = 7'b0000000; // 8 
            4'b1001 :   Out = 7'b0000100; // 9
          */  
endmodule


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: lab2_2_1_partA_tb
//////////////////////////////////////////////////////////////////////////////////

module lab2_2_1_partA_tb(
    );
    
    reg [3:0] v;
	wire z;
	integer k;
    wire [3:0] m_out;
    
    lab2_task2 DUT (.v(v), .z(z), .m_out(m_out));
    
 
    initial
    begin
      v = 0;
	for(k=0; k < 16; k=k+1)
		#10 v = k;
	#20;
    end

endmodule
