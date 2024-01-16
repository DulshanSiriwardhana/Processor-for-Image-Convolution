`timescale 1ns / 1ps

module tb_Instruction_Ram;

  // Inputs
  reg clk;
  reg [5:0] address;

  // Outputs
  wire [15:0] instr_out;

  // Instantiate the module under test
  Instruction_Ram uut (
    .clk(clk),
    .address(address),
    .instr_out(instr_out)
  );

  // Clock generation
  initial begin
    clk = 1;
    forever #5 clk = ~clk;
  end

  // Test scenario
  initial begin
    // Initialize inputs
    address = 0;

    // Apply some test stimuli
    // You can add more test cases based on your requirements
    #10 address = 1; // Read instruction at address 1
    #10 address = 2; // Read instruction at address 2
    #10 address = 3; // Read instruction at address 3
    // Add more test cases as needed

    // Stop the simulation
    #10 $stop;
  end

endmodule
