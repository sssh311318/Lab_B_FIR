############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project fir128_Q5
set_top fir
add_files fir128_Q5/fir.cpp
add_files fir128_Q5/fir.h
add_files fir128_Q5/input.dat
add_files fir128_Q5/out.gold.dat
add_files -tb fir128_Q5/fir_test.cpp
open_solution "origin" -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default
source "./fir128_Q5/origin/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
