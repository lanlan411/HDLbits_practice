module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] d_in;
    integer i;
    always@(posedge clk)begin
        d_in <= in;
        if(reset)
            out <= 32'd0;
        else begin
            for(i=0;i<32;i=i+1)begin
                if(d_in[i] && ~in[i])
                    out[i] = 1'b1;
            end
        end  
    end
endmodule
