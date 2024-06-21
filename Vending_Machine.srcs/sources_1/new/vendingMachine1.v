`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2024 06:36:33 PM
// Design Name: 
// Module Name: vendingMachine_1
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

// take1 -> 1
//take2 -> 2
//take3 -> 3
//take4 -> 4



module vendingMachine_1(
    input [2:0]DATA,
    input load1, load3, load4,
    input take1,take2, take3, take4,
    input start, clk, rst, cancel,
//    output reg [3:0]reg2, reg [3:0]reg6, reg [3:0]reg10,
//    output reg [3:0]regi1, reg [3:0]regi2, reg [3:0]regi3,reg [3:0]regi4,
    output co,
//    output [4:0]inputDATA,
//    output reg [4:0]itemCount, //Consider person can take at max 24 items (limit set 6 items count per item)
    output reg [5:0]money,  //As (1+2+3+4)*6 = 60 which is of 6 bits
    output reg moneySign,          // 0-> +  1-> -,
    output [6:0] SSD_tens, output [6:0] SSD_ones,
    output [2:0] outputDATA
    );
    wire [4:0]inputDATA;
    reg [4:0]itemCount;
//    reg [6:0]money;
//    reg moneySign;           // 0-> +  1-> -
    
    assign inputDATA = {2'b00,DATA};
    assign outputDATA = DATA;
    reg [27:0]count=0;
    //CLK DIV
    assign co = count[27];
//    assign co = clk;
    always@ (posedge clk) count = count + 1;
    
    wire [5:0]mul1,mul2,mul3,mul4;
    wire c1,c2,c3,c4;
    multiply_by_4bit CALL1  (.number1(DATA),.number2(4'b0001),.result(mul1),.c_out(c1));
    multiply_by_4bit CALL2 (.number1(DATA),.number2(4'b0010),.result(mul2),.c_out(c2));
    multiply_by_4bit CALL3 (.number1(DATA),.number2(4'b0011),.result(mul3),.c_out(c3));
    multiply_by_4bit CALL4 (.number1(DATA),.number2(4'b0100),.result(mul4),.c_out(c4));
    
    fivebitadd_display display1 (.A(itemCount),.SSD_tens(SSD_tens),.SSD_ones(SSD_ones));
    
    always@(posedge co)
        begin
//            $display("co: %b", co);
//            $display("DATA: %b", DATA); 
            if(rst)
                begin
                    itemCount <= 5'b00000;
                    money <= 6'b000000;
                    moneySign <= 0;
                end
                
            else if(load1)
                begin  
                    if(moneySign==0)
                        begin
                            money <= money + mul1;
                        end   
                    else
                        begin
                            if(money>mul1)
                                begin 
                                    money <= money-mul1;
                                    moneySign <=1;
                                end
                             else
                                begin
                                    money <= -money+mul1;
                                    moneySign <=0;
                                end   
                        end  
                end
            else if(load3)
                begin  
                    if(moneySign==0)
                        begin
                            money <= money + mul3;
                        end   
                    else
                        begin
                            if(money>mul3)
                                begin 
                                    money <= money-mul3;
                                    moneySign <=1;
                                end
                             else
                                begin
                                    money <= -money+mul3;
                                    moneySign <=0;
                                end   
                        end  
                end
            else if(load4)
                begin  
                    if(moneySign==0)
                        begin
                            money <= money + mul4;
                        end   
                    else
                        begin
                            if(money>mul4)
                                begin 
                                    money <= money-mul4;
                                    moneySign <=1;
                                end
                             else
                                begin
                                    money <= -money+mul4;
                                    moneySign <=0;
                                end   
                        end  
                end
            
            
            
            else if(take1)
                begin
                    itemCount <= itemCount + inputDATA;
                    if(moneySign ==0)
                    begin
                        if(money>= mul1)
                            begin
                                moneySign <= 0;
                                money <= money - mul1;
                            end
                        else
                            begin
                                moneySign <= 1;
                                money <= - money + mul1;
                            end
                    end
                    else
                    begin`
//                        if(money>= mul1)
//                            begin
                                moneySign <= 1;
                                money <= money + mul1;
