moduler counter (
    input clk,
    input rst_n,
    input [1:0] ctrl_type,
    input [W_CTR-1:0] in_counter,
    output reg [W_CTR-1:0] out_counter);
    parameter CTR_LOAD = 2'h0;
    parameter CTR_INC  = 2'h1;
    parameter CTR_FREEZE = 2'h2;
    parameter CTR_RST = 2'h3;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            out_counter <= W_CTR'h0;
        end
        else begin
            case (ctrl_type)
                CTR_LOAD   : begin
                    out_counter <= in_counter;
                end
                CTR_INC    : begin
                    out_counter <= out_counter + 1;
                end
                CTR_FREEZE : begin
                    out_counter <= out_counter;
                end
                CTR_RST    : begin
                    out_counter <= W_CTR'h0;
                end
            endcase
        end
    end
endmodule
