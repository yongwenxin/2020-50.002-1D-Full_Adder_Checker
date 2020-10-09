set projDir "D:/SUTD/CS/1D\ Full\ Adder/1D_Full_adder/work/vivado"
set projName "1D_Full_adder"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "D:/SUTD/CS/1D\ Full\ Adder/1D_Full_adder/work/verilog/au_top_0.v" "D:/SUTD/CS/1D\ Full\ Adder/1D_Full_adder/work/verilog/full_adder_checker_1.v" "D:/SUTD/CS/1D\ Full\ Adder/1D_Full_adder/work/verilog/reset_conditioner_2.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "D:/ALCHITRY_DL/library/components/au.xdc" "D:/SUTD/CS/1D\ Full\ Adder/1D_Full_adder/work/constraint/custom.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
