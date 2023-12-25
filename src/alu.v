module ALU (
    input wire [3:0] operation,
    input wire [31:0] ALU_in_X,
    input wire [31:0] ALU_in_Y,
    output wire [31:0] ALU_out_S,
    output wire ZR,
    output wire NG
);

reg [31:0] ALU_Result;

assign ALU_out_S = ALU_Result;
assign NG = ALU_Result[31];
assign ZR = ^ALU_Result;

always @(*) begin
    case(operation)
        4'b0000: // AND
            ALU_Result = ALU_in_X & ALU_in_Y ; 
        4'b0001: // OR
            ALU_Result = ALU_in_X | ALU_in_Y ;
        4'b0010: // Adição
            ALU_Result = ALU_in_X + ALU_in_Y;
        4'b0110: // Subtração
            ALU_Result = ALU_in_X - ALU_in_Y;
        4'b0111: // SLT
            ALU_Result = (ALU_in_X < ALU_in_Y) ? 32'h1 : 32'h0;
        4'b1100: // NOR
            ALU_Result = ~(ALU_in_X | ALU_in_Y);
        default: ALU_Result = ALU_in_X & ALU_in_Y ; // Operação padrão
    endcase
end
    
endmodule
