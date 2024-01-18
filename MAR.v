`timescale 1ns / 1ps
module MAR(
	input clk,
	input w_en,
	output reg [31:0] data_out,
	input [31:0] data_in,
	output reg [11:0] data_addr
);

always @ (posedge clk)
	begin
		if (w_en)
			begin
			data_addr<=data_in[11:0];
			data_out<=data_in;
			end
		end
endmodule