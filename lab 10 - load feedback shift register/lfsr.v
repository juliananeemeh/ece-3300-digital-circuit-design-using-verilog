`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2025 10:11:29 PM
// Design Name: 
// Module Name: lfsr
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lfsr(
                input clk,
                input rst,
                input en,
                input load_lfsr,
                input [31:0] lfsr_inp,
                output reg [31:0] lfsr_out
           );

           wire new_bit = lfsr_inp[23] ^ lfsr_inp[5] ^ lfsr_inp[2] ^ lfsr_inp[0];
           always @(posedge clk) begin
           if (rst)
                lfsr_out <= 32'h0;
           else if (load_lfsr)
                lfsr_out <= lfsr_inp;
           else 
                lfsr_out <= {new_bit,lfsr_out[31:1]};
                end
endmodule
