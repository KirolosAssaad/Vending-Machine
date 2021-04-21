module dispenser ( amount, A, B, C,clk, sw,water);
input clk, sw;
input  A;
input B;
input C;
output  reg [6:0] amount;
//output q1, q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15;
output reg water=1'b0;
parameter [3:0] S0=4'b0000, S5=4'b0001, S10=4'b0010, S15=4'b0011, S20=4'b0100, S25=4'b0101;
parameter [3:0] S30=4'b0110, S35=4'b0111, S40=4'b1000, S45=4'b1001, S50=4'b1010, S55=4'b1011, S60=4'b1100, S65=4'b1101, S70=4'b1110;
reg [3:0] current =S0, next=S0;
//reg sum=7'b0000000, bal=5'b00000;

always @(*) begin
//amount<=0;
case(current)
S0: begin 
if(A) next<=S5;
else if(B) next<=S15;
else if(C) next<=S25;
else next<=S0;
//amount<=0;
water<=1'b0;
end

S5: begin if(A) next<=S10;
else if(B) next<=S20;
else if(C) next<=S30;
else next<=S5;
//amount<=5;
//bal<=5'd0;
water<=1'b0;
end

S10:begin  if(A) next<=S15;
else if(B) next<=S25;
else if(C) next<=S35;
else next<=S10;
//amount<=10;
//bal<=5'd0;
water<=1'b0;
end

S15: begin  if(A) next<=S20;
else if(B) next<=S30;
else if(C) next<=S40;
else next<=S15;
//amount<=15;
//bal<=5'd0;
water<=1'b0;
end

S20: begin  if(A) next<=S25;
else if(B) next<=S35;
else if(C) next<=S45;
else next<=S20;
//amount<=7'b00010100;
//bal<=5'd0;
water<=1'b0;
end

S25: begin  if(A) next<=S30;
else if(B) next<=S40;
else if(C) next<=S50;
else next<=S25;
//amount<=7'b00011001;
//bal<=5'd0;
water<=1'b0;
end

S30: begin  if(A) next<=S35;
else if(B) next<=S45;
else if(C) next<=S55;
else next<=S30;
//amount<=7'b0111110;
//bal<=5'd0;
water<=1'b0;
end

S35: begin  if(A) next<=S40;
else if(B) next<=S50;
else if(C) next<=S60;
else next<=S35;
//amount<=7'b0100011;
//bal<=5'd0;
water<=1'b0;
end

S40: begin  if(A) next<=S45;
else if(B) next<=S55;
else if(C) next<=S65;
else next<=S40;
//amount<=7'b0101000;
//bal<=5'd0;
water<=1'b0;
end

S45: begin  if(A) next<=S50;
else if(B) next<=S60;
else if(C) next<=S70;
else next<=S45;
//amount<=7'b0101101;
//bal<=5'd0;
water<=1'b0;
end

S50: begin
next<=current;
// amount<=7'b0110010;
//bal<=5'd0;
water<=1'b1;
 if(sw) begin next<=S0; end
end

S55: begin
next<=current;
// amount<=7'b0110111;
//bal<=5'd5;
water<=1'b1;
if(sw) begin next<=S5; end
end

S60: begin
next<=current;
// amount<=7'b0111100;
//bal<=5'd10;
water<=1'b1;
if(sw) begin next<=S10; end
end

S65: begin
next<=current;
// amount<=7'b1000001;
//bal<= 5'd15;
water<=1'b1;
 if(sw) begin next<=S15; end
end

S70: begin
next<=current;
// amount<=7'b1000110;
//bal<=5'd20;
water<=1'b1;
if(sw) begin next<=S20; end
end

default: next<=next;
endcase
end

always @ (posedge clk ) begin
current<=next;
amount<=0;
case (current)
S0: amount<=0;
S5: amount<=5;
S10: amount<=10;
S15: amount<=15;
S20: amount<=20;
S25: amount<=25;
S30: amount<=30;
S35: amount<=35;
S40: amount<=40;
S45: amount<=45;
S50: amount<=50;
S55: amount<=55;
S60: amount<=60;
S65: amount<=65;
S70: amount<=70;
default:amount <=111; //for debugging
endcase
end


//assign q1=(current==S0);
//assign q2=(current==S5);
//assign q3=(current==S10);
//assign q4=(current==S15);
//assign q5=(current==S20);
//assign q6=(current==S25);
//assign q7=(current==S30);
//assign q8=(current==S35);
//assign q9=(current==S40);
//assign q10=(current==S45);
//assign q11=(current==S50);
//assign q12=(current==S55);
//assign q13=(current==S60);
//assign q14=(current==S65);
//assign q15=(current==S70);



endmodule