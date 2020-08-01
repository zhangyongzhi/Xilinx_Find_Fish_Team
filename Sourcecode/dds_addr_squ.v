module dds_addr_squ (clk, rst_n, addr_out);

	input clk, rst_n;   //系统时钟复位
	output [7:0] addr_out;  //输出的地�?，对应到ROM内的数据
	 
	parameter N = 32;
	parameter PWORD = 128;  //相位控制�? (x/360)*256
	parameter FWORD = 429497; //频率控制字F_out=B*(F_clk/2**32)，fword=B
	//5KHZ
	reg [N-1:0] addr;  //32位累加器
	
	always @ (posedge clk or negedge rst_n)
	begin
		if (!rst_n)
			begin
				addr <= 32'd0;  //相位控制�?
			end
		else
			begin
	/*每隔fword的大小，输出�?位地�?，若频率控制字FWORD等于2，那么地�?计数器输出的就依次是0�?2�?4.....*/		
				addr <= addr + FWORD;
			end		
	end 
	/*将累加器器的地址的高八位赋�?�给输出的地�?（ROM的地�?*/
	assign addr_out = addr[N-1:N-8] + PWORD;

endmodule 