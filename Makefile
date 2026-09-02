PYTHON ?= python3
VLOGAN ?= vlogan
VHDLAN ?= vhdlan
VCS ?= vcs

BUILD_DIR := build
SIMV := $(BUILD_DIR)/simv
INPUT ?= tb/vectors/default.txt
OUTPUT ?= $(BUILD_DIR)/ciphertext.txt

SV_RTL := \
	rtl/systemverilog/aes_128.sv \
	rtl/systemverilog/ced_controller.sv \
	rtl/systemverilog/alpha.sv \
	rtl/systemverilog/inv_alpha.sv \
	rtl/systemverilog/fault_injector.sv \
	rtl/systemverilog/flat_deflat.sv \
	rtl/systemverilog/sbox.sv

VHDL_RTL := \
	rtl/vhdl/aes128Pkg.vhd \
	rtl/vhdl/keyXor_128.vhd \
	rtl/vhdl/sbox_128.vhd \
	rtl/vhdl/shiftRow_128.vhd \
	rtl/vhdl/mixColumn.vhd \
	rtl/vhdl/mixColumn_128.vhd \
	rtl/vhdl/keyExpansion.vhd

TB := tb/aes_128_tb.sv

.PHONY: prepare compile run clean

prepare:
	VHDLAN=$(VHDLAN) $(PYTHON) scripts/setup_vcs.py

compile: prepare
	$(VLOGAN) -full64 -sverilog $(SV_RTL) $(TB) -l $(BUILD_DIR)/vlogan.log
	$(VHDLAN) -full64 $(VHDL_RTL) -l $(BUILD_DIR)/vhdlan.log
	$(VCS) -full64 aes_128_tb -debug_access+all -Mdir=$(BUILD_DIR)/csrc -o $(SIMV) -l $(BUILD_DIR)/vcs.log

run: compile
	$(SIMV) +INPUT=$(INPUT) +OUTPUT=$(OUTPUT) -l $(BUILD_DIR)/simulation.log

clean:
	$(PYTHON) scripts/clean.py
