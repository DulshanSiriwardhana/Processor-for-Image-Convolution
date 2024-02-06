`timescale 1ns / 1ps

module Processor_tb;

  // Parameters
  parameter CLK_PERIOD = 10; // Clock period in ns

  // Inputs
  reg en;
  reg clk;

  // Instantiate the Processor module
  Processor processor_inst (
    .en(en),
    .clk(clk)
  );

  // Clock generation
  always #((CLK_PERIOD / 2)) clk = ~clk;

  // Test stimulus
  initial begin
    // Initialize inputs
    en = 1;
    clk = 0;

    // Run simulation for 100 seconds (100,000,000,000 ps)
    #100_000_000;

    // End simulation
    $finish;
  end

endmodule
