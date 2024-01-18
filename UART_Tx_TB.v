
`timescale 1ns/10ps

module UART_TX_TB();

  // Testbench uses a 25 MHz clock
  // Interface to 115200 baud UART
  // 25000000 / 115200 = 217 Clocks Per Bit.
  parameter c_CLOCK_PERIOD_NS = 40;
  parameter c_CLKS_PER_BIT    = 217;
  parameter c_BIT_PERIOD      = 8600;
  
  reg r_Clock = 0;
  reg r_Rst_L = 1; // Active Low Reset, initialize to high
  reg r_TX_DV = 0;
  reg [7:0] r_TX_Byte = 8'h37; // Byte to be transmitted
  
  wire w_TX_Active, w_TX_Serial, w_TX_Done;

  UART_TX #(.CLKS_PER_BIT(c_CLKS_PER_BIT)) UART_TX_Inst
    (.i_Rst_L(r_Rst_L),
     .i_Clock(r_Clock),
     .i_TX_DV(r_TX_DV),
     .i_TX_Byte(r_TX_Byte), 
     .o_TX_Active(w_TX_Active),
     .o_TX_Serial(w_TX_Serial),
     .o_TX_Done(w_TX_Done)
     );

  always
    #(c_CLOCK_PERIOD_NS/2) r_Clock <= ~r_Clock; // Clock toggle every half period

  initial
    begin
      // Reset
      r_Rst_L = 0;
      #100; // Hold reset for a short duration
      r_Rst_L = 1; // Release reset

      // Start transmitting
      #100; // Wait before starting transmission
      r_TX_DV = 1; // Assert TX_DV
      #100; // Maintain TX_DV for some time
      r_TX_DV = 0; // De-assert TX_DV
      
      // Wait for TX to complete
      @(posedge r_Clock);
      while (!w_TX_Done) begin
        #10; // Wait for TX_Done to be asserted
      end
      
      // Check if TX is complete
      if (w_TX_Done)
        $display("Transmission Completed - TX Done asserted");
      else
        $display("Transmission Failed - TX Done not asserted");

      $finish;
    end

endmodule
