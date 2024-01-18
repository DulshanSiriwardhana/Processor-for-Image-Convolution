`timescale 1ns / 1ps

module MDR_tb;

  // Define signals for the test bench
  reg clk;
  reg enable;
  reg w_en;
  reg write_en;
  reg read_en;
  reg [31:0] data_in_tb; // Test bench input data
  wire [31:0] data_out;
  wire [7:0] DRAM_out;

  // Internal register to hold DRAM_out value for testing
  reg [7:0] DRAM_out_tb;

  // Instantiate the MDR module
  MDR uut (
    .clk(clk),
    .enable(enable),
    .w_en(w_en),
    .write_en(write_en),
    .read_en(read_en),
    .data_out(data_out),
    .data_in(data_in_tb),
    .DRAM_in(DRAM_out_tb), // Connect DRAM_in to an internal register
    .DRAM_out(DRAM_out)
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
      enable = 0;
      w_en = 0;
      write_en = 0;
      read_en = 0;
      data_in_tb = 32'hA5A5A5A5; // Example test bench input data
      DRAM_out_tb = 8'd150;
      

      // Enable the MDR module
      enable = 1;

      // Apply stimulus
      // Transition to state 2 to perform operations
      #10 enable = 0;
      w_en = 1;
      #10 w_en = 0;
      read_en = 1;
      #10 read_en = 0;
      write_en = 1;
      #10 write_en = 0;

      // Set the value of the internal DRAM_out
      #10 DRAM_out_tb = 8'hFF;

      // Monitor the outputs
      $display("Data_out = %h, DRAM_out = %h", data_out, DRAM_out_tb);

      // Finish simulation
      $finish;
    end

endmodule
