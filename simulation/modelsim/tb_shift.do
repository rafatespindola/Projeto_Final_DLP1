vcom -93 -work work {/home/aluno/Projeto_Final_DLP1/shift_register.vhd}
vsim work.shift_register(v1)
add wave sim:/shift_register/*
force -freeze sim:/shift_register/din_sft 11111001000 0
force -freeze sim:/shift_register/load_sft 1 0, 0 200
force -freeze sim:/shift_register/clk_sft 1 0, 0 {50 ps} -r 100
force -freeze sim:/shift_register/rst_sft 1 0, 0 10
run 1500

