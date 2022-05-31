# Begin_DVE_Session_Save_Info
# DVE full session
# Saved on Fri May 27 20:09:53 2022
# Designs open: 1
#   Sim: /root/Downloads/part-i/simv
# Toplevel windows open: 1
# 	TopLevel.2
#   Wave.1: 26 signals
#   Group count = 9
#   Group data_mem_intf signal count = 10
#   Group instr_mem_intf signal count = 8
#   Group probe_if signal count = 8
#   Group data_mem_intf_1 signal count = 13
#   Group instr_mem_intf_1 signal count = 9
#   Group probe_if_1 signal count = 8
#   Group data_mem_intf_2 signal count = 11
#   Group instr_mem_intf_2 signal count = 8
#   Group probe_if_2 signal count = 7
# End_DVE_Session_Save_Info

# DVE version: L-2016.06_Full64
# DVE build date: May 24 2016 21:01:02


#<Session mode="Full" path="/root/Downloads/part-i/DVEfiles/session.tcl" type="Debug">

gui_set_loading_session_type Post
gui_continuetime_set

# Close design
if { [gui_sim_state -check active] } {
    gui_sim_terminate
}
gui_close_db -all
gui_expr_clear_all

# Close all windows
gui_close_window -type Console
gui_close_window -type Wave
gui_close_window -type Source
gui_close_window -type Schematic
gui_close_window -type Data
gui_close_window -type DriverLoad
gui_close_window -type List
gui_close_window -type Memory
gui_close_window -type HSPane
gui_close_window -type DLPane
gui_close_window -type Assertion
gui_close_window -type CovHier
gui_close_window -type CoverageTable
gui_close_window -type CoverageMap
gui_close_window -type CovDetail
gui_close_window -type Local
gui_close_window -type Stack
gui_close_window -type Watch
gui_close_window -type Group
gui_close_window -type Transaction



# Application preferences
gui_set_pref_value -key app_default_font -value {Fixed [Misc],9,-1,5,50,0,0,0,0,0}
gui_src_preferences -tabstop 8 -maxbits 24 -windownumber 1
#<WindowLayout>

# DVE top-level session


# Create and position top-level window: TopLevel.2

if {![gui_exist_window -window TopLevel.2]} {
    set TopLevel.2 [ gui_create_window -type TopLevel \
       -icon $::env(DVE)/auxx/gui/images/toolbars/dvewin.xpm] 
} else { 
    set TopLevel.2 TopLevel.2
}
gui_show_window -window ${TopLevel.2} -show_state maximized -rect {{0 60} {1365 767}}

# ToolBar settings
gui_set_toolbar_attributes -toolbar {TimeOperations} -dock_state top
gui_set_toolbar_attributes -toolbar {TimeOperations} -offset 0
gui_show_toolbar -toolbar {TimeOperations}
gui_hide_toolbar -toolbar {&File}
gui_set_toolbar_attributes -toolbar {&Edit} -dock_state top
gui_set_toolbar_attributes -toolbar {&Edit} -offset 0
gui_show_toolbar -toolbar {&Edit}
gui_hide_toolbar -toolbar {CopyPaste}
gui_set_toolbar_attributes -toolbar {&Trace} -dock_state top
gui_set_toolbar_attributes -toolbar {&Trace} -offset 0
gui_show_toolbar -toolbar {&Trace}
gui_hide_toolbar -toolbar {TraceInstance}
gui_hide_toolbar -toolbar {BackTrace}
gui_set_toolbar_attributes -toolbar {&Scope} -dock_state top
gui_set_toolbar_attributes -toolbar {&Scope} -offset 0
gui_show_toolbar -toolbar {&Scope}
gui_set_toolbar_attributes -toolbar {&Window} -dock_state top
gui_set_toolbar_attributes -toolbar {&Window} -offset 0
gui_show_toolbar -toolbar {&Window}
gui_set_toolbar_attributes -toolbar {Signal} -dock_state top
gui_set_toolbar_attributes -toolbar {Signal} -offset 0
gui_show_toolbar -toolbar {Signal}
gui_set_toolbar_attributes -toolbar {Zoom} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom} -offset 0
gui_show_toolbar -toolbar {Zoom}
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -offset 0
gui_show_toolbar -toolbar {Zoom And Pan History}
gui_set_toolbar_attributes -toolbar {Grid} -dock_state top
gui_set_toolbar_attributes -toolbar {Grid} -offset 0
gui_show_toolbar -toolbar {Grid}
gui_set_toolbar_attributes -toolbar {Simulator} -dock_state top
gui_set_toolbar_attributes -toolbar {Simulator} -offset 0
gui_show_toolbar -toolbar {Simulator}
gui_set_toolbar_attributes -toolbar {Interactive Rewind} -dock_state top
gui_set_toolbar_attributes -toolbar {Interactive Rewind} -offset 0
gui_show_toolbar -toolbar {Interactive Rewind}
gui_set_toolbar_attributes -toolbar {Testbench} -dock_state top
gui_set_toolbar_attributes -toolbar {Testbench} -offset 0
gui_show_toolbar -toolbar {Testbench}

