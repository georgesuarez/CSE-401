`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2018 12:15:19 PM
// Design Name: 
// Module Name: pipeline
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


module pipeline();
    
    // Inputs
    reg EX_MEM_PCSrc;
    reg [31:0] EX_MEM_NPC;
    
    // Outputs
    wire [31:0] IF_ID_INSTR;
    wire [31:0] IF_ID_NPC;
    
    // Instantiate the Unit Under Test (UUT)
    I_FETCH uut (
        .EX_MEM_PCSrc(EX_MEM_PCSrc),
        .EX_MEM_NPC(EX_MEM_NPC),
        .IF_ID_INSTR(IF_ID_INSTR),
        .IF_ID_NPC(IF_ID_NPC)
     );
     
     initial
     begin
        EX_MEM_NPC = 0;
        EX_MEM_PCSrc = 0;
     #9
        EX_MEM_PCSrc = 1;
        EX_MEM_NPC = 5;
     #1
        EX_MEM_PCSrc = 0;
     #10;
     $stop;
     end

endmodule
