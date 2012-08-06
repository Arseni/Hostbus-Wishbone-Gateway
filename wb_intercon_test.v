`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:09:00 08/06/2012
// Design Name:   wb_intercon
// Module Name:   C:/xilinxProjects/wb_hb_bridge/wb_intercon_test.v
// Project Name:  wb_hb_bridge
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: wb_intercon
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module wb_intercon_test;

	// Inputs
	reg rst;
	reg clk;
	reg glob_strobe;
	reg glob_write;
	reg glob_ack;
	reg glob_cycle;
	reg [15:0] glob_addr;
	reg [15:0] glob_wrData;
	reg [15:0] rdData0;
	reg [15:0] rdData1;

	// Outputs
	wire [15:0] glob_rdData;
	wire strobe0;
	wire write0;
	wire ack0;
	wire cycle0;
	wire [7:0] addr0;
	wire [15:0] wrData0;
	wire strobe1;
	wire write1;
	wire ack1;
	wire cycle1;
	wire [4:0] addr1;
	wire [15:0] wrData1;

	// Instantiate the Unit Under Test (UUT)
	wb_intercon uut (
		.rst(rst), 
		.clk(clk), 
		.glob_strobe(glob_strobe), 
		.glob_write(glob_write), 
		.glob_ack(glob_ack), 
		.glob_cycle(glob_cycle), 
		.glob_addr(glob_addr), 
		.glob_rdData(glob_rdData), 
		.glob_wrData(glob_wrData), 
		.strobe0(strobe0), 
		.write0(write0), 
		.ack0(ack0), 
		.cycle0(cycle0), 
		.addr0(addr0), 
		.rdData0(rdData0), 
		.wrData0(wrData0), 
		.strobe1(strobe1), 
		.write1(write1), 
		.ack1(ack1), 
		.cycle1(cycle1), 
		.addr1(addr1), 
		.rdData1(rdData1), 
		.wrData1(wrData1)
	);

	initial begin
		// Initialize Inputs
		rst = 0;
		clk = 0;
		glob_strobe = 0;
		glob_write = 0;
		glob_ack = 0;
		glob_cycle = 0;
		glob_addr = 0;
		glob_wrData = 0;
		rdData0 = 'h00FF;
		rdData1 = 'h55AA;

		// Wait 100 ns for global reset to finish
		#100;
    forever
		begin
			glob_addr = glob_addr + 1;
			#10;
		end
		// Add stimulus here

	end
      
endmodule

