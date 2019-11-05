 
module ALU(con,op1,op2,sft_amt,result);
  
  input [31:0] op1,op2;
  input [2:0] con;
  input [4:0] sft_amt;
  output reg [31:0] result;
  
  
  always@(op1,op2,con)
  begin
    if(con==1)
      result= op1+op2;
      
    else if(con==2)
      result= op1-op2;
      
    else if(con==3)  
      result= op1&op2;
      
    else if(con==4) 
      result= op1|op2;
      
    else if(con==5) 
      result= op1<< sft_amt;
    
    else if(con==6) 
      result= op1>> sft_amt;
      
    else 
      result= 32'b0;  
      
  end    
endmodule  