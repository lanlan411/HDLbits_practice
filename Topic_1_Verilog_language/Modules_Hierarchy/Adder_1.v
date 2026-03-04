module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire w1;
    wire [15:0] w2;
    wire [15:0] w3;
    add16 instr0(.a(a[15:0]),.b(b[15:0]),.cin(1'd0),.cout(w1),.sum(w2));
    add16 instr1(.a(a[31:16]),.b(b[31:16]),.cin(w1),.cout(),.sum(w3));
    assign sum = {w3,w2};
endmodule
