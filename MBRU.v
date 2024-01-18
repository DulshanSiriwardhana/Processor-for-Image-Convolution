`timescale 1ns / 1ps
module MBRU(
	input clk,
	input fetch,
	input [15:0] instruction_in,
	output reg [5:0] instruction_out,
	output reg [31:0] data_out
);

	always @(posedge clk)

	begin
		if (fetch ==1)
		begin
		instruction_out <= instruction_in[15:10];
		data_out<= {22'b0000000000000000000000,instruction_in[9:0]};
	
		end
	end

endmodule