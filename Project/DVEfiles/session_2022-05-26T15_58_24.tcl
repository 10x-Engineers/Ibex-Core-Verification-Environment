# Begin_DVE_Session_Save_Info
# DVE full session
# Saved on Thu May 26 15:58:24 2022
# Designs open: 1
#   Sim: /root/Downloads/part-i/simv
# Toplevel windows open: 1
# 	TopLevel.1
#   Source.1: 
#   Source.2: uvm_pkg.\uvm_root::run_test 
#   Schematic.1: ok
#   Schematic.2: ok
#   Source.3: uvm_pkg
#   Group count = 4
#   Group data_mem_intf signal count = 13
#   Group instr_mem_intf signal count = 9
#   Group probe_if signal count = 8
#   Group uvm_pkg signal count = 55
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


# Create and position top-level window: TopLevel.1

if {![gui_exist_window -window TopLevel.1]} {
    set TopLevel.1 [ gui_create_window -type TopLevel \
       -icon $::env(DVE)/auxx/gui/images/toolbars/dvewin.xpm] 
} else { 
    set TopLevel.1 TopLevel.1
}
gui_show_window -window ${TopLevel.1} -show_state normal -rect {{6 77} {1311 764}}

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
set HSPane.1 [gui_create_window -type HSPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 173]
catch { set Hier.1 [gui_share_window -id ${HSPane.1} -type Hier] }
catch { set Stack.1 [gui_share_window -id ${HSPane.1} -type Stack -silent] }
catch { set Class.1 [gui_share_window -id ${HSPane.1} -type Class -silent] }
catch { set Object.1 [gui_share_window -id ${HSPane.1} -type Object -silent] }
gui_set_window_pref_key -window ${HSPane.1} -key dock_width -value_type integer -value 173
gui_set_window_pref_key -window ${HSPane.1} -key dock_height -value_type integer -value 260
gui_set_window_pref_key -window ${HSPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${HSPane.1} {{left 0} {top 0} {width 172} {height 414} {dock_state left} {dock_on_new_line true} {child_hier_colhier 199} {child_hier_coltype 30} {child_hier_colpd 0} {child_hier_col1 0} {child_hier_col2 1} {child_hier_col3 -1}}
set DLPane.1 [gui_create_window -type DLPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 173]
catch { set Data.1 [gui_share_window -id ${DLPane.1} -type Data] }
catch { set Local.1 [gui_share_window -id ${DLPane.1} -type Local -silent] }
catch { set Member.1 [gui_share_window -id ${DLPane.1} -type Member -silent] }
gui_set_window_pref_key -window ${DLPane.1} -key dock_width -value_type integer -value 173
gui_set_window_pref_key -window ${DLPane.1} -key dock_height -value_type integer -value 260
gui_set_window_pref_key -window ${DLPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${DLPane.1} {{left 0} {top 0} {width 172} {height 414} {dock_state left} {dock_on_new_line true} {child_data_colvariable 134} {child_data_colvalue 12} {child_data_coltype 19} {child_data_col1 0} {child_data_col2 1} {child_data_col3 2}}
set Console.1 [gui_create_window -type Console -parent ${TopLevel.1} -dock_state bottom -dock_on_new_line true -dock_extent 178]
gui_set_window_pref_key -window ${Console.1} -key dock_width -value_type integer -value 689
gui_set_window_pref_key -window ${Console.1} -key dock_height -value_type integer -value 178
gui_set_window_pref_key -window ${Console.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${Console.1} {{left 0} {top 0} {width 1305} {height 177} {dock_state bottom} {dock_on_new_line true}}
#### Start - Readjusting docked view's offset / size
set dockAreaList { top left right bottom }
foreach dockArea $dockAreaList {
  set viewList [gui_ekki_get_window_ids -active_parent -dock_area $dockArea]
  foreach view $viewList {
      if {[lsearch -exact [gui_get_window_pref_keys -window $view] dock_width] != -1} {
        set dockWidth [gui_get_window_pref_value -window $view -key dock_width]
        set dockHeight [gui_get_window_pref_value -window $view -key dock_height]
        set offset [gui_get_window_pref_value -window $view -key dock_offset]
        if { [string equal "top" $dockArea] || [string equal "bottom" $dockArea]} {
          gui_set_window_attributes -window $view -dock_offset $offset -width $dockWidth
        } else {
          gui_set_window_attributes -window $view -dock_offset $offset -height $dockHeight
        }
      }
  }
}
#### End - Readjusting docked view's offset / size
gui_sync_global -id ${TopLevel.1} -option true

# MDI window settings
set Source.1 [gui_create_window -type {Source}  -parent ${TopLevel.1}]
gui_show_window -window ${Source.1} -show_state maximized
gui_update_layout -id ${Source.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false}}
set Source.2 [gui_create_window -type {Source}  -parent ${TopLevel.1}]
gui_show_window -window ${Source.2} -show_state maximized
gui_update_layout -id ${Source.2} {{show_state maximized} {dock_state undocked} {dock_on_new_line false}}
gui_use_schematics
set Schematic.1 [gui_create_window -type {Schematic}  -parent ${TopLevel.1} -defer_create_taskbar_icon]
set setting [::Misc::Setting::create -array DveSchematicSettings]
Misc::init_window $setting ${Schematic.1}
::Misc::exec_method -window ${Schematic.1} -method captionCmd
gui_add_icon_to_taskbar -window ${Schematic.1}
gui_show_window -window ${Schematic.1} -show_state maximized
gui_update_layout -id ${Schematic.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false}}
set Schematic.2 [gui_create_window -type {Schematic}  -parent ${TopLevel.1} -defer_create_taskbar_icon]
set setting [::Misc::Setting::create -array DvePathSchematicSettings]
Misc::init_window $setting ${Schematic.2}
::Misc::exec_method -window ${Schematic.2} -method captionCmd
gui_add_icon_to_taskbar -window ${Schematic.2}
gui_show_window -window ${Schematic.2} -show_state maximized
gui_update_layout -id ${Schematic.2} {{show_state maximized} {dock_state undocked} {dock_on_new_line false}}
set Source.3 [gui_create_window -type {Source}  -parent ${TopLevel.1}]
gui_show_window -window ${Source.3} -show_state maximized
gui_update_layout -id ${Source.3} {{show_state maximized} {dock_state undocked} {dock_on_new_line false}}

# End MDI window settings

gui_set_env TOPLEVELS::TARGET_FRAME(Source) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(Schematic) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(PathSchematic) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(Wave) none
gui_set_env TOPLEVELS::TARGET_FRAME(List) none
gui_set_env TOPLEVELS::TARGET_FRAME(Memory) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(DriverLoad) none
gui_update_statusbar_target_frame ${TopLevel.1}

#</WindowLayout>

#<Database>

# DVE Open design session: 

if { [llength [lindex [gui_get_db -design Sim] 0]] == 0 } {
gui_set_env SIMSETUP::SIMARGS {+UVM_TESTNAME=ibex_test_base_test}
gui_set_env SIMSETUP::SIMEXE {./simv}
gui_set_env SIMSETUP::ALLOW_POLL {0}
if { ![gui_is_db_opened -db {/root/Downloads/part-i/simv}] } {
gui_sim_run Ucli -exe simv -args { +UVM_TESTNAME=ibex_test_base_test -ucligui} -dir /root/Downloads/part-i -nosource
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
gui_load_child_values {uvm_pkg}


set _session_group_1 data_mem_intf
gui_sg_create "$_session_group_1"
set data_mem_intf "$_session_group_1"

gui_sg_addsignal -group "$_session_group_1" { ibex_test_testbench.data_mem_intf.data_err_i ibex_test_testbench.data_mem_intf.data_rdata_i ibex_test_testbench.data_mem_intf.data_wdata_intg_o ibex_test_testbench.data_mem_intf.data_wdata_o ibex_test_testbench.data_mem_intf.data_rvalid_i ibex_test_testbench.data_mem_intf.data_rdata_intg_i ibex_test_testbench.data_mem_intf.clk ibex_test_testbench.data_mem_intf.data_addr_o ibex_test_testbench.data_mem_intf.data_gnt_i ibex_test_testbench.data_mem_intf.data_we_o ibex_test_testbench.data_mem_intf.data_be_o ibex_test_testbench.data_mem_intf.data_req_o {ibex_test_testbench.data_mem_intf.$unit} }

set _session_group_2 instr_mem_intf
gui_sg_create "$_session_group_2"
set instr_mem_intf "$_session_group_2"

gui_sg_addsignal -group "$_session_group_2" { ibex_test_testbench.instr_mem_intf.instr_gnt_i ibex_test_testbench.instr_mem_intf.instr_req_o ibex_test_testbench.instr_mem_intf.instr_addr_o ibex_test_testbench.instr_mem_intf.instr_rdata_i ibex_test_testbench.instr_mem_intf.instr_err_i ibex_test_testbench.instr_mem_intf.instr_rvalid_i ibex_test_testbench.instr_mem_intf.clk ibex_test_testbench.instr_mem_intf.rst_n {ibex_test_testbench.instr_mem_intf.$unit} }

set _session_group_3 probe_if
gui_sg_create "$_session_group_3"
set probe_if "$_session_group_3"

gui_sg_addsignal -group "$_session_group_3" { ibex_test_testbench.probe_if.debug_req ibex_test_testbench.probe_if.core_sleep ibex_test_testbench.probe_if.ecall ibex_test_testbench.probe_if.alert_major ibex_test_testbench.probe_if.clk ibex_test_testbench.probe_if.fetch_enable {ibex_test_testbench.probe_if.$unit} ibex_test_testbench.probe_if.alert_minor }

set _session_group_4 uvm_pkg
gui_sg_create "$_session_group_4"
set uvm_pkg "$_session_group_4"

gui_sg_addsignal -group "$_session_group_4" { {uvm_pkg.\uvm_reg_map::do_write .unnamed$$_0.unnamed$$_1} {uvm_pkg.\uvm_reg_map::do_read .unnamed$$_0.unnamed$$_1} {uvm_pkg.\uvm_component_name_check_visitor::visit .unnamed$$_0} uvm_pkg.UVM_NUM_LINES uvm_pkg.UVM_START_FUNCS uvm_pkg.uvm_nv_copyright uvm_pkg.UVM_END_DATA_EXTRA uvm_pkg.UVM_COPY uvm_pkg.UVM_LINE_WIDTH uvm_pkg.UVM_RADIX uvm_pkg.UVM_STDOUT uvm_pkg.UVM_MACRO_EXTRAS uvm_pkg.uvm_snps_copyright uvm_pkg.UVM_PHYSICAL uvm_pkg.UVM_FLAGS_ON uvm_pkg.uvm_aa_string_key uvm_pkg.UVM_NOPRINT uvm_pkg.uvm_start_uvm_declarations uvm_pkg.uvm_cy_copyright uvm_pkg.UVM_SETSTR uvm_pkg.UVM_RECORD uvm_pkg.UVM_NODEFPRINT uvm_pkg.UVM_UNPACK uvm_pkg.UVM_END_FUNCS uvm_pkg.UVM_SMALL_STRING uvm_pkg.UVM_DEFAULT uvm_pkg.UVM_READONLY uvm_pkg.UVM_SETOBJ uvm_pkg.UVM_NOPACK uvm_pkg.s_spaces uvm_pkg.UVM_NORECORD uvm_pkg.UVM_SETINT uvm_pkg.UVM_UNBOUNDED_CONNECTIONS uvm_pkg.UVM_PRINT uvm_pkg.UVM_FLAGS_OFF uvm_pkg.UVM_ABSTRACT uvm_pkg.UVM_NOCOMPARE uvm_pkg.UVM_FLAGS uvm_pkg.UVM_NOCOPY uvm_pkg.UVM_COMPARE uvm_pkg.UVM_ALL_ON uvm_pkg.uvm_cdn_copyright uvm_pkg.UVM_HDL_MAX_WIDTH uvm_pkg.UVM_LARGE_STRING uvm_pkg.uvm_global_random_seed uvm_pkg.UVM_STR_CRC_POLYNOMIAL uvm_pkg.UVM_PACK uvm_pkg.s_connection_error_id uvm_pkg.uvm_revision uvm_pkg.UVM_CHECK_FIELDS uvm_pkg.s_connection_warning_id uvm_pkg.UVM_STREAMBITS uvm_pkg.UVM_MACRO_NUMFLAGS uvm_pkg.uvm_mgc_copyright uvm_pkg.UVM_SET }
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_NUM_LINES}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_NUM_LINES}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_START_FUNCS}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_START_FUNCS}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_END_DATA_EXTRA}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_END_DATA_EXTRA}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_COPY}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_COPY}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_LINE_WIDTH}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_LINE_WIDTH}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_RADIX}
gui_set_radix -radix {unsigned} -signals {Sim:uvm_pkg.UVM_RADIX}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_STDOUT}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_STDOUT}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_MACRO_EXTRAS}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_MACRO_EXTRAS}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_PHYSICAL}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_PHYSICAL}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_FLAGS_ON}
gui_set_radix -radix {unsigned} -signals {Sim:uvm_pkg.UVM_FLAGS_ON}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_NOPRINT}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_NOPRINT}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_SETSTR}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_SETSTR}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_RECORD}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_RECORD}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_NODEFPRINT}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_NODEFPRINT}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_UNPACK}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_UNPACK}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_END_FUNCS}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_END_FUNCS}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_SMALL_STRING}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_SMALL_STRING}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_DEFAULT}
gui_set_radix -radix {unsigned} -signals {Sim:uvm_pkg.UVM_DEFAULT}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_READONLY}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_READONLY}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_SETOBJ}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_SETOBJ}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_NOPACK}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_NOPACK}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_NORECORD}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_NORECORD}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_SETINT}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_SETINT}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_PRINT}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_PRINT}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_FLAGS_OFF}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_FLAGS_OFF}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_ABSTRACT}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_ABSTRACT}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_NOCOMPARE}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_NOCOMPARE}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_FLAGS}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_FLAGS}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_NOCOPY}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_NOCOPY}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_COMPARE}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_COMPARE}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_ALL_ON}
gui_set_radix -radix {unsigned} -signals {Sim:uvm_pkg.UVM_ALL_ON}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_HDL_MAX_WIDTH}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_HDL_MAX_WIDTH}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_LARGE_STRING}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_LARGE_STRING}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_STR_CRC_POLYNOMIAL}
gui_set_radix -radix {unsigned} -signals {Sim:uvm_pkg.UVM_STR_CRC_POLYNOMIAL}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_PACK}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_PACK}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_CHECK_FIELDS}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_CHECK_FIELDS}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_STREAMBITS}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_STREAMBITS}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_MACRO_NUMFLAGS}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_MACRO_NUMFLAGS}
gui_set_radix -radix {decimal} -signals {Sim:uvm_pkg.UVM_SET}
gui_set_radix -radix {twosComplement} -signals {Sim:uvm_pkg.UVM_SET}