# End ToolBar settings

# Docked window settings
gui_sync_global -id ${TopLevel.2} -option true

# MDI window settings
set Wave.1 [gui_create_window -type {Wave}  -parent ${TopLevel.2}]
gui_show_window -window ${Wave.1} -show_state maximized
gui_update_layout -id ${Wave.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 395} {child_wave_right 965} {child_wave_colname 195} {child_wave_colvalue 196} {child_wave_col1 0} {child_wave_col2 1}}

# End MDI window settings

gui_set_env TOPLEVELS::TARGET_FRAME(Source) none
gui_set_env TOPLEVELS::TARGET_FRAME(Schematic) none
gui_set_env TOPLEVELS::TARGET_FRAME(PathSchematic) none
gui_set_env TOPLEVELS::TARGET_FRAME(Wave) none
gui_set_env TOPLEVELS::TARGET_FRAME(List) none
gui_set_env TOPLEVELS::TARGET_FRAME(Memory) none
gui_set_env TOPLEVELS::TARGET_FRAME(DriverLoad) none
gui_update_statusbar_target_frame ${TopLevel.2}

#</WindowLayout>

#<Database>

# DVE Open design session: 

if { [llength [lindex [gui_get_db -design Sim] 0]] == 0 } {
gui_set_env SIMSETUP::SIMARGS {{-ucligui +UVM_TESTNAME=ibex_test_base_test}}
gui_set_env SIMSETUP::SIMEXE {/root/Downloads/part-i/simv}
gui_set_env SIMSETUP::ALLOW_POLL {0}
if { ![gui_is_db_opened -db {/root/Downloads/part-i/simv}] } {
gui_sim_run Ucli -exe simv -args {-ucligui +UVM_TESTNAME=ibex_test_base_test} -dir /root/Downloads/part-i -nosource
}
}
if { ![gui_sim_state -check active] } {error "Simulator did not start correctly" error}
gui_set_precision 1s
gui_set_time_units 1s
#</Database>

# DVE Global setting session: 


# Global: Breakpoints

# Global: Bus

# Global: Expressions

# Global: Signal Time Shift

# Global: Signal Compare

# Global: Signal Groups
gui_load_child_values {ibex_test_testbench.instr_mem_intf}
gui_load_child_values {ibex_test_testbench.data_mem_intf}
gui_load_child_values {ibex_test_testbench.probe_if}


set _session_group_7 data_mem_intf
gui_sg_create "$_session_group_7"
set data_mem_intf "$_session_group_7"

gui_sg_addsignal -group "$_session_group_7" { ibex_test_testbench.data_mem_intf.data_err_i ibex_test_testbench.data_mem_intf.data_rdata_i ibex_test_testbench.data_mem_intf.data_wdata_o ibex_test_testbench.data_mem_intf.data_rvalid_i ibex_test_testbench.data_mem_intf.clk ibex_test_testbench.data_mem_intf.data_addr_o ibex_test_testbench.data_mem_intf.data_gnt_i ibex_test_testbench.data_mem_intf.data_we_o ibex_test_testbench.data_mem_intf.data_be_o ibex_test_testbench.data_mem_intf.data_req_o }

