`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2025 12:40:19 PM
// Design Name: 
// Module Name: speed_controller_tb
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


module speed_controller_tb #( parameter WIDTH_SCTB = 32)(

    );
    
    reg clk_sctb;
    reg rst_sctb;
    reg [$clog2(WIDTH_SCTB)-1:0] speed_sctb;
    wire clk_speed_sctb;
    
    initial
        begin
            clk_sctb = 1;
        end
    always
        begin
            #5 clk_sctb = ~clk_sctb;
        end
        
    speed_controller #(.WIDTH_SPEED(WIDTH_SCTB)) GEN_2
                      (
                            .clk(clk_sctb),
                            .rst(rst_sctb),
                            .speed(speed_sctb),
                            .clk_speed(clk_speed_sctb)
                       );
                    
                    
                    initial
                        begin
                            speed_sctb = 0;
                            rst_sctb = 1;
                            #40
                            rst_sctb = 0;
                            #1000
                            $finish;
                        end
endmodule
