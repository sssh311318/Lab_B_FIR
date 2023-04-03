-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fir is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    y : OUT STD_LOGIC_VECTOR (31 downto 0);
    y_ap_vld : OUT STD_LOGIC;
    x : IN STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of fir is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "fir_fir,hls_ip_2022_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=6.912000,HLS_SYN_LAT=267,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=4418,HLS_SYN_LUT=14180,HLS_VERSION=2022_1}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (4 downto 0) := "00010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (4 downto 0) := "00100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (4 downto 0) := "01000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (4 downto 0) := "10000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal fir_int_int_shift_reg : STD_LOGIC_VECTOR (1023 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    signal tmp_s_fu_81_p5 : STD_LOGIC_VECTOR (1023 downto 0);
    signal tmp_s_reg_119 : STD_LOGIC_VECTOR (1023 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal grp_fir_Pipeline_Time_delay_loop_fu_57_ap_start : STD_LOGIC;
    signal grp_fir_Pipeline_Time_delay_loop_fu_57_ap_done : STD_LOGIC;
    signal grp_fir_Pipeline_Time_delay_loop_fu_57_ap_idle : STD_LOGIC;
    signal grp_fir_Pipeline_Time_delay_loop_fu_57_ap_ready : STD_LOGIC;
    signal grp_fir_Pipeline_Time_delay_loop_fu_57_p_out : STD_LOGIC_VECTOR (1023 downto 0);
    signal grp_fir_Pipeline_Time_delay_loop_fu_57_p_out_ap_vld : STD_LOGIC;
    signal grp_fir_Pipeline_MAC_fu_63_ap_start : STD_LOGIC;
    signal grp_fir_Pipeline_MAC_fu_63_ap_done : STD_LOGIC;
    signal grp_fir_Pipeline_MAC_fu_63_ap_idle : STD_LOGIC;
    signal grp_fir_Pipeline_MAC_fu_63_ap_ready : STD_LOGIC;
    signal grp_fir_Pipeline_MAC_fu_63_acc_out : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fir_Pipeline_MAC_fu_63_acc_out_ap_vld : STD_LOGIC;
    signal grp_fir_Pipeline_Time_delay_loop_fu_57_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal grp_fir_Pipeline_MAC_fu_63_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal trunc_ln260_fu_77_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component fir_fir_Pipeline_Time_delay_loop IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        fir_int_int_shift_reg_load : IN STD_LOGIC_VECTOR (1023 downto 0);
        p_out : OUT STD_LOGIC_VECTOR (1023 downto 0);
        p_out_ap_vld : OUT STD_LOGIC );
    end component;


    component fir_fir_Pipeline_MAC IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        tmp_2 : IN STD_LOGIC_VECTOR (1023 downto 0);
        acc_out : OUT STD_LOGIC_VECTOR (31 downto 0);
        acc_out_ap_vld : OUT STD_LOGIC );
    end component;



begin
    grp_fir_Pipeline_Time_delay_loop_fu_57 : component fir_fir_Pipeline_Time_delay_loop
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_fir_Pipeline_Time_delay_loop_fu_57_ap_start,
        ap_done => grp_fir_Pipeline_Time_delay_loop_fu_57_ap_done,
        ap_idle => grp_fir_Pipeline_Time_delay_loop_fu_57_ap_idle,
        ap_ready => grp_fir_Pipeline_Time_delay_loop_fu_57_ap_ready,
        fir_int_int_shift_reg_load => fir_int_int_shift_reg,
        p_out => grp_fir_Pipeline_Time_delay_loop_fu_57_p_out,
        p_out_ap_vld => grp_fir_Pipeline_Time_delay_loop_fu_57_p_out_ap_vld);

    grp_fir_Pipeline_MAC_fu_63 : component fir_fir_Pipeline_MAC
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_fir_Pipeline_MAC_fu_63_ap_start,
        ap_done => grp_fir_Pipeline_MAC_fu_63_ap_done,
        ap_idle => grp_fir_Pipeline_MAC_fu_63_ap_idle,
        ap_ready => grp_fir_Pipeline_MAC_fu_63_ap_ready,
        tmp_2 => tmp_s_reg_119,
        acc_out => grp_fir_Pipeline_MAC_fu_63_acc_out,
        acc_out_ap_vld => grp_fir_Pipeline_MAC_fu_63_acc_out_ap_vld);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    grp_fir_Pipeline_MAC_fu_63_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_fir_Pipeline_MAC_fu_63_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
                    grp_fir_Pipeline_MAC_fu_63_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_fir_Pipeline_MAC_fu_63_ap_ready = ap_const_logic_1)) then 
                    grp_fir_Pipeline_MAC_fu_63_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_fir_Pipeline_Time_delay_loop_fu_57_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_fir_Pipeline_Time_delay_loop_fu_57_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                    grp_fir_Pipeline_Time_delay_loop_fu_57_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_fir_Pipeline_Time_delay_loop_fu_57_ap_ready = ap_const_logic_1)) then 
                    grp_fir_Pipeline_Time_delay_loop_fu_57_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                fir_int_int_shift_reg <= tmp_s_fu_81_p5;
                tmp_s_reg_119 <= tmp_s_fu_81_p5;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, grp_fir_Pipeline_Time_delay_loop_fu_57_ap_done, grp_fir_Pipeline_MAC_fu_63_ap_done, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((grp_fir_Pipeline_Time_delay_loop_fu_57_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                if (((grp_fir_Pipeline_MAC_fu_63_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXXXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state2_blk_assign_proc : process(grp_fir_Pipeline_Time_delay_loop_fu_57_ap_done)
    begin
        if ((grp_fir_Pipeline_Time_delay_loop_fu_57_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state3_blk <= ap_const_logic_0;

    ap_ST_fsm_state4_blk_assign_proc : process(grp_fir_Pipeline_MAC_fu_63_ap_done)
    begin
        if ((grp_fir_Pipeline_MAC_fu_63_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state4_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state4_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state5_blk <= ap_const_logic_0;

    ap_done_assign_proc : process(ap_CS_fsm_state5)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state5)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    grp_fir_Pipeline_MAC_fu_63_ap_start <= grp_fir_Pipeline_MAC_fu_63_ap_start_reg;
    grp_fir_Pipeline_Time_delay_loop_fu_57_ap_start <= grp_fir_Pipeline_Time_delay_loop_fu_57_ap_start_reg;
    tmp_s_fu_81_p5 <= (grp_fir_Pipeline_Time_delay_loop_fu_57_p_out(1023 downto 8) & trunc_ln260_fu_77_p1);
    trunc_ln260_fu_77_p1 <= x(8 - 1 downto 0);
    y <= grp_fir_Pipeline_MAC_fu_63_acc_out;

    y_ap_vld_assign_proc : process(ap_CS_fsm_state5)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            y_ap_vld <= ap_const_logic_1;
        else 
            y_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

end behav;