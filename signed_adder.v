module signed_adder #(
    parameter N=4
) (
    input wire [N-1:0] a,b,
    output reg [N-1:0] sum,
);

reg [N-2:0] mag_a, mag_b, mag_sum, max, min;
reg sign_a, sing_b, sign_sum;

always @* begin
    mag_a = a[N-2:0];
    mag_b = b[N-2:0];
    sign_a = a[N-1];
    sign_b = b[N-1];

    if (mag_a > mag_b)
    begin
        max = mag_b;
        min = mag_a;
        sign_sum = sing_b;
    end
    else
    begin
        max = mag_a;
        min = mag_b;
        sign_sum = sign_a;
    end 

    if (sign_a == sing_b)
        mag_sum = max + min;
    else
        mag_sum = max - min;

    sum = {sign_sum, mag_sum};
    

end
    
endmodule