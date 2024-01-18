module clock_gen (

 	input clk_in ,
	output clk_out

 );

 parameter factor = 4; //4

 reg [7:0] counter = 0;
 reg out = 0;


 assign clk_out = out ;

 always @( posedge clk_in )
 	begin
 		if ( counter < factor - 1) begin
 		counter <= counter + 1;
 		end
 	else begin
 	out <= ~ out ;
 	counter <= 0;
 	end
 	end

 endmodule