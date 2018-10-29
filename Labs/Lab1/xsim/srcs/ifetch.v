module I_FETCH ( 
    input EX_MEM_PCSrc,
    input wire [31:0] EX_MEM_NPC,
    output wire [31:0] IF_ID_INSTR, IF_ID_NPC
);

    // signals
    wire [31:0] PC;
    wire [31:0] data_out;
    wire [31:0] npc, npc_mux;
    
    // instantiations
    mux mux1 ( .y(npc_mux),
               .a(EX_MEM_NPC),
               .b(npc),
               .sel(EX_MEM_PCSrc));
               
    pc_mod pc_mod1 ( .pc_out(PC),
                     .npc(npc_mux));
                     
    mem mem1 ( .data(data_out),
               .addr(PC));
               
    if_id if_id1 ( .instructions_out(IF_ID_INSTR),
                   .npc_out(IF_ID_NPC),
                   .instructions_in(data_out),
                   .npc_in(npc));
                   
    incrementer incrementer1 ( .pc_out(npc),
                               .pc_in(PC));
    
endmodule