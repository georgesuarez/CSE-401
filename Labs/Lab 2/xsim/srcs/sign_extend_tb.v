module test();
    // Port Wires
    wire [31:0] se_out;
    
    // Register Declarations
    reg [15:0] se_in;
    
    initial begin
        se_in = 0;
        #1 se_in = 16'b10;
        #1 se_in = 16'b01;
    end
    
    initial begin
        $monitor("Time = %0d\tse_in = %b\tse_out = %b", $time, se_in, se_out);
    end
    
    s_extend s_extend1( .next_end( se_in ), .extend( se_out ) );
    
endmodule