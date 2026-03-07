module top_module (
    input clk,
    input d,
    output q
);
    reg temp1,temp2;
    always@(posedge clk)begin
    	temp1 <= d;
    end
    
    always@(negedge clk)begin
    	temp2 <= d;
    end
    
    always@(*)begin
        case(clk)
            1'd0:q <= temp2;
            1'd1:q <= temp1;
        endcase
    end
endmodule
