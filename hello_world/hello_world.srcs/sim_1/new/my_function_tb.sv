`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2025 03:15:46 PM
// Design Name: 
// Module Name: my_function_tb
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


module my_function_tb();
// Define the inputs and outputs that will be manipulated by the simulation
reg clock, reset;
reg A, B, C, D;
wire Y;

initial begin
    // Print to the console the header of the output
    $display("time clock reset | A B C D | Y");
    // Monitor the values of the inputs and outputs as they change
    $monitor("%g %b %b | %b %b %b %b | %b",
        $time, clock, reset, A, B, C, D, Y);
    
    // Initialize the clock and reset
    clock = 1'b1;
    reset = 1'b0;
    
    // Set the reset after 5 ticks
    #15 reset = 1'b1;
    
    // Unset the reset after 10 ticks
    #10 reset = 1'b0;
    
    // Iterate over all values of the inputs
    for (int d = 0; d < 2; d++) begin
        for (int c = 0; c < 2; c++) begin
            for (int b = 0; b < 2; b++) begin
                for (int a = 0; a < 2; a++) begin
                    A = a;
                    B = b;
                    C = c;
                    D = d;
                    // Pass 10 ticks
                    #10;
                end
            end
        end
    end
    
    // Finish the simulation
    #15 $finish;
end

always begin
    // Toggle the clock every 5 ticks
    #5 clock = ~clock;
end

// Connect the Device Under Test (DUT) to the test bench
my_function dut(clock, reset, A, B, C, D, Y);
endmodule
