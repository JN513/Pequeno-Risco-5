module Instruction_Memory #(
    parameter MEMORY_SIZE = 1024,
    parameter MEMORY_FILE = ""
)
(
    input wire reset,
    input wire [31:0] read_address,
    output wire [31:0] instruction_out
);

reg [31:0] memory[(MEMORY_SIZE/4)-1:0];
wire [31:0] normalized_address;

assign normalized_address = read_address >> 2;

integer i;

initial begin
    if(MEMORY_FILE != "") begin
        $readmemb(MEMORY_FILE, memory);
    end

    memory[0] = 32'h3e800093;
    memory[1] = 32'h7d008113;
    memory[2] = 32'hc1810193;
    memory[3] = 32'h83018213;
    memory[4] = 32'h3e820293;
end

assign instruction_out = memory[normalized_address];
    
endmodule