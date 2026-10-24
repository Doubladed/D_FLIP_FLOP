`timescale 1ns/1ps

module tb_dff;

	logic clk, rstn;
	logic d;
	logic q;

dff dff(

        .clk(clk), .rstn(rstn),
        .d(d),
        .q(q)
);

initial begin

	$vcdpluson;
end

// f = 100 MHz -> t = 10 ns
// half cycle = 5 ns 

initial begin

	clk = 1'b0;
	forever #5 clk = ~clk;
end

initial begin

	rstn = 1'b0;
	d = 1'b0;

	repeat(3) @(negedge clk);
	rstn = 1'b1;

	@(negedge clk);
	d = 1'b1;

        @(negedge clk);
        d = 1'b0;

        @(negedge clk);
        d = 1'b1;

        @(negedge clk);
        d = 1'b0;

        @(negedge clk);
        d = 1'b1;

        @(negedge clk);
        d = 1'b0;

        @(negedge clk);
        d = 1'b1;

        @(negedge clk);
        d = 1'b0;

        @(negedge clk);
        d = 1'b1;

        @(negedge clk);
        d = 1'b0;

	repeat(5) @(negedge clk);
	$finish;
end

endmodule
