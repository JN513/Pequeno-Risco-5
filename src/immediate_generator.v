module Immediate_Generator (
    input wire [31:0] instruction,
    output wire [31:0] immediate
);

reg [31:0] immediate_reg;

assign immediate = immediate_reg;

always @(*) begin
    case (instruction[6:0])
        7'b0010011: // addi instruction 
            immediate_reg = {20'h00000, instruction[31:20]};
        7'b0000011: // lw instruction 
            immediate_reg = {20'h00000, instruction[31:20]};
        7'b0100011: // sw instruction 
            immediate_reg = {20'h00000, instruction[31:25], instruction[11:7]};
        7'b1100011: // beq instruction 
            immediate_reg = {19'h00000, instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0};
        default: immediate_reg = 32'h00000000;
    endcase
end
    
endmodule