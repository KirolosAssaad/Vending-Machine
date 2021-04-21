module N_counter (input clk, output reg [1:0]count);


always @(posedge clk) 
 begin
 
count <= count + 1;


end
endmodule