module test();
    
    // Port Wires
    wire [31:0] rdata1, rdata2, wdata;
    wire [4:0] wreg;
    wire [31:0] A, B;
    wire reg_write;
    wire [31:0] rreg1, rreg2;
    
    // Register Declarations
    reg [31:0] register[0:31];
       
    initial begin
        $display("Time\tRead data 1\tRead Data 2\n");
        $monitor("%0d\t%h\t%h", $time, rdata1, rdata2);
        #20; $finish;
    end
    
    always @ ( reg_write ) begin
        #1 register[0] <= 'h002300AA;
        #1 register[1] <= 'h10654321;
        #1 register[2] <= 'h00100022;
        #1 register[3] <= 'h8C123456;
        #1 register[4] <= 'h8F123456;
        #1 register[5] <= 'hAD654321;
        #1 register[6] <= 'h13012345;
        #1 register[7] <= 'hAC654321;
        #1 register[8] <= 'h12012345;
    end
    
    register reg1( .rs( rreg1[25:21] ),
                   .rt( rreg2[20:16] ),
                   .rd( wreg ),
                   .write_data( wdata ),
                   .reg_write( reg_write ),
                   .A( rdata1 ),
                   .B( rdata2 ) );
    
endmodule