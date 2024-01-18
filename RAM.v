`timescale 1ns / 1ps

module Ram #(
  parameter DATA_WIDTH = 8, 
  parameter ADDR_WIDTH = 12
)(
  input clk,
  input w_en,
  input r_en,
  input done,
  input [(ADDR_WIDTH-1):0] address,
  input [(DATA_WIDTH-1):0] data_in,
  output reg [(DATA_WIDTH-1):0] data_out
);

  reg [(DATA_WIDTH-1):0] ram [2**ADDR_WIDTH - 1:0];
  reg [(DATA_WIDTH-1):0] read_data;
  reg [17:0] index;
  reg file_end;

  integer f; // Declare file variable
  integer file;

  always @(posedge clk)
    if (w_en == 1)
      ram[address] <= data_in;

  always @(posedge clk)
    if (r_en == 1)
      read_data <= ram[address];

  assign data_out = read_data;

  always @(posedge clk)
    if (done == 1) begin
      if (!file_end) begin
        index <= index + 1;
        if (index < 2**ADDR_WIDTH) begin
          $fwrite(f, "%b\n", ram[index]);
        end else begin
          file_end <= 1;
          $fclose(f);
          $finish;
        end
      end
    end

initial begin
  f = $fopen("C:\\Users\\User\\OneDrive\\Desktop\\5th Sem\\HDL\\Project\\Processor-for-Image-Convolution\\Con_Output.txt", "w");

  // Open the data file for reading
  file = $fopen("C:\\Users\\User\\OneDrive\\Desktop\\5th Sem\\HDL\\Project\\Processor-for-Image-Convolution\\Image.txt", "r");

  if (file == 0) begin
    $display("Error opening the file");
    $stop;
  end
end

endmodule

