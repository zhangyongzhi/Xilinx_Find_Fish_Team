module dds_tri (clk, rst_n, dds_en, q);

	input clk, rst_n, dds_en;   //系统时钟复位
	output [7:0] q;     //输出波形数据
	
	wire [7:0] addr_out;  //8位地�?，对应到ROM内的数据
	wire [7:0] q_out;
	/*****相位累加器模�?*****/
	dds_addr_tri dds_addr_inst_tri(
		.clk(clk), 
		.rst_n(rst_n),
		.addr_out(addr_out)
	);
	
	/*****波形数据模块*****/
	dist_mem_gen_tri	rom_inst_tri (
		.a ( addr_out ),
		.clk ( clk ),
		.spo ( q_out )
	);
	
	assign q = q_out & {8{dds_en}};

endmodule 