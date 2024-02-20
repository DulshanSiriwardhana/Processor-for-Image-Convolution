`timescale 1ps / 1ps

module control_unit_tb;

    // Inputs
    reg clk;
    reg enable;
    reg Z_flag;
    reg [5:0] addr;
    reg [5:0] MBRU;

    // Outputs
    wire [37:0] control_signal;
    wire finish;

    // Instantiate the Unit Under Test (UUT)
    control_unit uut (
        .clk(clk),
        .enable(enable),
        .Z_flag(Z_flag),
        .addr(addr),
        .MBRU(MBRU),
        .control_signal(control_signal),
        .finish(finish)
    );


    initial begin
        // Initialize Inputs
        clk = 0;
        enable = 0;
        Z_flag = 0;
        addr = 0;
        MBRU = 0;

        // Wait 100 ns for global reset
        #100;

        // Enable the control unit
        enable = 1;
        #150;
       

        // Test various scenarios
        // Scenario 1: Test FETCH2 operation
        addr = 6'd1; // FETCH2 address
        MBRU = 6'd4; // Example MBRU value
        #150; // Wait for a clock cycle

        // Scenario 2: Test JUMPNZ with Z_flag = 0
	MBRU = 6'd47;
        addr = 6'd48; // JUMPNZ address
        Z_flag = 1; // Z_flag not set
        #150; // Wait for a clock cycle

        // Scenario 3: Test JUMPNZ with Z_flag = 1
        //Z_flag = 1; // Z_flag set
        #150; // Wait for a clock cycle

        // Scenario 4: Test JUMPZ with Z_flag = 0
        addr = 6'd52; // JUMPZ address
        Z_flag = 0; // Z_flag not set
        #150; // Wait for a clock cycle

        // Scenario 5: Test JUMPZ with Z_flag = 1
        Z_flag = 1; // Z_flag set
        #150; // Wait for a clock cycle

        // Finish the simulation
        #100 $finish;
    end

endmodule