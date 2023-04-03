############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_array_reshape -type complete -dim 1 "fir" c
set_directive_array_reshape -type complete -dim 1 "fir" shift_reg
set_directive_top -name fir "fir"
set_directive_pipeline "fir"
