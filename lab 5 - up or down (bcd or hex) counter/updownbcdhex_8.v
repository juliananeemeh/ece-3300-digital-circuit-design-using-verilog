`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2025 04:40:16 PM
// Design Name: 
// Module Name: updownbcdhex_8
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


module updownbcdhex_8  #(parameter WIDTH_COUNT = 8, WIDTH_UP = 4)
                        (
                            input sys_clk,
                            input sys_rst,
                            input sys_en,
                            input [1:0] mode,
                            output [(WIDTH_COUNT*WIDTH_UP) -1 :0] sys_count,
                            output enout
                        );
                        
                        wire [WIDTH_COUNT:0] en_chain;
                        assign en_chain[0] = sys_en;
                        assign enout = en_chain[WIDTH_COUNT];
                        genvar i;
                        generate
                            for(i=0;i<WIDTH_COUNT; i = i+1)
                                begin
                                    up_down_hex_bcd #(.WIDTH(WIDTH_UP)) JA
                                    (
                                        .clk(sys_clk),
                                        .rst(sys_rst),
                                        .en(en_chain[i]),
                                        .mode(mode),
                                        .count(sys_count[(4*i+3) : (4*i)]),
                                        .enout(en_chain[i+1])
                                    ); 
                                    end
                                    endgenerate
                                    
                        
endmodule
