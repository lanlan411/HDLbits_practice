module top_module (
    input clk,
    input x,
    output z
); 
    reg temp1, temp2, temp3;
    DFF instr0(.clk(clk),.D(x ^ temp1),.Q(temp1));
    DFF instr1(.clk(clk),.D(x & ~temp2),.Q(temp2));
    DFF instr2(.clk(clk),.D(x | ~temp3),.Q(temp3));
    assign z = ~(temp1 | temp2 | temp3);
endmodule

module DFF(
    input clk,
	input D,
    output Q);
    
    always@(posedge clk)begin
        Q <= D;
    end
endmodule