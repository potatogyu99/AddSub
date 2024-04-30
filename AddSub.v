module AddSub (
input S, 
 input [3:0] A, B, 
 output reg [3:0] F, 
 output reg Unsigned_Overflow,
 output reg Signed_Overflow
);
reg [4:0] Result;
always @ (S or A or B) begin 
if (S == 0) begin 
Result = { 1'b0, A} + {1'b0, B};
F = Result [3: 0];
Unsigned_Overflow = Result [4];
Signed_Overflow = ( (!A [3]) & (!B [3]) & (Result [3])) + ( (A [3]) & (B [3]) & (!Result [3]));
end else begin 
Result = {1'b0, A} - {1'b0, B};
F = Result [3:0];
Unsigned_Overflow = Result [4];
Signed_Overflow = ( (A [3]) & (!B[3]) & (!Result [3])) + ((!A[3]) & (B [3]) & (Result [3]));
end 
end
endmodule
