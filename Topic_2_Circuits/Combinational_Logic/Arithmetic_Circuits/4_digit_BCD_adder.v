module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    
    wire [4:0] temp_cin;
    assign temp_cin[0] = cin;
    
	genvar i;
    generate
        for(i=0;i<4;i=i+1)begin : BCD_adder
            bcd_fadd instr0 (.a(a[i*4 +: 4]),.b(b[i*4 +: 4]),.cin(temp_cin[i]),.cout(temp_cin[i+1]),.sum(sum[i*4 +: 4]));
        end
    endgenerate
    
    assign cout = temp_cin[4];
endmodule
