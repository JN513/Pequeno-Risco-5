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
        12'b00xxxxxxxxxx:  
            aluop_out_reg = 0010;
        12'b01xxxxxxxxxx:  
            aluop_out_reg = 0110;
        12'b1xxxxxxxx000:  
            aluop_out_reg = 0010;
        12'b1xx1xxxxx000:  
            aluop_out_reg = 0110;
        12'b1x0000000111:  
            aluop_out_reg = 0000;
        12'b1x0000000110:  
            aluop_out_reg = 0001;
    endcase
end
    
endmodule