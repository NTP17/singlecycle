onerror {quit -f}
vlib work
vlog -work work singlecycle.vo
vlog -work work singlecycle.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.lsu_vlg_vec_tst
vcd file -direction singlecycle.msim.vcd
vcd add -internal lsu_vlg_vec_tst/*
vcd add -internal lsu_vlg_vec_tst/i1/*
add wave /*
run -all
