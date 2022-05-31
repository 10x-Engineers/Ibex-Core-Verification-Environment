# DVE Simulation Rebuild/Restart Options
# Saved on Thu May 12 17:40:25 2022
set SIMSETUP::REBUILDOPTION 1
set SIMSETUP::REBUILDCMD {rm -rf csrc simv.daidir simv tr_db.log ucli.key vc_hdrs.h  vcs -ntb_opts uvm-1.2 -sverilog -f flist -LDFLAGS -full64 -debug_all +lint=TFIPC-L}
set SIMSETUP::REBUILDDIR {}
set SIMSETUP::RESTOREBP 1
set SIMSETUP::RESTOREDUMP 1
set SIMSETUP::RESTOREFORCE 1
set SIMSETUP::RESTORESPECMAN 0
