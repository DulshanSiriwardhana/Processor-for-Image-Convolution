module tb_ram_image;

  reg clk;
  reg w_en;
  reg r_en;
  reg done;
  reg initial_reset;
  reg [17:0] address;
  reg [7:0] data_in;
  wire [7:0] data_out;

  // Instantiate the RAM module
  // Ram #(
  //  .DATA_WIDTH(8),
   // .ADDR_WIDTH(18)
 // ) my_ram (
   // .clk(clk),
    // .w_en(w_en),
   // .r_en(r_en),
    //.done(done),
    //.address(address),
   // .data_in(data_in),
   // .data_out(data_out),
   // .init_data(init_data),
   // .initial_reset(initial_reset)
  // );

  // Provide clock signal
  always #5 clk = ~clk;

  // Initial values for RAM initialization
  reg [7:0] init_data [2**10-1:0];

  // Input image file path
  parameter IMAGE_FILE = "parameter IMAGE_FILE = "C:/Users/User/OneDrive/Desktop/5th Sem/HDL/Project/Processor-for-Image-Convolution/image.jpeg";
";
  reg [10:0] image_data [2**10-1:0];

  // Read image file and populate image_data
  initial begin
    $readmemh(IMAGE_FILE, image_data);
    // You may need to adjust the $readmemh format based on your image file format.
    
    // Provide some initial values for other signals
    w_en = 1;
    r_en = 0;
    done = 0;
    address = 0;

    // Initialize RAM with the provided image data
    initial_reset = 1;
    #10 initial_reset = 0;

    // Perform read and write operations
    #10;
    address = 1;
    w_en = 0;
    r_en = 1;
    done = 1;

    #100 $finish;  // Finish the simulation after some time
  end

endmodule
