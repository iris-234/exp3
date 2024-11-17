

module top( 
    input [3:0] a, b,
    input [2:0] sel,
    output reg [3:0] sum,
    output of1 );
    reg  [0:0] of;
    reg [3:0] n;

     always @(*) begin
        sum=0;
        of=0;
        n=0;
        case(sel)
            3'b000:  begin
                {of,sum}=a+b;
            end
            3'b001: begin
                n=~b+1;
                {of,sum}=a+n;
            end         
            3'b010:  begin
                sum = a^(4'b1111);
            end
            3'b011:  begin
                sum=a&b;
            end
            3'b100:  begin
                sum=a|b;
            end
            3'b101:  begin
                sum=a^b;
            end
            3'b110:  begin
                if (a<b) begin
                    sum=1;
                end
                else begin
                    sum=0;
                end
            end
            3'b111: begin
                if (a==b) begin
                    sum=1;
                end
                else begin
                    sum=0;
                end
            end
            default;
        endcase
    end
    assign of1 = of;
endmodule


