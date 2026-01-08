`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2025 07:59:49 PM
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
    reg sys_clk;
    reg rst;
    reg [4:0] speed;
    reg [7:0] load_val;
    reg load_r;
    reg load_g;
    reg load_b;
    wire led1_r;
    wire led1_g;
    wire led1_b;
    wire led2_r;
    wire led2_g;
    wire led2_b;

    top TB(
                .sys_clk(sys_clk),
                .rst(rst),
                .speed(speed),
                .load_val(load_val),
                .load_r(load_r),
                .load_g(load_g),
                .load_b(load_b),
                .led1_r(led1_r),
                .led1_g(led1_g),
                .led1_b(led1_b),
                .led2_r(led2_r),
                .led2_g(led2_g),
                .led2_b(led2_b)
           );
           
           initial sys_clk = 1'b0;
           always #5 sys_clk = ~sys_clk;
           
           initial begin
                rst = 1;
                speed = 0;
                load_val = 8'd128;
                load_r = 0;
                load_g = 0;
                load_b = 0;
                
                #20
                rst = 0;
                
                #50 load_r = 1;
                #50 load_r = 0;
                
                #50 load_g = 1;
                #50 load_g = 0;
                
                #50 load_b = 1;
                #50 load_b = 0;
                
                #500000;
                $finish; 
                end
endmodule
