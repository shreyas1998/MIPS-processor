module reg_file(read1,read2,write_data,clk,write_reg,write1,rst,reg1,reg2);
  
  // a regfile of 33 registers
  input[4:0] read1,read2,write1;  //write1 is for the write address
  input[31:0] write_data; // the data to be written
  input write_reg;  // whether to write or not
  input clk,rst;
  output reg [31:0] reg1,reg2;

  
  reg [31:0] reg_mem[31:0];   
  // Now 5 32 bit registers for register file, should be 32 registers
  
  //decoding the address
  
  always@(*) // chnaged from assign statement to always. why did              //it work?
  begin
    reg1= reg_mem[read1];
    reg2= reg_mem[read2];
  end
  always@(posedge clk)
    
    if(write_reg== 1'b1)
      reg_mem[write1]<= write_data;
      
  always@(posedge rst)
    begin
    reg_mem[0]= 32'b0100;
    reg_mem[1]= 32'b0101;
    reg_mem[2]= 32'b1111;
    reg_mem[3]= 32'b0;
    reg_mem[4]= 32'b1010;
    reg_mem[5]= 32'b1110;
    reg_mem[6]= 32'b011; 
    reg_mem[7]= 32'b0;
    reg_mem[8]= 32'b111010;
    reg_mem[9]= 32'b011101;
    reg_mem[10]= 32'b011; 

    end   
    
 endmodule    