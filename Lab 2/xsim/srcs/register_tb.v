`timescale 1ns / 1ps

module test;
    
    // Outputs
    wire [31:0] A, B;
    
    // Inputs
    reg [4:0] rs, rt, rd;
    reg [31:0] write_data;
    reg reg_write;
    
    register uut( .rs( rs ),
                  .rt( rt ),
                  .rd( rd ),
                  .write_data( write_data ),
                  .reg_write( reg_write ),
                  .A( A ),
                  .B( B ) );
    
    initial
    begin
        rs = 0;
        rt = 1;
        reg_write = 0;
        
        #1 
        rs = 2;
        rt = 3;
        rd = 3;
        write_data = 100;
        
        #1 
        rs = 4;
        rt = 5;
        reg_write = 1;
        
        #1 
        reg_write = 0;
        rt = 3;
        
        #1 
        rs = 6;
        reg_write = 1;
        rd = 6;
        write_data = 100;
        
        #1 $finish;
    end
endmodule