#!/bin/sh

set -e

yosys -p "synth_ice40 -blif main.blif" main.sv
arachne-pnr -d 8k -P cm81 -p main.pcf main.blif -o main.asc
icepack main.asc main.bin
tinyfpgab --program main.bin
