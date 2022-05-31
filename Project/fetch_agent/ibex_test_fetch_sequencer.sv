class ibex_test_fetch_sequencer extends uvm_sequencer #(ibex_test_fetch_seq_item);

  // TLM port to peek the address phase from the response monitor
  uvm_tlm_analysis_fifo #(ibex_test_fetch_seq_item) request_fifo; 

  `uvm_component_utils(ibex_test_fetch_sequencer)

  function new(string name = "ibex_test_fetch_sequencer", uvm_component parent = null);
    super.new(name, parent);
    request_fifo = new("request_fifo", this);
  endfunction : new

endclass : ibex_test_fetch_sequencer
