create_project -force servo vivado_out -part xc7s75fgga484-1
add_files [glob src/*.v]
add_files -fileset constrs_1 constraints/servo.xdc
set_property top servo_top [current_fileset]
update_compile_order -fileset sources_1

launch_runs synth_1 -jobs 4
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1

open_run impl_1
report_utilization -file vivado_out/utilization.txt
report_timing_summary -file vivado_out/timing.txt
puts "BIT: [glob vivado_out/servo.runs/impl_1/*.bit]"
