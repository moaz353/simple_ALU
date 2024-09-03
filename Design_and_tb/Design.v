module ALU_16bit (A , B ,ALU_FUN , CLK , ALU_OUT , arith_flag , logic_flag ,
                cmp_flag , shift_flag ) ;

input [15:0] A , B ; 
input CLK ;
input [3:0] ALU_FUN ; 

output reg [31:0] ALU_OUT ; 
output arith_flag , logic_flag , cmp_flag , shift_flag ; 
always @(posedge CLK) begin
    case(ALU_FUN) 
    4'b0000 : ALU_OUT <= A + B     ; 
    4'b0001 : ALU_OUT <= A - B     ; 
    4'b0010 : ALU_OUT <= A * B     ; 
    4'b0011 : ALU_OUT <= A / B     ; 
    4'b0100 : ALU_OUT <=  A & B    ; 
    4'b0101 : ALU_OUT <=  A | B    ; 
    4'b0110 : ALU_OUT <=  ~(A & B) ; 
    4'b0111 : ALU_OUT <=  ~(A | B) ; 
    4'b1000 : ALU_OUT <=  A ^ B    ; 
    4'b1001 : ALU_OUT <=  ~(A ^ B) ; 
    4'b1010 : ALU_OUT <=  (A == B)? 1 : 0 ; 
    4'b1011 : ALU_OUT <=  (A > B)?  2 : 0  ; 
    4'b1100 : ALU_OUT <=  (A < B)?  3 : 0  ; 
    4'b1101 : ALU_OUT <=  {1'b1 , A[14:0] }; 
    4'b1110 : ALU_OUT <=  {A[15:1] , 1'b1 }; 
    default : ALU_OUT <= 0 ; 
    endcase 
end

assign arith_flag = (ALU_FUN >=  0 && ALU_FUN <= 3    )? 1 : 0 ; 
assign logic_flag = (ALU_FUN >=  4 && ALU_FUN <= 9    )? 1 : 0 ; 
assign cmp_flag   = (ALU_FUN >= 10 && ALU_FUN <= 12   )? 1 : 0 ; 
assign shift_flag = (ALU_FUN == 13 |  ALU_FUN == 14   )? 1 : 0 ; 

endmodule 
