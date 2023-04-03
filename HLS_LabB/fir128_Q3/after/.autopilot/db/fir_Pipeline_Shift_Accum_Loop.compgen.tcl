# This script segment is generated automatically by AutoPilot

set id 1
set name fir_mac_muladd_5s_8s_19s_19_4_1
set corename simcore_mac
set op mac
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 5
set in0_signed 1
set in1_width 8
set in1_signed 1
set in2_width 19
set in2_signed 1
set ce_width 1
set ce_signed 0
set out_width 19
set arg_lists {i0 {5 1 +} i1 {8 1 +} m {13 1 +} i2 {19 1 +} p {19 1 +} c_reg {1} rnd {0} acc {0} }
set TrueReset 0
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {all} IMPL {dsp48} LATENCY 3 ALLOW_PRAGMA 1
}


set op mac
set corename DSP48
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_dsp48] == "::AESL_LIB_VIRTEX::xil_gen_dsp48"} {
eval "::AESL_LIB_VIRTEX::xil_gen_dsp48 { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    true_reset ${TrueReset} \
    stage_num ${stage_num} \
    clk_width ${clk_width} \
    clk_signed ${clk_signed} \
    reset_width ${reset_width} \
    reset_signed ${reset_signed} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    in2_width ${in2_width} \
    in2_signed ${in2_signed} \
    ce_width ${ce_width} \
    ce_signed ${ce_signed} \
    out_width ${out_width} \
    arg_lists {${arg_lists}} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_dsp48, check your platform lib"
}
}


# Memory (RAM/ROM)  definition:
set ID 3
set hasByteEnable 0
set MemName fir_fir_Pipeline_Shift_Accum_Loop_fir_int_int_c_ROM_AUTO_1R
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 32
set AddrRange 128
set AddrWd 7
set impl_style auto
set TrueReset 0
set IsROM 1
set ROMData { "00000000000000000000000000001010" "00000000000000000000000000001011" "00000000000000000000000000001011" "00000000000000000000000000001000" "00000000000000000000000000000011" "11111111111111111111111111111101" "11111111111111111111111111111000" "11111111111111111111111111110101" "11111111111111111111111111110101" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110101" "11111111111111111111111111110101" "11111111111111111111111111111000" "11111111111111111111111111111101" "00000000000000000000000000000011" "00000000000000000000000000001000" "00000000000000000000000000001011" "00000000000000000000000000001011" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001011" "00000000000000000000000000001011" "00000000000000000000000000001000" "00000000000000000000000000000011" "11111111111111111111111111111101" "11111111111111111111111111111000" "11111111111111111111111111110101" "11111111111111111111111111110101" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110101" "11111111111111111111111111110101" "11111111111111111111111111111000" "11111111111111111111111111111101" "00000000000000000000000000000011" "00000000000000000000000000001000" "00000000000000000000000000001011" "00000000000000000000000000001011" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001011" "00000000000000000000000000001011" "00000000000000000000000000001000" "00000000000000000000000000000011" "11111111111111111111111111111101" "11111111111111111111111111111000" "11111111111111111111111111110101" "11111111111111111111111111110101" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110110" "11111111111111111111111111110101" "11111111111111111111111111110101" "11111111111111111111111111111000" "11111111111111111111111111111101" "00000000000000000000000000000011" "00000000000000000000000000001000" "00000000000000000000000000001011" "00000000000000000000000000001011" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001010" "00000000000000000000000000001010" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set DelayBudget 3.254
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem  \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $MemName BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


set CoreName ROM
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem  \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5 \
    name shift_reg_V \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename shift_reg_V \
    op interface \
    ports { shift_reg_V_address0 { O 7 vector } shift_reg_V_ce0 { O 1 bit } shift_reg_V_we0 { O 1 bit } shift_reg_V_d0 { O 8 vector } shift_reg_V_address1 { O 7 vector } shift_reg_V_ce1 { O 1 bit } shift_reg_V_q1 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'shift_reg_V'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4 \
    name acc_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_out \
    op interface \
    ports { acc_out { O 19 vector } acc_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


# flow_control definition:
set InstName fir_flow_control_loop_pipe_sequential_init_U
set CompName fir_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix fir_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


