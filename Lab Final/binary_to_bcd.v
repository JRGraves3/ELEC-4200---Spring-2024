`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2024 09:35:36 AM
// Design Name: 
// Module Name: binary_to_bcd
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


module binary_to_bcd(
    input [9:0] binary,
    output reg [3:0] huns, tens, ones
    );
    
    reg [9:0] bcd_data=0;
    
    always @(binary) begin
        bcd_data = binary;
        huns = (bcd_data/100)%10;
        tens = (bcd_data/10)%10;
        ones = bcd_data%10;
    end
endmodule
    /*#(parameter INPUT_WIDTH = 10,
      parameter DECIMAL_DIGITS = 3)
    (input i_Clock,
    input [INPUT_WIDTH-1:0] i_Binary,
    input i_Start,
    output [DECIMAL_DIGITS*4-1:0] o_BCD,
    output o_DV
    );
       
    parameter s_IDLE              = 3'b000;
    parameter s_SHIFT             = 3'b001;
    parameter s_CHECK_SHIFT_INDEX = 3'b010;
    parameter s_ADD               = 3'b011;
    parameter s_CHECK_DIGIT_INDEX = 3'b100;
    parameter s_BCD_DONE          = 3'b101;
    
    reg [2:0] r_SM_Main = s_IDLE;
    
    // The vector that contains the output BCD
    reg [DECIMAL_DIGITS*4-1:0] r_BCD = 0;
    
    // The vector that contains the input binary value being shifted.
    reg [INPUT_WIDTH-1:0] r_Binary = 0;
    
    // Keeps track of which Decimal Digit we are indexing
    reg [DECIMAL_DIGITS-1:0] r_Digit_Index = 0;
    
    // Keeps track of which loop iteration we are on.
    // Number of loops performed = INPUT_WIDTH
    reg [7:0] r_Loop_Count = 0;
    wire [3:0] w_BCD_Digit;
    reg r_DV = 1'b0;                       
    
    always @(posedge i_Clock)
    begin
        case (r_SM_Main) 
            // Stay in this state until i_Start comes along
            s_IDLE : begin
                     r_DV <= 1'b0;
                     if (i_Start == 1'b1) begin
                         r_Binary  <= i_Binary;
                         r_SM_Main <= s_SHIFT;
                         r_BCD     <= 0;
                     end else
                         r_SM_Main <= s_IDLE;
                     end
            // Always shift the BCD Vector until we have shifted all bits through
            // Shift the most significant bit of r_Binary into r_BCD lowest bit.
            s_SHIFT : begin
                      r_BCD     <= r_BCD << 1;
                      r_BCD[0]  <= r_Binary[INPUT_WIDTH-1];
                      r_Binary  <= r_Binary << 1;
                      r_SM_Main <= s_CHECK_SHIFT_INDEX;
                      end
            // Check if we are done with shifting in r_Binary vector
            s_CHECK_SHIFT_INDEX : begin if (r_Loop_Count == INPUT_WIDTH-1) begin
                                            r_Loop_Count <= 0;
                                            r_SM_Main    <= s_BCD_DONE;
                                        end else begin
                                            r_Loop_Count <= r_Loop_Count + 1;
                                            r_SM_Main    <= s_ADD; // Break down each BCD Digit individually. Check them one-by-one to // see if they are greater than 4. If they are, increment by 3. // Put the result back into r_BCD Vector. s_ADD : begin if (w_BCD_Digit > 4)
                                         end
                                         r_BCD[(r_Digit_Index*4)+:4] <= w_BCD_Digit + 3;  
                                         r_SM_Main <= s_CHECK_DIGIT_INDEX; 
                                  end
            // Check if we are done incrementing all of the BCD Digits
            s_CHECK_DIGIT_INDEX : begin if (r_Digit_Index == DECIMAL_DIGITS-1) begin
                                            r_Digit_Index <= 0;
                                            r_SM_Main <= s_SHIFT;
                                        end else begin
                                            r_Digit_Index <= r_Digit_Index + 1;
                                            r_SM_Main <= s_ADD;
                                        end
                                  end
            s_BCD_DONE : begin
                         r_DV <= 1'b1;
                         r_SM_Main <= s_IDLE;
                         end
            default : r_SM_Main <= s_IDLE;
        endcase
    end // always @ (posedge i_Clock)  
    
    assign w_BCD_Digit = r_BCD[r_Digit_Index*4 +: 4];
    assign o_BCD = r_BCD;
    assign o_DV  = r_DV;*/
//endmodule
