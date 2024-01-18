module PC (
  input [31:0] in,
  input clk,
  input reset,
  output reg [31:0] out
);

  always @(posedge clk) begin
    if (reset) 
      out <= 32'b00000000000000000000000000000000;
    else
      out <= in;
  end

endmodule
