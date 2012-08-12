`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:26:50 08/12/2012
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
	reg glob_cycle;
	reg [15:0] glob_addr;
	reg [15:0] glob_wrData;
	reg ack0;
	reg [15:0] rdData0;
	reg ack1;
	reg [15:0] rdData1;

	// Outputs
	wire glob_ack;
	wire [15:0] glob_rdData;
	wire strobe0;
	wire write0;
	wire cycle0;
	wire [7:0] addr0;
	wire [15:0] wrData0;
	wire strobe1;
	wire write1;
	wire cycle1;
	wire [3:0] addr1;
	wire [15:0] wrData1;

	// Instantiate the Unit Under Test (UUT)
	wb_intercon uut (
		.rst(rst), 
		.clk(clk), 
		.glob_strobe(glob_strobe), 
		.glob_write(glob_write), 
		.glob_cycle(glob_cycle), 
		.glob_ack(glob_ack), 
		.glob_addr(glob_addr), 
		.glob_wrData(glob_wrData), 
		.glob_rdData(glob_rdData), 
		.strobe0(strobe0), 
		.write0(write0), 
		.cycle0(cycle0), 
		.ack0(ack0), 
		.addr0(addr0), 
		.wrData0(wrData0), 
		.rdData0(rdData0), 
		.strobe1(strobe1), 
		.write1(write1), 
		.cycle1(cycle1), 
		.ack1(ack1), 
		.addr1(addr1), 
		.wrData1(wrData1), 
		.rdData1(rdData1)
	);

	initial begin
		// Initialize Inputs
		rst = 0;
		clk = 0;
		glob_strobe = 0;
		glob_write = 0;
		glob_cycle = 0;
		glob_addr = 0;
		glob_wrData = 0;
		ack0 = 0;
		rdData0 = 'h55AA;
		ack1 = 0;
		rdData1 = 'hFF00;

		// Wait 100 ns for global reset to finish
    forever
		begin
			glob_addr = glob_addr + 1;
			#10;
		end
        
		// Add stimulus here

	end
      
endmodule

