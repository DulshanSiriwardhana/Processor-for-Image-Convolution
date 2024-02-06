`timescale 1ns / 1ps

module MDR(
	input clk,
	input enable,
	input w_en,
	input write_en,
	input read_en,
	output reg [31:0] data_out,
	input [31:0] data_in,
	input [7:0] DRAM_in,
	output reg [7:0] DRAM_out
);

 reg [1:0] state = 2'b0;

 always @ (posedge clk)
	 if (enable ==1'b1)
		 begin
		 state<= state+1;
		 end

always @ (posedge clk)
begin
	 if(state == 2'b10)
	 begin
	if (w_en==1)
		begin
		data_out<=data_in;
		end
	if (read_en)
		begin
		data_out<= {24'd0,DRAM_in};
		end
	if (write_en)
		begin
		DRAM_out<=data_in[7:0];
		end
	 end
end
endmodule