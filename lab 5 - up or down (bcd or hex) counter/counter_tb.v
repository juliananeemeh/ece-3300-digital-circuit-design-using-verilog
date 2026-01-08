`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2025 05:03:27 PM
// Design Name: 
// Module Name: counter_tb
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


module counter_tb();

parameter WIDTH_COUNT = 8;
parameter WIDTH_UP = 4;

reg sys_clk;
reg sys_rst;
reg sys_en;
reg [1:0] mode;

wire [(WIDTH_COUNT*WIDTH_UP)-1:0] sys_count;

updownbcdhex_8 #(.WIDTH_COUNT(WIDTH_COUNT),.WIDTH_UP(WIDTH_UP)) TB
(
    .sys_clk(sys_clk),
    .sys_rst(sys_rst),
    .sys_en(sys_en),
    .mode(mode),
    .sys_count(sys_count)
);

initial sys_clk = 0;
always #5 sys_clk = ~sys_clk;

initial begin
    sys_rst = 1;
    sys_en = 0;
    mode = 2'b00;
    
    #100 sys_rst = 0;
    
    sys_en = 1;
    
    #10000 mode = 2'b01;
    #10000 mode = 2'b10;
    #10000 mode = 2'b11;
    
    #5000 $finish;
    end
endmodule
