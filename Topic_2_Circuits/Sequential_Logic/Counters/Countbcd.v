module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);        
    decade_counter udc1(.clk(clk),.reset(reset),.en(1'd1),.q(q[3:0]),.carry_out(ena[1]));
    decade_counter udc2(.clk(clk),.reset(reset),.en(ena[1]),.q(q[7:4]),.carry_out(ena[2]));
    decade_counter udc3(.clk(clk),.reset(reset),.en(ena[2]),.q(q[11:8]),.carry_out(ena[3]));
    decade_counter udc4(.clk(clk),.reset(reset),.en(ena[3]),.q(q[15:12]),.carry_out());
endmodule

module decade_counter(
    input clk,
    input reset,
    input en,
    output reg [3:0] q, 
    output carry_out
);
    assign carry_out = (q == 4'd9) && en;
    always @(posedge clk) begin
        if (reset) begin
            q <= 4'd0;
        end
        else if (en) begin
            if (q == 4'd9)
                q <= 4'd0;
            else
                q <= q + 4'd1;
        end
    end
endmodule
