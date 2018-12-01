`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2018 11:57:26 AM
// Design Name: 
// Module Name: mem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mem(
    output reg [31:0] data,
    input wire [31:0] addr
    );
    
    // Regsiter Declarations
    reg [31:0] MEM[0:127];
    integer i;
  
    
    // Initialize Registers
    /*initial begin
       MEM[0] <= 'h002300AA;
       MEM[1] <= 'h10654321;
       MEM[2] <= 'h00100022;
       MEM[3] <= 'h8C123456;
       MEM[4] <= 'h8F123456;
       MEM[5] <= 'hAD654321;
       MEM[6] <= 'h13012345;
       MEM[7] <= 'hAC654321;
       MEM[8] <= 'h12012345;
       MEM[9] <= 'h90000099;
     end
   */
   
   initial begin
        $readmemb("C:/Users/George Suarez/Desktop/lab_6/risc.txt", MEM);
        
        $display("From Memory (risc.txt): ");
                for(i = 0; i < 24; i = i + 1)
                    $display("\tMEM[%0d] = %0b", i, MEM[i]);
   end
     
     
     always @ ( addr ) 
     begin
        data <= MEM[addr];
     end 
endmodule
