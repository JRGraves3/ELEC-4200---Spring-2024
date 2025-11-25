`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2024 02:17:20 PM
// Design Name: 
// Module Name: mealy_sm
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


module mealy_sm(
    input clk, reset, ain,
    output reg [3:0] count,
    output reg yout,
    output reg [1:0] state);
    
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
    reg [1:0] next_state;
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= S0;
            count <= 4'b0;
           // yout <= 1'b0;
        end else begin
            state <= next_state;
            if (ain) count <= count + 1'b1;
        end
    end
    
    always @(state or ain) begin
        
        case(state)
            S0      : begin if(ain) begin
                      next_state = S1;
                     // count = 1'b1 + count;
                      end end
            S1      : begin if(ain) begin
                      next_state = S2;
                     // count = 1'b1 + count;
                      end end
            S2      : begin if(ain) begin
                      next_state = S3;
                     // count = 1'b1 + count;
                      end else next_state = S2; end
            S3      : begin if(ain) begin
                      next_state = S1;
                     // count = 1'b1 + count;
                      end else next_state = S3; end
            default : next_state = S0;
        endcase
    end
    
    always @(state or ain) begin
        case(state)
            S0      : begin if(!ain) yout = 1;
                      else yout = 0; end
            S3      : begin if(ain) yout = 1;
                      else yout = 0; end
            S2      : yout = 0;
            S1      : yout = 0;
            default : yout = 0;
        endcase
        /*if(count % 3 == 0) yout <= 1'b1;
        if(count % 3 != 0) yout <= 1'b0;*/
    end
endmodule
