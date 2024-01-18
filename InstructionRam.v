`timescale 1ns / 1ps
module Instruction_Ram(
    input clk,
    input [5:0] address,
    output reg [15:0] instr_out
    );


   
    parameter inst_count = 165;
    reg [15:0] inst_ram [inst_count:0];
   
   
    //define instructions
    	parameter FETCH         =   6'd0;
    	parameter CLAC          =   6'd2;
	parameter MVACMAR	=   6'd3;
	parameter LDAC		=   6'd4;
	parameter MVACK0	=   6'd6;
	parameter INAC		=   6'd7;
	parameter MVACI		=   6'd8;
	parameter MVACK1	=   6'd9;
	parameter MVIAC		=   6'd10;
	parameter MVACK2	=   6'd11;
	parameter MVACK3	=   6'd12;
	parameter MVACK4	=   6'd13;
	parameter MVACK5	=   6'd14;
	parameter MVACK6	=   6'd15;
	parameter MVACK7	=   6'd16;
	parameter MVACK8	=   6'd17;
	parameter MVACP1	=   6'd18;
	parameter LDII		=   6'd19;
	parameter MVACP2	=   6'd20;
	parameter ADDI		=   6'd21;
	parameter MVACP3	=   6'd22;
	parameter LDIDP		=   6'd23;
	parameter MVACCV	=   6'd24;
	parameter MVP1AC	=   6'd25;
	parameter MULK0		=   6'd26;
	parameter MVP2AC	=   6'd27;
	parameter MULK3		=   6'd28;
	parameter ADDCV		=   6'd29;
	parameter MULK6		=   6'd30;
	parameter MULK1		=   6'd31;
	parameter MULK4		=   6'd32;
	parameter MVP3AC	=   6'd33;
	parameter MULK7		=   6'd34;
	parameter MULK2		=   6'd35;
	parameter MULK5		=   6'd36;
	parameter MULK8		=   6'd37;
	parameter MVDPAC	=   6'd38;
	parameter MVCVAC	=   6'd39;
	parameter MOD30		=   6'd40;
	parameter STAC		=   6'd41;
	parameter MVII		=   6'd43;
	parameter SUBI		=   6'd44;
	parameter MVACDP	=   6'd45;
	parameter NOP		=   6'd46;
	parameter JUMPNZ	=   6'd47;
	parameter JUMPZ		=   6'd52;


      
//completion of the convolution

   
    
    initial
    begin
        inst_ram[0]     = {CLAC, 10'd0};
        inst_ram[1]     = {MVACMAR, 10'd0};
        inst_ram[2]     = {LDAC, 10'd0}; 
        inst_ram[3]     = {MVACK0, 10'd0}; 

        inst_ram[4]     = {CLAC, 10'd0}; 
        inst_ram[5]     = {INAC, 10'd0};
        inst_ram[6]     = {MVACI, 10'd0};
        inst_ram[7]     = {MVACMAR, 10'd0};
        inst_ram[8]     = {LDAC, 10'd0};
        inst_ram[9]     = {MVACK1, 10'd0};

        inst_ram[10]    = {MVIAC, 10'd0};
        inst_ram[11]    = {INAC, 10'd0};
        inst_ram[12]    = {MVACI, 10'd0};
        inst_ram[13]    = {MVACMAR, 10'd0};
        inst_ram[14]    = {LDAC, 10'd0};
        inst_ram[15]    = {MVACK2, 10'd0};

        inst_ram[16]    = {MVIAC, 10'd0};
        inst_ram[17]    = {INAC, 10'd0};
        inst_ram[18]    = {MVACI, 10'd0};
        inst_ram[19]    = {MVACMAR, 10'd0};
        inst_ram[20]    = {LDAC, 10'd0};
        inst_ram[21]    = {MVACK3, 10'd0};

        inst_ram[22]    = {MVIAC, 10'd0};
        inst_ram[23]    = {INAC, 10'd0};
        inst_ram[24]    = {MVACI, 10'd0};
        inst_ram[25]    = {MVACMAR, 10'd0};
        inst_ram[26]    = {LDAC, 10'd0};
        inst_ram[27]    = {MVACK4, 10'd0};

        inst_ram[28]    = {MVIAC, 10'd0};
        inst_ram[29]    = {INAC, 10'd0};
        inst_ram[30]    = {MVACI,   10'd0};
        inst_ram[31]    = {MVACMAR,   10'd0};
        inst_ram[32]    = {LDAC,    10'd0};
        inst_ram[33]    = {MVACK5,    10'd0};

        inst_ram[34]    = {MVIAC, 10'd0};
        inst_ram[35]    = {INAC, 10'd0};
        inst_ram[36]    = {MVACI, 10'd0};
        inst_ram[37]    = {MVACMAR, 10'd0};
        inst_ram[38]    = {LDAC, 10'd0};
        inst_ram[39]    = {MVACK6, 10'd0};




        inst_ram[40]    = {MVIAC, 10'd0};
        inst_ram[41]    = {INAC, 10'd0};
        inst_ram[42]    = {MVACI, 10'd0};
        inst_ram[43]    = {MVACMAR, 10'd0};
        inst_ram[44]    = {LDAC,  10'd0};
        inst_ram[45]    = {MVACK7,  10'd0};

       	inst_ram[46]    = {MVIAC, 10'd0};
        inst_ram[47]    = {INAC, 10'd0};
        inst_ram[48]    = {MVACI, 10'd0};
        inst_ram[49]    = {MVACMAR, 10'd0};
        inst_ram[50]    = {LDAC, 10'd0};
        inst_ram[51]    = {MVACK8, 10'd0};

        inst_ram[52]    = { MVIAC, 10'd0};
        inst_ram[53]    = { INAC, 10'd0};
        inst_ram[54]    = { MVACP1, 10'd0};
        inst_ram[55]    = { LDII, 10'd30};	//Immediate data
        inst_ram[56]    = { ADDI, 10'd0};                            
        inst_ram[57]    = { MVACP2, 10'd0};
        inst_ram[58]    = { ADDI, 10'd0};
        inst_ram[59]    = { MVACP3, 10'd0};
        inst_ram[60]    = { LDIDP, 10'd910};                    //Immediate data
        inst_ram[61]    = { CLAC, 10'd0};
        inst_ram[62]    = { MVACCV, 10'd0};


        inst_ram[63]    = { MVP1AC, 10'd0};                //L1
        inst_ram[64]    = { MVACMAR, 10'd0};
        inst_ram[65]    = { INAC, 10'd0};
        inst_ram[66]    = { MVACP1, 10'd0};
        inst_ram[67]    = { LDAC, 10'd0};
        inst_ram[68]    = { MULK0, 10'd0};
        inst_ram[69]    = { MVACCV, 10'd0};


        inst_ram[70]    = { MVP2AC, 10'd0};
        inst_ram[71]    = { MVACMAR, 10'd0};
        inst_ram[72]    = { INAC, 10'd0};
        inst_ram[73]    = { MVACP2, 10'd0};
        inst_ram[74]    = { LDAC, 10'd0};
        inst_ram[75]    = { MULK3, 10'd0}; 
        inst_ram[76]    = { ADDCV, 10'd0};
        inst_ram[77]    = { MVACCV, 10'd0};


        
        inst_ram[78]    = { MVP3AC, 10'd0};
        inst_ram[79]    = { MVACMAR, 10'd0};
        inst_ram[80]    = { INAC, 10'd0};
        inst_ram[81]    = { MVACP3, 10'd0};
        inst_ram[82]    = { LDAC, 10'd0};
        inst_ram[83]    = { MULK6, 10'd0}; 
        inst_ram[84]    = { ADDCV, 10'd0};
        inst_ram[85]    = { MVACCV, 10'd0};

        inst_ram[86]    = { MVP1AC, 10'd0};
        inst_ram[87]    = { MVACMAR, 10'd0};
        inst_ram[88]    = { INAC, 10'd0};
        inst_ram[89]    = { MVACP1, 10'd0};
        inst_ram[90]    = { LDAC, 10'd0};
        inst_ram[91]    = { MULK1, 10'd0}; 
        inst_ram[92]    = { ADDCV, 10'd0};
        inst_ram[93]    = { MVACCV, 10'd0};

        inst_ram[94]    = { MVP2AC, 10'd0};
        inst_ram[95]    = { MVACMAR, 10'd0};
        inst_ram[96]    = { INAC, 10'd0};
        inst_ram[97]    = { MVACP2, 10'd0};
        inst_ram[98]    = { LDAC, 10'd0};
        inst_ram[99]    = { MULK4, 10'd0}; 
        inst_ram[100]    = { ADDCV, 10'd0};
        inst_ram[101]    = { MVACCV, 10'd0};

        inst_ram[102]    = { MVP3AC, 10'd0};
        inst_ram[103]    = { MVACMAR, 10'd0};
        inst_ram[104]    = { INAC, 10'd0};
        inst_ram[105]    = { MVACP3, 10'd0};
        inst_ram[106]    = { LDAC, 10'd0};
        inst_ram[107]    = { MULK7, 10'd0};
        inst_ram[108]    = { ADDCV, 10'd0};
        inst_ram[109]    = { MVACCV, 10'd0};






        inst_ram[110]    = { MVP1AC, 10'd0};
        inst_ram[111]    = { MVACMAR, 10'd0};
        inst_ram[112]    = { INAC, 10'd0};
        inst_ram[113]    = { MVACP1, 10'd0};
        inst_ram[114]    = { LDAC, 10'd0};
        inst_ram[115]    = { MULK2, 10'd0}; 
        inst_ram[116]    = { ADDCV, 10'd0};
        inst_ram[117]    = { MVACCV, 10'd0};

        inst_ram[118]    = { MVP2AC, 10'd0};
        inst_ram[119]    = { MVACMAR, 10'd0};
        inst_ram[120]    = { INAC, 10'd0};
        inst_ram[121]    = { MVACP2, 10'd0};
        inst_ram[122]    = { LDAC, 10'd0};
        inst_ram[123]    = { MULK5, 10'd0};
        inst_ram[124]    = { ADDCV, 10'd0};
        inst_ram[125]    = { MVACCV, 10'd0};

        inst_ram[126]    = { MVP3AC, 10'd0};
        inst_ram[127]    = { MVACMAR, 10'd0};
        inst_ram[128]    = { INAC, 10'd0};
        inst_ram[129]    = { MVACP3, 10'd0};
        inst_ram[130]    = { LDAC, 10'd0};
        inst_ram[131]    = { MULK8, 10'd0}; 
        inst_ram[132]    = { ADDCV, 10'd0};
        inst_ram[133]    = { MVACCV, 10'd0};



        inst_ram[134]    = { MVDPAC, 10'd0};
        inst_ram[135]    = { MVACMAR, 10'd0};
        inst_ram[136]    = { MVCVAC, 10'd0};
        inst_ram[137]    = { STAC, 10'd0};


        inst_ram[138]    = { LDII, 10'd29};                       //Immediate data
        inst_ram[139]    = { MVP1AC, 10'd0};
        inst_ram[140]    = { MOD30, 10'd0};
        inst_ram[141]    = { SUBI, 10'd0};
        inst_ram[142]    = { JUMPZ, 10'd159};            //Jump address
        inst_ram[143]    = { MVP1AC, 10'd0}; 
        inst_ram[144]    = { INAC, 10'd0};
        inst_ram[145]    = { INAC, 10'd0};
        inst_ram[146]    = { MVACP1, 10'd0};
        inst_ram[147]    = { MVP2AC, 10'd0}; 
        inst_ram[148]    = { INAC, 10'd0};
        inst_ram[149]    = { INAC, 10'd0};
        inst_ram[150]    = { MVACP2, 10'd0};
        inst_ram[151]    = { MVP3AC, 10'd0};
        inst_ram[152]    = { INAC, 10'd0};
        inst_ram[153]    = { INAC, 10'd0};
        inst_ram[154]    = { MVACP3, 10'd0}; 
        inst_ram[155]    = { MVDPAC, 10'd0};
        inst_ram[156]    = { INAC, 10'd0};
        inst_ram[157]    = { INAC, 10'd0}; 
        inst_ram[158]    = { MVACDP, 10'd0};

        inst_ram[159]    = { LDII, 10'd869};          //L3      //Immediate data
        inst_ram[160]    = { MVDPAC, 10'd0};
        inst_ram[161]    = { SUBI, 10'd0};
        inst_ram[162]    = { JUMPNZ, 10'd63};     //Jump address
        inst_ram[163]    = { NOP, 10'd0};              //L2







   
    end
   
    always @(posedge clk)
    begin
        instr_out<= inst_ram[address];
   
    end   
   
endmodule