//                            end
//                        else
//                            begin
//                                moneySign <= 1;
//                                money <= money + mul1;
//                            end
                    end
                end
            else if(take2)
                begin
                    itemCount <= itemCount + inputDATA;
                    if(moneySign ==0)
                    begin
                        if(money>= mul2)
                            begin
                                moneySign <= 0;
                                money <= money - mul2;
                            end
                        else
                            begin
                                moneySign <= 1;
                                money <= - money + mul2;
                            end
                    end
                    else
                    begin
//                        if(money>= mul2)
//                            begin
                                moneySign <= 1;
                                money <= money + mul2;
//                            end
//                        else
//                            begin
//                                moneySign <= 1;
//                                money <= money + mul2;
//                            end
                    end
                end
            else if(take3)
                begin
                    itemCount <= itemCount + inputDATA;
                    if(moneySign ==0)
                    begin
                        if(money>= mul3)
                            begin
                                moneySign <= 0;
                                money <= money - mul3;
                            end
                        else
                            begin
                                moneySign <= 1;
                                money <= - money + mul3;
                            end
                    end
                    else
                    begin
//                        if(money>= mul3)
//                            begin
                                moneySign <= 1;
                                money <= money + mul3;
//                            end
//                        else
//                            begin
//                                moneySign <= 1;
//                                money <= money + mul3;
//                            end
                    end
                end
            else if(take4)
                begin
                    itemCount <= itemCount + inputDATA;
                    if(moneySign ==0)
                    begin
                        if(money>= mul4)
                            begin
                                moneySign <= 0;
                                money <= money - mul4;
                            end
                        else
                            begin
                                moneySign <= 1;
                                money <= - money + mul4;
                            end
                    end
                    else
                    begin
//                        if(money>= mul4)
//                            begin
                                moneySign <= 1;
                                money <= money + mul4;
//                            end
//                        else
//                            begin
//                                moneySign <= 1;
//                                money <= money + mul4;
//                            end
                    end
                end
                
                
            else if (cancel==1 && start == 0)    // Transaction Cancel
                begin
                    itemCount <= 0;       //7seg
                    money <= 0;
                    moneySign <= 0;      //LCD
                end
                
            else if (start)
                begin
                    if(moneySign == 0)
                        begin
                    //Fn for showing down counter on 7seg displays and finally make itemCount=0
                            money <= 0;   // Display this 0 on LCD   // This shows that extra money is return to the person
                            itemCount <= 0;
                        end
                end  
//            $display("5: %b", mul5);
//            $display("10: %b", mul10);  
//            $display("15: %b", mul15);  
//            $display("20: %b", mul10);  
//            $display("30: %b", mul30);  
             
                
        end
endmodule       
        

