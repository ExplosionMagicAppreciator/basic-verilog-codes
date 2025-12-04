module half_adder (
    input wire a, b,
    output reg sum, carry,

);

    assign sum = a ^ b;
    assign carry = a & b;
    
endmodule

module full_adder (
    input wire a, b, c_in,
    output reg sum, c_out,
);
    half_adder ha1(a, b, sum1, c_out1);
    half_adder ha2(sum1, c_in, sum, c_out2);
    assign c_out = c_out1 | c_out2;

endmodule

module parallel_adder (
    input wire [3:0] a, b,
    input c_in, reset,
    output c_out,
    output reg [3:0] sum,
);


    always @(a or b or reset)
    begin
        if (!reset)
        begin
            sum = 4'b0000;
            c_out = 1'b0;
        end 
    else
    begin
        full_adder fa0(a[0], b[0], c_in, sum[0], c_out0);
        full_adder fa1(a[1], b[1], c_out0, sum[1], c_out1);
        full_adder fa2(a[2], b[2], c_out1, sum[2], c_out2);
        full_adder fa3(a[3], b[3], c_out2, sum[3], c_out);
    end
    end
    
endmodule
