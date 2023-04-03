############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project fir128_best
set_top fir
add_files fir128_best/fir.cpp
add_files fir128_best/fir.h
add_files fir128_best/input.dat
add_files fir128_best/out.gold.dat
add_files -tb fir128_best/fir_test.cpp
open_solution "coef_int" -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default
source "./fir128_best/coef_int/directives.tcl"
csim_design
csynth_design
cosim_design -trace_level all
export_design -format ip_catalog
