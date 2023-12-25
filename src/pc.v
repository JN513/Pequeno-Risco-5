module PC(
    input wire clk,
    input wire [31:0] Input,
    output reg [31:0] Output,
    input wire Inclement,
    input wire Load,
    input wire Reset
);

reg [32:0] PC_Register;

assign Output = PC_Register;

initial begin
    PC_Register = 32'd0;
end

always @(posedge clk) begin
    if(Reset == 1'b1) begin
        PC_Register <= 32'd0;
    end
    else begin
        if(Inclement == 1'b1) begin 
            PC_Register <= PC_Register + 1;
        end else if(Load == 1'b1) begin
            PC_Register <= Input;
        end
    end 
end

endmodule
