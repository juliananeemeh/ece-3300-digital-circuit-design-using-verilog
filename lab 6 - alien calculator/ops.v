`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2025 03:14:45 PM
// Design Name: 
// Module Name: ops
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


module ops(
            input [3:0] a, 
            input [3:0] b, 
            input [1:0] op,
            output reg [7:0] result

    );
    
    always@(*)
            begin
                case (op)
                 2'b00: result = a+b;
                 2'b01: result = a-b; 
                 2'b10: result = b-a;
                 2'b11: result = a*b;
                 default: result = 8'bzzzz_zzzz;
                 endcase
            end 
endmodule
