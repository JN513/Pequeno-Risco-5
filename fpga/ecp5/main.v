module top (
    input wire clk,
    input wire reset,
    input wire rx,
    output wire tx
);

Core #(
    .MEMORY_FILE("../software/memory/beq.hex")
) Core(
    .clk(clk),
    .reset(reset)
);

always @(posedge clk ) begin

end

endmodule
