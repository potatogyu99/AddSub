`timescale 1ns / 1ps

module AddSub_tb;

    // Inputs
    reg S;
    reg [3:0] A, B;

    // Outputs
    wire [3:0] F;
    wire Unsigned_Overflow, Signed_Overflow;

    // Instantiate the unit under test (UUT)
    Addsub uut (
        .S(S), 
        .A(A), 
        .B(B), 
        .F(F), 
        .Unsigned_Overflow(Unsigned_Overflow), 
        .Signed_Overflow(Signed_Overflow)
    );

    // Stimulus
    initial begin
        // Test Case 1: Addition (S=0)
        S = 1'b0;
        A = 4'b0011;  // 3
        B = 4'b0010;  // 2
        #10; // Wait for some time
        // Display results
        $display("Addition Test (S=0): A=%d, B=%d, F=%d, Unsigned Overflow=%b, Signed Overflow=%b", A, B, F, Unsigned_Overflow, Signed_Overflow);

        // Test Case 2: Subtraction (S=1)
        S = 1'b1;
        A = 4'b0011;  // 3
        B = 4'b0010;  // 2
        #10; // Wait for some time
        // Display results
        $display("Subtraction Test (S=1): A=%d, B=%d, F=%d, Unsigned Overflow=%b, Signed Overflow=%b", A, B, F, Unsigned_Overflow, Signed_Overflow);
        
        // Add more test cases here...

        // End simulation
        $finish;
    end

endmodule
