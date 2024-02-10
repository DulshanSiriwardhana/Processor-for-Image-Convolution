`timescale 1ns / 1ps
module clk_divider_ALU(
input clk,
output clk_div
);
reg [3:0]count=4'd0;
parameter limit=4'd4;
reg out=1;
assign clk_div=out;
always @(posedge clk)
begin
if (count>=(limit-1))
begin
count<=4'd0;
out<= ~out;
end
else
count <= count+4'd1;
end
endmodule