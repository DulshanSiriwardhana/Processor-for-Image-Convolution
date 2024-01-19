`timescale 1ns / 1ps

module Ram2 (
  
  input clk,
  input w_en,
  input r_en,
  input done,
  input [11:0] address,
  input [7:0] data_in,
  output reg [7:0] data_out
);

  reg [7:0] ram [2**12 - 1:0];
 
  reg [11:0] index;
  reg file_end;
  reg file_opened;

 
  integer file;
 integer i;
  integer data;

  initial begin
    // Open the data file for reading
    file = $fopen("C:\\Users\\User\\OneDrive\\Desktop\\5th Sem\\HDL\\Project\\Processor-for-Image-Convolution\\Image.txt", "r");
 	
       

        // image data: 8 bit single channel image
        ram[0] = 8'b11010000;
        ram[1] = 8'b11010000;
        ram[2] = 8'b11010001;
        ram[3] = 8'b11010001;
        ram[4] = 8'b11010001;
	ram[5] = 8'b11010000;
        ram[6] = 8'b11010000;
        ram[7] = 8'b11010001;
        ram[8] = 8'b11010001;
        ram[9] = 8'b11010001;
    

   @(posedge clk) begin
    if (w_en) begin
      ram[address] <= data_in;
    end

    if (r_en) begin
      data_out <= ram[address];
    end
	
       
 
    
     
    end
  end

endmodule
