`timescale 1ns / 1ps

module pipeline();
    
    // Inputs
    wire EX_MEM_PCSrc;
    wire [31:0] EX_MEM_NPC;
    
    // Outputs
    wire [31:0] IF_ID_INSTR;
    wire [31:0] IF_ID_NPC;
    
    
    I_FETCH I_FETCH1 (
        .EX_MEM_PCSrc(EX_MEM_PCSrc),
        .EX_MEM_NPC(EX_MEM_NPC),
        .IF_ID_INSTR(IF_ID_INSTR),
        .IF_ID_NPC(IF_ID_NPC)
     );
     
     // Decode
     wire   [4:0]   MEM_WB_rd;
     wire           MEM_WB_regwrite;
     wire   [31:0]  WB_mux5_writedata;
     wire   [1:0]   wb_ctlout;
     wire   [2:0]   m_ctlout;
     wire           regdst;
     wire           alusrc;
     wire   [1:0]   aluop;
     wire   [31:0]  npcout, rdata1out, rdata2out, s_extendout;
     wire   [4:0]   instrout_2016, instrout_1511;
     
     I_DECODE I_DECODE2(
        .IF_ID_instrout( IF_ID_instr ),
        .IF_ID_npcout( IF_ID_npc ),
        .MEM_WB_rd( MEM_WB_rd ),
        .MEM_WB_regwrite( MEM_WB_regwrite),
        .WB_mux5_writedata( WB_mux5_writedata ),
        .wb_ctlout( wb_ctlout ),
        .m_ctlout( m_ctlout ),
        .regdst( regdst ),
        .alusrc( alusrc ),
        .aluop( aluop ),
        .npcout( npcout ),
        .rdata1out( rdata1out ),
        .rdata2out( rdata2out ),
        .s_extendout( s_extendout ),
        .instrout_2016( instrout_2016 ),
        .instrout_1511( instrout_1511 )
      );
      
      // "Internal" wires for Execute to connect to other Stages
      wire    [1:0]    wb_ctlout_pipe;
      wire             branch, memread, memwrite;
      wire             zero;
      wire    [31:0]   alu_result, rdata2out_pipe;
      wire    [4:0]    five_bit_muxout;
              
      EXECUTE EXECUTE3(
           .wb_ctl( wb_ctlout ),          //11 inputs, based off of outputs of ID/EX latch (Lab 2-2)
           .m_ctl( m_ctlout ),
           .regdst( regdst ), 
           .alusrc( alusrc ),
           .aluop( aluop ), 
           .npcout( npcout ), 
           .rdata1( rdata1out ), 
           .rdata2( rdata2out ), 
           .s_extendout( s_extendout ),
           .instrout_2016( instrout_2016 ), 
           .instrout_1511( instrout_1511 ),
           .wb_ctlout( wb_ctlout_pipe ),    //9 total outputs from EX/MEM latch (Lab 3-2)
           .branch( branch ), 
           .memread( memread ), 
           .memwrite( memwrite ),
           .EX_MEM_NPC( EX_MEM_NPC ),     // add_result in Lab 3-5, said to go to IF_MUX
           .zero( zero ),
           .alu_result( alu_result ), 
           .rdata2out( rdata2out_pipe ),
           .five_bit_muxout( five_bit_muxout )
          );
endmodule
