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
integer i;

initial begin
    for (i = 0; i < (MEMORY_SIZE/4)-1; i = i +1) begin
        memory[i] = 32'h00000000;
    end

    if(MEMORY_FILE != "") begin
        $readmemh(MEMORY_FILE, memory);
    end
end

assign instruction_out = memory[read_address];

always @(posedge reset) begin
    for (i = 0; i < (MEMORY_SIZE/4)-1; i = i +1) begin
        memory[i] = 32'h00000000;
    end
end
    
endmodule