`timescale 1ns/1ps

module alu_tb;

parameter WIDTH = 32;

reg  [WIDTH-1:0] A;
reg  [WIDTH-1:0] B;
reg  [3:0] opcode;

wire [WIDTH-1:0] result;
wire carry;
wire overflow;
wire zero;
wire negative;

alu #(WIDTH) DUT (
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result),
    .carry(carry),
    .overflow(overflow),
    .zero(zero),
    .negative(negative)
);

initial begin

    $display("Starting ALU Test...");
    $monitor("Time=%0t Opcode=%b A=%0d B=%0d Result=%0d Carry=%b Overflow=%b Zero=%b Negative=%b",
              $time, opcode, A, B, result,
              carry, overflow, zero, negative);

    // ADD
    A = 10;
    B = 20;
    opcode = 4'b0000;
    #10;

    // SUB
    A = 20;
    B = 10;
    opcode = 4'b0001;
    #10;

    // AND
    A = 32'hF0F0F0F0;
    B = 32'h0F0F0F0F;
    opcode = 4'b0010;
    #10;

    // OR
    opcode = 4'b0011;
    #10;

    // XOR
    opcode = 4'b0100;
    #10;

    // SLL
    A = 8;
    B = 2;
    opcode = 4'b0101;
    #10;

    // SRL
    A = 32;
    B = 2;
    opcode = 4'b0110;
    #10;

    // SRA
    A = -16;
    B = 2;
    opcode = 4'b0111;
    #10;

    // SLT
    A = 5;
    B = 10;
    opcode = 4'b1000;
    #10;

    // Overflow Test
    A = 32'h7FFFFFFF;
    B = 1;
    opcode = 4'b0000;
    #10;

    // Zero Test
    A = 15;
    B = 15;
    opcode = 4'b0001;
    #10;

    $display("ALU Test Completed.");
    $finish;

end

endmodule