# Global: Highlighting

# Global: Stack
gui_change_stack_mode -mode tree

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 685



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


# Hier 'Hier.1'
gui_show_window -window ${Hier.1}
gui_list_set_filter -id ${Hier.1} -list { {Package 1} {All 0} {Process 1} {VirtPowSwitch 0} {UnnamedProcess 1} {UDP 0} {Function 1} {Block 1} {SrsnAndSpaCell 0} {OVA Unit 1} {LeafScCell 1} {LeafVlgCell 1} {Interface 1} {LeafVhdCell 1} {$unit 1} {NamedBlock 1} {Task 1} {VlgPackage 1} {ClassDef 1} {VirtIsoCell 0} }
gui_list_set_filter -id ${Hier.1} -text {*}
gui_hier_list_init -id ${Hier.1}
gui_change_design -id ${Hier.1} -design Sim
catch {gui_list_expand -id ${Hier.1} ibex_test_testbench}
catch {gui_list_select -id ${Hier.1} {ibex_test_testbench.data_mem_intf}}
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Class 'Class.1'
gui_list_set_filter -id ${Class.1} -list { {OVM 1} {VMM 1} {All 1} {Object 1} {UVM 1} {RVM 1} }
gui_list_set_filter -id ${Class.1} -text {*}
gui_change_design -id ${Class.1} -design Sim
# Warning: Class view not found.

