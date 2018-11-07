`timescale 1ns / 1ps

module mem_test;
    
    wire [31:0] read_data;
    
    reg [31:0] address;
    reg [31:0] write_data;
    reg mem_read, mem_write;
    
    initial begin
        mem_read = 1;
        mem_write = 0;
        address = 32'b00000001;
        
        #1
        mem_read = 1;
        mem_write = 0;
        address = 32'b00000001;
        
        #1
        mem_read = 0;
        mem_write = 1;
        address = 32'b00000001;
        write_data = ~address;
        
        #1
        mem_read = 1;
        mem_write = 0;
        address = 32'b00000010;
        
        #1
        mem_read = 1;
        mem_write = 1;
        address = 32'b00000010;
        write_data = ~address;
        
        #1
        mem_read = 1;
        mem_write = 0;
        address = 32'b00000100;
        
        #1
        mem_read = 0;
        mem_write = 1;
        address = 32'b00000100;
        write_data = ~address;
        
        #1
        mem_read = 1;
        mem_write = 0;
        address = 32'b00001000;
        
        #1
        mem_read = 1;
        mem_write = 1;
        address = 32'b00001000;
        write_data = ~address;
        
        #1 $finish; 
    end
    
    data_memory data_memory4( 
    .addr(address), 
    .write_data(write_data), 
    .memwrite(mem_write), 
    .memread(mem_read), 
    .read_data(read_data)
   );

endmodule
