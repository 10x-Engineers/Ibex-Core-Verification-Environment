# Ibex-Core-Verification-Environment

**Introduction**

Ibex is an Open Source 32-bit RISC-V CPU Core which is heavily parameterized and well suited for embedded control applications. The Ibex Core also supports IEMCB extensions which are Integer (I), Embedded (E), Integer Multiplication and Division (M), Compressed (C), and Bit Manipulation (B) extensions.
Ibex offers several configuration parameters to meet the needs of various application scenarios. The options include different choices for the architecture of the multiplier unit, as well as a range of performance and security features. 
Ibex is designed to be 2 Stage pipelined.
First stage is the Instruction fetch stage which fetches instructions via prefetch buffer, capable of fetching 1 instruction per cycle from the external memory.
Second is the Decode and Execution stage. 
So, All instructions require two minimum cycles to complete. For any instruction that takes more than one cycle to complete, the core will stall until the instruction is complete. Following picture is the Ibex core detailed view.

Reference: LowRISC (Github)

**Instructions and Data Memory**

Understanding how the system works is the primary step for verification of any SoC. The Ibex Core is designed to perform like any other core i.e process instructions but 2 main components, data memory and instruction memory, are located externally from the core. As seen from the figure above, Instruction memory (outside core) is connected to the prefetch buffer which is located inside the Core. Similar case is with the Load Store Unit (LSU) and, as shown, it is connected to data memory which is also connected outside the core. The core follows a certain protocol and the verification environment needs to follow that protocol. Data memory and instruction memory may be external but are a unified memory structure. A verification environment follows the said protocol and connects the external memory with the core. It performs read and write operations respective to the core request. Diagram below shows a clearer picture of how each component is connected.


**Unified Memory Structure**

