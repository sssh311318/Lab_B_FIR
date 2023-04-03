-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fir_fir_Pipeline_Shift_Accum_Loop is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    mul : IN STD_LOGIC_VECTOR (31 downto 0);
    conv2_i_i : IN STD_LOGIC_VECTOR (7 downto 0);
    acc_out : OUT STD_LOGIC_VECTOR (31 downto 0);
    acc_out_ap_vld : OUT STD_LOGIC );
end;


architecture behav of fir_fir_Pipeline_Shift_Accum_Loop is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_fsm_pp0_stage1 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv8_7F : STD_LOGIC_VECTOR (7 downto 0) := "01111111";
    constant ap_const_lv7_0 : STD_LOGIC_VECTOR (6 downto 0) := "0000000";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv7_7F : STD_LOGIC_VECTOR (6 downto 0) := "1111111";
    constant ap_const_lv8_FF : STD_LOGIC_VECTOR (7 downto 0) := "11111111";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0) := "01";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_CS_fsm_pp0_stage1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage1 : signal is "none";
    signal ap_block_state2_pp0_stage1_iter0 : BOOLEAN;
    signal ap_block_state4_pp0_stage1_iter1 : BOOLEAN;
    signal ap_block_pp0_stage1_subdone : BOOLEAN;
    signal tmp_reg_239 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage1 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal shift_reg_V_address0 : STD_LOGIC_VECTOR (6 downto 0);
    signal shift_reg_V_ce0 : STD_LOGIC;
    signal shift_reg_V_we0 : STD_LOGIC;
    signal shift_reg_V_d0 : STD_LOGIC_VECTOR (7 downto 0);
    signal shift_reg_V_q0 : STD_LOGIC_VECTOR (7 downto 0);
    signal fir_int_int_c_address0 : STD_LOGIC_VECTOR (6 downto 0);
    signal fir_int_int_c_ce0 : STD_LOGIC;
    signal fir_int_int_c_q0 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal tmp_fu_136_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln28_fu_144_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln28_reg_243 : STD_LOGIC_VECTOR (63 downto 0);
    signal icmp_ln29_fu_153_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln29_reg_248 : STD_LOGIC_VECTOR (0 downto 0);
    signal shift_reg_V_load_reg_262 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_block_pp0_stage1_11001 : BOOLEAN;
    signal trunc_ln1679_fu_181_p1 : STD_LOGIC_VECTOR (4 downto 0);
    signal trunc_ln1679_reg_267 : STD_LOGIC_VECTOR (4 downto 0);
    signal mul_ln34_cast_fu_197_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_enable_reg_pp0_iter0_reg : STD_LOGIC := '0';
    signal ap_phi_reg_pp0_iter0_mul_pn_reg_114 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_phi_reg_pp0_iter1_mul_pn_reg_114 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln33_fu_165_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal ap_block_pp0_stage1 : BOOLEAN;
    signal acc_fu_50 : STD_LOGIC_VECTOR (31 downto 0);
    signal acc_1_fu_204_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal i_fu_54 : STD_LOGIC_VECTOR (7 downto 0);
    signal add_ln28_fu_170_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_sig_allocacmp_i_1 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_block_pp0_stage1_01001 : BOOLEAN;
    signal trunc_ln28_fu_149_p1 : STD_LOGIC_VECTOR (6 downto 0);
    signal add_ln33_fu_159_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal mul_ln34_fu_191_p2 : STD_LOGIC_VECTOR (12 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_idle_pp0_1to1 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_condition_268 : BOOLEAN;
    signal ap_condition_272 : BOOLEAN;
    signal ap_ce_reg : STD_LOGIC;

    component fir_mul_5s_8s_13_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (4 downto 0);
        din1 : IN STD_LOGIC_VECTOR (7 downto 0);
        dout : OUT STD_LOGIC_VECTOR (12 downto 0) );
    end component;


    component fir_fir_Pipeline_Shift_Accum_Loop_shift_reg_V_RAM_AUTO_1R1W IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (6 downto 0);
        ce0 : IN STD_LOGIC;
        we0 : IN STD_LOGIC;
        d0 : IN STD_LOGIC_VECTOR (7 downto 0);
        q0 : OUT STD_LOGIC_VECTOR (7 downto 0) );
    end component;


    component fir_fir_Pipeline_Shift_Accum_Loop_fir_int_int_c_ROM_AUTO_1R IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (6 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component fir_flow_control_loop_pipe_sequential_init IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start_int : OUT STD_LOGIC;
        ap_loop_init : OUT STD_LOGIC;
        ap_ready_int : IN STD_LOGIC;
        ap_loop_exit_ready : IN STD_LOGIC;
        ap_loop_exit_done : IN STD_LOGIC;
        ap_continue_int : OUT STD_LOGIC;
        ap_done_int : IN STD_LOGIC );
    end component;



