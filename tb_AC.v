`timescale 1ns/1ps

module Accumulator_tb;

  // Parameters
  parameter CLOCK_PERIOD = 10; // Time period for clock signal

  // Signals
  reg [31:0] data_in;
  reg clk;
  reg reset;
  wire [31:0] acc;

  // Instantiate Accumulator module
  Accumulator uut (
    .data_in(data_in),
    .clk(clk),
    .reset(reset),
    .acc(acc)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #CLOCK_PERIOD clk = ~clk;
  end

  // Initial block for test case
  initial begin
    // Initialize inputs
    data_in = 32'hA1A2A3A4;
    reset = 1;

    // Apply inputs and monitor outputs
    #10; // Wait for a few clock cycles
    reset = 0; // Release reset
    #10; // Wait for a few clock cycles
    data_in = 32'hB1B2B3B4;
    #10; // Wait for a few clock cycles
    data_in = 32'hC1C2C3C4;
    #10; // Wait for a few clock cycles
    data_in = 32'hD1D2D3D4;
    #10; // Wait for a few clock cycles

    // End simulation
    $finish;
  end

endmodule
