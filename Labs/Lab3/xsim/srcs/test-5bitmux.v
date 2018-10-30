module test ();
    
    // Wire ports
    wire [4:0] y;
    
    // Register Declarations
    reg [4:0] a, b;
    reg sel;
    
    mux mux2( .y( y ), .a( a ), .b( b ), .sel( sel ) );
    
    initial begin
        a = 5'b01010;
        b = 5'b10101;
        sel = 1'b1;
        
        #10
        a = 5'b00000;
        
        #10
        sel = 1'b1;
        
        #10
        b = 5'b11111;
        
        #5
        a = 5'b00101;
        
        #5
        sel = 1'b0;
        b = 5'b11101;
        
        #5
        sel = 1'bx;
    end   
    
    always @ ( a or b or sel )
        #1
        $display("At t = %0d sel = %b A = %b B = %b Y = %b", $time, sel, a, b, y); 
     
endmodule