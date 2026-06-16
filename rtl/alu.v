module alu #(
    parameter WIDTH = 32
)(
    input  [WIDTH-1:0] A,
    input  [WIDTH-1:0] B,
    input  [3:0] opcode,

    output reg [WIDTH-1:0] result,
    output reg carry,
    output reg overflow,
    output zero,
    output negative
);

reg [WIDTH:0] temp;

always @(*) begin
    result   = 0;
    carry    = 0;
    overflow = 0;
    temp     = 0;

    case(opcode)

        // ADD
        4'b0000: begin
            temp     = A + B;
            result   = temp[WIDTH-1:0];
            carry    = temp[WIDTH];

            overflow = (~A[WIDTH-1] & ~B[WIDTH-1] & result[WIDTH-1]) |
                       ( A[WIDTH-1] &  B[WIDTH-1] & ~result[WIDTH-1]);
        end

        // SUB
        4'b0001: begin
            temp     = A - B;
            result   = temp[WIDTH-1:0];
            carry    = temp[WIDTH];

            overflow = (~A[WIDTH-1] & B[WIDTH-1] & result[WIDTH-1]) |
                       ( A[WIDTH-1] & ~B[WIDTH-1] & ~result[WIDTH-1]);
        end

        // AND
        4'b0010: result = A & B;

        // OR
        4'b0011: result = A | B;

        // XOR
        4'b0100: result = A ^ B;

        // Shift Left Logical
        4'b0101: result = A << B[4:0];

        // Shift Right Logical
        4'b0110: result = A >> B[4:0];

        // Shift Right Arithmetic
        4'b0111: result = $signed(A) >>> B[4:0];

        // Set Less Than (signed)
        4'b1000: result = ($signed(A) < $signed(B)) ? 1 : 0;

        default: result = 0;

    endcase
end

assign zero     = (result == 0);
assign negative = result[WIDTH-1];

endmodule