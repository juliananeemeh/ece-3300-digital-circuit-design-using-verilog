`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2025 07:16:36 PM
// Design Name: 
// Module Name: pwm
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


module pwm(
                input clk,
                input rst,
                input [7:0] duty,
                output reg pwm_out
          );
          
          reg [7:0] count = 8'b0;
          always @(posedge clk) begin
            if (rst) begin
                count <= 8'b00000000;
                pwm_out <= 1'b0;
                end
            else begin
                count <= count + 1;
                if (count < duty)
                    pwm_out <= 1'b1;
                else
                    pwm_out <= 1'b0;
                end
                end
endmodule
