set SynModuleInfo {
  {SRCNAME fir_Pipeline_Time_delay_loop MODELNAME fir_Pipeline_Time_delay_loop RTLNAME fir_fir_Pipeline_Time_delay_loop
    SUBMODULES {
      {MODELNAME fir_flow_control_loop_pipe_sequential_init RTLNAME fir_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME fir_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME fir_Pipeline_MAC MODELNAME fir_Pipeline_MAC RTLNAME fir_fir_Pipeline_MAC
    SUBMODULES {
      {MODELNAME fir_mac_muladd_5s_8s_19s_19_4_1 RTLNAME fir_mac_muladd_5s_8s_19s_19_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME fir_fir_Pipeline_MAC_fir_int_int_c_ROM_AUTO_1R RTLNAME fir_fir_Pipeline_MAC_fir_int_int_c_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fir MODELNAME fir RTLNAME fir IS_TOP 1
    SUBMODULES {
      {MODELNAME fir_shift_reg_V_RAM_AUTO_1R1W RTLNAME fir_shift_reg_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
