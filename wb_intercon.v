`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:11:27 08/04/2012 
// Design Name: 
// Module Name:    wb_intercon 
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
module wb_intercon
#( parameter DATA_WIDTH = 16,
	 parameter ADDR_WIDTH = 16 )
(
// general
	input wire rst,
	input wire clk,
// global wishbone signals
	input wire glob_strobe,
	input wire glob_write,
	input wire glob_cycle,
	output reg glob_ack,
	input wire [ADDR_WIDTH-1:0] glob_addr,
	input wire [DATA_WIDTH-1:0] glob_wrData,
	output reg [DATA_WIDTH-1:0] glob_rdData,
// 1. address space ( 0x0000 - 0x00FF )
	output reg strobe0,
	output reg write0,
	output reg cycle0,
	input wire ack0,
	output reg [7:0] addr0,
	output reg [DATA_WIDTH-1:0] wrData0,
	input wire [DATA_WIDTH-1:0] rdData0,
// 2. address space ( 0x0100 - 0x010F ) 
	output reg strobe1,
	output reg write1,
	output reg cycle1,
	input wire ack1,
	output reg [3:0] addr1,
	output reg [DATA_WIDTH-1:0] wrData1,
	input wire [DATA_WIDTH-1:0] rdData1
);

reg sel0, sel1;

always @*
begin
	sel0 = (glob_addr[15:8] == 'h00) ? 1 : 0;
	sel1 = (glob_addr[15:4] == 'h010) ? 1 : 0;
	
	// space 0 signals
	strobe0 = sel0 & glob_strobe;
	write0 = sel0 & glob_write;
	cycle0 = sel0 & glob_cycle;
	addr0 = sel0 == 1 ? glob_addr[7:0] : 'b0;
	wrData0 = sel0 == 1 ? glob_wrData : 'b0;
	
	// space 1 signals
	strobe1 = sel1 & glob_strobe;
	write1 = sel1 & glob_write;
	cycle1 = sel1 & glob_cycle;
	addr1 = sel1 == 1 ? glob_addr[3:0] : 'b0;
	wrData1 = sel1 == 1 ? glob_wrData : 'b0;
	
	
	// global signal's assign
	glob_ack = sel0 == 1 ? ack0 : 
						 sel1 == 1 ? ack1 :
						 'b0;
	glob_rdData = sel0 == 1 ? rdData0 :
								sel1 == 1 ? rdData1 :
								'b0;
	
end



endmodule
