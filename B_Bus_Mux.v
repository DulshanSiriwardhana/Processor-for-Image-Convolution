module B_Bus_Mux (
  input [31:0] MDR,
  input [31:0] K0,
  input [31:0] K1,
  input [31:0] K2,
  input [31:0] K3,
  input [31:0] K4,
  input [31:0] K5,
  input [31:0] K6,
  input [31:0] K7,
  input [31:0] K8,
  input [31:0] P1,
  input [31:0] P2,
  input [31:0] P3,
  input [31:0] DP,
  input [31:0] CV,
  input [31:0] I,
  input [31:0] MBRU,
  input [4:0]  select,
  output reg [31:0] Y
);

  always @*
    case (select)
      5'b00000: Y = MDR;
      5'b00001: Y = K0;
      5'b00010: Y = K1;
      5'b00011: Y = K2;
      5'b00100: Y = K3;
      5'b00101: Y = K4;
      5'b00110: Y = K5;
      5'b00111: Y = K6;
      5'b01000: Y = K7;
      5'b01001: Y = K8;
      5'b01010: Y = P1;
      5'b01011: Y = P2;
      5'b01100: Y = P3;
      5'b01101: Y = DP;
      5'b01110: Y = CV;
      5'b01111: Y = I;
      5'b10000: Y = MBRU;
      default: Y = 32'b0;
    endcase

endmodule

