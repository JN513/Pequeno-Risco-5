module Data_Memory #(
    parameter MEMORY_SIZE = 4096
)(
    input wire clk,
    input wire reset,
    input wire memory_read,
    input wire memory_write,
    input wire [31:0] address,
    input wire [31:0] write_data,
    output wire [31:0] read_data
);

reg [31:0] ram [(MEMORY_SIZE/4)-1: 0];
integer i;

wire [31:0] normalized_address;

assign read_data = (memory_read == 1'b1) ? ram[address] : 32'h00000000;

initial begin
    for (i = 0; i < (MEMORY_SIZE/4)-1; i = i + 1) begin
       ram[i] = 32'h00000000; 
    end

    ram[0] = 32'd1;
    ram[1] = 32'd5;
    ram[2] = 32'd3;
    ram[3] = 32'd535;
    ram[4] = 32'd927;
    ram[5] = 32'd1024;
    ram[6] = 32'd300;
    ram[7] = 32'd1001;
    ram[8] = 32'd1000;
end

always @(posedge clk) begin
    if(reset == 1'b1) begin 
        for (i = 0; i < (MEMORY_SIZE/4)-1; i = i +1) begin
        ram[i] <= 32'h00000000;
    end
    end else if(memory_write == 1'b1) begin
        ram[address] <= write_data;
    end
end
    
endmodule