module floating_point_adder (
    input wire sign1, sign2,
    input wire [3:0] exp1, exp2,
    input wire [7:0] frac1, frac2,
    output reg sign_out,
    output reg [3:0] exp_out,
    output reg [7:0] frac_out,
);
    reg sign_large, sign_small;
    reg [3:0] exp_large, exp_small, exp_norm, exp_diff;
    reg [7:0] frac_large, frac_small, frac_aligned, frac_norm, sum_norm ;
    reg [8:0] sum;
    reg [2:0] lead0;

    always @*
    begin
        if ({exp1, frac1} > {exp2, frac2})
            begin
                sign_large = sign1;
                sign_small = sign2;
                exp_large = exp1;
                exp_small = exp2;
                frac_large = frac1;
                frac_small = frac2;
            end
        else
            begin
                sign_large = sign2;
                sign_small = sign1;
                exp_large = exp2;
                exp_small = exp1;
                frac_large = frac2;
                frac_small = frac1;
            end


endmodule
