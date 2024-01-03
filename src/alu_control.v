module ALU_Control (
    input wire [1:0] aluop_in,
    input wire [6:0] func7,
    input wire [2:0] func3,
    output wire [3:0] aluop_out
);

reg [3:0] aluop_out_reg;

assign aluop_out = aluop_out_reg;

always @(*) begin
    case ({aluop_in, func7, func3})
        12'b00_0000000_010:  
            aluop_out_reg = 4'b0010;
        12'bx1_xxxxxxx_xxx:  
            aluop_out_reg = 4'b0110;
        12'b1x_0000000_000:  
            aluop_out_reg = 4'b0010;
        12'b1x_0100000_000:  
            aluop_out_reg = 4'b0110;
        12'b1x_0000000_111:  
            aluop_out_reg = 4'b0000;
        12'b1x_0000000_110:  
            aluop_out_reg = 4'b0001;
    endcase
end
    
endmodule