`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:30:49 07/19/2012 
// Design Name: 
// Module Name:    wb_hb_memmap 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module wb_hb_memmap
#( parameter DATA_WIDTH = 16,
	 parameter ADDR_WIDTH = 16 )
(
// general
	input wire rst,
	input wire clk,
// wishbone signals
	output reg wb_strobe,
	output reg wb_write,
	output reg wb_ack,
	output reg wb_cycle,
	output reg [ADDR_WIDTH-1:0] wb_addr,
	input wire [DATA_WIDTH-1:0] wb_rdData,
	output reg [DATA_WIDTH-1:0] wb_wrData
);

endmodule
