`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2025 08:24:46 PM
// Design Name: 
// Module Name: top_tb
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


module top_tb();

parameter WIDTH_TOP = 32;

reg [1:0] mode;
reg clk;
reg rst;
reg en;
reg [$clog2(WIDTH_TOP)-1:0] speed;
wire [7:0] an;
wire [6:0] seg;
wire dp_sw;


top #(.WIDTH_TOP(WIDTH_TOP)) TB
          (
                .clk(clk),
                .rst(rst),
                .en(en),
                .mode(mode),
                .speed(speed),
                .seg(seg),
                .an(an),
                .dp_sw(dp_sw)
          );
          initial clk = 0;
          always #5 clk = ~clk;
          
          initial begin
            rst = 1;
            en = 0;
            mode = 2'b00;
            speed = 4'd0;
            
            #10
            rst = 0;
            #100
            en = 1;
            
            #5000 mode = 2'b01;
            #5000 mode = 2'b10;
            #5000 mode = 2'b11;
            
            #5000
            $finish;
            end
            
endmodule
