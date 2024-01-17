`timescale 1ns/1ps

module PC_tb;

  // Parameters
  parameter CLOCK_PERIOD = 10; // Time period for clock signal

  // Signals
  reg [31:0] in;
  reg clk;
  reg reset;
  wire [31:0] out;

  // Instantiate PC module
  PC uut (
    .in(in),
    .clk(clk),
    .reset(reset),
    .out(out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #CLOCK_PERIOD clk = ~clk;
  end

  // Initial block for test case
  initial begin
    // Initialize inputs
    in = 32'h12345678;
    reset = 1;

    // Apply inputs and monitor outputs
    #10; // Wait for a few clock cycles
    reset = 0; // Release reset
    #10; // Wait for a few clock cycles
    in = 32'hABCDEF01;
    #10; // Wait for a few clock cycles
    in = 32'h87654321;
    #10; // Wait for a few clock cycles

    // End simulation
    $finish;
  end

endmodule