set _session_group_8 instr_mem_intf
gui_sg_create "$_session_group_8"
set instr_mem_intf "$_session_group_8"

gui_sg_addsignal -group "$_session_group_8" { ibex_test_testbench.instr_mem_intf.instr_gnt_i ibex_test_testbench.instr_mem_intf.instr_req_o ibex_test_testbench.instr_mem_intf.instr_addr_o ibex_test_testbench.instr_mem_intf.instr_rdata_i ibex_test_testbench.instr_mem_intf.instr_err_i ibex_test_testbench.instr_mem_intf.instr_rvalid_i ibex_test_testbench.instr_mem_intf.clk ibex_test_testbench.instr_mem_intf.rst_n }

set _session_group_9 probe_if
gui_sg_create "$_session_group_9"
set probe_if "$_session_group_9"

gui_sg_addsignal -group "$_session_group_9" { ibex_test_testbench.probe_if.debug_req ibex_test_testbench.probe_if.core_sleep ibex_test_testbench.probe_if.ecall ibex_test_testbench.probe_if.alert_major ibex_test_testbench.probe_if.clk ibex_test_testbench.probe_if.fetch_enable {ibex_test_testbench.probe_if.$unit} ibex_test_testbench.probe_if.alert_minor }

set _session_group_10 data_mem_intf_1
gui_sg_create "$_session_group_10"
set data_mem_intf_1 "$_session_group_10"

gui_sg_addsignal -group "$_session_group_10" { ibex_test_testbench.data_mem_intf.data_err_i ibex_test_testbench.data_mem_intf.data_rdata_i ibex_test_testbench.data_mem_intf.data_wdata_intg_o ibex_test_testbench.data_mem_intf.data_wdata_o ibex_test_testbench.data_mem_intf.data_rvalid_i ibex_test_testbench.data_mem_intf.data_rdata_intg_i ibex_test_testbench.data_mem_intf.clk ibex_test_testbench.data_mem_intf.data_addr_o ibex_test_testbench.data_mem_intf.data_gnt_i ibex_test_testbench.data_mem_intf.data_we_o ibex_test_testbench.data_mem_intf.data_be_o ibex_test_testbench.data_mem_intf.data_req_o {ibex_test_testbench.data_mem_intf.$unit} }

set _session_group_11 instr_mem_intf_1
gui_sg_create "$_session_group_11"
set instr_mem_intf_1 "$_session_group_11"

gui_sg_addsignal -group "$_session_group_11" { ibex_test_testbench.instr_mem_intf.instr_gnt_i ibex_test_testbench.instr_mem_intf.instr_req_o ibex_test_testbench.instr_mem_intf.instr_addr_o ibex_test_testbench.instr_mem_intf.instr_rdata_i ibex_test_testbench.instr_mem_intf.instr_err_i ibex_test_testbench.instr_mem_intf.instr_rvalid_i ibex_test_testbench.instr_mem_intf.clk ibex_test_testbench.instr_mem_intf.rst_n {ibex_test_testbench.instr_mem_intf.$unit} }

set _session_group_12 probe_if_1
gui_sg_create "$_session_group_12"
set probe_if_1 "$_session_group_12"

gui_sg_addsignal -group "$_session_group_12" { ibex_test_testbench.probe_if.debug_req ibex_test_testbench.probe_if.core_sleep ibex_test_testbench.probe_if.ecall ibex_test_testbench.probe_if.alert_major ibex_test_testbench.probe_if.clk ibex_test_testbench.probe_if.fetch_enable {ibex_test_testbench.probe_if.$unit} ibex_test_testbench.probe_if.alert_minor }

set _session_group_13 data_mem_intf_2
gui_sg_create "$_session_group_13"
set data_mem_intf_2 "$_session_group_13"

