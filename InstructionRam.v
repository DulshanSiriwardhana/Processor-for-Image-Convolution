`timescale 1ns / 1ps
module Instruction_Ram(
    input clk,
    input [8:0] address,
    output reg [15:0] instr_out
    );


   
    parameter inst_count = 200;
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
	parameter DECAC         =   6'd59;


      
//completion of the convolution

   
    
    initial
    begin
	inst_ram[0]     = {FETCH, 10'd0};
        inst_ram[1]     = {CLAC, 10'd0};
        inst_ram[2]     = {MVACMAR, 10'd0};
        inst_ram[3]     = {LDAC, 10'd0}; 
        inst_ram[4]     = {MVACK0, 10'd0}; 

        inst_ram[5]     = {CLAC, 10'd0}; 
        inst_ram[6]     = {INAC, 10'd0};
        inst_ram[7]     = {MVACI, 10'd0};
        inst_ram[8]     = {MVACMAR, 10'd0};
        inst_ram[9]     = {LDAC, 10'd0};
        inst_ram[10]    = {MVACK1, 10'd0};

        inst_ram[11]    = {MVIAC, 10'd0};
        inst_ram[12]    = {INAC, 10'd0};
        inst_ram[13]    = {MVACI, 10'd0};
        inst_ram[14]    = {MVACMAR, 10'd0};
        inst_ram[15]    = {LDAC, 10'd0};
        inst_ram[16]    = {MVACK2, 10'd0};

        inst_ram[17]    = {MVIAC, 10'd0};
        inst_ram[18]    = {INAC, 10'd0};
        inst_ram[19]    = {MVACI, 10'd0};
        inst_ram[20]    = {MVACMAR, 10'd0};
        inst_ram[21]    = {LDAC, 10'd0};
        inst_ram[22]    = {MVACK3, 10'd0};

        inst_ram[23]    = {MVIAC, 10'd0};
        inst_ram[24]    = {INAC, 10'd0};
        inst_ram[25]    = {MVACI, 10'd0};
        inst_ram[26]    = {MVACMAR, 10'd0};
        inst_ram[27]    = {LDAC, 10'd0};
        inst_ram[28]    = {MVACK4, 10'd0};

        inst_ram[29]    = {MVIAC, 10'd0};
        inst_ram[30]    = {INAC, 10'd0};
        inst_ram[31]    = {MVACI,   10'd0};
        inst_ram[32]    = {MVACMAR,   10'd0};
        inst_ram[33]    = {LDAC,    10'd0};
        inst_ram[34]    = {MVACK5,    10'd0};

        inst_ram[35]    = {MVIAC, 10'd0};
        inst_ram[36]    = {INAC, 10'd0};
        inst_ram[37]    = {MVACI, 10'd0};
        inst_ram[38]    = {MVACMAR, 10'd0};
        inst_ram[39]    = {LDAC, 10'd0};
        inst_ram[40]    = {MVACK6, 10'd0};




        inst_ram[41]    = {MVIAC, 10'd0};
        inst_ram[42]    = {INAC, 10'd0};
        inst_ram[43]    = {MVACI, 10'd0};
        inst_ram[44]    = {MVACMAR, 10'd0};
        inst_ram[45]    = {LDAC,  10'd0};
        inst_ram[46]    = {MVACK7,  10'd0};

       	inst_ram[47]    = {MVIAC, 10'd0};
        inst_ram[48]    = {INAC, 10'd0};
        inst_ram[49]    = {MVACI, 10'd0};
        inst_ram[50]    = {MVACMAR, 10'd0};
        inst_ram[51]    = {LDAC, 10'd0};
        inst_ram[52]    = {MVACK8, 10'd0};

        inst_ram[53]    = { MVIAC, 10'd0};
        inst_ram[54]    = { INAC, 10'd0};
        inst_ram[55]    = { MVACP1, 10'd0};
        inst_ram[56]    = { LDII, 10'd30};	//Immediate data
        inst_ram[57]    = { ADDI, 10'd0};       //corrected                    
        inst_ram[58]    = { MVACP2, 10'd0};
        inst_ram[59]    = { ADDI, 10'd0};
        inst_ram[60]    = { MVACP3, 10'd0};
        inst_ram[61]    = { LDIDP, 10'd910};    //Immediate data  //corrected
        inst_ram[62]    = { CLAC, 10'd0};
        inst_ram[63]    = { MVACCV, 10'd0};


        inst_ram[64]    = { MVP1AC, 10'd0};                //L1
        inst_ram[65]    = { MVACMAR, 10'd0};
        inst_ram[66]    = { INAC, 10'd0};
        inst_ram[67]    = { MVACP1, 10'd0};  //p1 = 10
        inst_ram[68]    = { LDAC, 10'd0};
        inst_ram[69]    = { MULK0, 10'd0};
        inst_ram[70]    = { MVACCV, 10'd0};


        inst_ram[71]    = { MVP2AC, 10'd0};
        inst_ram[72]    = { MVACMAR, 10'd0};
        inst_ram[73]    = { INAC, 10'd0};
        inst_ram[74]    = { MVACP2, 10'd0};
        inst_ram[75]    = { LDAC, 10'd0};
        inst_ram[76]    = { MULK3, 10'd0}; 
        inst_ram[77]    = { ADDCV, 10'd0};
        inst_ram[78]    = { MVACCV, 10'd0};


        
        inst_ram[79]    = { MVP3AC, 10'd0};
        inst_ram[80]    = { MVACMAR, 10'd0};
        inst_ram[81]    = { INAC, 10'd0};
        inst_ram[82]    = { MVACP3, 10'd0};
        inst_ram[83]    = { LDAC, 10'd0};
        inst_ram[84]    = { MULK6, 10'd0}; 
        inst_ram[85]    = { ADDCV, 10'd0};
        inst_ram[86]    = { MVACCV, 10'd0};

        inst_ram[87]    = { MVP1AC, 10'd0};
        inst_ram[88]    = { MVACMAR, 10'd0};
        inst_ram[89]    = { INAC, 10'd0};
        inst_ram[90]    = { MVACP1, 10'd0}; //p1=11
        inst_ram[91]    = { LDAC, 10'd0};
        inst_ram[92]    = { MULK1, 10'd0}; 
        inst_ram[93]    = { ADDCV, 10'd0};
        inst_ram[94]    = { MVACCV, 10'd0};

        inst_ram[95]    = { MVP2AC, 10'd0};
        inst_ram[96]    = { MVACMAR, 10'd0};
        inst_ram[97]    = { INAC, 10'd0};
        inst_ram[98]    = { MVACP2, 10'd0};
        inst_ram[99]    = { LDAC, 10'd0};
        inst_ram[100]    = { MULK4, 10'd0}; 
        inst_ram[101]    = { ADDCV, 10'd0};
        inst_ram[102]    = { MVACCV, 10'd0};

        inst_ram[103]    = { MVP3AC, 10'd0};
        inst_ram[104]    = { MVACMAR, 10'd0};
        inst_ram[105]    = { INAC, 10'd0};
        inst_ram[106]    = { MVACP3, 10'd0};
        inst_ram[107]    = { LDAC, 10'd0};
        inst_ram[108]    = { MULK7, 10'd0};
        inst_ram[109]    = { ADDCV, 10'd0};
        inst_ram[110]    = { MVACCV, 10'd0};






        inst_ram[111]    = { MVP1AC, 10'd0};
        inst_ram[112]    = { MVACMAR, 10'd0};
        inst_ram[113]    = { INAC, 10'd0};
        //inst_ram[114]    = { MVACP1, 10'd0};
        inst_ram[114]    = { LDAC, 10'd0};
        inst_ram[115]    = { MULK2, 10'd0}; 
        inst_ram[116]    = { ADDCV, 10'd0};
        inst_ram[117]    = { MVACCV, 10'd0};

        inst_ram[118]    = { MVP2AC, 10'd0};
        inst_ram[119]    = { MVACMAR, 10'd0};
        inst_ram[120]    = { INAC, 10'd0};
        //inst_ram[122]    = { MVACP2, 10'd0};
        inst_ram[121]    = { LDAC, 10'd0};
        inst_ram[122]    = { MULK5, 10'd0};
        inst_ram[123]    = { ADDCV, 10'd0};
        inst_ram[124]    = { MVACCV, 10'd0};

        inst_ram[125]    = { MVP3AC, 10'd0};
        inst_ram[126]    = { MVACMAR, 10'd0};
        inst_ram[127]    = { INAC, 10'd0};
        //inst_ram[130]    = { MVACP3, 10'd0};
        inst_ram[128]    = { LDAC, 10'd0};
        inst_ram[129]    = { MULK8, 10'd0}; 
        inst_ram[130]    = { ADDCV, 10'd0};   // 
        inst_ram[131]    = { MVACCV, 10'd0};

	inst_ram[132]    = { MVP1AC, 10'd0};  //changed
	inst_ram[133]    = { DECAC, 10'd0};
	inst_ram[134]    = { MVACP1, 10'd0};

	inst_ram[135]    = { MVP2AC, 10'd0};  //changed
	inst_ram[136]    = { DECAC, 10'd0};
	inst_ram[137]    = { MVACP2, 10'd0};

	inst_ram[138]    = { MVP3AC, 10'd0};  //changed
	inst_ram[139]    = { DECAC, 10'd0};
	inst_ram[140]    = { MVACP3, 10'd0};
 
        inst_ram[141]    = { MVDPAC, 10'd0};
        inst_ram[142]    = { MVACMAR, 10'd0};
	
	inst_ram[143]       = {INAC,10'd0};  // incremented the data ram
	inst_ram[144]       = {MVACDP, 10'd0};

        inst_ram[145]    = { MVCVAC, 10'd0};  //* no error but no change 
        inst_ram[146]    = { STAC, 10'd0};   // loading last 8 digits of zeros  // stac2 check again

	
        inst_ram[147]    = { LDII, 10'd7};      //Immediate data  not loading to I bus but loaded to B bus
        
 	inst_ram[148]    = { MVP1AC, 10'd0};
        inst_ram[149]    = { MOD30, 10'd0};
        inst_ram[150]    = { SUBI, 10'd0};
        inst_ram[151]    = { JUMPZ, 10'd179};            //Jump address
        

	inst_ram[152]    = { MVP1AC, 10'd0}; 
        inst_ram[153]    = { INAC, 10'd0};
	inst_ram[154]    = { MVACP1, 10'd0};
	inst_ram[155]    = { MVP1AC, 10'd0};
        inst_ram[156]    = { INAC, 10'd0};
        inst_ram[157]    = { MVACP1, 10'd0};
      

	inst_ram[158]    = { MVP2AC, 10'd0}; 
        inst_ram[159]    = { INAC, 10'd0};
	inst_ram[160]    = { MVACP2, 10'd0};
	inst_ram[161]    = { MVP2AC, 10'd0};
        inst_ram[162]    = { INAC, 10'd0};
        inst_ram[163]    = { MVACP2, 10'd0};
       

	inst_ram[164]    = { MVP3AC, 10'd0}; 
        inst_ram[165]    = { INAC, 10'd0};
	inst_ram[166]    = { MVACP3, 10'd0};
	inst_ram[167]    = { MVP3AC, 10'd0};
        inst_ram[168]    = { INAC, 10'd0};
        inst_ram[169]    = { MVACP3, 10'd0};
       
        
        inst_ram[170]    = { MVDPAC, 10'd0}; 
        inst_ram[171]    = { INAC, 10'd0};
	inst_ram[172]    = { MVACDP, 10'd0};
	inst_ram[173]    = { MVDPAC, 10'd0};
        inst_ram[174]    = { INAC, 10'd0};
        inst_ram[175]    = { MVACDP, 10'd0};
	inst_ram[176]    = { MVDPAC, 10'd0};
        inst_ram[177]    = { INAC, 10'd0};
        inst_ram[178]    = { MVACDP, 10'd0};

        inst_ram[179]    = { MVDPAC, 10'd0}; //L3
	inst_ram[180]    = { LDII, 10'd827}; //827
	inst_ram[181]    = { SUBI, 10'd0};
	inst_ram[182]    = { LDII, 10'd869};   //869             //Immediate data
	inst_ram[183]    = { SUBI, 10'd0};
        
        inst_ram[184]    = { JUMPNZ, 10'd63};     //Jump address
        inst_ram[185]    = { NOP, 10'd0};              //L2







   
    end
   
    always @(posedge clk)
    begin
        instr_out<= inst_ram[address];
   
    end   
   
endmodule
