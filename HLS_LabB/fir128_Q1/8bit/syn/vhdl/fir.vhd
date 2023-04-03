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
    "fir_fir,hls_ip_2022_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=6.508000,HLS_SYN_LAT=134,HLS_SYN_TPT=none,HLS_SYN_MEM=2,HLS_SYN_DSP=0,HLS_SYN_FF=337,HLS_SYN_LUT=326,HLS_VERSION=2022_1}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal mul_fu_76_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul_reg_98 : STD_LOGIC_VECTOR (31 downto 0);
    signal empty_8_fu_83_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal empty_8_reg_103 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fir_Pipeline_Shift_Accum_Loop_fu_53_ap_start : STD_LOGIC;
    signal grp_fir_Pipeline_Shift_Accum_Loop_fu_53_ap_done : STD_LOGIC;
    signal grp_fir_Pipeline_Shift_Accum_Loop_fu_53_ap_idle : STD_LOGIC;
    signal grp_fir_Pipeline_Shift_Accum_Loop_fu_53_ap_ready : STD_LOGIC;
    signal grp_fir_Pipeline_Shift_Accum_Loop_fu_53_acc_out : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fir_Pipeline_Shift_Accum_Loop_fu_53_acc_out_ap_vld : STD_LOGIC;
    signal grp_fir_Pipeline_Shift_Accum_Loop_fu_53_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal empty_fu_64_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal empty_7_fu_70_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component fir_fir_Pipeline_Shift_Accum_Loop IS
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
    end component;



begin
    grp_fir_Pipeline_Shift_Accum_Loop_fu_53 : component fir_fir_Pipeline_Shift_Accum_Loop
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_fir_Pipeline_Shift_Accum_Loop_fu_53_ap_start,
        ap_done => grp_fir_Pipeline_Shift_Accum_Loop_fu_53_ap_done,
        ap_idle => grp_fir_Pipeline_Shift_Accum_Loop_fu_53_ap_idle,
        ap_ready => grp_fir_Pipeline_Shift_Accum_Loop_fu_53_ap_ready,
        mul => mul_reg_98,
        conv2_i_i => empty_8_reg_103,
        acc_out => grp_fir_Pipeline_Shift_Accum_Loop_fu_53_acc_out,
        acc_out_ap_vld => grp_fir_Pipeline_Shift_Accum_Loop_fu_53_acc_out_ap_vld);





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


    grp_fir_Pipeline_Shift_Accum_Loop_fu_53_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_fir_Pipeline_Shift_Accum_Loop_fu_53_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    grp_fir_Pipeline_Shift_Accum_Loop_fu_53_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_fir_Pipeline_Shift_Accum_Loop_fu_53_ap_ready = ap_const_logic_1)) then 
                    grp_fir_Pipeline_Shift_Accum_Loop_fu_53_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                empty_8_reg_103 <= empty_8_fu_83_p1;
                    mul_reg_98(31 downto 1) <= mul_fu_76_p2(31 downto 1);
            end if;
        end if;
    end process;
    mul_reg_98(0) <= '0';

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, grp_fir_Pipeline_Shift_Accum_Loop_fu_53_ap_done, ap_CS_fsm_state2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((grp_fir_Pipeline_Shift_Accum_Loop_fu_53_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state2_blk_assign_proc : process(grp_fir_Pipeline_Shift_Accum_Loop_fu_53_ap_done)
    begin
        if ((grp_fir_Pipeline_Shift_Accum_Loop_fu_53_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state3_blk <= ap_const_logic_0;

    ap_done_assign_proc : process(ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    empty_7_fu_70_p2 <= std_logic_vector(shift_left(unsigned(x),to_integer(unsigned('0' & ap_const_lv32_1(31-1 downto 0)))));
    empty_8_fu_83_p1 <= x(8 - 1 downto 0);
    empty_fu_64_p2 <= std_logic_vector(shift_left(unsigned(x),to_integer(unsigned('0' & ap_const_lv32_3(31-1 downto 0)))));
    grp_fir_Pipeline_Shift_Accum_Loop_fu_53_ap_start <= grp_fir_Pipeline_Shift_Accum_Loop_fu_53_ap_start_reg;
    mul_fu_76_p2 <= std_logic_vector(unsigned(empty_fu_64_p2) + unsigned(empty_7_fu_70_p2));
    y <= grp_fir_Pipeline_Shift_Accum_Loop_fu_53_acc_out;

    y_ap_vld_assign_proc : process(ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            y_ap_vld <= ap_const_logic_1;
        else 
            y_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

end behav;