gui_sg_addsignal -group "$_session_group_13" { ibex_test_testbench.data_mem_intf.data_err_i ibex_test_testbench.data_mem_intf.data_rdata_i ibex_test_testbench.data_mem_intf.data_wdata_o ibex_test_testbench.data_mem_intf.data_rvalid_i ibex_test_testbench.data_mem_intf.clk ibex_test_testbench.data_mem_intf.data_addr_o ibex_test_testbench.data_mem_intf.data_gnt_i ibex_test_testbench.data_mem_intf.data_we_o ibex_test_testbench.data_mem_intf.data_be_o ibex_test_testbench.data_mem_intf.data_req_o {ibex_test_testbench.data_mem_intf.$unit} }

set _session_group_14 instr_mem_intf_2
gui_sg_create "$_session_group_14"
set instr_mem_intf_2 "$_session_group_14"

gui_sg_addsignal -group "$_session_group_14" { ibex_test_testbench.instr_mem_intf.instr_gnt_i ibex_test_testbench.instr_mem_intf.instr_req_o ibex_test_testbench.instr_mem_intf.instr_addr_o ibex_test_testbench.instr_mem_intf.instr_rdata_i ibex_test_testbench.instr_mem_intf.instr_err_i ibex_test_testbench.instr_mem_intf.instr_rvalid_i ibex_test_testbench.instr_mem_intf.clk ibex_test_testbench.instr_mem_intf.rst_n }

set _session_group_15 probe_if_2
gui_sg_create "$_session_group_15"
set probe_if_2 "$_session_group_15"

gui_sg_addsignal -group "$_session_group_15" { ibex_test_testbench.probe_if.debug_req ibex_test_testbench.probe_if.core_sleep ibex_test_testbench.probe_if.ecall ibex_test_testbench.probe_if.alert_major ibex_test_testbench.probe_if.clk ibex_test_testbench.probe_if.fetch_enable ibex_test_testbench.probe_if.alert_minor }

# Global: Highlighting

# Global: Stack
gui_change_stack_mode -mode tree

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 28



# Save global setting...

# Wave/List view global setting
gui_cov_show_value -switch false

# Close all empty TopLevel windows
foreach __top [gui_ekki_get_window_ids -type TopLevel] {
    if { [llength [gui_ekki_get_window_ids -parent $__top]] == 0} {
        gui_close_window -window $__top
    }
}
gui_set_loading_session_type noSession
# DVE View/pane content session: 


# View 'Wave.1'
gui_wv_sync -id ${Wave.1} -switch false
set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_marker_create -id ${Wave.1} M1 15
gui_marker_create -id ${Wave.1} M2 35
gui_marker_create -id ${Wave.1} M3 46
gui_marker_select -id ${Wave.1} {  M3 }
gui_marker_set_ref -id ${Wave.1}  C1
gui_wv_zoom_timerange -id ${Wave.1} 0 87
gui_list_add_group -id ${Wave.1} -after {New Group} {data_mem_intf_2}
gui_list_add_group -id ${Wave.1} -after {New Group} {instr_mem_intf_2}
gui_list_add_group -id ${Wave.1} -after {New Group} {probe_if_2}
gui_list_select -id ${Wave.1} {ibex_test_testbench.instr_mem_intf.instr_rvalid_i }
gui_seek_criteria -id ${Wave.1} {Any Edge}



gui_set_env TOGGLE::DEFAULT_WAVE_WINDOW ${Wave.1}
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
gui_list_set_insertion_bar  -id ${Wave.1} -group probe_if_2  -position in

gui_marker_move -id ${Wave.1} {C1} 28
gui_view_scroll -id ${Wave.1} -vertical -set 245
gui_show_grid -id ${Wave.1} -enable false
# Restore toplevel window zorder
# The toplevel window could be closed if it has no view/pane
if {[gui_exist_window -window ${TopLevel.2}]} {
	gui_set_active_window -window ${TopLevel.2}
	gui_set_active_window -window ${Wave.1}
}
#</Session>

