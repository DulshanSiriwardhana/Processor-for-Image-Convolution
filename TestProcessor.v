`timescale 1ns / 1ps


module ProcessorTest(
    input en,
    input clk ,
input w_en, 

input r_en ,
input [11:0] data_addr,
input [31:0] C_bus  
    );

	wire complete;
    wire [7:0] DRam_in;
    wire [31:0]data_out;
    wire [7:0]  DRam_out;
     Ram2 RAM(
        .clk(clk),
        .w_en(w_en),
        .r_en(r_en),
        .done(complete),
        .address(data_addr),
        .data_in(DRam_out), //maximum value is 256 (8 bits)
        .data_out(DRam_in)
    );
MDR MDR(
        .clk(clk),
        .enable(en),
        .w_en(w_en),
        .write_en(w_en),
        .read_en(r_en),
        .data_out(data_out),
        .data_in(C_bus),
        .DRAM_in(DRam_in),
        .DRAM_out(DRam_out)
    );
endmodule