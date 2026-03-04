module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
	wire w1;
    wire [15:0] w2;
    wire [15:0] w3;
    wire [31:0] xor_value = b ^ {32{sub}};
    add16 instr0(.a(a[15:0]),.b(xor_value[15:0]),.cin(sub),.sum(w2),.cout(w1));
    add16 instr1(.a(a[31:16]),.b(xor_value[31:16]),.cin(w1),.sum(w3),.cout());
    assign sum = {w3,w2};
endmodule
