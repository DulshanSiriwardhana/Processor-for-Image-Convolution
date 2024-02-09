`timescale 1ns / 1ps


module PCounter(
    input clk,
    input en,
    input w_en,
    input complete,
    input inc,
    input [31:0] data_in,
    output reg [8:0] instruction_address //input to instruction register and B bus mux
    );


    reg start=1'b0;
   
    always @(posedge en)
        start<=1'b1; 
   
     initial
        begin
            instruction_address=9'd0;   
        end
   
    always @(posedge clk)
        begin
            if (complete==1)
                begin
                instruction_address <= instruction_address;
                end
            else if (start)
                begin
                    if(w_en==1)
                        begin
                            instruction_address <= data_in[8:0];
                        end
                     else if (inc==1)
                         begin
                            instruction_address <= instruction_address+1;
                         end
                     else
                         begin
                            instruction_address<=instruction_address;
                         end
                 end  
        end
   
endmodule