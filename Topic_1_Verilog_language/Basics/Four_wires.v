module top_module( 
    input a,b,c,
    output w,x,y,z );
    assign {w,x,y,z} = {a,{2{b}},c};
endmodule