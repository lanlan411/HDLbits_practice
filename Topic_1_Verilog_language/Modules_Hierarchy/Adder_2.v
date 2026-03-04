module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire [15:0] w1;
    wire w2;
    wire [15:0] w3;
    add16 instr0(.a(a[15:0]),.b(b[15:0]),.cin(1'b0),.sum(w1),.cout(w2));
    add16 instr1(.a(a[31:16]),.b(b[31:16]),.cin(w2),.sum(w3),.cout());
    assign sum = {w3,w1};
endmodule

module add1 ( input a, input b, input cin, output sum, output cout );
    assign {cout,sum} = a + b + cin;
// Full adder module here

endmodule
