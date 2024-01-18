`timescale 1ns / 1ps


module Processor(
    input en,
    input clk   
    );


    // used in Instruction_Ram
    wire [5:0] instruction_address;
    wire [15:0] instruction_out_memory;
   
    /////////// used in Control Unit
    wire z_flag,complete;
    wire [5:0] instruction_out_MBRU;
    wire [37:0] control_signals;

    ///////////// USED IN MDR
    wire [7:0] DRam_in;
    wire [31:0] mdr_out;
    wire [7:0]  DRam_out;

   //////////// // used in MBRU
    wire [31:0] mbru_out;


    ///////////// used in MAR
    wire [31:0] mar_out;
    wire [31:0] B_bus;
    wire [31:0] C_bus;

   
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


    // used in mdr
    wire [31:0] mdr_out;        


    // clock divider
    wire clk_div;




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
        .DRam_in(DRam_in),
        .DRam_out(DRam_out)
    );


    Accumulator ACC(
        .clk(clk_div), //added clk divider otherwise 4 operations in 1 clock cycle
        .data_in(C_bus),
        .data_out(A_bus),
        .inc(control_signals[4]),
        .w_en(control_signals[9])
    );


    ALU_32bit ALU(
        .enable(en),
        .clk(clk),   //added clk divider otherwise 4 operations in 1 clock cycle
        .A(A_bus),
        .B(B_bus),
        .out(C_bus),
        .z_flag(z_flag),
        .sel(control_signals[26:23])
    );


   Register K0(
        .clk(clk),
        .w_en(control_signals[18]),
        .data_in(C_bus),
        .data_out(R1_bus)
    );


    Register K1(
        .clk(clk),
        .w_en(control_signals[18]),
        .data_in(C_bus),
        .data_out(R1_bus)
    );


    Register K2(
        .clk(clk),
        .w_en(control_signals[17]),
        .data_in(C_bus),
        .data_out(R2_bus)
    );


    Register K3(
        .clk(clk),
        .w_en(control_signals[16]),
        .data_in(C_bus),
        .data_out(R3_bus)
    );


    Register K4(
        .clk(clk),
        .w_en(control_signals[15]),
        .data_in(C_bus),
        .data_out(R4_bus)
    );


    Register K5(
        .clk(clk),
        .w_en(control_signals[14]),
        .data_in(C_bus),
        .data_out(R5_bus)
    );


    Register K6(
        .clk(clk),
        .w_en(control_signals[13]),
        .data_in(C_bus),
        .data_out(R6_bus)
    );


    Register K7(
        .clk(clk),
        .w_en(control_signals[12]),
        .data_in(C_bus),
        .data_out(R7_bus)
    );


    Register K8(
        .clk(clk),
        .w_en(control_signals[11]),
        .data_in(C_bus),
        .data_out(R8_bus)
    );


    Register P1(
        .clk(clk),
        .w_en(control_signals[10]),
        .data_in(C_bus),
        .data_out(R9_bus)
    );

     Register P2(
        .clk(clk),
        .w_en(control_signals[10]),
        .data_in(C_bus),
        .data_out(R9_bus)
    );

    Register P3(
        .clk(clk),
        .w_en(control_signals[10]),
        .data_in(C_bus),
        .data_out(R9_bus)
    );


    Register CV(
        .clk(clk),
        .w_en(control_signals[10]),
        .data_in(C_bus),
        .data_out(R9_bus)
    );

   

     Register DP(
        .clk(clk),
        .w_en(control_signals[10]),
        .data_in(C_bus),
        .data_out(R9_bus)
    );

     Register I(
        .clk(clk),
        .w_en(control_signals[10]),
        .data_in(C_bus),
        .data_out(R9_bus)
    );


    PC PC(
        .clk(clk_div),
        .en(en),
        .w_en(control_signals[20]),
        .complete(complete),
        .inc(control_signals[5]),
        .data_in(C_bus),
        .instruction_address(instruction_address)  
    );


    B_Bus_Mux MUX(
        .clk(clk),
        .sel(control_signals[3:0]),
        .AC(A_bus),
        .MAR(mar_out),
        .MDR(mdr_out),
        .PC(instruction_address),
        .MBRU(mbru_out),
        .R1(R1_bus),
        .R2(R2_bus),
        .R3(R3_bus),
        .R4(R4_bus),
        .R5(R5_bus),
        .R6(R6_bus),
        .R7(R7_bus),
        .R8(R8_bus),
        .R9(R9_bus),
        .Bus_Out(B_bus)
    );


    Ram RAM(
        .clk(clk),
        .w_en(control_signals[6]),
        .r_en(control_signals[7]),
        .done(complete),
        .address(data_addr),
        .data_in(DRam_out), //maximum value is 256 (8 bits)
        .data_out(DRam_in)
    );
   
    clk_divider cd(
        .clk(clk),
        .clk_div(clk_div)
        );
endmodule
