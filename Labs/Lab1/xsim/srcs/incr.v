`timescale 1ns / 1ps

module incrementer ( input wire [31:0] pc_in, output wire [31:0] pc_out );
    assign pc_out = pc_in + 1;  // Increment PC by 1
endmodule