Memory Model and Parameters
The external Memory Model attached with the Fetch and LSU agent is cloned from LowRisc OpenTitan Repository and can be found here. To be precise, it is located in the vendor/lowrisc_ip/dv/sv/mem_model directory. The UVM test instance (derived from uvm_test) instantiates a single instance of this memory model that loads the compiled assembly test program into the memory at the beginning of each test. This acts as a unified instruction/data memory that serves all requests from the memory interface agents.
The DUT (Ibex core) is simplified and does not include a Random Instruction Generator, Spike and Trace log comparator. Parameters are the same as provided by the document. These are as follows :

        parameter bit PMPEnable = 1'b0;
       
        parameter int unsigned PMPGranularity = 0;
        
        parameter int unsigned PMPNumRegions  = 4;
        
        parameter bit RV32E = 1'b0;
        
        parameter ibex_pkg::rv32m_e RV32M = `IBEX_CFG_RV32M;
        
        parameter ibex_pkg::rv32b_e RV32B = `IBEX_CFG_RV32B;
        
        parameter ibex_pkg::regfile_e RegFile = `IBEX_CFG_RegFile;
        
        parameter bit BranchTargetALU = 1'b0;
        
        parameter bit WritebackStage = 1'b0;
        
        parameter bit ICache = 0;
        
        parameter bit ICacheECC = 0;
        
        parameter bit BranchPredictor = 1'b0;
        
        parameter bit DbgTriggerEn = 1'b0;
        
        parameter bit SecureIbex = 1'b0;
        
        parameter bit DmHaltAddr = 1'b0;

Specific values are also provided to the interface which are as follows:

        test_en_i     1’b0

        scan_rst_ni   1’b1

        ram_cfg_i     0’b0

        hart_id_i     32’b0

        boot_addr_i   32’h8000_0000

        Irq (Interrupt Inputs) (all interrupts unconnected)

        crash_dump_o  0

A clear picture of the interface signals are shown below.

**UVM Verification Environment**

Our verification environment is designed to create an interface between external memory and the core. The major part of project consists of a UVM Verification Component, also known as UVC which acts as a slave module to the Ibex processor core. The core and memory work as master and slave. The memory slave serves the core with responses against the memory access request generated and shared over a common interface. Following figure is the visual representation of how the UVC is constructed. It is also shown how a UVC is connected to the core. The verification architecture consists of Top Module, Test class, environment class and 2 UVCs.

Top Module (Testbench) instantiates the connections between the DUT and Core. It also initializes the verification process by running the UVM Test class and configures the interfaces to the database to be used by the Driver and Monitor class of both agents. Coming towards the Test class, we store our instructions in the memory model here. We also give the signal to start the core which starts giving requests to our UVC. Furthermore, we also start our sequence classes from here of both fetch and lsu agents. Test class basically controls the whole system. It also instantiates the environment class respectively. 
Coming towards UVCs, there are 2 agents in our Environment. The agents are connected to the interface which are connected to the core. These interfaces are instruction memory interface, and data memory interface. The instruction memory interface conveys the instructions to be executed. Therefore, only load type requests are generated (Loading the Instruction from memory). On the other hand, the data memory interface lets through both load and store type of requests to be handled by our UVC. Therefore the protocol implementation for both of these are slightly different from each other in order to tailor to their specific needs. However the implemented protocol complies the standard and does not violate it in any case. Following figures show example of the protocols to follow while implementing and serving slave sequences.


Reference: Basic Memory Transaction (docs)


The core raises the request signal high with all the accompanying stimuli (address of concern, data to read/write, read/write operation or other configurations etc.) and keeps waiting for the grant signal from slave module  which in this case, is our UVC to provide a one cycle grant high followed by a one cycle long valid signal along with valid data. If for some reason there is no data on that specific address, we drive the error signal to the core. The same protocol applies to store instructions as well but the only difference is that there is no read data but only valid high when the data is successfully stored. 
For back to back transactions, the grant signal can immediately be served if possible, but the actual response is to be served in the coming cycle. The response is served by asserting the valid signal regardless of if it is a read or write type request. If it was a read type, a valid data would accompany the valid HIGH, otherwise it is a don't care. The valid HIGH can be deasserted in the coming cycle. It should remain high for exactly one cycle for the core to read the response. The grant signal can be deasserted in the cycle following it was raised to HIGH, or kept further high based on further service. The protocol is the same for both the interface although Fetch Interface Agent has less pins to monitor and drive upon. 
Agents
The verification environment is designed with only active agents meaning both UVCs will contain driver class along with monitor class. The core starts executing instructions from the boot address after loading the instructions from the external memory. When an ecall instruction is encountered by the core, the environment detects it respectively and disables the core which prevents it from making any more requests. And finally, a tracelog is created by the core. The log contains all the instructions which are processed by the core since the start of the test.

**Interfaces**

Interfaces provide a way of communication between the UVC and DUT for any design. The DUT signals define how the interface is to be designed. There are 2 interfaces which correspond to our design.
  1)  Memory interface (Which provides the communication between the Core and the Memory) Interface to monitor memory requests and drive the signals
        - Fetch Interface Agent (Accesses Instruction Memory to fetch the next Instructions)
        - Load/Store Unit Interface Agent (Accesses the Data Memory for Load Store Instructions)
  2)  DUT probe interface 
        - Interface to probe DUT internal signals (Special Core Signals)

**How To Run**

There is make file which contains the following commands. Simply type "make <anyone of the commands below>
  
The required software to run these commands is VCS Synopsys Tool 2016 verison or above.


        run:
	        vcs -ntb_opts uvm-1.2 -sverilog -f flist -LDFLAGS -full64 -debug_all +lint=TFIPC-L
        sim:
	        ./simv +UVM_TESTNAME=ibex_test_base_test +UVM_VERBOSITY=UVM_DEBUG -timescale 1ns/1ns
        clean:
	        rm -rf csrc simv.daidir simv tr_db.log ucli.key vc_hdrs.h
        clear:
	        clear
        gui:
	        ./simv +UVM_TESTNAME=ibex_test_base_test -gui &
  
        covg:
	        vcs -ntb_opts uvm-1.2 -sverilog tb/testbench.sv -o out -cm line+cond+fsm+tgl+assert -LDFLAGS -Wl,--no-as-needed -full64 -debug_all
	        ./out -cm line+cond+fsm+tgl+assert +UVM_TIMEOUT=1000000
	        dve -covdir out.vdb/ &

        rebuild: clear clean run

        resim: rebuild sim

        regui: rebuild gui

        cnc: clean clear




