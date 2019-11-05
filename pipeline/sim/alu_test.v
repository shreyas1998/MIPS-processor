`timescale 1ns/1ns

module ALU_test();
  
  reg [7:0] op1,op2;
  reg  con;
  wire [7:0] result;

  alu alu1(.in1(op1),.in2(op2),.aluc(con),.out(result));

  initial
  begin
    $dumpfile("alu.vcd");
    $dumpvars(0);		

    op1= 55; 
    op2= 2;
    con=0;
    
    #10;
    con=1;  
    #10;	  
  end

endmodule  