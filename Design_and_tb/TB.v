module ALU_16bit_tb ; 

reg [15:0] A , B ; 
reg CLK ;
reg [3:0] ALU_FUN ; 

wire [31:0] ALU_OUT ; 
wire arith_flag , logic_flag , cmp_flag , shift_flag ; 

ALU_16bit DUT (.A(A), .B(B), .ALU_FUN(ALU_FUN), .CLK(CLK), .ALU_OUT(ALU_OUT),
                    .arith_flag(arith_flag), .logic_flag(logic_flag),
                    .cmp_flag(cmp_flag), .shift_flag(shift_flag));

initial begin
    CLK=0 ; 
    forever #1 CLK =~CLK ; 
end

initial begin 
    repeat (10000) begin 
        A       = $random ; 
        B       = $random ; 
        ALU_FUN = $random ;
        @(negedge CLK) ; 
    end
    $stop ; 
end
endmodule 
