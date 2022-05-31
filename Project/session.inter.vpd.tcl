# Begin_DVE_Session_Save_Info
# DVE view(Wave.1 ) session
# Saved on Fri May 6 17:27:12 2022
# Toplevel windows open: 2
# 	TopLevel.1
# 	TopLevel.2
#   Wave.1: 30 signals
# End_DVE_Session_Save_Info

# DVE version: L-2016.06_Full64
# DVE build date: May 24 2016 21:01:02


#<Session mode="View" path="/root/Downloads/UVMP3/part-i/session.inter.vpd.tcl" type="Debug">

#<Database>

gui_set_time_units 1s
#</Database>

# DVE View/pane content session: 

# Begin_DVE_Session_Save_Info (Wave.1)
# DVE wave signals session
# Saved on Fri May 6 17:27:12 2022
# 30 signals
# End_DVE_Session_Save_Info

# DVE version: L-2016.06_Full64
# DVE build date: May 24 2016 21:01:02


#Add ncecessay scopes
gui_load_child_values {ibex_test_testbench.instr_mem_intf}
gui_load_child_values {ibex_test_testbench.data_mem_intf}
gui_load_child_values {ibex_test_testbench.probe_if}

gui_set_time_units 1s

set _wave_session_group_1 data_mem_intf
if {[gui_sg_is_group -name "$_wave_session_group_1"]} {
    set _wave_session_group_1 [gui_sg_generate_new_name]
}
set Group1 "$_wave_session_group_1"

gui_sg_addsignal -group "$_wave_session_group_1" { {Sim:ibex_test_testbench.data_mem_intf.data_err_i} {Sim:ibex_test_testbench.data_mem_intf.data_rdata_i} {Sim:ibex_test_testbench.data_mem_intf.data_wdata_intg_o} {Sim:ibex_test_testbench.data_mem_intf.data_wdata_o} {Sim:ibex_test_testbench.data_mem_intf.data_rvalid_i} {Sim:ibex_test_testbench.data_mem_intf.data_rdata_intg_i} {Sim:ibex_test_testbench.data_mem_intf.clk} {Sim:ibex_test_testbench.data_mem_intf.data_addr_o} {Sim:ibex_test_testbench.data_mem_intf.data_gnt_i} {Sim:ibex_test_testbench.data_mem_intf.data_we_o} {Sim:ibex_test_testbench.data_mem_intf.data_be_o} {Sim:ibex_test_testbench.data_mem_intf.data_req_o} {Sim:ibex_test_testbench.data_mem_intf.$unit} }

set _wave_session_group_2 instr_mem_intf
if {[gui_sg_is_group -name "$_wave_session_group_2"]} {
    set _wave_session_group_2 [gui_sg_generate_new_name]
}
set Group2 "$_wave_session_group_2"

gui_sg_addsignal -group "$_wave_session_group_2" { {Sim:ibex_test_testbench.instr_mem_intf.instr_gnt_i} {Sim:ibex_test_testbench.instr_mem_intf.instr_req_o} {Sim:ibex_test_testbench.instr_mem_intf.instr_addr_o} {Sim:ibex_test_testbench.instr_mem_intf.instr_rdata_i} {Sim:ibex_test_testbench.instr_mem_intf.instr_err_i} {Sim:ibex_test_testbench.instr_mem_intf.instr_rvalid_i} {Sim:ibex_test_testbench.instr_mem_intf.clk} {Sim:ibex_test_testbench.instr_mem_intf.rst_n} {Sim:ibex_test_testbench.instr_mem_intf.$unit} }

set _wave_session_group_3 probe_if
if {[gui_sg_is_group -name "$_wave_session_group_3"]} {
    set _wave_session_group_3 [gui_sg_generate_new_name]
}
set Group3 "$_wave_session_group_3"

gui_sg_addsignal -group "$_wave_session_group_3" { {Sim:ibex_test_testbench.probe_if.debug_req} {Sim:ibex_test_testbench.probe_if.core_sleep} {Sim:ibex_test_testbench.probe_if.ecall} {Sim:ibex_test_testbench.probe_if.alert_major} {Sim:ibex_test_testbench.probe_if.clk} {Sim:ibex_test_testbench.probe_if.fetch_enable} {Sim:ibex_test_testbench.probe_if.$unit} {Sim:ibex_test_testbench.probe_if.alert_minor} }
if {![info exists useOldWindow]} { 
	set useOldWindow true
}
if {$useOldWindow && [string first "Wave" [gui_get_current_window -view]]==0} { 
	set Wave.1 [gui_get_current_window -view] 
} else {
	set Wave.1 [lindex [gui_get_window_ids -type Wave] 0]
if {[string first "Wave" ${Wave.1}]!=0} {
gui_open_window Wave
set Wave.1 [ gui_get_current_window -view ]
}
}

set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_marker_set_ref -id ${Wave.1}  C1
gui_wv_zoom_timerange -id ${Wave.1} 4813 5202
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group1}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group2}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group3}]
gui_seek_criteria -id ${Wave.1} {Any Edge}


gui_set_pref_value -category Wave -key exclusiveSG -value $groupExD
gui_list_set_height -id Wave -height $origWaveHeight
if {$origGroupCreationState} {
	gui_list_create_group_when_add -wave -enable
}
if { $groupExD } {
 gui_msg_report -code DVWW028
}
gui_list_set_filter -id ${Wave.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Wave.1} -text {*}
gui_list_set_insertion_bar  -id ${Wave.1} -group ${Group3}  -position in

gui_marker_move -id ${Wave.1} {C1} 5000
gui_view_scroll -id ${Wave.1} -vertical -set 0
gui_show_grid -id ${Wave.1} -enable false
#</Session>

