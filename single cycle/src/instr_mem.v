
module instr_mem(PC,inst_out,rst);
  
  input rst;
  input [4:0]PC;
  output[31:0] inst_out;
  
  reg [7:0] I_m[31:0]; // chnange it to 32 bits
  
  always@(negedge rst)
    begin
    I_m[0]= 8'hFC;
    I_m[1]= 8'h20;
    I_m[2]= 8'h00;
    I_m[3]= 8'h08;
    I_m[4]= 8'h00;
    I_m[5]= 8'h01;
    I_m[6]= 8'h10; 
    I_m[7]= 8'h20;	  
    I_m[8]= 8'h00; 
    I_m[9]= 8'h85;
    I_m[10]= 8'h30;  
    I_m[11]= 8'h22; 
    I_m[12]= 8'h01; 
    I_m[13]= 8'h09; 
    I_m[14]= 8'h50; 
    I_m[15]= 8'h24; 
    I_m[16]= 8'h01; 
    I_m[17]= 8'h28; 
    I_m[18]= 8'h50; 
    I_m[19]= 8'h25;
    I_m[20]= 8'h01; 
    I_m[21]= 8'h66;
    I_m[22]= 8'h01; 
    I_m[23]= 8'h80;
    I_m[24]= 8'h01; 
    I_m[25]= 8'hA9; 
    I_m[26]= 8'h02; 
    I_m[27]= 8'h82; 
    I_m[28]= 8'h0; 
    I_m[29]= 8'h0; 
    I_m[30]= 8'h0; 
    I_m[31]= 8'h0; 
  
  
    end 
     
assign inst_out= {I_m[PC],I_m[PC+1],I_m[PC+2],I_m[PC+3]} ;


endmodule
  
  