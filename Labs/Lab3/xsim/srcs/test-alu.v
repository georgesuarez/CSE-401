`timescale 1ns / 1ps

module test ();
    
    // Register Declarations
    reg [31:0] a, b;
    reg [2:0] control;
    
    // Wire Ports
    wire [31:0] result;
    wire        zero;
    
    initial begin
        a <= 'b1010;
        b <= 'b0111;
        control <= 'b011;
        
        $display("A = %b\tB = %b", a, b);
        $monitor("ALUOP = %b\tresult = %b", control, result);
        
        #1
        control <= 'b100;
        
        #1
        control <= 'b010;
        
        #1
        control <= 'b111;
        
        #1
        control <= 'b110;
        
        #1
        control <= 'b001;
        
        #1
        control <= 'b000;
         
        #1
        $finish;
    end
    
    alu alu2 ( .a( a ), .b( b ), .control( control ), .result( result ), .zero( zero ) );

endmodule
