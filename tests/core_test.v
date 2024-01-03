module core_tb();

reg clk, reset;

always #1 clk = ~clk;

Core #(
    "../software/mem.bin"
) Core(
    .clk(clk),
    .reset(reset)
);

initial begin
    $dumpfile("build/core.vcd");
    $dumpvars;

    clk = 0;
    reset = 0;

    #120

    $finish;
end

endmodule
