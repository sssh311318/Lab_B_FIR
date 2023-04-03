############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project fir128_Q1
set_top fir
add_files fir128_Q1/out.gold.dat
add_files fir128_Q1/input.dat
add_files fir128_Q1/fir.h
add_files fir128_Q1/fir.cpp
add_files -tb fir128_Q1/fir_test.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "16bit" -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default
source "./fir128_Q1/16bit/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
