`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2024 04:06:24 PM
// Design Name: 
// Module Name: task1
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


module task1(
    input CLK100MHZ, reset,
    output reg [1:0] NS_signal, WE_signal
    );
    wire div_clk;
    //reg switch;
    reg [1:0] OnTime;
    parameter red = 2, green = 1;
    
    clock_divider A(.CLK100MHZ(CLK100MHZ), .divided_clk(div_clk));
    
    initial begin
        NS_signal = red;
        WE_signal = green;
        OnTime = 0;
        //switch = 0;
    end
    
    always @(posedge div_clk or posedge reset) begin
        if (reset) begin
            NS_signal = red;
            WE_signal = green;
            OnTime = 0;
            //switch = 0;
        end else begin
            if (OnTime == 3) begin
                case(NS_signal)
                    red     : begin
                              NS_signal = green;
                              WE_signal = red;
                              end
                    green   : begin
                              NS_signal = red;
                              WE_signal = green;
                              end
                    default : begin
                              NS_signal = red;
                              WE_signal = green;
                              end
                    endcase
                //switch = 1;
                OnTime = 0;
            end else begin
                OnTime = OnTime + 1;
                //switch = 0;
            end
        end
    end
    
    /*always @(posedge div_clk) begin
        if (switch) begin
            case(NS_signal)
                red     : begin
                          NS_signal = green;
                          WE_signal = red;
                          end
                green   : begin
                          NS_signal = red;
                          WE_signal = green;
                          end
                default : begin
                          NS_signal = red;
                          WE_signal = green;
                          end
            endcase
            switch = 0;
        end
    end*/
endmodule
