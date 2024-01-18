`timescale 1ns/1ps

module B_Bus_Mux_tb;

  // Parameters
  parameter CLOCK_PERIOD = 10; // Time period for clock signal

  // Signals
  reg [31:0] MDR, K0, K1, K2, K3, K4, K5, K6, K7, K8, P1, P2, P3, DP, CV, I, MBRU;
  reg [4:0] select;
  wire [31:0] Y;

  // Instantiate B_Bus_Mux module
  B_Bus_Mux uut (
    .MDR(MDR),
    .K0(K0),
    .K1(K1),
    .K2(K2),
    .K3(K3),
    .K4(K4),
    .K5(K5),
    .K6(K6),
    .K7(K7),
    .K8(K8),
    .P1(P1),
    .P2(P2),
    .P3(P3),
    .DP(DP),
    .CV(CV),
    .I(I),
    .MBRU(MBRU),
    .select(select),
    .Y(Y)
  );

  // Clock generation
  initial begin
    select = 5'b00000; // Default case
    MDR = 32'hA1A2A3A4;
    K0 = 32'hB1B2B3B4;
    K1 = 32'hC1C2C3C4;
    K2 = 32'hD1D2D3D4;
    K3 = 32'hE1E2E3E4;
    K4 = 32'hF1F2F3F4;
    K5 = 32'h11111111;
    K6 = 32'h22222222;
    K7 = 32'h33333333;
    K8 = 32'h44444444;
    P1 = 32'h55555555;
    P2 = 32'h66666666;
    P3 = 32'h77777777;
    DP = 32'h88888888;
    CV = 32'h99999999;
    I = 32'hAAAAAAAA;
    MBRU = 32'hBBBBBBBB;

    #5; // Wait for a few clock cycles
    select = 5'b00001; // Test K0
    #5; // Wait for a few clock cycles
    select = 5'b00100; // Test K3
    #5; // Wait for a few clock cycles
    select = 5'b01110; // Test CV
    #5; // Wait for a few clock cycles

    // End simulation
    $finish;
  end

endmodule
