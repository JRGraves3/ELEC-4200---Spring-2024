`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2024 04:42:06 PM
// Design Name: 
// Module Name: task2
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


module task2(
    input CLK100MHZ, reset,
    output reg [2:0] NS_signal, WE_signal
    );
    wire divided_clk; //switch;
   // reg [1:0] redTNS, redTWE, greenTNS, greenTWE;
   // reg yellowTNS, yellowTWE;
    reg [4:0] OnTime = 0;
    parameter all_red = 4, yellow = 2, green = 1;
    
    clock_divider A(.CLK100MHZ(CLK100MHZ), .divided_clk(divided_clk));
    
    initial begin
        NS_signal = all_red;
        WE_signal = green;
    end
    
    always @(posedge divided_clk or posedge reset) begin //NS driver
        if (OnTime == 10) OnTime <= 0;
        if (reset) begin
            OnTime <= 0;
            NS_signal <= all_red;
            WE_signal <= green;
        end else begin
            case (OnTime)
                0       : begin
                          OnTime = OnTime + 1;
                          NS_signal = all_red;
                          WE_signal = green;
                          end
                1       : begin
                          OnTime = OnTime + 1;
                          NS_signal = all_red;
                          WE_signal = green;
                          end
                2       : begin
                          OnTime = OnTime + 1;
                          NS_signal = all_red;
                          WE_signal = green;
                          end
                3       : begin
                          OnTime = OnTime + 1;
                          NS_signal = all_red;
                          WE_signal = yellow;
                          end
                4       : begin
                          OnTime = OnTime + 1;
                          NS_signal = all_red;
                          WE_signal = all_red;
                          end
                5       : begin
                          OnTime = OnTime + 1;
                          NS_signal = green;
                          WE_signal = all_red;
                          end
                6       : begin
                          OnTime = OnTime + 1;
                          NS_signal = green;
                          WE_signal = all_red;
                          end
                7       : begin
                          OnTime = OnTime + 1;
                          NS_signal = green;
                          WE_signal = all_red;
                          end
                8       : begin
                          OnTime = OnTime + 1;
                          NS_signal = yellow;
                          WE_signal = all_red;
                          end
                9       : begin
                          OnTime = OnTime + 1;
                          NS_signal = all_red;
                          WE_signal = all_red;
                          end
                default : begin
                          OnTime = 0;
                          NS_signal = all_red;
                          WE_signal = green;
                          end
               /* green   : begin
                          
                          end
                yellow  : begin
                          
                          end
                all_red : begin
                          
                          end */
            endcase
        end
    end
    
    /*always @(posedge divided_clk or posedge reset) begin //WE driver
        if (reset) WE_signal <= green;
        else begin
            
        end
    end
    
    always @(posedge divided_clk or posedge reset) begin //OnTime counter and reset
        if (reset || OnTime == 7) OnTime <= 0;
        else OnTime <= OnTime + 1;
    end*/
endmodule
