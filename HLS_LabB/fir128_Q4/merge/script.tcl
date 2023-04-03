############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project fir128_Q4
set_top fir
add_files fir128_Q4/out.gold.dat
add_files fir128_Q4/input.dat
add_files fir128_Q4/fir.h
add_files fir128_Q4/fir.cpp
add_files -tb fir128_Q4/fir_test.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "merge" -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default
source "./fir128_Q4/merge/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
