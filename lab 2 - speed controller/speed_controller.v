`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2025 04:49:19 PM
// Design Name: 
// Module Name: speed_controller
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


module speed_controller #(parameter WIDTH_SPEED =32)
                      (
                            input clk,
                            input rst,
                            input [$clog2(WIDTH_SPEED)-1:0] speed,
                            output clk_speed
                       );
    wire [WIDTH_SPEED-1:0] tmp_count;                 
    up_counter #(.WIDTH(WIDTH_SPEED)) CONTR
    (
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .count(tmp_count)
    );
    
    
    // the mux is my job :(
    assign clk_speed = tmp_count[speed];
endmodule
