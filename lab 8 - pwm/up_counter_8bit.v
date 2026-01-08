`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2025 05:11:08 PM
// Design Name: 
// Module Name: up_counter_8bit
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


module up_counter_8bit(
                             input clk,
                             input rst,
                             input load,
                             input [7:0] load_value,
                             output [7:0] count
                       );
    reg [7:0] tmp = 8'd0;       
    always@(posedge clk)
        begin
            if(rst)
             tmp <= 0;
            else if (load)
                tmp <= load_value;
            else
                tmp <= tmp + 1'b1;
        end
        assign count = tmp;
endmodule
