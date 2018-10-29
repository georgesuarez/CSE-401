`timescale 1ns / 1ps

module if_id ( output reg [31:0] instructions_out, npc_out,
               input wire [31:0] instructions_in, npc_in
              );
              
    initial begin
        instructions_out <= 0;
        npc_out <= 0;
    end
    
    always @ * begin
        #1 
           instructions_out <= instructions_in;
           npc_out <= npc_in;
    end
endmodule