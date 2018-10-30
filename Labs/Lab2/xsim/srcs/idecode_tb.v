`timescale 1ns / 1ps

module idecode_tb;
    
    // Inputs
    reg [31:0] IF_ID_instrout;
    reg [31:0] IF_ID_npcout;
    reg [4:0]  MEM_WB_rd;
    reg MEM_WB_regwrite;
    reg [31:0] WB_mux5_writedata;
    
    // Outputs
    wire [1:0] wb_ctlout;
    wire [2:0] m_ctlout;
    wire regdst;
    wire alusrc;
    wire [1:0] aluop;
    wire [31:0] npcout, rdata1out, rdata2out, s_extendout;
    wire [4:0] instrout_2016, instrout_1511;
    
    // Instantiate the Unit Under Test (UUT)
    I_DECODE uut(
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
        
     initial begin
        // Initialize Inputs
        IF_ID_instrout = 0;
        IF_ID_npcout = 0;
        MEM_WB_rd = 0;
        MEM_WB_regwrite = 0;
        WB_mux5_writedata = 0;
        
        #1
        IF_ID_instrout = 'h002300AA;
        IF_ID_npcout = 1;
        MEM_WB_rd = 1;
        MEM_WB_regwrite = 1;
        WB_mux5_writedata = 35;
        
        #1
        IF_ID_instrout = 'h10654321;
        IF_ID_npcout = 2;
        MEM_WB_rd = 2;
        MEM_WB_regwrite = 1;
        WB_mux5_writedata = 43;
        
        #1
        IF_ID_instrout = 'h00100022;
        IF_ID_npcout = 3;
        MEM_WB_rd = 3;
        MEM_WB_regwrite = 0;
        WB_mux5_writedata = 4;
        
        #1
        IF_ID_instrout = 'h8C123456;
        IF_ID_npcout = 4;
        MEM_WB_rd = 4;
        MEM_WB_regwrite = 1;
        WB_mux5_writedata = 100;
        
        #1
        IF_ID_instrout = 'h8F123456;
        IF_ID_npcout = 5;
        MEM_WB_rd = 5;
        MEM_WB_regwrite = 1;
        WB_mux5_writedata = 0;
        
        #1
        IF_ID_instrout = 'hAD654321;
        IF_ID_npcout = 6;
        MEM_WB_rd = 6;
        MEM_WB_regwrite = 0;
        WB_mux5_writedata = 21;
        
        #1
        IF_ID_instrout = 'h13012345;
        IF_ID_npcout = 7;
        MEM_WB_rd = 7;
        MEM_WB_regwrite = 1;
        WB_mux5_writedata = 24;
        
        #1
        IF_ID_instrout = 'hAC654321;
        IF_ID_npcout = 8;
        MEM_WB_rd = 8;
        MEM_WB_regwrite = 1;
        WB_mux5_writedata = 1;
        
        #1
        IF_ID_instrout = 'h12012345;
        IF_ID_npcout = 9;
        MEM_WB_rd = 9;
        MEM_WB_regwrite = 0;
        WB_mux5_writedata = 155;
        
        #1;
        $stop;        
     end
endmodule
