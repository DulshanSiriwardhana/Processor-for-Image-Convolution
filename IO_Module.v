module IO_module (
    input clk,
    input reset,
    input start,
    input rx_done,
    output reg tx_start,
    input tx_done,
    output reg [15:0] ram_addr,
    output reg write,
    output reg read,
    output reg reset_cpu,
    output sel
);

    parameter RAM_LEN = 65536;
    parameter IDLE_RX = 0;
    parameter RX_1 = 1;
    parameter RX_2 = 2;
    parameter RX_3 = 3;
    parameter WAIT_RX = 4;
    parameter IDLE_TX = 5;
    parameter TX_1 = 6;
    parameter TX_2 = 7;
    parameter TX_3 = 8;
    parameter TX_4 = 9;
    parameter WAIT_TX = 10;

    reg [3:0] STATE_RX = IDLE_RX;
    reg [3:0] STATE_TX = IDLE_TX;
    reg [16:0] write_addr = 0;
    reg [16:0] read_addr = 0;
    reg select = 0;

    assign sel = select;

    initial begin
        reset_cpu <= 1'b0;
    end

    always @(posedge clk) begin
        case (STATE_RX)
            IDLE_RX:
                begin
                    if (rx_done) begin
                        ram_addr <= write_addr[15:0];
                        STATE_RX <= RX_1;
                    end
                    else begin
                        write <= 0;
                        STATE_RX <= IDLE_RX;
                    end
                    if (reset) begin
                        write_addr <= 0;
                        select <= 0;
                    end
                    else begin
                        write_addr <= write_addr;
                    end
                end
            RX_1 :
		begin
		
 			write <= 1;
 			STATE_RX <= RX_2 ;
 		end
 			
 	    RX_2 :
 		begin
 			write <= 0;
 			write_addr <= write_addr + 1;
 			STATE_RX <= RX_3 ;
 		end

 	     RX_3 :
 		begin
 			if ( write_addr == RAM_LEN ) begin
 				reset_cpu <= 1;
				select <= 1;
 				STATE_RX <= WAIT_RX ;
 			end
 			else begin
 				reset_cpu <= 0;
 				STATE_RX <= WAIT_RX ;
 			end
 		end

 		WAIT_RX :
 		begin
 			if (~ rx_done ) begin //
 				STATE_RX <= IDLE_RX ;
 				end
		else begin
 			STATE_RX <= WAIT_RX ;
 		end

 		if ( reset ) begin
 			write_addr <= 0;
			select <= 0;
 		end
 		else begin
			 write_addr <= write_addr ;
 		end
 		end 
                default: STATE_RX <= IDLE_RX;
        endcase

        case ( STATE_TX )

 		IDLE_TX :
 		begin
 			if ( start ) begin
 				read_addr <= 0;
 				select <= 0;
 				STATE_TX <= TX_1 ;
 			end
 			else begin
 				read <= 1 ?b0;
 				read_addr <= 0;
 				STATE_TX <= IDLE_TX ;
 			end



			begin
 				if ( start ) begin
 					read_addr <= 0;
 					 select <= 0;
					 STATE_TX <= TX_1 ;
 				end
 				else begin
 					read <= 1 ?b0;
 					read_addr <= 0;
 					STATE_TX <= IDLE_TX ;
 				end




 				TX_1 :
 					begin
						ram_addr <= read_addr [15:0];
 						read <= 1 ?b1;
 						STATE_TX <= TX_2 ;
 					end

 				TX_2 :
 					begin
 						read <= 1 ?b0;
						tx_start <= 1;
						 STATE_TX <= TX_3 ;
 					end

 				TX_3 :
 					begin
 						tx_start <= 0;
 						STATE_TX <= TX_4 ;
 					end


                                TX_4 :   				
 					begin
						if ( tx_done ) begin
 							if ( read_addr == RAM_LEN ) begin
 								read_addr <= WAIT_TX ;
							 end
 							else begin
 								read_addr <= read_addr + 1;
 								STATE_TX <= TX_1 ;
						 	end
 						end
 						else begin
 							STATE_TX <= TX_4 ;
 						end
 					end

 				WAIT_TX :
 					begin
 					
						if (~ start ) 
							begin
								STATE_TX <= IDLE_TX ;
							 end
 						else begin
 							STATE_TX <= WAIT_TX ;
 						end
 					end

 				default : STATE_TX <= IDLE_TX ;

 			endcase
 		end
       end
endmodule

