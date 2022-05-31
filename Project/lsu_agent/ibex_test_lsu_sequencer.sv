class ibex_test_lsu_sequencer extends uvm_sequencer #(ibex_test_lsu_seq_item); 

  // TLM port to peek the address phase from the response monitor
  uvm_tlm_analysis_fifo #(ibex_test_lsu_seq_item) addr_ph_port;

  `uvm_component_utils(ibex_test_lsu_sequencer)

  function new (string name = "ibex_test_lsu_sequencer", uvm_component parent);
    super.new(name, parent);
    addr_ph_port = new("addr_ph_port", this);
  endfunction : new

endclass : ibex_test_lsu_sequencer
