`timescale 1ns / 1ps
module MAR_tb;

  // Define signals for the test bench
  reg clk;
  reg w_en;
  reg [31:0] data_in;  // Change to reg for input data
  wire [31:0] data_out;
  wire [11:0] data_addr;

  // Instantiate the MAR module
  MAR uut (
    .clk(clk),
    .w_en(w_en),
    .data_out(data_out),
    .data_in(data_in),  // Connect to the reg signal
    .data_addr(data_addr)
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
      w_en = 0;
      data_in = 32'hA5A5A5A5; // Example data value

      // Apply stimulus
      w_en = 1;
      #10 w_en = 0;

      // Monitor the outputs
      $display("Data_addr = %h, Data_out = %h", data_addr, data_out);
      
      // Finish simulation
      $finish;
    end

endmodule
