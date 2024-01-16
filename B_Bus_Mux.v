module B_Bus_Mux (
  input [31:0] A,
  input [31:0] B,
  input [1:0]  select,
  output reg [31:0] Y
);

  always @*
    case (select)
      2'b00: Y = A;
      2'b01: Y = B;
      //2'b10: Y = 32'b0;
      //2'b11: Y = 32'b0;
      default: Y = 32'b0; // Default case for safety
    endcase

endmodule

