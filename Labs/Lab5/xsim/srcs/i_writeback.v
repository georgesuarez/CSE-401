`timescale 1ns / 1ps

module WRITE_BACK(
    input wire [31:0] mem_read_data,
    input wire [31:0] mem_alu_result,
    input wire        memtoreg,
    output wire [31:0] wb_data
  );
  
  mux mux4(
     .y( wb_data ),
     .a( mem_read_data ),
     .b( mem_alu_result ),
     .sel( memtoreg )
  );
    
endmodule