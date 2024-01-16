module core_tb();

reg clk, reset;

always #1 clk = ~clk;

Core #(
    .MEMORY_FILE("software/memory/teste.hex")
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
