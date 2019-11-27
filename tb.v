module tb;
reg clk,rst;
wire [7:0] eurika;
reg [7:0] letter;
 name dut(eurika,letter,clk,rst);
initial
	begin
		#1 rst=1;#2 rst=0;
		#2 letter=97;
		#10 letter=101;
		#10 letter="R";
		#10 letter="I";
		#10 letter="T";
		#10 letter="U";
		#10 letter="S";
		#10 letter="H";
		#10 letter="R";
		#10 letter="E";
		#10 letter="E";
		#10 letter=103;
		#10 letter=107;
		
	end
initial 
begin
	forever
	begin
	clk=0;#5;clk=1;#5;
	end
end
initial 
begin	
	#200; $finish;
	end
endmodule