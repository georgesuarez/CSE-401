`timescale 1ns / 1ps

module alu_control (
    input wire [5:0] funct,
    input wire [1:0] aluop,
    output reg [2:0] select
   );
   
   parameter Rtype = 2'b10,
             Radd  = 2'b10,
             Rsub  = 2'b10,
             Rand  = 2'b10,
             Ror   = 2'b10,
             Rslt  = 2'b10; 
   
   parameter lwsw  = 2'b00,     // Since LW and SW use the same bit pattern, only way to store them as a parameter
             Itype = 2'b01,     // beq, branch
             xis   = 6'bXXXXXX;
             
   // ALU Control Inputs Designation
   parameter ALUadd = 3'b010,   // For R-type instructions
             ALUsub = 3'b110,
             ALUand = 3'b000,
             ALUor  = 3'b001,
             ALUslt = 3'b111;
             
   // If the input information does not correspond to any valid instruction,
   // alu_op = 2'b11 which sets control = ALUx = 3'b011
   // and ALU output is 32 x's as required by lab manual
   parameter unknown = 2'b11,  // For invalid opcode, ALUop = 2'b11
             ALUx    = 3'b011;
   
   // Funct field
   parameter FUNCTadd = 6'b100000,
             FUNCTsub = 6'b100010,
             FUNCTand = 6'b100100,
             FUNCTor  = 6'b100101,
             FUNCTslt = 6'b101010;
             
   initial
    select <= 0;
    
   always @ * begin
    if ( aluop == Rtype )
    begin
        case ( funct )
            // Assign the correct select value based on the function field
            // Use Fig 3.2 to aid you in this.
            // Desired ALU action
            FUNCTadd : select <= ALUadd;
            FUNCTsub : select <= ALUsub;
            FUNCTand : select <= ALUand;
            FUNCTor  : select <= ALUor;
            FUNCTslt : select <= ALUslt;
            default  : select <= ALUx;
        endcase
     end
     
     // For all other types. Use figure 3.2 to help you out.
     // Feel free to reuse any of the parameters defined above.
     else if ( aluop == lwsw )
     begin
        select <= ALUadd;
     end
     
     else if ( aluop == Itype )
     begin
        select <= ALUsub;
     end
     
     else if ( aluop == unknown )
     begin
        select <= ALUx;
     end
     
     else
     begin
        select <= select;
     end
   end
endmodule // alu_control
