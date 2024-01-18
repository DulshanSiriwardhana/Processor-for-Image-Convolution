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
  reg [7:0] read_data;
  reg [17:0] index;

  integer f; // Declare file variable
  integer file;
  integer i;
  integer data;

  always @(posedge clk)
    if (w_en == 1)
      ram[address] <= data_in;

  always @(posedge clk)
    if (r_en == 1)
      read_data <= ram[address];

  assign data_out = read_data;

  always @(posedge clk)
    if (done == 1) begin
      index <= index + 1;
      $fwrite(f, "%b\n", ram[index]);
      if (index == 86383) begin
        $fclose(f);
        $finish;
      end
    end

  initial begin
   // f = $fopen("E:\\Work\\ENTC\\5 CSD\\DownSampleMe-main_3\\Images\\clock_tower256-processor_output.txt", "w");
    
    file = $fopen("Image.txt", "r");

    if (file == 0) begin
      $display("Error opening the file");
      $stop;
    end

    // Read data from the file line by line and store in the ram array
    
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
  end

endmodule

