module name(eureka,letter,clk,rst);
	input [7:0] letter;
	input clk,rst;
	output reg [7:0] eureka;
	parameter NO=0,FR=1,I=2,T=3,U=4,S=5,H=6,SR=7,FE=8,SE=9;
	reg [3:0] state;
	
	always @(posedge clk or posedge rst)
	begin
		if(rst) state<=NO;
		else 
		begin
			case(state)
				NO : state<=(letter=="R")?FR:NO;
				FR :begin 
					if(letter=="R")	state<=FR;
					 else state<=(letter=="I")?I:NO;
					 end
				I : begin
					if(letter=="T") state<=T;
					else state<=(letter=="R")?FR:NO;
					end
				T : begin
					if(letter=="U") state<=U;
					else state<=(letter=="R")?FR:NO;
					end
				U : begin
					if(letter=="S") state<=S;
					else  state<=(letter=="R")?FR:NO;
					end
				S : begin
					if(letter=="H") state<=H;
					else  state<=(letter=="R")?FR:NO;
					end
				H : state<=(letter=="R")?SR:NO;
				SR : begin 
					if(letter=="E") state<=FE;
					else state<=(letter=="R")?FR:NO;
					end
				FE: begin
					if(letter=="E") state<=SE;
					else state<=(letter=="R")?FR:NO;
					end
				SE : state<=(letter=="R")?FR:NO;
			endcase
		end
	end
	always @* 
	begin
		case(state)
			NO 	: 	eureka=8'b00000000;
			FR	: 	eureka=8'b10000000;
			I	:	eureka=8'b11000000;
			T	:	eureka=8'b11100000;
			U	:	eureka=8'b11110000;
			S	:	eureka=8'b11111000;
			H	:	eureka=8'b11111100;
			SR	:	eureka=8'b11111110;
			FE	:	eureka=8'b11111111;
			SE	:	eureka=8'b00000001;
		endcase
	end
endmodule
					