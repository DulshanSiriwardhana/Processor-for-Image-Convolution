module ALU_32bit (
    input [31:0] A_bus, // A input bus
    input [31:0] B_bus, // B input bus
    input [3:0] Control,      // 4-bit control input for operation selection (control signal)
    input enable,             // Enable signal for ALU
    input clk,                // Clock signal to change the state to wait some time for while operating other units
    output reg [31:0] C_bus, // C output bus
    output reg Z_flag
);

// Define ALU operations
parameter ADD = 4'b0001;
parameter SUB = 4'b0010;
parameter MUL = 4'b0011;
parameter MOD = 4'b0100;
parameter PASSATOC = 4'b0101;
parameter PASSBTOC = 4'b0110;
parameter INCAC = 4'b0111;
parameter DECAC = 4'b1000;
parameter RESET = 4'b1001;

reg [2:0] state = 3'b0;
reg start = 1'b0;
reg [31:0] A;
reg [31:0] B;
reg [31:0] reset_signal;
reg [31:0] incac_signal;
reg [32:0] temp;
reg [31:0] temp1;
reg [63:0] product,a_temp;
reg [15:0] shift_count;
reg [31:0] remainder;
reg [31:0] sign_changer = -32'b1;
integer i;

always @(posedge clk) begin
    if (enable) begin
        start <= 1'b1;
	reset_signal=32'b0;
	incac_signal=32'b1;
        A <= A_bus;
        B <= B_bus;
    end
end

 always @(posedge clk)
       if (enable==1'b1)
            begin
           state<=state+1;          
            end   

always @(posedge clk) begin
    if (start) begin
      if (state == 3'b010) begin
            case (Control)
                ADD : begin
                    temp = A + B;
                    C_bus = temp[31:0];
                end

                SUB : begin
                    temp = A + (-B);
			//temp = A + 32'b1;
                     C_bus = temp[31:0];
		if (temp == 32'b0) begin
        		 Z_flag = 0;
    		end else begin
       		 Z_flag = 1;
    		end
               end

                MUL : begin
            	    a_temp ={32'b0,A_bus[31:0]};//a_temp=32'b0;
		    product = 64'b0;
		    for(i=0;i<16;i=i+1)
		    begin
   			if(B[i] == 1)
     			   product=product+a_temp;//add based on multiplier bit
   			else
   			     product=product;
   			a_temp={a_temp[30:0],1'b0};//shift in each iteration
		    end
		    assign C_bus=product[31:0];
                end

                MOD : begin
                   // if (B != 0)
                    //    remainder = A;
                    //else
                     //   remainder = 32'b0;

                   // while (remainder >= B)
                    //    remainder = remainder - B;
		remainder = A[4:0] - (A[4:0] >> 4) * 30;

                    assign C_bus = A[4:0] - (A[4:0] >> 4) * 30;
                end

                PASSATOC : C_bus <= A;

                PASSBTOC :  C_bus<=B;
		

                INCAC : C_bus<=A+1;

                DECAC : C_bus <= A -1;

                RESET : C_bus <= reset_signal;

                default : C_bus <= C_bus;
            endcase
        end
   end
end

endmodule
