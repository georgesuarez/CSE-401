`timescale 1ns / 1ps

module writeback_tb;

    // Inputs
    reg [31:0] mem_read_data, mem_alu_result;
    reg memtoreg;
    
    // Outputs
    wire wb_data;
    
    WRITE_BACK uut(
        .mem_read_data( mem_read_data ),
        .mem_alu_result( alu_result ),
        .memtoreg( memtoreg ),
        .wb_data( wb_data )
    );
    
    initial begin
        mem_read_data = 32'h002300AA;
        mem_alu_result = 32'h10654321;
        memtoreg = 1'b1;
        
        #10
        mem_read_data = 32'h00100022;
        
        #10
        memtoreg = 1'b1;
        
        #10
        mem_alu_result = 32'h8C123456;
        
        #5
        mem_read_data = 32'h8F123456;
        
        #5
        memtoreg = 1'b0;
        mem_alu_result = 32'hFFFFFFFF;
        
        #5;
        memtoreg = 1'bx;
        
    end
    
    always @ ( mem_read_data or mem_alu_result or memtoreg )
        #1
        $display("At t = %0d memtoreg = %b mem_read_data = %h mem_alu_result = %h wb_data = %h", 
            $time, memtoreg, mem_read_data, mem_alu_result, wb_data);

endmodule