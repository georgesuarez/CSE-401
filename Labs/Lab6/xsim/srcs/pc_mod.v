`timescale 1ns / 1ps

module pc_mod( output reg [31:0] pc_out, input wire [31:0] npc );
    
    initial 
    begin
        pc_out <= 0;
    end
    
    always @ ( npc ) 
    begin
        #1 pc_out <= npc;
    end
    
endmodule