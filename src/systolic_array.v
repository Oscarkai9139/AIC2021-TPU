`include "PE.v"

module systolic_array(clk, rst, a1, a2, a3, a4, b1, b2, b3, b4, 
        c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16);

    parameter DATA_SIZE = 8;
    input clk;
    input rst;
    input [DATA_SIZE-1:0] a1, a2, a3, a4;
    input [DATA_SIZE-1:0] b1, b2, b3, b4;
    output reg [2*DATA_SIZE-1:0] c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16;

    wire [DATA_SIZE-1:0] ar00, ar01, ar02, 
               ar10, ar11, ar12, 
               ar20, ar21, ar22,
               ar30, ar31, ar32;
    wire [DATA_SIZE-1:0] bd00, bd01, bd02, bd03,
               bd10, bd11, bd12, bd13,
               bd20, bd21, bd22, bd23;


    PE pe0 (.clk(clk), .rst(rst), .in_a(a1), in_b(b1), out_a(ar00), out_b(bd00), out_c(c1));
    PE pe1 (.clk(clk), .rst(rst), .in_a(ar00), in_b(b2), out_a(ar01), out_b(bd01), out_c(c2));
    PE pe2 (.clk(clk), .rst(rst), .in_a(ar01), in_b(b3), out_a(ar02), out_b(bd02), out_c(c3));
    PE pe3 (.clk(clk), .rst(rst), .in_a(ar02), in_b(b4), out_a(), out_b(bd03), out_c(c4));

    PE pe4 (.clk(clk), .rst(rst), .in_a(a2), in_b(bd00), out_a(ar10), out_b(bd10), out_c(c5));
    PE pe5 (.clk(clk), .rst(rst), .in_a(ar10), in_b(bd01), out_a(ar11), out_b(bd11), out_c(c6));
    PE pe6 (.clk(clk), .rst(rst), .in_a(ar11), in_b(bd02), out_a(ar12), out_b(bd12), out_c(c7));
    PE pe7 (.clk(clk), .rst(rst), .in_a(ar12), in_b(bd03), out_a(), out_b(bd13), out_c(c8));

    PE pe8 (.clk(clk), .rst(rst), .in_a(a3), in_b(bd10), out_a(ar20), out_b(bd20), out_c(c9));
    PE pe9 (.clk(clk), .rst(rst), .in_a(ar20), in_b(bd11), out_a(ar21), out_b(bd21), out_c(c10));
    PE pe10(.clk(clk), .rst(rst), .in_a(ar21), in_b(bd12), out_a(ar22), out_b(bd22), out_c(c11));
    PE pe11(.clk(clk), .rst(rst), .in_a(ar22), in_b(bd13), out_a(), out_b(bd23), out_c(c12));
    
    PE pe12(.clk(clk), .rst(rst), .in_a(a4), in_b(bd20), out_a(ar30), out_b(), out_c(c13));
    PE pe13(.clk(clk), .rst(rst), .in_a(ar30), in_b(bd21), out_a(ar31), out_b(), out_c(c14));
    PE pe14(.clk(clk), .rst(rst), .in_a(ar31), in_b(bd22), out_a(ar32), out_b(), out_c(c15));
    PE pe15(.clk(clk), .rst(rst), .in_a(ar32), in_b(bd23), out_a(), out_b(), out_c(c16));


endmodule