`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2024 04:44:28 PM
// Design Name: 
// Module Name: task3
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


module task3(
    input CLK100MHZ, reset, pedes,
    output reg [2:0] NS_signal, WE_signal
    );
    wire divided_clk;
    reg [3:0] OnTime = 0;
    parameter all_red = 4, yellow = 2, green = 1;
    
    clock_divider A(.CLK100MHZ(CLK100MHZ), .divided_clk(divided_clk));
    
    initial begin
        NS_signal = all_red;
        WE_signal = green;
        OnTime = 0;
    end
    
   /* always @(posedge pedes) begin
        if (pedes) begin
            NS_signal <= all_red;
            WE_signal <= all_red;
            OnTime <= 5;
        end
    end*/
    
    always @(posedge divided_clk or posedge reset) begin
        if (!pedes) begin
            if (reset) begin
                OnTime <= 0;
                NS_signal <= all_red;
                WE_signal <= green;
            end else begin
                if (OnTime == 10) OnTime <= 0;
                else begin 
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
                    endcase
                end
            end
        end else begin
            NS_signal <= all_red;
            WE_signal <= all_red;
            OnTime <= 5;
        end
    end
endmodule