module multiply_by_4bit(number1,number2, result, c_out);
    parameter n = 3;
    input [n-1:0]number1;
    input [3:0]number2;
    output[n+2:0]result;
    output c_out;
    
    reg [n-1:0] leftShift0_temp;
    reg [n+2:0] leftShift0;
    
    reg [n:0] leftShift1_temp;
    reg [n+2:0] leftShift1;
    
    reg [n+1:0] leftShift2_temp;
    reg [n+2:0] leftShift2;
    
    reg [n+2:0] leftShift3;
    
    always@(*)
        begin
            if(number2[0]==1'b1)
                begin
                    leftShift0_temp = number1;
                    leftShift0 = {3'b000,leftShift0_temp};
                end
            if(number2[1]==1'b1)
                begin
                    leftShift1_temp = number1<<1;
                    leftShift1 = {2'b00,leftShift1_temp};
                end
            if(number2[2]==1'b1)
                begin
                    leftShift2_temp = number1<<2;
                    leftShift2 = {1'b0,leftShift2_temp};
                end 
            if(number2[3]==1'b1)
                begin
                    leftShift3 = number1<<3;
                end  
            
            if(number2[0]==0) leftShift0 = 6'b000000;
            if(number2[1]==0) leftShift1 = 6'b000000;
            if(number2[2]==0) leftShift2 = 6'b000000;
            if(number2[3]==0) leftShift3 = 6'b000000;  
            
//            $display("number1: %b", number1);
//            $display("leftShift0: %b", leftShift0);
//            $display("leftShift1: %b", leftShift1);
//            $display("leftShift2: %b", leftShift2);
//            $display("leftShift3: %b", leftShift3);           
        end 
      
      assign result = leftShift0 + leftShift1 + leftShift2 + leftShift3;    
      assign c_out = 1'b0;                   
endmodule

module BinaryToDecimal(input [4:0] binary,output reg [4:0] decimal);
    reg [4:0] temp_decimal; // Temporary variable to store decimal value
    integer i;
    always @* begin
        decimal = 0; // Initialize decimal value
        temp_decimal = 0;
        // Loop through each bit of the binary input
        for (i = 0; i < 5; i = i + 1) begin
            // Add the contribution of each bit to the temporary decimal value
            temp_decimal = temp_decimal + (binary[i] * (2**i));
        end
        
        // Assign the temporary decimal value to the output
        decimal = temp_decimal;
    end
endmodule

module DecimalSplitter(input [4:0] decimal,output reg [3:0] dec_tens,output reg [3:0] dec_ones);
    always @* begin
        dec_ones = decimal % 10; // Extract ones digit
        dec_tens = decimal / 10; // Extract tens digit
    end
endmodule

// BCD to Seven Segment Decoder
// Common Cathode SSD
module BCD_to_SevenSegment (input [3:0] bcd_input, output reg [6:0] seven_segment_output);
    always @(bcd_input) begin
        case (bcd_input)
            4'b0000: seven_segment_output = 7'b0111111; // 0 0111111 
            4'b0001: seven_segment_output = 7'b0000110; // 1 0000110
            4'b0010: seven_segment_output = 7'b1011011; // 2 1011011
            4'b0011: seven_segment_output = 7'b1001111; // 3 1001111
            4'b0100: seven_segment_output = 7'b1100110; // 4 1100110
            4'b0101: seven_segment_output = 7'b1101101; // 5 1101101
            4'b0110: seven_segment_output = 7'b1111101; // 6 1111101
            4'b0111: seven_segment_output = 7'b0000111; // 7 0000111
            4'b1000: seven_segment_output = 7'b1111111; // 8 1111111
            4'b1001: seven_segment_output = 7'b1101111; // 9 1101111
            default: seven_segment_output = 7'b1111100; //   1111100 Display E for undefined BCD input
        endcase
    end
endmodule

module disp_add(input [3:0] dec_tens, input [3:0] dec_ones, output [6:0] s_tens, output [6:0] s_ones);
    BCD_to_SevenSegment tens_(dec_tens, s_tens);
    BCD_to_SevenSegment ones_(dec_ones, s_ones);
endmodule

module fivebitadd_display(input [4:0] A, output [6:0] SSD_tens, output [6:0] SSD_ones);
//    wire [3:0] s;
//    wire c;
    wire [4:0] dec; wire [3:0]d_tens, d_ones;
//    four_bit_adder FourBAdd(A, B, s, c);
    BinaryToDecimal bin2dec({A}, dec);
    DecimalSplitter DSplit(dec,d_tens,d_ones);
    disp_add D_and_A(d_tens, d_ones, SSD_tens, SSD_ones);
endmodule















module carry_lookahead_Adder (in1, in2, cin, sum, cout);
	parameter n=15; // number of bits
	input [n-1:0] in1;
	input [n-1:0] in2;
	input cin;
	output [n-1:0] sum;
	output cout;
	
	wire [n-1:0] gen;
	wire [n-1:0] prod;
	wire [n:0] c_tmp;

	genvar i,j;
	generate 
		 assign c_tmp[0]=cin; 
		 for(j=0; j<n; j=j+1)
		 begin: carry_generator
			assign gen[j] = in1[j] & in2[j];
			assign prod[j] = in1[j] | in2[j];
			assign c_tmp[j+1] = gen[j] | prod[j] & c_tmp[j];
		 end  
		 assign cout = c_tmp[n];
		 for(i=0; i<n; i=i+1)
		 begin: sum_without_carry
			assign sum[i] = in1[i] ^ in2[i] ^ c_tmp[i];
		 end 
	endgenerate
endmodule

