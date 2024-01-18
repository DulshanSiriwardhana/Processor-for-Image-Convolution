`timescale 1ns / 1ps


module Ram#(
  parameter DATA_WIDTH = 8, // maximum 255
  parameter ADDR_WITDH = 10
)(                
    input clk,
    input w_en,
    input r_en,
    input done,
    input  [(ADDR_WITDH-1):0] address,
    input  [(DATA_WIDTH-1):0] data_in,//maximum value is 256 (8 bits)
    output [(DATA_WIDTH-1):0] data_out
);
   
    // localparam ram_size=131072; //17 bits
    reg [(DATA_WIDTH-1):0] ram [2**ADDR_WITDH -1: 0];
    reg [(DATA_WIDTH-1):0] read_data;
    reg [17:0] index;
    reg [17:0] index_conv;
    integer f;
    integer g;
       
    always @(posedge clk)
        begin
            if (w_en==1)
                ram[address]<=data_in;                  
    end
       
    always @ (posedge clk)
        begin
            if(r_en == 1)
                read_data<= ram[address];  
    end
       
    assign data_out = read_data;
   


    always@(posedge clk)
        begin
          if ( done  == 1 )
          begin
              index <= index+1;
              $fwrite(f,"%b\n",ram[index] ); //NOT DRAM < DMEM           
          end
          if(index == 86383)
              begin
                $fclose(f);
                $finish;
              end
        end
    initial
    begin
        
        f = $fopen("E:\\Work\\ENTC\\5 CSD\\DownSampleMe-main_3\\Images\\clock_tower256-processor_output.txt","w");
        index = 70000;              //start index
        ram[3]  = 8'bx; // height_count
        ram[4]  = 8'bx; // a: a local variable
        ram[5]  = 8'bx; // b: a local variable
        ram[6]  = 8'bx; // c: a local variable
        ram[7]  = 8'bx; // width_count
       
        // image data: 8 bit single channel image
        ram[20] = 8'b11010000;
        ram[21] = 8'b11010000;
        ram[22] = 8'b11010001;
        ram[23] = 8'b11010001;
        ram[24] = 8'b11010001;
	  ??????
	  ??????
	  ??????
        ram[65555] = 8'b01100101;
    
    end    
   
endmodule
