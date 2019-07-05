transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/rafael.te/Projeto_Final_DLP1/conv_paralelo_serial.vhd}
vcom -93 -work work {/home/rafael.te/Projeto_Final_DLP1/gerador_paridade.vhd}
vcom -93 -work work {/home/rafael.te/Projeto_Final_DLP1/shift_register.vhd}

