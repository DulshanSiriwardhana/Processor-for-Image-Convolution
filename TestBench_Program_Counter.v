`timescale 1ns / 1ps

module ProgamCounter_tb;

    reg clk;
    reg en;
    reg w_en;
    reg complete;
    reg inc;
    reg [31:0] data_in;
    wire [5:0] instruction_address;

    
    ProgamCounter uut (
        .clk(clk),
        .en(en),
        .w_en(w_en),
        .complete(complete),
        .inc(inc),
        .data_in(data_in),
        .instruction_address(instruction_address)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Stimulus generation
    initial begin
        clk = 0;
        en = 0;
        w_en = 0;
        complete = 0;
        inc = 0;
        data_in = 32'b0;

        // Test case 1: Test with write enable
        en = 1;
        w_en = 1;
        data_in = 32'hA5A5A5A5;
        #10;
        $display("Test Case 1: instruction_address = %b", instruction_address);

        // Test case 2: Test with increment
        w_en = 0;
        inc = 1;
        #10;
        $display("Test Case 2: instruction_address = %b", instruction_address);

        // Add more test cases as needed

        // End simulation
        $stop;
    end

endmodule
