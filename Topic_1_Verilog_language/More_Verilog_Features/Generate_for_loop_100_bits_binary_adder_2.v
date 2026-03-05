module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    genvar i;
    generate
        for(i=0;i<100;i=i+1)begin : adder100
            if(i == 0)
            	full_adder instr0(.a(a[i]),.b(b[i]),.cin(cin),.cout(cout[i]),.sum(sum[i]));
            else
                full_adder instr0(.a(a[i]),.b(b[i]),.cin(cout[i-1]),.cout(cout[i]),.sum(sum[i]));
        end
    endgenerate
endmodule  

module full_adder(
    input a,b,
    input cin,
    output cout,
    output sum );
    assign {cout,sum} = a + b + cin;
endmodule
