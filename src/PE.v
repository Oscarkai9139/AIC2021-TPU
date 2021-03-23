module PE(clk, rst, in_a, in_b, out_a, out_b, out_c);

    parameter DATA_SIZE = 8;

    input clk;
    input rst;
    input [DATA_SIZE-1:0] in_a, in_b;
    output reg [DATA_SIZE-1:0] out_a, out_b;
    output reg [2*DATA_SIZE-1:0] out_c;

    always@(posedge clk) begin
        if(rst) begin
            out_a <= 'd0;
            out_b <= 'd0;
            out_c <= 'd0;
        end
        else begin
            out_a <= in_a;
            out_b <= in_b;
            out_c <= in_a*in_b+out_c;
        end
    end
endmodule