begin
    shift_reg_V_U : component fir_fir_Pipeline_Shift_Accum_Loop_shift_reg_V_RAM_AUTO_1R1W
    generic map (
        DataWidth => 8,
        AddressRange => 128,
        AddressWidth => 7)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => shift_reg_V_address0,
        ce0 => shift_reg_V_ce0,
        we0 => shift_reg_V_we0,
        d0 => shift_reg_V_d0,
        q0 => shift_reg_V_q0);

    fir_int_int_c_U : component fir_fir_Pipeline_Shift_Accum_Loop_fir_int_int_c_ROM_AUTO_1R
    generic map (
        DataWidth => 32,
        AddressRange => 128,
        AddressWidth => 7)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => fir_int_int_c_address0,
        ce0 => fir_int_int_c_ce0,
        q0 => fir_int_int_c_q0);

    mul_5s_8s_13_1_1_U1 : component fir_mul_5s_8s_13_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 5,
        din1_WIDTH => 8,
        dout_WIDTH => 13)
    port map (
        din0 => trunc_ln1679_reg_267,
        din1 => shift_reg_V_load_reg_262,
        dout => mul_ln34_fu_191_p2);

    flow_control_loop_pipe_sequential_init_U : component fir_flow_control_loop_pipe_sequential_init
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter0_stage1,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter0_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter0_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) then 
                    ap_enable_reg_pp0_iter0_reg <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter0_stage1)) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                    ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                end if; 
            end if;
        end if;
    end process;


    acc_fu_50_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                acc_fu_50 <= ap_const_lv32_0;
            elsif (((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                acc_fu_50 <= acc_1_fu_204_p2;
            end if; 
        end if;
    end process;

    ap_phi_reg_pp0_iter1_mul_pn_reg_114_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln29_reg_248 = ap_const_lv1_0) and (tmp_reg_239 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                ap_phi_reg_pp0_iter1_mul_pn_reg_114 <= mul_ln34_cast_fu_197_p1;
            elsif (((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                ap_phi_reg_pp0_iter1_mul_pn_reg_114 <= ap_phi_reg_pp0_iter0_mul_pn_reg_114;
            end if; 
        end if;
    end process;

    i_fu_54_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((tmp_fu_136_p3 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
                    i_fu_54 <= add_ln28_fu_170_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    i_fu_54 <= ap_const_lv8_7F;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln29_fu_153_p2 = ap_const_lv1_1) and (tmp_fu_136_p3 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                ap_phi_reg_pp0_iter0_mul_pn_reg_114 <= mul;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((tmp_fu_136_p3 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                icmp_ln29_reg_248 <= icmp_ln29_fu_153_p2;
                    zext_ln28_reg_243(7 downto 0) <= zext_ln28_fu_144_p1(7 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln29_reg_248 = ap_const_lv1_0) and (tmp_reg_239 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then
                shift_reg_V_load_reg_262 <= shift_reg_V_q0;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                tmp_reg_239 <= ap_sig_allocacmp_i_1(7 downto 7);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln29_reg_248 = ap_const_lv1_0) and (tmp_reg_239 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then
                trunc_ln1679_reg_267 <= trunc_ln1679_fu_181_p1;
            end if;
        end if;
    end process;
    zext_ln28_reg_243(63 downto 8) <= "00000000000000000000000000000000000000000000000000000000";

    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_block_pp0_stage1_subdone, ap_block_pp0_stage0_subdone, ap_idle_pp0_1to1, ap_start_int)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                if ((not(((ap_start_int = ap_const_logic_0) and (ap_idle_pp0_1to1 = ap_const_logic_1))) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_pp0_stage1 => 
                if ((ap_const_boolean_0 = ap_block_pp0_stage1_subdone)) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                end if;
            when others =>  
                ap_NS_fsm <= "XX";
        end case;
    end process;
    acc_1_fu_204_p2 <= std_logic_vector(unsigned(ap_phi_reg_pp0_iter1_mul_pn_reg_114) + unsigned(acc_fu_50));
    acc_out <= acc_fu_50;

    acc_out_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage1, tmp_reg_239, ap_block_pp0_stage1_11001)
    begin
        if (((tmp_reg_239 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            acc_out_ap_vld <= ap_const_logic_1;
        else 
            acc_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    add_ln28_fu_170_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_i_1) + unsigned(ap_const_lv8_FF));
    add_ln33_fu_159_p2 <= std_logic_vector(unsigned(trunc_ln28_fu_149_p1) + unsigned(ap_const_lv7_7F));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
    ap_CS_fsm_pp0_stage1 <= ap_CS_fsm(1);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1_01001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state2_pp0_stage1_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state3_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state4_pp0_stage1_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_268_assign_proc : process(ap_CS_fsm_pp0_stage0, tmp_fu_136_p3, icmp_ln29_fu_153_p2, ap_block_pp0_stage0)
    begin
                ap_condition_268 <= ((icmp_ln29_fu_153_p2 = ap_const_lv1_0) and (tmp_fu_136_p3 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0));
    end process;


    ap_condition_272_assign_proc : process(ap_CS_fsm_pp0_stage0, tmp_fu_136_p3, icmp_ln29_fu_153_p2, ap_block_pp0_stage0)
    begin
                ap_condition_272 <= ((icmp_ln29_fu_153_p2 = ap_const_lv1_1) and (tmp_fu_136_p3 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0));
    end process;


    ap_condition_exit_pp0_iter0_stage1_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1_subdone, tmp_reg_239)
    begin
        if (((tmp_reg_239 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            ap_condition_exit_pp0_iter0_stage1 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage1 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1_subdone, ap_loop_exit_ready, ap_done_reg)
    begin
        if (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_enable_reg_pp0_iter0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0_reg, ap_start_int)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) then 
            ap_enable_reg_pp0_iter0 <= ap_start_int;
        else 
            ap_enable_reg_pp0_iter0 <= ap_enable_reg_pp0_iter0_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_idle_pp0 = ap_const_logic_1) and (ap_start_int = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_1to1_assign_proc : process(ap_enable_reg_pp0_iter1)
    begin
        if ((ap_enable_reg_pp0_iter1 = ap_const_logic_0)) then 
            ap_idle_pp0_1to1 <= ap_const_logic_1;
        else 
            ap_idle_pp0_1to1 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter0_stage1;

    ap_ready_int_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_allocacmp_i_1_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, ap_loop_init, i_fu_54)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
            ap_sig_allocacmp_i_1 <= ap_const_lv8_7F;
        else 
            ap_sig_allocacmp_i_1 <= i_fu_54;
        end if; 
    end process;

    fir_int_int_c_address0 <= zext_ln28_fu_144_p1(7 - 1 downto 0);

    fir_int_int_c_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            fir_int_int_c_ce0 <= ap_const_logic_1;
        else 
            fir_int_int_c_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    icmp_ln29_fu_153_p2 <= "1" when (ap_sig_allocacmp_i_1 = ap_const_lv8_0) else "0";
        mul_ln34_cast_fu_197_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(mul_ln34_fu_191_p2),32));


    shift_reg_V_address0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage1, zext_ln28_reg_243, zext_ln33_fu_165_p1, ap_block_pp0_stage1, ap_condition_268, ap_condition_272)
    begin
        if ((ap_enable_reg_pp0_iter0 = ap_const_logic_1)) then
            if (((ap_const_boolean_0 = ap_block_pp0_stage1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                shift_reg_V_address0 <= zext_ln28_reg_243(7 - 1 downto 0);
            elsif ((ap_const_boolean_1 = ap_condition_272)) then 
                shift_reg_V_address0 <= ap_const_lv7_0;
            elsif ((ap_const_boolean_1 = ap_condition_268)) then 
                shift_reg_V_address0 <= zext_ln33_fu_165_p1(7 - 1 downto 0);
            else 
                shift_reg_V_address0 <= "XXXXXXX";
            end if;
        else 
            shift_reg_V_address0 <= "XXXXXXX";
        end if; 
    end process;


    shift_reg_V_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage0_11001, tmp_fu_136_p3, icmp_ln29_fu_153_p2, ap_block_pp0_stage1_11001)
    begin
        if ((((icmp_ln29_fu_153_p2 = ap_const_lv1_0) and (tmp_fu_136_p3 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or ((icmp_ln29_fu_153_p2 = ap_const_lv1_1) and (tmp_fu_136_p3 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or ((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1)))) then 
            shift_reg_V_ce0 <= ap_const_logic_1;
        else 
            shift_reg_V_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    shift_reg_V_d0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage1, conv2_i_i, shift_reg_V_q0, ap_block_pp0_stage1, ap_condition_272)
    begin
        if ((ap_enable_reg_pp0_iter0 = ap_const_logic_1)) then
            if (((ap_const_boolean_0 = ap_block_pp0_stage1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                shift_reg_V_d0 <= shift_reg_V_q0;
            elsif ((ap_const_boolean_1 = ap_condition_272)) then 
                shift_reg_V_d0 <= conv2_i_i;
            else 
                shift_reg_V_d0 <= "XXXXXXXX";
            end if;
        else 
            shift_reg_V_d0 <= "XXXXXXXX";
        end if; 
    end process;


    shift_reg_V_we0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage1, tmp_reg_239, ap_block_pp0_stage0_11001, tmp_fu_136_p3, icmp_ln29_fu_153_p2, icmp_ln29_reg_248, ap_block_pp0_stage1_11001)
    begin
        if ((((icmp_ln29_fu_153_p2 = ap_const_lv1_1) and (tmp_fu_136_p3 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or ((icmp_ln29_reg_248 = ap_const_lv1_0) and (tmp_reg_239 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1)))) then 
            shift_reg_V_we0 <= ap_const_logic_1;
        else 
            shift_reg_V_we0 <= ap_const_logic_0;
        end if; 
    end process;

    tmp_fu_136_p3 <= ap_sig_allocacmp_i_1(7 downto 7);
    trunc_ln1679_fu_181_p1 <= fir_int_int_c_q0(5 - 1 downto 0);
    trunc_ln28_fu_149_p1 <= ap_sig_allocacmp_i_1(7 - 1 downto 0);
    zext_ln28_fu_144_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ap_sig_allocacmp_i_1),64));
    zext_ln33_fu_165_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln33_fu_159_p2),64));
end behav;
