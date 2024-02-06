`timescale 1ns / 1ps

module Ram2 (
  input clk,
  input w_en,
  input r_en,
  input [11:0] address,
  input [7:0] data_in,
  output reg [7:0] data_out
);
integer file;
 integer i;
  integer data;
  reg [7:0] ram[0:4095];

  initial begin
    // Initialize RAM with some values
    ram[0] = 8'b11010000;
    ram[1] = 8'b11010001;
    ram[2] = 8'b11010010;
    ram[3] = 8'b11010011;
    ram[4] = 8'b11010100;
    ram[5] = 8'b11011000;
    ram[6] = 8'b11010111;
    ram[7] = 8'b11010110;
    ram[8] = 8'b11111111;

file = $fopen("C:\\Users\\User\\OneDrive\\Desktop\\5th Sem\\HDL\\Project\\Processor-for-Image-Convolution\\Image.txt", "r");
 	
       
 for (i = 9; i < 2**12; i = i + 1) begin
       data=0;
      if ($feof(file) == 0) begin
        $fscanf(file, "%b\n", data);
        ram[i] = data;
      end else begin
        $display("End of file reached");
        $fclose(file);

      end
    end

    // Add more initializations if needed
  end

  always @(posedge clk) begin
    if (w_en) begin
      ram[address] <= data_in;
    end

    if (r_en) begin
      data_out <= ram[address];
    end
  end

endmodule

