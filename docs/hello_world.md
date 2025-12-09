---
layout: default
title: Verilog Hello World
nav_order: 2
---

# Description

This demo shows you how to create and simulate a simple hardware module written in Verilog using the Vivado IDE.
The module will implement the following function:
```
Y = (A and B) xor (C and D)
```
**A**, **B**, **C** and **D** represent single bit inputs, while **Y** represents a single bit output.
The hardware module that implements the function needs to be a sequential module and it needs to set the output during the positive edge of the clock.

## Create Project

Open Vivado and create a new project by clicking on **Create Project**.
You can name the project **hello_world**.
The project will be an **RTL project** and check the *Do not specify sources at this time* checkbox.
Keep everything else unchecked.
Select the board by clicking on the **Boards** tab, and then select the *Spartan-7 SP701 Evaluation Platform*.

## Create the hardware module source file

In the **Flow Navigator** pane on the left side of the IDE click on **Add Sources** to create a new hardware module.
Select **Add or create design sources**.
Click on **Create File**, name the source file as **my_function** and select the file type as **Verilog**.
Click on **Finish** and then **OK** in the module definition window to create the source file.
This will create a new file in the *Design Sources* section (expand the section) in the **Sources** pane on middle top pane of the IDE.

## Implement the hardware module

To implement the custom bit function, double click on the *my_function*(*my_function.v*) source file and write the following code:
```
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
```

## Create the verification testbench program

To verify and simulate the implemented hardware module, you will need to create a testbench source file that describes how the modules will be simulated.
In the **Flow Navigator** pane on the left side of the IDE click on **Add Sources** to create a new hardware module.
Select **Add or create simulation sources**.
Click on **Create File**, name the simulation source file as **my_function_tb** and select the file type as **SystemVerilog**.
Click on **Finish** and then **OK** in the module definition window to create the simulation source file.
This will create a new file in the *Simulation Sources/sim_1* section (expand the section) in the **Sources** pane on middle top pane of the IDE.

## Implement the simulation module

To implement the simulation code, double click on the *my_function_tb*(*my_function_tb.sv*) simulation source file and write the following code:
```
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
```

## Start the simulation

To run the simulation click on **Run Simulation** from the *Simulation* section of the left panel, and then click on **Run Behavioral Simulation**.
In the Tcl console in the bottom panel, you should see:
```
time clock reset | A B C D | Y
0 1 0 | x x x x | x
5 0 0 | x x x x | x
10 1 0 | x x x x | x
15 0 1 | x x x x | x
20 1 1 | x x x x | 0
25 0 0 | 0 0 0 0 | 0
30 1 0 | 0 0 0 0 | 0
35 0 0 | 1 0 0 0 | 0
40 1 0 | 1 0 0 0 | 0
45 0 0 | 0 1 0 0 | 0
50 1 0 | 0 1 0 0 | 0
55 0 0 | 1 1 0 0 | 0
60 1 0 | 1 1 0 0 | 1
65 0 0 | 0 0 1 0 | 1
70 1 0 | 0 0 1 0 | 0
75 0 0 | 1 0 1 0 | 0
80 1 0 | 1 0 1 0 | 0
85 0 0 | 0 1 1 0 | 0
90 1 0 | 0 1 1 0 | 0
95 0 0 | 1 1 1 0 | 0
100 1 0 | 1 1 1 0 | 1
105 0 0 | 0 0 0 1 | 1
110 1 0 | 0 0 0 1 | 0
115 0 0 | 1 0 0 1 | 0
120 1 0 | 1 0 0 1 | 0
125 0 0 | 0 1 0 1 | 0
130 1 0 | 0 1 0 1 | 0
135 0 0 | 1 1 0 1 | 0
140 1 0 | 1 1 0 1 | 1
145 0 0 | 0 0 1 1 | 1
150 1 0 | 0 0 1 1 | 1
155 0 0 | 1 0 1 1 | 1
160 1 0 | 1 0 1 1 | 1
165 0 0 | 0 1 1 1 | 1
170 1 0 | 0 1 1 1 | 1
175 0 0 | 1 1 1 1 | 1
180 1 0 | 1 1 1 1 | 0
185 0 0 | 1 1 1 1 | 0
190 1 0 | 1 1 1 1 | 0
195 0 0 | 1 1 1 1 | 0
```

A new tab called *Untitled* has been create in the top right panel.
If you click on it, you can access the simulation diagram.
Zoom out so that you can see the ticks and the changes in the inputs and outputs like this:
![Simulation Diagram]({{ '/assets/images/hello_simulation.png' | relative_url }})

## Assignment

Create now a new module that implementes a simple 1 bit adder, that receives as an input two bits (A and B) and returns as output one bit for the result (R) and one bit for carry (C):
```
R = A xor B
C = A and B
```

The hardware module that implements the simple 1 bit adder needs to be a sequential module and it needs to set the output during the positive edge of the clock.