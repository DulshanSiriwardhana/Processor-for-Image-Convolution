module dff (
  input D,
  input CE,
  input CLR,
  input C,
  output reg Q
);

  always @(posedge C, negedge CLR) begin
    case ({CLR, CE}) 
      2'b1x: Q <= 0;        // set output to zero on clear signal
      2'b01: Q <= D;        // on rising clock edge, set output to data if enabled
      2'b00: Q <= Q;        // hold output when disabled
      default: Q <= 0;      // default to prevent latch being formed
    endcase
  end  
endmodule

module R1 (
  input D,
  input CLK, CE, CLR,
  output Q
);
  dff dff_inst0(D, CE, CLR, CLK, Q);
endmodule

module R2 (
  input [1:0] D,
  input CLK, CE, CLR,
  output [1:0] Q
);
  R1 R1_inst0(D[0], CLK, CE, CLR, Q[0]);
  R1 R1_inst1(D[1], CLK, CE, CLR, Q[1]);
endmodule

module R4 (
  input [3:0] D, 
  input CLK, CE, CLR,
  output [3:0] Q
);
  R2 R2_inst0(D[1:0], CLK, CE, CLR, Q[1:0]);
  R2 R2_inst1(D[3:2], CLK, CE, CLR, Q[3:2]);
endmodule

module R8 (
  input [7:0] D,
  input CLK, CE, CLR,
  output [7:0] Q
);
  R4 R4_inst0(D[3:0], CLK, CE, CLR, Q[3:0]);
  R4 R4_inst1(D[7:4], CLK, CE, CLR, Q[7:4]);
endmodule

module R16 (
  input [15:0] D,
  input CLK, CE, CLR,
  output [15:0] Q
);
  R8 R8_inst0(D[7:0], CLK, CE, CLR, Q[7:0]);
  R8 R8_inst1(D[15:8], CLK, CE, CLR, Q[15:8]);
endmodule

module R32 (
  input [31:0] D,
  input CLK, CE, CLR,
  output [31:0] Q
);
  R16 R16_inst0(D[15:0], CLK, CE, CLR, Q[15:0]);
  R16 R16_inst1(D[31:16], CLK, CE, CLR, Q[31:16]);
endmodule

