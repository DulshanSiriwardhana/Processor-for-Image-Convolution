`timescale 1ns / 1ps


module Register(
    input clk,
    input w_en,
    input [31:0] data_in,
    output reg [31:0] data_out
    );


   
    //register set at posedge clk
    always @(posedge clk)
    begin
        if(w_en == 1)
            data_out<=data_in;
    end
       
endmodule

