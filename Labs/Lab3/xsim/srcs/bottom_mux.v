`timescale 1ns / 1ps

module bottom_mux(
    output wire [31:0] y,
    input wire [31:0] a, b,
    input wire sel
  );
  
  assign y = sel ? a : b;
  
endmodule // mux