# Member 'Member.1'
gui_list_set_filter -id ${Member.1} -list { {InternalMember 0} {RandMember 1} {All 0} {BaseMember 0} {PrivateMember 1} {LibBaseMember 0} {AutomaticMember 1} {VirtualMember 1} {PublicMember 1} {ProtectedMember 1} {OverRiddenMember 0} {InterfaceClassMember 1} {StaticMember 1} }
gui_list_set_filter -id ${Member.1} -text {*}

# Data 'Data.1'
gui_list_set_filter -id ${Data.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {LowPower 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Data.1} -text {*}
gui_list_show_data -id ${Data.1} {ibex_test_testbench.probe_if}
gui_view_scroll -id ${Data.1} -vertical -set 0
gui_view_scroll -id ${Data.1} -horizontal -set 0
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Source 'Source.1'
gui_src_value_annotate -id ${Source.1} -switch false
gui_set_env TOGGLE::VALUEANNOTATE 0
gui_view_scroll -id ${Source.1} -vertical -set 0
gui_src_set_reusable -id ${Source.1}

# Source 'Source.2'
gui_src_value_annotate -id ${Source.2} -switch false
gui_set_env TOGGLE::VALUEANNOTATE 0
gui_open_source -id ${Source.2}  -replace -active {uvm_pkg.\uvm_root::run_test } /usr/synopsys/vcs-L-2016.06//etc/uvm-1.2/base/uvm_root.svh
gui_view_scroll -id ${Source.2} -vertical -set 3392
gui_src_set_reusable -id ${Source.2} -disable

# View 'Schematic.1'
gui_use_schematics



# View 'Schematic.2'
gui_use_schematics

# Create path schematic window 'Schematic.2'
gui_show_pin_value_annotate [gui_window_hier_name -window ${Schematic.2}]
gui_zoom -window ${Schematic.2} -rect { {-18630 -4151} {28579 14150} }



# Source 'Source.3'
gui_src_value_annotate -id ${Source.3} -switch false
gui_set_env TOGGLE::VALUEANNOTATE 0
gui_open_source -id ${Source.3}  -replace -active uvm_pkg /usr/synopsys/vcs-L-2016.06//etc/uvm-1.2/uvm_pkg.sv
gui_view_scroll -id ${Source.3} -vertical -set 368
gui_src_set_reusable -id ${Source.3} -disable
# Restore toplevel window zorder
# The toplevel window could be closed if it has no view/pane
if {[gui_exist_window -window ${TopLevel.1}]} {
	gui_set_active_window -window ${TopLevel.1}
	gui_set_active_window -window ${Source.3}
	gui_set_active_window -window ${HSPane.1}
}
#</Session>

