module Accumulator (
  input [31:0] data_in,
  input clk,
  input reset,
  output reg [31:0] acc
);

  always @(posedge clk or posedge reset) begin
    if (reset)
      acc <= 32'b0;
    else
      acc <= acc + data_in;
  end

endmodule
