module top;
integer a,b,c;
reg [2:0]oper;

function integer alu(input integer a,b,input reg[2:0]oper);
begin 
	case(oper)
		3'b000: alu=a+b;
		3'b001: alu=a-b;
		3'b010: alu=a*b;
		3'b011: alu=a%b;
		3'b100: alu=a/b;
		3'b101: alu=a**b;
		default alu='d0;
	endcase
end
endfunction

initial begin 
	repeat(5)begin 
		a=$urandom_range(10,20);
		b=$urandom_range(10,20);
		oper=$urandom_range(0,5);
		c=alu(a,b,oper);
		$display(" a=%0d b=%0d oper=%0d result=%0d ",a,b,oper,c);
	end
end
endmodule


===============================================
	harika sagukari after changes 
================================================================


	=======================================
	checking
	===========================================


		===============================
ending
===================================
