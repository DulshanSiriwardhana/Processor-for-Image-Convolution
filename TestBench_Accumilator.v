`timescale 1ns / 1ps

module Accumulator_tb;

    reg clk;
    reg [31:0] data_in;
    reg inc;
    reg w_en;
    wire [31:0] data_out;

    
    Accumilator uut (
        .clk(clk),
        .data_in(data_in),
        .data_out(data_out),
        .inc(inc),
        .w_en(w_en)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Stimulus generation
    initial begin
        clk = 0;
        data_in = 32'h00000001;
        inc = 0;
        w_en = 0;

        // Test case 1: Test with increment
        inc = 1;
        #10;
        $display("Test Case 1: data_out = %h", data_out);

        // Test case 2: Test with write enable
        inc = 0;
        w_en = 1;
        data_in = 32'h0000000A;
        #10;
        $display("Test Case 2: data_out = %h", data_out);

        

        // End simulation
        $stop;
    end

endmodule