`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2025 12:08:14 PM
// Design Name: 
// Module Name: barrel_shifter
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


module barrel_shifter(
                        input [1:0] sel,
                        input [3:0] b,
                        output [3:0] p
                     );
    
    wire [3:0] v;
            
            //level 1
            mux_2x1 m1( //one
                .m_sel(sel[0]),
                .m_I0(b[0]),
                .m_I1(b[1]),
                .m_Op(v[0])
            
            );
            mux_2x1 m2( //two
                .m_sel(sel[0]),
                .m_I0(b[1]),
                .m_I1(b[2]),
                .m_Op(v[1])
            
            );
            mux_2x1 m3( //three
                .m_sel(sel[0]),
                .m_I0(b[2]),
                .m_I1(b[3]),
                .m_Op(v[2])
            
            );
            mux_2x1 m4( //four
                .m_sel(sel[0]),
                .m_I0(b[3]),
                .m_I1(b[0]),
                .m_Op(v[3])
            
            );
            
            //Level 2
            mux_2x1 m5( //one
                .m_sel(sel[1]),
                .m_I0(v[0]),
                .m_I1(v[2]),
                .m_Op(p[0])
            
            );
            mux_2x1 m6( //two
                .m_sel(sel[1]),
                .m_I0(v[1]),
                .m_I1(v[3]),
                .m_Op(p[1])
            
            );
            mux_2x1 m7( //three
                .m_sel(sel[1]),
                .m_I0(v[2]),
                .m_I1(v[0]),
                .m_Op(p[2])
            
            );
            mux_2x1 m8( //four
                .m_sel(sel[1]),
                .m_I0(v[3]),
                .m_I1(v[1]),
                .m_Op(p[3])
            
            );

endmodule
