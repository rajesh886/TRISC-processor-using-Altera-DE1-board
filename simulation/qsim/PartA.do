onerror {quit -f}
vlib work
vlog -work work PartA.vo
vlog -work work PartA.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.PartA_vlg_vec_tst
vcd file -direction PartA.msim.vcd
vcd add -internal PartA_vlg_vec_tst/*
vcd add -internal PartA_vlg_vec_tst/i1/*
add wave /*
run -all
