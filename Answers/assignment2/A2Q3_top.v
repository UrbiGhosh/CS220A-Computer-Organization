module A2Q3_top;
	reg clk;
	wire out;
	m v1(clk,out);
	reg [19:0] count;
always @(out) begin
	$display("time cycles: %d out: %b \n", count, out);
end
always @(posedge clk) begin
	if(count == 310000) begin
		$finish;
	end
end
initial begin
	count = 0;
end

initial begin
	forever begin
		clk=1;
		#5;
		clk=0;
		#5;
		count = count + 1;
	end
end

initial begin
	$dumpfile("dump.vcd"); $dumpvars;
	end
endmodule