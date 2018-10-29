module test ();
    // Port wires
    wire [08:0] controls;
    
    // Register Declarations
    reg [31:0] instr;
    
    initial begin
        instr[31:26] <= 6'b0;
        $display("Time\t\tOPCODE\t\t\t\t\Controlbits\n");
        $monitor("%0d\t\t%b\t%b ", $time, instr, controls);
        #20; $finish;
    end
    
    always begin
        #1 instr[31:26] = 35;
        #1 instr[31:26] = 43;
        #1 instr[31:26] = 4;
        #1 instr[31:26] = 100;
        #1 instr[31:26] = 0;
     end
     
     control control1 ( instr[31:26], controls );
endmodule