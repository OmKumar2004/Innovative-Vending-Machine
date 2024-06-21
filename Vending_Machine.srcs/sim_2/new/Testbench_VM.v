`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2024 01:14:48 AM
// Design Name: 
// Module Name: Testing_VM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Testing_VM;  
 //Inputs
    reg clk, rst, start, cancel;
    reg [2:0]DATA;
    reg load1, load3, load4, take1,take2, take3, take4;
 //Outputs
    wire [5:0]money;
    wire moneySign;
    wire [4:0]itemCount;
    wire co;
    wire [6:0] SSD_tens;
    wire [6:0] SSD_ones;
    wire [2:0] outputData;
    vendingMachine_1 DUT(
        .clk(clk), .rst(rst), .start(start) ,.cancel(cancel),
        .co(co),
        .DATA(DATA),
        .load1(load1), .load3(load3), .load4(load4), .take1(take1), .take2(take2), .take3(take3), .take4(take4),
        .money(money), .moneySign(moneySign),
         .itemCount(itemCount),
        .SSD_tens(SSD_tens), .SSD_ones(SSD_ones), .outputDATA(outputDATA)       
        );
        
//    always #5 clk = ~clk;
    initial begin
        clk = 0;
        forever# 5 clk = ~clk;
    end 
       
  //Test Cases
    initial begin
        clk = 0;
        rst = 1;
        start = 0;
        cancel = 0;
        load1=0; load3=0; load4=0; take1=0; take2=0; take3=0; take4=0;
//        money = 4'b0000; moneySign = 0; itemCount = 4'b0000;
        DATA = 3'b000; 
      #10;
        rst = 0;
    //Test Case 1: load1=1 load3=2 load4=2 take1=0 take2=1 take3=1 take4=2
//        DATA = 4'b0001;
        load1=1;
        DATA = 3'b001;
      #10;
        load1=0;
        load3=1;
        DATA = 3'b001;
      #10;
        load3=0;
        load4=1;
        DATA = 3'b001;
      #10;
        load4=0;
        
        take1 = 1;
        DATA= 3'b111;
      #10;
        take1 = 0;
        take2 = 1;
        DATA= 3'b101;
      #10;
        take2 = 0;
        take3 = 1;
        DATA= 3'b001;
      #10;
        take3 = 0;
        take4 = 1;
        DATA= 3'b010;
      #10;
        take4 = 0;
        
        start=1; #30;
        start=0; #10;
        
        cancel =1; #10;
        cancel = 0; #10;
        
        
        $finish;
     end  
endmodule
