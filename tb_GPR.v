`timescale 1ns/1ps

module R32_tb;

  // Parameters
  parameter CLOCK_PERIOD = 10; // Time period for clock signal

  // Signals
  reg [31:0] D;
  reg CLK;
  reg CE;
  reg CLR;
  wire [31:0] Q;

  // Instantiate R32 module
  R32 uut (
    .D(D),
    .CLK(CLK),
    .CE(CE),
    .CLR(CLR),
    .Q(Q)
  );

  // Clock generation
  initial begin
    CLK = 0;
    forever #CLOCK_PERIOD CLK = ~CLK;
  end

  // Initial block for test case
  initial begin
    // Initialize inputs
    D = 32'h12345678;
    CE = 1;
    CLR = 0;

    // Apply inputs and monitor outputs
    #10; // Wait for a few clock cycles
    D = 32'hABCDEF01;
    #10; // Wait for a few clock cycles
    D = 32'h87654321;
    #10; // Wait for a few clock cycles

    // End simulation
    $finish;
  end

endmodule
