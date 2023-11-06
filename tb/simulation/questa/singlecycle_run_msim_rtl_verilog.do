transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/ntphu/MS2/src {/home/ntphu/MS2/src/outmem.v}
vlog -vlog01compat -work work +incdir+/home/ntphu/MS2/src {/home/ntphu/MS2/src/inmem.v}
vlog -vlog01compat -work work +incdir+/home/ntphu/MS2/src {/home/ntphu/MS2/src/datamem.v}
vlog -vlog01compat -work work +incdir+/home/ntphu/MS2/src {/home/ntphu/MS2/src/instr_rom.v}
vlog -sv -work work +incdir+/home/ntphu/MS2/src {/home/ntphu/MS2/src/wb_mux.sv}
vlog -sv -work work +incdir+/home/ntphu/MS2/src {/home/ntphu/MS2/src/singlecycle.sv}
vlog -sv -work work +incdir+/home/ntphu/MS2/src {/home/ntphu/MS2/src/regfile.sv}
vlog -sv -work work +incdir+/home/ntphu/MS2/src {/home/ntphu/MS2/src/reg_dec.sv}
vlog -sv -work work +incdir+/home/ntphu/MS2/src {/home/ntphu/MS2/src/pc_reg.sv}
vlog -sv -work work +incdir+/home/ntphu/MS2/src {/home/ntphu/MS2/src/op_b_mux.sv}
vlog -sv -work work +incdir+/home/ntphu/MS2/src {/home/ntphu/MS2/src/op_a_mux.sv}
vlog -sv -work work +incdir+/home/ntphu/MS2/src {/home/ntphu/MS2/src/lsu.sv}
vlog -sv -work work +incdir+/home/ntphu/MS2/src {/home/ntphu/MS2/src/ld_sel_mux.sv}
vlog -sv -work work +incdir+/home/ntphu/MS2/src {/home/ntphu/MS2/src/immGen.sv}
vlog -sv -work work +incdir+/home/ntphu/MS2/src {/home/ntphu/MS2/src/ctrl_unit.sv}
vlog -sv -work work +incdir+/home/ntphu/MS2/src {/home/ntphu/MS2/src/brcomp.sv}
vlog -sv -work work +incdir+/home/ntphu/MS2/src {/home/ntphu/MS2/src/br_mux.sv}
vlog -sv -work work +incdir+/home/ntphu/MS2/src {/home/ntphu/MS2/src/alu.sv}
vlog -sv -work work +incdir+/home/ntphu/MS2/src {/home/ntphu/MS2/src/add4.sv}

vlog -sv -work work +incdir+/home/ntphu/MS2/tb {/home/ntphu/MS2/tb/singlecycle_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  singlecycle_tb

add wave *
view structure
view signals
run -all
