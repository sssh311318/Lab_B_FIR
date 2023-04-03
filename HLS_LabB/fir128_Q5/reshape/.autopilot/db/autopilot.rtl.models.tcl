set SynModuleInfo {
  {SRCNAME fir_Pipeline_Time_delay_loop MODELNAME fir_Pipeline_Time_delay_loop RTLNAME fir_fir_Pipeline_Time_delay_loop
    SUBMODULES {
      {MODELNAME fir_flow_control_loop_pipe_sequential_init RTLNAME fir_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME fir_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME fir_Pipeline_MAC MODELNAME fir_Pipeline_MAC RTLNAME fir_fir_Pipeline_MAC
    SUBMODULES {
      {MODELNAME fir_mul_32s_8s_32_2_1 RTLNAME fir_mul_32s_8s_32_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fir MODELNAME fir RTLNAME fir IS_TOP 1}
}
