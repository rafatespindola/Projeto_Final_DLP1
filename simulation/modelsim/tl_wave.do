onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tx_serial/clk_tx
add wave -noupdate /tx_serial/rst_tx
add wave -noupdate /tx_serial/enable_tx
add wave -noupdate /tx_serial/ent/pulso
add wave -noupdate /tx_serial/load_tx
add wave -noupdate /tx_serial/sel_paridade_tx
add wave -noupdate /tx_serial/sel_baudrate_tx
add wave -noupdate /tx_serial/out_tx
add wave -noupdate /tx_serial/baudrate_tx
add wave -noupdate -radix ascii /tx_serial/to_conv
add wave -noupdate /tx_serial/ssd1_tx
add wave -noupdate /tx_serial/ssd2_tx
add wave -noupdate /tx_serial/ssd3_tx
add wave -noupdate /tx_serial/ssd4_tx
add wave -noupdate /tx_serial/ssd5_tx
add wave -noupdate /tx_serial/ssd6_tx
add wave -noupdate /tx_serial/ssd7_tx
add wave -noupdate /tx_serial/ssd8_tx
add wave -noupdate /tx_serial/led_baudrate_tx1
add wave -noupdate /tx_serial/led_baudrate_tx2
add wave -noupdate /tx_serial/led_baudrate_tx3
add wave -noupdate /tx_serial/led_baudrate_tx4
add wave -noupdate /tx_serial/clk_baud
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1300884956 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {33711504425 ps}
