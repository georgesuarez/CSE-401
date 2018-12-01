`timescale 1ns / 1ps

module data_memory(
    input wire [31:0] addr, // Memory address
    input wire [31:0] write_data,  // Memory address contents
    input wire        memwrite, memread,
    output reg [31:0] read_data  // Output of memory address contents
   );
   
   // Register Declaration
   reg [31:0] DMEM[255:0];  // 256 words of 32-bit memory
   
   integer i;
   
   initial begin
        read_data <= 0;
        
        // Initialize DMEM[0-5] from data.txt
        $readmemb("C:/Users/George Suarez/Desktop/lab_6/data.txt", DMEM, 0, 6);
        
        // Initialize DMEM[6-255] to 6-255
        /*for(i = 6; i < 256; i = i + 1)
            DMEM[i] = i;
        */
           
        // Display DMEM[0-5]
        $display("From Data Memory (data.txt): ");
        for(i = 0; i < 6; i = i + 1)
            $display("\tDMEM[%0d] = %0d", i, DMEM[i]);
        
        // Display DMEM[255]
        $display("\t...");
        $display("\tDMEM[%0d] = %0d", 255, DMEM[255]);
   end  
   
   always @ (addr) begin
        if (memwrite)   // Store
        begin
            DMEM[addr] <= write_data;
        end
        
        if (memread)    // Load
        begin
            read_data <= DMEM[addr];
        end
   end
    
endmodule  // data_memory
