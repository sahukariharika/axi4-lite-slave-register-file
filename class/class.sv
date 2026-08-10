`timescale 1ns/1ps
module top;
integer a;
real r;
time t;
realtime rt;
reg b;//1 bit 
reg [2:0]c;//3bits
wire w;

initial begin
	$display("##### default values of the varibales###########  ");
	$display("\t a=%b",a);
	$display("\t r=%b",r);
	$display("\t t=%b",t);
	$display("\t rt=%b",rt);
	$display("\t b=%b",b);
	$display("\t c=%b",c);
	$display("\t w=%b",w);
		
	$display("\t time =%0t",$time);
		a=100;
		r=202.25;
		t=10.55;//giving  dalay of  10 ns 
		#10.55;
		rt=10.55;
		b=1'b1;
		c=3'b011;
		//w=1'b0;//not possible

	$display("##### after assigning  values of the varibales###########  ");
	$display("\t a=%0d",a);
	$display("\t r=%f",r);
	$display("\t t=%0d",t);
	$display("\t time =%0t",$time);
	$display("\t rt=%0f",rt);
	$display("\t realtime =%0t",$realtime);
	$display("\t b=%b",b);
	$display("\t c=%0d",c);
	$display("\t w=%0d",w);
end

endmodule
/*
##### default values of the varibales###########  
# 	 a=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
# 	 r=00000000000000000000000000000000
# 	 t=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
# 	 rt=00000000000000000000000000000000
# 	 b=x
# 	 c=xxx
# 	 w=z
# 	 time =0
##### after assigning  values of the varibales###########  
# 	 a=100
# 	 r=202.250000
# 	 t=11
# 	 time =11000
# 	 rt=10.550000
# 	 realtime =10550
# 	 b=1
# 	 c=3
# 	 w=z
*/
