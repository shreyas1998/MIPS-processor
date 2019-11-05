module reg_file(read1,write_data,write_reg,write_addr,rst,reg1);
  
  // a regfile of #8 , 8 bit registers
  input[2:0] read1,write_addr;  //write_addr is for the write address
  input[7:0] write_data; // the data to be written
  input write_reg;  // whether to write or not
  input rst;
  output reg [7:0] reg1;

  reg [7:0] reg_mem[7:0];    
  
  
  //decoding the address
  
  always@(*) // changed from assign statement to always. why did  it work?
  begin
    reg1= reg_mem[read1];           //reading
    if(write_reg ==1'b1)	   //writing
    	reg_mem[write_addr]<= write_data;  //working only with non blocking statements
  
  end
         
  always@(posedge rst)
    begin
    reg_mem[0]= 0;
    reg_mem[1]= 1;
    reg_mem[2]= 2;
    reg_mem[3]= 3;
    reg_mem[4]= 4;
    reg_mem[5]= 5;
    reg_mem[6]= 6; 

    end   
    
 endmodule    