`timescale 1ns / 1ps

module s_extend(
    input wire [15:0] next_end,
    output reg [31:0] extend
  );
  
  always @ * begin
    // Replicate signed bit 16 times then cancatinate
    extend = { {16{next_end[15]}}, next_end };
  end
  
endmodule