`timescale 1ns / 1ps

module Ram (
  
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
 	
       
 for (i = 0; i < 2**12; i = i + 1) begin
       data=0;
      if ($feof(file) == 0) begin
        $fscanf(file, "%b\n", data);
        ram[i] = data;
      end else begin
        $display("End of file reached");
        $fclose(file);

      end
    end

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
