`timescale 1ns / 1ps

module register( 
    input [4:0] rs,         
    input [4:0] rt,
    input [4:0] rd,
    input [31:0] write_data,
    input reg_write,
    output reg [31:0] A,    // rs output
    output reg [31:0] B     // rd output
  );
  
  // Register declaration
  reg [31:0] REG [0:31]; // Gives us 32 registers, each 32 bits long
  
  integer i;
  
  initial begin
    A <= 0;
    B <= 0;
    
    // Initialize our registers
    for (i = 0; i < 32; i = i + 1)
        REG[i] <= 0;
        
        // Display contents of the first 9 registers
        $display("From Register Memory:");
        for (i = 0; i < 9; i = i + 1)
            $display("\tREG[%0d] = %0d", i, REG[i]);
            
            // Display last register
            $display("\t...");
            $display("\tREG[%0d] = %0d", 31, REG[31]);
  end
  
  always @ * begin
    A <= REG[rs];
    B <= REG[rt];
    
    // Write data using index rd
    if (rd != 0 && reg_write)
        REG[rd] <= write_data;
    end
  
endmodule // register