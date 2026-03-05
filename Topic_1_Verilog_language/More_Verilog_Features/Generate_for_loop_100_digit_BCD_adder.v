module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    wire [100:0] temp_cin; 
    
    assign temp_cin[0] = cin;

	genvar i;
    generate
        for(i=0;i<100;i=i+1)begin : BCD_adder
            bcd_fadd instr0(.a(a[i*4 +: 4]),.b(b[i*4 +: 4]),.cin(temp_cin[i]),.cout(temp_cin[i+1]),.sum(sum[i*4 +: 4]));
        end
    endgenerate
    
    assign cout = temp_cin[100];
endmodule
