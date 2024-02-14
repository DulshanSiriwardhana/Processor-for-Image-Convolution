`timescale 1ns / 1ps

module Ram2 (
  input clk,
  input w_en,
  input r_en,
  input [11:0] address,
  input [7:0] data_in,
  input done,
  output reg [7:0] data_out
);
integer file;
integer file_out;
 integer i;
  integer data;
  reg [7:0] ram[0:4095];
  reg [11:0] index;


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
    index=10'd910;

file = $fopen("C:\\Users\\User\\OneDrive\\Desktop\\5th Sem\\HDL\\Project\\Processor-for-Image-Convolution\\Image.txt", "r");
file_out = $fopen("C:\\Users\\User\\OneDrive\\Desktop\\5th Sem\\HDL\\Project\\Processor-for-Image-Convolution\\Con_Output.txt", "w");

  

     
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
 always @(posedge clk)
        begin
          if ( done  == 1 )
          begin
              index <= index+1;
              $fwrite(file_out,"%b\n",ram[index] ); //NOT DRAM < DMEM           
          end
          if(index == 784)
              begin
                $fclose(file_out);
                $finish;
              end
        end

endmodule

