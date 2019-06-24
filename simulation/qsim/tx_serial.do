onerror {quit -f}
vlib work
vlog -work work tx_serial.vo
vlog -work work tx_serial.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.gerador_paridade_vlg_vec_tst
vcd file -direction tx_serial.msim.vcd
vcd add -internal gerador_paridade_vlg_vec_tst/*
vcd add -internal gerador_paridade_vlg_vec_tst/i1/*
add wave /*
run -all
