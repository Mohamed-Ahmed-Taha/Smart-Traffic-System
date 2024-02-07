# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {Common 17-41} -limit 10000000
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {D:/Work/College/GUC/S Semester 5/Smart Traffic System/Full System/DSD Project/DSD project/project_2/project_2.cache/wt} [current_project]
set_property parent.project_path {D:/Work/College/GUC/S Semester 5/Smart Traffic System/Full System/DSD Project/DSD project/project_2/project_2.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo {d:/Work/College/GUC/S Semester 5/Smart Traffic System/Full System/DSD Project/DSD project/project_2/project_2.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  {D:/Work/College/GUC/S Semester 5/Smart Traffic System/Full System/DSD Project/DSD project/project_2/project_2.srcs/sources_1/new/Counter.vhd}
  {D:/Work/College/GUC/S Semester 5/Smart Traffic System/Full System/DSD Project/DSD project/project_2/project_2.srcs/sources_1/new/BuzzTimeCounter.vhd}
  {D:/Work/College/GUC/S Semester 5/Smart Traffic System/Full System/DSD Project/DSD project/project_2/project_2.srcs/sources_1/new/BuzzerCtrl.vhd}
  {D:/Work/College/GUC/S Semester 5/Smart Traffic System/Full System/DSD Project/DSD project/project_2/project_2.srcs/sources_1/new/TriggerGen.vhd}
  {D:/Work/College/GUC/S Semester 5/Smart Traffic System/Full System/DSD Project/DSD project/project_2/project_2.srcs/sources_1/new/Traffic_system.vhd}
  {D:/Work/College/GUC/S Semester 5/Smart Traffic System/Full System/DSD Project/DSD project/project_2/project_2.srcs/sources_1/new/TimeDelay.vhd}
  {D:/Work/College/GUC/S Semester 5/Smart Traffic System/Full System/DSD Project/DSD project/project_2/project_2.srcs/sources_1/new/OR_Gate.vhd}
  {D:/Work/College/GUC/S Semester 5/Smart Traffic System/Full System/DSD Project/DSD project/project_2/project_2.srcs/sources_1/new/CondensedUltrasonicFile.vhd}
  {D:/Work/College/GUC/S Semester 5/Smart Traffic System/Full System/DSD Project/DSD project/project_2/project_2.srcs/sources_1/new/Traffic_system_structural.vhd}
  {D:/Work/College/GUC/S Semester 5/Smart Traffic System/Full System/DSD Project/DSD project/project_2/project_2.srcs/sources_1/new/Top_UltrasonicSensors.vhd}
  {D:/Work/College/GUC/S Semester 5/Smart Traffic System/Full System/DSD Project/DSD project/project_2/project_2.srcs/sources_1/new/Lcd_controller.vhd}
  {D:/Work/College/GUC/S Semester 5/Smart Traffic System/Full System/DSD Project/DSD project/project_2/project_2.srcs/sources_1/new/Top.vhd}
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc {{D:/Work/College/GUC/S Semester 5/Smart Traffic System/Full System/Basys-3-Master.xdc}}
set_property used_in_implementation false [get_files {{D:/Work/College/GUC/S Semester 5/Smart Traffic System/Full System/Basys-3-Master.xdc}}]


synth_design -top Top -part xc7a35tcpg236-1


write_checkpoint -force -noxdef Top.dcp

catch { report_utilization -file Top_utilization_synth.rpt -pb Top_utilization_synth.pb }
