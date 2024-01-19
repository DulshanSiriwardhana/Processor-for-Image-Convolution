`timescale 1ns / 1ps


module ProcessorTest(
    input en,
    input clk   
    );


    wire [7:0] DRam_in;
    wire [11:0] data_addr;
    wire [7:0]  DRam_out;
    wire  control_signal;
 Ram2 RAM(
        .clk(clk),
        .w_en(),
        .r_en(control_signal),
        .done(complete),
        .address(data_addr),
        .data_in(DRam_out), //maximum value is 256 (8 bits)
        .data_out(DRam_in)
    );
endmodule