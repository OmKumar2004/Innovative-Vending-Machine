`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.04.2024 00:56:21
// Design Name: 
// Module Name: TB_MUL
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


module TB_MUL;
    reg [10:0]number1;
    reg [4:0]number2;
    wire [14:0]result;
    wire c_out;
    
    multiply_by_5bit DUT1(.number1(number1),.number2(number2),.result(result),.c_out(c_out));
    initial begin
        number1 = 11'b00000000000; number2 = 5'b00101; #20;
        $display("Result: %b, Carry Out: %b", result, c_out);
    $finish;
    end    
endmodule

