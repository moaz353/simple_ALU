quit -sim 
vlib work 
vlog session3_lab2.v session3_lab2_tb.v 
vsim -voptargs=+acc ALU_16bit_tb 
add wave * 
run -all 