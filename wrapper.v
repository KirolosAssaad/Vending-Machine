module wrapper(clk,A, display, water, enable);
input clk, A;
output [6:0] display;
output water;

output [3:0] enable;
wire hz1, hz100;
wire reset=0;
clockDivider #(50000000) cd (clk, reset, hz1);
clockDivider #(500000) cdd (clk, reset, hz100);
wire [3:0] out ;

UART_receiver_for_A u1(.clk(clk),.RxD(A),.output_level(out[0]));
UART_receiver_for_B u2(.clk(clk),.RxD(A),.output_level(out[1]));
UART_receiver_for_C u3(.clk(clk),.RxD(A),.output_level(out[2]));
UART_receiver_for_stop u4(.clk(clk),.RxD(A),.output_level(out[3]));

wire re1,re2,re3,re4;
pos_edge_det pe1(out[0],clk,re1);
pos_edge_det pe2(out[1],clk,re2);
pos_edge_det pe3(out[2],clk,re3);
pos_edge_det pe4(out[3],clk,re4);
//assign q15=out[3];
wire [6:0] total;
wire [3:0] hundreds, tens, ones;
binary_to_BCD btb1(total, hundreds, tens, ones);

dispenser de1(total,re1,re2,re3,clk,re4,water);
wire [6:0] out1;
wire [6:0] out2;
wire [6:0] out3;
wire [6:0] out4;

pro_7_seg s1 (0,out4);
pro_7_seg s2 (hundreds,out3);
pro_7_seg s3 (ones,out1);
pro_7_seg s4 (tens,out2);




wire [1:0] count;
decoder2x4 d (count,enable);
N_counter nc1 (hz100,count);

mux_4to1_assign m1 (out1,out3,out2,out4,count,display);


endmodule