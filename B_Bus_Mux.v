`timescale 1ns / 1ps


module B_Bus_Mux(
    input clk,
    input [4:0] sel,
    input [31:0] AC,
    input [31:0] MAR,
    input [31:0] MDR,
    input [5:0]  PC,
    input [31:0] MBRU,
    input [31:0] K0,
    input [31:0] K1,
    input [31:0] K2,
    input [31:0] K3,
    input [31:0] K4,
    input [31:0] K5,
    input [31:0] K6,
    input [31:0] K7,
    input [31:0] K8,
    input [31:0] P1,
    input [31:0] P2,
    input [31:0] P3,
    input [31:0] DP,
    input [31:0] CV,
    input [31:0] I,

    output reg [31:0] Bus_Out
    );
   
    always @(sel or MAR or MDR or PC or MBRU or K0 or K1 or K2 or K3 or K4 or K5 or K6 or K7 or K8 or P1 or P2 or P3 or DP or CV or I)
   
        begin
            case(sel)
            
            5'b10111 : Bus_Out <= MAR;
            5'b00001 : Bus_Out <= MDR;
            5'b10001 : Bus_Out <= MBRU;
	    5'b00010 : Bus_Out <= K0;
            5'b00011 : Bus_Out <= K1;
            5'b00100 : Bus_Out <= K2;
            5'b00101 : Bus_Out <= K3;
            5'b00110 : Bus_Out <= K4;
            5'b00111 : Bus_Out <= K5;
            5'b01000 : Bus_Out <= K6;
            5'b01001 : Bus_Out <= K7;
            5'b01010 : Bus_Out <= K8;
            5'b01011 : Bus_Out <= P1;
            5'b01100: Bus_Out <= P2;
            5'b01101: Bus_Out <= P3;
	    5'b01110: Bus_Out <= DP;
	    5'b01111: Bus_Out <= CV;
	    5'b10000: Bus_Out <= I;
            5'b10011 : Bus_Out <= {26'b0,PC};
           // default : Bus_Out <= 32'b0;
	   default : Bus_Out <= Bus_Out;

            endcase
         end         
endmodule

