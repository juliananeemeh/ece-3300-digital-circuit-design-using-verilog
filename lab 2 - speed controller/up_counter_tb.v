`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2025 12:06:11 PM
// Design Name: 
// Module Name: up_counter_tb
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


module up_counter_tb #(parameter WIDTH_TB = 4)(

                     );
 reg clk_tb;
 reg rst_tb;
 reg en_tb;
 wire [WIDTH_TB-1:0] count_tb;              
 
 initial
    begin: DUMMY_START_CLK
        clk_tb = 1;
    end  
    
    always
        begin
        #5 clk_tb = ~clk_tb; //flip 
        end             
          
 up_counter #(.WIDTH(WIDTH_TB)) GEN
 (
      .clk(clk_tb),
      .rst(rst_tb),
      .en(en_tb),
      .count(count_tb) 
  );
  
  initial
    begin :CNT_EN_RST
        rst_tb = 1;
        en_tb = 0;
        #40
        rst_tb = 0;
        #80
        en_tb = 1;
        #320
        en_tb = 0;
        #100
        $finish;
    end
  

endmodule
