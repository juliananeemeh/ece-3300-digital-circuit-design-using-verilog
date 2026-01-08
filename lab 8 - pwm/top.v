`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2025 07:30:05 PM
// Design Name: 
// Module Name: top
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


module top(
                input sys_clk,
                input rst,
                input [4:0] speed,
                input [7:0] load_val,
                input load_r,
                input load_g,
                input load_b,
                output led1_r,
                output led1_g,
                output led1_b,
                output led2_r,
                output led2_g,
                output led2_b 
           );
           wire clk_8;
           wire clk_locked;
           
           clk_wiz_0 CLK
             (
              .clk_out1(clk_8),
              .reset(1'b0),
              .locked(clk_locked),
              .clk_in1(sys_clk)
             );
             
             wire clk_speed;
             speed_controller #(.WIDTH_SPEED(32)) SPEED
             (
              .clk(clk_8),
              .rst(rst),
              .speed(speed),
              .clk_speed(clk_speed)
             );
             
             wire [7:0] count_r;
             wire [7:0] count_g;
             wire [7:0] count_b;
             
             up_counter_8bit COUNT_R(
                             .clk(clk_speed),
                             .rst(rst),
                             .load(load_r),
                             .load_value(load_val),
                             .count(count_r)
                       );
             up_counter_8bit COUNT_G(
                             .clk(clk_speed),
                             .rst(rst),
                             .load(load_g),
                             .load_value(load_val),
                             .count(count_g)
                       );
             up_counter_8bit COUNT_B(
                             .clk(clk_speed),
                             .rst(rst),
                             .load(load_b),
                             .load_value(load_val),
                             .count(count_b)
                       );
             
             wire [7:0] sh_r;
             wire [7:0] sh_g;
             wire [7:0] sh_b;
             
             reg [2:0] sel = 3'd0;
             always@(posedge clk_speed) begin
                    if (rst)
                        sel <= 3'd0;
                    else
                        sel <= sel + 1'b1;
                    end
                    
             barrel_shifter_8bit SHIFT_R(
                                .sel(sel),
                                .b(count_r),
                                .p(sh_r)                      
                          );
             barrel_shifter_8bit SHIFT_G(
                                .sel(sel),
                                .b(count_g),
                                .p (sh_g)                      
                          );
            barrel_shifter_8bit SHIFT_B(
                                .sel(sel),
                                .b(count_b),
                                .p(sh_b)                    
                          );
                       
          pwm LED1_R(
                .clk(clk_8),
                .rst(rst),
                .duty(count_r),
                .pwm_out(led1_r)
          );
          pwm LED1_G(
                .clk(clk_8),
                .rst(rst),
                .duty(count_g),
                .pwm_out(led1_g)
          );
          pwm LED1_B(
                .clk(clk_8),
                .rst(rst),
                .duty(count_b),
                .pwm_out(led1_b)
          );
          pwm LED2_R(
                .clk(clk_8),
                .rst(rst),
                .duty(sh_r),
                .pwm_out(led2_r)
          );
          pwm LED2_G(
                .clk(clk_8),
                .rst(rst),
                .duty(sh_g),
                .pwm_out(led2_g)
          );
          pwm LED2_B(
                .clk(clk_8),
                .rst(rst),
                .duty(sh_b),
                .pwm_out(led2_b)
          );
                  
endmodule
