module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0] d_in;
    always@(posedge clk)begin
    	d_in <= in;
        anyedge <= in ^ d_in;
    end
endmodule
