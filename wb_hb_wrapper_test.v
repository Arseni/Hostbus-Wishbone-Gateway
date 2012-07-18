`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:03:01 07/17/2012
// Design Name:   wb_hb_wrapper
// Module Name:   C:/xilinxProjects/wb_hb_bridge/wb_hb_wrapper_test.v
// Project Name:  wb_hb_bridge
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: wb_hb_wrapper
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module wb_hb_wrapper_test;

	// Inputs
	reg rst;
	reg clk;
	reg hb_cs;
	reg hb_oe;
	reg hb_we;
	reg [15:0] hb_addr;
	reg [15:0] wb_rdData;

	// Outputs
	wire wb_strobe;
	wire wb_write;
	wire wb_ack;
	wire wb_cycle;
	wire [15:0] wb_addr;
	wire [15:0] wb_wrData;

	// Bidirs
	wire [15:0] hb_data;
	reg [15:0] hb_dataReg;
	
	assign hb_data = hb_we == 0 ? hb_dataReg : 16'bZ;

	// Instantiate the Unit Under Test (UUT)
	wb_hb_wrapper uut (
		.rst(rst), 
		.clk(clk), 
		.hb_cs(hb_cs), 
		.hb_oe(hb_oe), 
		.hb_we(hb_we), 
		.hb_addr(hb_addr), 
		.hb_data(hb_data), 
		.wb_strobe(wb_strobe), 
		.wb_write(wb_write), 
		.wb_ack(wb_ack), 
		.wb_cycle(wb_cycle), 
		.wb_addr(wb_addr), 
		.wb_rdData(wb_rdData), 
		.wb_wrData(wb_wrData)
	);

	initial begin
		// Initialize Inputs
		rst = 0;
		hb_cs = 1;
		hb_oe = 1;
		hb_we = 1;
		hb_addr = 'b11;
		wb_rdData = 16'b1010101010101010;
		hb_dataReg = 16'b1111000011110000;

		rst = 1;
		#100;
		rst = 0;
		// Wait 100 ns for global reset to finish
		#100;
		
		hb_cs = 0;
		hb_oe = 0;
		#100;
		hb_cs = 1;
		hb_oe = 1;
		#100;
		hb_cs = 0;
		hb_we = 0;
		#100;
		hb_cs = 1;
		hb_we = 1;
		
    
		// Add stimulus here

	end
	
	always
	begin
		clk = 1;
		#10;
		clk = 0;
		#10;
	end
      
endmodule

