 
module control_unit(inst_out,mux_cont,aluop_shamt,write_reg);
  
  input [31:0] inst_out;
  output mux_cont,write_reg;
  reg [2:0] alu_op;
  output [7:0] aluop_shamt;
  
  assign mux_cont= inst_out[31]?1:0;    // 1 means immediate 
  assign write_reg= 1'b1;
  assign aluop_shamt= {alu_op,inst_out[10:6]};  // alu op shamt is a combination of alu and shamt
  // 1 add, 2 sub, 3 and, 4 or, 5 sll, 6 srl
  always@(*)
    begin
    
    if(inst_out[31:26]== 6'b0)
      begin 
        case(inst_out[5:0])
      // what kind of statements to use?
      
        6'b100000: alu_op= 3'b001;
        6'b100010: alu_op= 3'b010;
        6'b100100: alu_op= 3'b011;
        6'b100101: alu_op= 3'b100;
        6'b000000: alu_op= 3'b101;
        6'b000010: alu_op= 3'b110;
        endcase
        
      end
    else
      alu_op= 3'b0; 
    end 
endmodule