`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2025 11:31:01 AM
// Design Name: 
// Module Name: my_function
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


module my_function(clk, rst, A, B, C, D, Y);
// Define the ports of your module
input clk, rst, A, B, C, D;
output Y;

// Define the types for the ports
wire clk, rst, A, B, C, D;
reg Y;

// On the positive edge of the clock
always @ (posedge clk)
    // If the reset is set, the set the output to 0
    if (rst == 1'b1) begin
        Y <= 1'b0;
    // Otherwise, set the output to be equal to (A and B) xor (C and D)
    end else begin
        Y <= (A & B) ^ (C & D);
    end

endmodule
