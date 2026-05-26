module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output [7:0] mm,
    output [7:0] ss);
    wire [3:0] tick;
    decade_counter uss0(.clk(clk),.reset(reset),.en(ena),.q(ss[3:0]),.carry_out(tick[0]));
    decade_counter #(.MAX_COUNT(5)) uss1 (.clk(clk),.reset(reset),.en(tick[0]),.q(ss[7:4]),.carry_out(tick[1]));
    decade_counter umm0(.clk(clk),.reset(reset),.en(tick[1]),.q(mm[3:0]),.carry_out(tick[2]));
    decade_counter #(.MAX_COUNT(5)) umm1 (.clk(clk),.reset(reset),.en(tick[2]),.q(mm[7:4]),.carry_out(tick[3]));
    always@(posedge clk)begin
        if(reset)
            hh[7:0] <= 8'h12; 
        else if(tick[3])begin
            if (hh == 8'h12)
                hh <= 8'h01;
            else if(hh[3:0] == 4'h9)begin
                hh[3:0] <= 4'h0;
                hh[7:4] <= hh[7:4] + 4'h1;
            end
            else
                hh[3:0] <= hh[3:0] + 4'h1;
        end
    end
    always@(posedge clk)begin
        if(reset)
            pm <= 0;
        else if(tick[3] && (hh[7:0] == 8'h11))
            pm <= ~pm;
    end
endmodule

module decade_counter#(
    parameter MAX_COUNT = 9
)(
    input clk,
    input reset,
    input en,
    output reg [3:0] q, 
    output carry_out
);
    assign carry_out = (q == MAX_COUNT) && en;
    always @(posedge clk) begin
        if (reset) begin
            q <= 4'd0;
        end
        else if (en) begin
            if (q == MAX_COUNT)
                q <= 4'd0;
            else
                q <= q + 4'd1;
        end
    end
endmodule