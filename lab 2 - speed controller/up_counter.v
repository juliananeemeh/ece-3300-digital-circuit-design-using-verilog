`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2025 04:44:54 PM
// Design Name: 
// Module Name: up_counter
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


module up_counter #(parameter WIDTH = 4)
    (
    input clk,
    input rst,
    input en,
    output [WIDTH-1:0] count 
    );
    reg [WIDTH-1:0] tmp;
    
    always@(posedge clk or posedge rst)
        begin
            if(rst)
             tmp <= 0;
            else
                begin
                if(en)
                 tmp<= tmp+1;
                end
        end
        assign count = tmp;
endmodule
