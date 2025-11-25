`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2024 04:24:33 PM
// Design Name: 
// Module Name: d_latch
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


module d_latch(
    input D, Enable,
    output Q, Qbar);
    wire Q_i, Qbar_i;
    /*assign Q = Enable & D;
    assign Qbar = Enable & ~D;*/
    assign #2 Q_i = Q;
    assign #2 Qbar_i = Qbar;
    assign #2 Q = ~((~D & Enable) | Qbar);
    assign #2 Qbar = ~((D & Enable) | Q);
    
endmodule
