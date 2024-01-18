`timescale 1ns / 1ps
module MBRU_tb;

  // Define signals for the test bench
  reg clk;
  reg fetch;
  reg [15:0] instruction_in;
  wire [5:0] instruction_out;
  wire [31:0] data_out;

  // Instantiate the MBRU module
  MBRU uut (
    .clk(clk),
    .fetch(fetch),
    .instruction_in(instruction_in),
    .instruction_out(instruction_out),
    .data_out(data_out)
  );

  // Clock generation
  always
    begin
      #5 clk = ~clk;
    end

  // Testbench stimulus
  initial
    begin
      // Initialize signals
      clk = 0;
      fetch = 0;
      instruction_in = 16'h1234; // Example instruction value

      // Apply stimulus
      fetch = 1;
      #10 fetch = 0;

      // Monitor the outputs
      $display("Instruction_out = %h, Data_out = %h", instruction_out, data_out);
      
      // Finish simulation
      $finish;
    end

endmodule