module test ();
    
    // Wire ports
    wire [2:0] select;
    
    // Register Declarations
    reg [1:0] aluop;
    reg [5:0] funct;
    
    alu_control alu_control2 ( .funct( funct ), .aluop( aluop ), .select( select ) );
    
    initial begin
        aluop = 2'b00;
        funct = 6'b100000;
        $monitor("ALUOp = %b\tfunct = %b\tselect = %b", aluop, funct, select);
        
        #1
        aluop = 2'b01;
        funct = 6'b100000;
        
        #1
        aluop = 2'b10;
        funct = 6'b100000;
        
        #1
        funct = 6'b100010;
        
        #1
        funct = 6'b100100;
        
        #1
        funct = 6'b100101;
        
        #1
        funct = 6'b101010;
        
        #1
        $finish;
    end
endmodule