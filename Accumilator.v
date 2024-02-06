`timescale 1ns / 1ps


module Accumilator(
    input clk,
    input [31:0] data_in,
    output reg [31:0] data_out,
    input inc,
    input w_en
    );
   
    //events done at pose edge
    always @(posedge clk)
    begin
        if (inc==1)
           data_out<= data_out+1;
         if (w_en==1)
            data_out<= data_in;


    end
endmodule
