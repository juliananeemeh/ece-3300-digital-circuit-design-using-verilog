`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2025 02:15:15 PM
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


module top
(
    input  wire        clk,        // 100 MHz clock from Nexys A7
    input  wire        rst,        // active-high reset (btn or similar)

    input  wire        vauxp11,
    //input  wire        vauxn11,

    output wire [6:0]  seg,
    output wire        dp,
    output wire [7:0]  an
);

    wire        eoc_out;
    wire        rdy;
    wire [4:0]  channel;
    wire [15:0] adc_out;

    wire [6:0] daddr_in = 7'h1B;

    xadc_wiz_0 XADC_inst (
          .daddr_in(7'h1B),
          .dclk_in(clk),
          .den_in(eoc_out),
          .di_in(16'h0000),
          .dwe_in(1'b0),
          .reset_in(rst),
          .vauxp11(vauxp11),
          .vauxn11(1'b0),
          .vp_in(1'b0),
          .vn_in(1'b0),

          .busy_out(), 
          .channel_out(channel),
          .do_out(adc_out),
          .drdy_out(rdy),
          .eoc_out(eoc_out),
          .eos_out(),
          .ot_out(), 
          .vccaux_alarm_out(),
          .vccint_alarm_out(),
          .user_temp_alarm_out(),
          .alarm_out()

    );

    reg [15:0] adc_sample;

    always @(posedge clk) begin
        if (rst) begin
            adc_sample <= 16'd0;
        end else if (rdy && (channel == 5'b11011)) begin
            adc_sample <= adc_out;
        end
    end

   wire [31:0] disp_bus;
   assign disp_bus = {16'h0000, adc_sample};

   wire [7:0] dp_switch = 8'hFF;  // 1 = off for active-low dp

    driver display_inst (
        .disp_clk   (clk),
        .disp_rst   (rst),
        .disp_inp   (disp_bus),
        .disp_sw_dp (dp_switch),
        .disp_seg   (seg),
        .disp_dp    (dp),
        .disp_an    (an)
    );

endmodule