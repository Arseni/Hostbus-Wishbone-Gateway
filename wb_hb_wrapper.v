`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:20:10 07/17/2012 
// Design Name: 	 Wishbone <-> Host bus signal wrapper
// Module Name:    wb_hb_wrapper 
// Project Name:   Wishbone <-> Host bus Bridge
// Target Devices: Xilinx Spartan 6
// Tool versions:  ISE 14.2
// Description:    Das Modul setzt die Host Bus Signale auf Wishbone Signale um.
//									
// Dependencies:   keine
//
// Revision: 
// Revision 0.01 - File Created 
//
//////////////////////////////////////////////////////////////////////////////////

module wb_hb_wrapper
#( parameter DATA_WIDTH = 16,
	 parameter ADDR_WIDTH = 16 )
(
// general
	input wire rst,
	input wire clk,
// host bus signals
	input wire hb_sc,
	input wire hb_oe,
	input wire hb_we,
	input wire [ADDR_WIDTH-1:0] hb_addr,
	inout wire [DATA_WIDTH-1:0] hb_data,
// wishbone signals
	output reg wb_strobe,
	output reg wb_write,
	output reg wb_ack,
	output reg wb_cycle,
	output reg [ADDR_WIDTH-1:0] wb_addr,
	input wire [DATA_WIDTH-1:0] wb_rdData,
	output reg [DATA_WIDTH-1:0] wb_wrData
);

reg strobe, write, read;
reg [DATA_WIDTH-1:0] wrAddr;
reg [ADDR_WIDTH-1:0] addr;

always @*
begin
	if(rst == 1)
	begin
		wb_strobe = 0;
		wb_write = 0;
		wb_ack = 0;
		wb_cycle = 0;
		wb_addr = 'b0;
		wb_wrData = 'b0;
	end
	else if(clk == 1)
	begin
		strobe = !(hb_cs) & !(hb_oe & hb_we);
		write = !(hb_cs & hb_we);
		read = !(hb_cs & hb_oe);
		addr = hb_addr;
		wrData = hb_data;
	end
end

always @*
begin
	wb_strobe = strobe;
	wb_cycle = strobe;
	wb_write = write;
	wb_addr = strobe == 1 ? addr : 'b0;
	wb_wrData = write == 1 ? wrData : 'b0;
	hb_data = read == 1 ? wb_rdData : 'bZ;
end

endmodule
