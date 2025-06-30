`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2024 05:21:06 PM
// Design Name: 
// Module Name: labfinal
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


module labfinal
    #(parameter N = 6)
    (
    input [N-1:0] user_input,
    input CLK100MHZ, enter, /*easy, normal, hard,*/ start, quit,
    output [7:0] TurnOn,
    output [6:0] seg_out,
    output reg [N-1:0] LED
    );
    //reg [3:0] 
    wire [3:0] huns_seg, tens_seg, ones_seg;
    reg [9:0] score, level, count;
    reg LED_mini_clk, wrong, LED_clk_count = 0;
    wire LED_clk, seg_clk/*, easy_clk, norm_clk, hard_clk*/;
    reg [2:0] /*seg_speed,*/ easy_speed, norm_speed, hard_speed;
    wire [4:0] rand_num;
    reg /*[1:0]*/ LED_speed = 0, seg_speed = 1, reset;
    reg [N-1:0] sequence[49:0];
    reg [N-1:0] user_seq[49:0];
    reg [N-1:0] temp_in[49:0];
    integer i, j, k, m, n;
    
    initial begin
        j = 0;
        m = 0;
        level = 3;
        score = 0;
        reset = 0;
        #5 reset = 1;
    end
    
    // randum number generation
    RNG R(.clk(CLK100MHZ), .reset(reset), .rnd(rand_num));
    always @(posedge start) begin
        //if(start) begin
            //level = 3;
            //seg_speed = 3;
            //LED_clk_count = 0;
            //j = 0;
            //m = 0;
            //ones_seg = 0; tens_seg = 0; huns_seg = 0;
            for(i = 0; i < 50; i = i + 1) begin
                case(rand_num)
                    0       : sequence[i] = 6'b000001;
                    16      : sequence[i] = 6'b000010;
                    8       : sequence[i] = 6'b000001;
                    20      : sequence[i] = 6'b000010;
                    26      : sequence[i] = 6'b000100;
                    13      : sequence[i] = 6'b001000;
                    6       : sequence[i] = 6'b010000;
                    3       : sequence[i] = 6'b100000;
                    17      : sequence[1] = 6'b000100;
                    default : sequence[i] = 6'bx;
                endcase
                user_seq[i] = 6'bx;
            end
        //end
    end
    
    // clock division
    clock_divider LEDClock(.clk(CLK100MHZ), .speed(LED_speed), .divided_clk(LED_clk));
    clock_divider SegClock(.clk(CLK100MHZ), .speed(seg_speed), .divided_clk(seg_clk));
    
    // start or quit
    /*always @(posedge start or posedge quit) begin
        if(start) wrong = 0;
        else if(quit) wrong = 1;
    end*/
    
    // LED DISPLAY
    // will wait 10 seconds for user to put in input
    always @(posedge LED_clk) begin
        //if(!wrong) begin
            if (LED_clk_count == level) begin
                for(k = 0; k < 5; k = k + 1) begin
                    #2000000000;
                end
                LED_clk_count = 0;
            end else begin
                LED_clk_count = LED_clk_count + 1;
                LED_mini_clk = ~LED_mini_clk;
            end
        //end
    end
    
    always @(posedge LED_mini_clk) begin
        //if(!wrong) begin
            if(j < level) begin
                LED = sequence[j];
                j = j + 1;
            end else begin
                j <= 0;
                level <= level + 1;
            end
        //end
    end
    
    // User input
    always @(posedge enter) begin
        //if(!wrong) begin
            user_seq[m] = user_input;
            m = m + 1;
            if(m == level) begin
                m <= 0;
            end
        //end
    end
    
    // checks user input againts sequence
    /*initial begin
        forever begin
            if(enter) begin
                if(user_seq[m] != sequence[m]) begin
                    wrong <= 1;
                    //$finish;
                end
            end
        end
    end*/
    
    // binary to bcd
    //binary_to_bcd B0(.binary(score), .ones(ones));
    always @* begin
        score = level - 3;
    end
    binary_to_bcd B0(.binary(score), .huns(huns_seg), .tens(tens_seg), .ones(ones_seg));
    
    // segment display
    seg_display S(.clk(seg_clk), .ones(ones_seg), .tens(tens_seg), .hundreds(huns_seg), .TurnOn(TurnOn), .seg_out(seg_out));
endmodule
