module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
	
    wire [3:0] temp_cin;
    assign temp_cin[0] = cin;
    genvar i;
    generate
        for(i=0;i<3;i=i+1)begin : ripple_adder
            full_adder instr0(.a(a[i]),.b(b[i]),.cin(temp_cin[i]),.cout(temp_cin[i+1]),.sum(sum[i]));
        end
    endgenerate
    assign cout = temp_cin[3:1];
endmodule

module full_adder( 
    input a, b, cin,
    output cout, sum );
    assign {cout,sum} = a+b+cin;
endmodule