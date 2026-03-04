module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire sel;
    wire [15:0] w1;
    wire [15:0] w2;
    wire [15:0] w3;
    add16 instr0(.a(a[15:0]),.b(b[15:0]),.cin(1'b0),.cout(sel),.sum(w1));
    add16 instr1(.a(a[31:16]),.b(b[31:16]),.cin(1'b0),.cout(),.sum(w2));
    add16 instr2(.a(a[31:16]),.b(b[31:16]),.cin(1'b1),.cout(),.sum(w3));
    assign sum = (sel)? {w3,w1}:{w2,w1};
endmodule
