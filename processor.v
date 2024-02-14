`timescale 1ns / 1ps


module Processor(
    input en,
    input clk

  
    );
// test aded
wire [7:0] test_ram_out;

    // used in Instruction_Ram
    wire [8:0] instruction_address;
    wire [15:0] instruction_out_memory;
   
    /////////// used in Control Unit
    wire z_flag,complete;
    wire [5:0] instruction_out_MBRU;
    wire [37:0] control_signals;

    ///////////// USED IN MDR
   // wire [7:0] DRam_in;
    wire [31:0] mdr_out;
    wire [7:0]  DRam_out;
	
   //////////// // used in MBRU
    wire [31:0] mbru_out;


    ///////////// used in MAR
    wire [31:0] mar_out;
    wire [31:0] B_bus;
    wire [31:0] C_bus;
    wire [11:0] data_addr;
   
    wire [31:0] K0_bus;
    wire [31:0] K1_bus;
    wire [31:0] K2_bus;
    wire [31:0] K3_bus;
    wire [31:0] K4_bus;
    wire [31:0] K5_bus;
    wire [31:0] K6_bus;
    wire [31:0] K7_bus;
    wire [31:0] K8_bus;
    wire [31:0] P1_bus;
    wire [31:0] P2_bus;
    wire [31:0] P3_bus;
    wire [31:0] CV_bus;
    wire [31:0] DP_bus;
    wire [31:0] I_bus;

    // used in Accumulator
    wire [31:0] A_bus;


           


    // clock divider
    wire clk_div;
    wire clk_div_alu;




control_unit CU (
    .clk(clk_div),
    .enable(en),
    .Z_flag(z_flag),
    .addr(control_signals[37:32]),
    .MBRU(instruction_out_MBRU),
    .control_signal(control_signals),
    .finish(complete)
  );


    Instruction_Ram IRAM(
        .clk(clk),      // input clk
        .address(instruction_address),// to be initialized [7:0] address
        .instr_out(instruction_out_memory)//to be initialized reg [25:0] instr_out
    );
 
    MBRU MBRU(
        .clk(clk),
        .fetch(control_signals[8]),
        .instruction_in(instruction_out_memory),
        .instruction_out(instruction_out_MBRU),
        .data_out(mbru_out)
    );


    MAR MAR(
        .clk(clk),
        .w_en(control_signals[27]),
        .data_out(mar_out),
        .data_in(C_bus),
        .data_addr(data_addr)
    );


    MDR MDR(
        .clk(clk),
        .enable(en),
        .w_en(control_signals[26]),
        .write_en(control_signals[6]),
         .read_en(control_signals[7]),
	
        .data_out(mdr_out),
        .data_in(C_bus),
        .DRAM_in(test_ram_out ),
        .DRAM_out(DRam_out)
    );
Ram2 RAM(
        .clk(clk),
        .w_en(control_signals[6]),
        .r_en(control_signals[7]),
	.done(complete),
        .address(data_addr),
        .data_in(DRam_out), //maximum value is 256 (8 bits)
        .data_out(test_ram_out)
    );

     Register AC(
        .clk(clk),
        .w_en(control_signals[9]),
        .data_in(C_bus),
        .data_out(A_bus)
    );


    ALU_32bit ALU(
        .enable(en),
        .clk(clk_div_alu),   //added clk divider otherwise 4 operations in 1 clock cycle
        .A_bus(A_bus),
        .B_bus(B_bus),
        .C_bus(C_bus),
        .Z_flag(z_flag),
        .Control(control_signals[31:28])
    );


   Register K0(
        .clk(clk),
        .w_en(control_signals[24]),
        .data_in(C_bus),
        .data_out(K0_bus)
    );


    Register K1(
        .clk(clk),
        .w_en(control_signals[23]),
        .data_in(C_bus),
        .data_out(K1_bus)
    );


    Register K2(
        .clk(clk),
        .w_en(control_signals[22]),
        .data_in(C_bus),
        .data_out(K2_bus)
    );


    Register K3(
        .clk(clk),
        .w_en(control_signals[21]),
        .data_in(C_bus),
        .data_out(K3_bus)
    );


    Register K4(
        .clk(clk),
        .w_en(control_signals[20]),
        .data_in(C_bus),
        .data_out(K4_bus)
    );


    Register K5(
        .clk(clk),
        .w_en(control_signals[19]),
        .data_in(C_bus),
        .data_out(K5_bus)
    );


    Register K6(
        .clk(clk),
        .w_en(control_signals[18]),
        .data_in(C_bus),
        .data_out(K6_bus)
    );


    Register K7(
        .clk(clk),
        .w_en(control_signals[17]),
        .data_in(C_bus),
        .data_out(K7_bus)
    );


    Register K8(
        .clk(clk),
        .w_en(control_signals[16]),
        .data_in(C_bus),
        .data_out(K8_bus)
    );


    Register P1(
        .clk(clk),
        .w_en(control_signals[15]),
        .data_in(C_bus),
        .data_out(P1_bus)
    );

     Register P2(
        .clk(clk),
        .w_en(control_signals[14]),
        .data_in(C_bus),
        .data_out(P2_bus)
    );

    Register P3(
        .clk(clk),
        .w_en(control_signals[13]),
        .data_in(C_bus),
        .data_out(P3_bus)
    );


    Register CV(
        .clk(clk),
        .w_en(control_signals[11]),
        .data_in(C_bus),
        .data_out(CV_bus)
    );

   

     Register DP(
        .clk(clk),
        .w_en(control_signals[12]),
        .data_in(C_bus),
        .data_out(DP_bus)
    );

     Register I(
        .clk(clk),
        .w_en(control_signals[10]),
        .data_in(C_bus),
        .data_out(I_bus)
    );


    PCounter PC(
        .clk(clk_div),
        .en(en),
        .w_en(control_signals[25]),
        .complete(complete),
        .inc(control_signals[5]),
        .data_in(C_bus),
        .instruction_address(instruction_address)  
    );




    B_Bus_Mux MUX(
        .clk(clk),
        .sel(control_signals[4:0]),
        .AC(A_bus),
        .MAR(mar_out),
        .MDR(mdr_out),
        .PC(instruction_address),
        .MBRU(mbru_out),
	.K0(K0_bus),
        .K1(K1_bus),
        .K2(K2_bus),
        .K3(K3_bus),
        .K4(K4_bus),
        .K5(K5_bus),
        .K6(K6_bus),
        .K7(K7_bus),
        .K8(K8_bus),
        .P1(P1_bus),
 	.P2(P2_bus),
 	.P3(P3_bus),
 	.CV(CV_bus),
 	.DP(DP_bus),
 	.I(I_bus),
	.Bus_Out(B_bus)
);





  

    
   
    clk_divider cd(
        .clk(clk),
        .clk_div(clk_div)
        );
clk_divider_ALU cd_alu(
       .clk(clk),
        .clk_div(clk_div_alu)
        );

endmodule
