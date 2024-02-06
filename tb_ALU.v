`timescale 1ns/1ps

module ALU_32bit_tb;

  // Parameters
  parameter CLOCK_PERIOD = 10; // Time period for clock signal

  // Signals
  reg [31:0] A_bus;
  reg [31:0] B_bus;
  reg [3:0] Control;
  reg enable;
  reg clk;
  wire [31:0] C_bus;
  wire Z_flag;

  // Instantiate ALU_32bit module
  ALU_32bit uut (
    .A_bus(A_bus),
    .B_bus(B_bus),
    .Control(Control),
    .enable(enable),
    .clk(clk),
    .C_bus(C_bus),
    .Z_flag(Z_flag)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #CLOCK_PERIOD clk = ~clk;
  end

  // Initial block for test case
  initial begin
    // Initialize inputs
    A_bus = 8'b10101010;
    B_bus = 8'b01010101;
    Control = 4'b0001; // ADD operation
    enable = 1'b1;

    // Apply inputs and monitor outputs
    #10; // Wait for a few clock cycles
    A_bus = 32'hABCDEF01;
    B_bus = 32'h01234567;
    Control = 4'b0010; // SUB operation
    #10; // Wait for a few clock cycles
    Control = 4'b0011; // MUL operation
    #10; // Wait for a few clock cycles
    Control = 4'b0100; // MOD operation
    #10; // Wait for a few clock cycles
    Control = 4'b0110; // PASSBTOC operation
    #10; // Wait for a few clock cycles
    Control = 4'b1000; // DECAC operation
    #10; // Wait for a few clock cycles
    Control = 4'b1001; // RESET operation
    #10; // Wait for a few clock cycles
    Control = 4'b0111; // INAC operation
    #10; // Wait for a few clock cycles

    // End simulation
    $finish;
  end

endmodule
