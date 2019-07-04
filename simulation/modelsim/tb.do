vsim work.tx_serial
add wave sim:/tx_serial/*
force -freeze sim:/tx_serial/clk_tx 0 0
force -freeze sim:/tx_serial/sel_paridade_tx 0 0
force -freeze sim:/tx_serial/load_tx 0 0
force -freeze sim:/tx_serial/rst_tx 0 0
force -freeze sim:/tx_serial/clk_tx 1 0, 0 {10000 ps} -r 20ns
force -freeze sim:/tx_serial/sel_baudrate_tx 00 0
run 100ms