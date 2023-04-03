// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module fir_fir_Pipeline_Shift_Accum_Loop (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        mul,
        x,
        acc_out,
        acc_out_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] mul;
input  [31:0] x;
output  [31:0] acc_out;
output   acc_out_ap_vld;

reg ap_idle;
reg acc_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_state4_pp0_stage0_iter3;
wire    ap_block_state5_pp0_stage0_iter4;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] tmp_fu_138_p3;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire   [6:0] shift_reg_V_address0;
reg    shift_reg_V_ce0;
reg    shift_reg_V_we0;
reg   [6:0] shift_reg_V_address1;
reg    shift_reg_V_ce1;
reg    shift_reg_V_we1;
wire   [31:0] shift_reg_V_q1;
wire   [6:0] fir_int_int_c_address0;
reg    fir_int_int_c_ce0;
wire   [31:0] fir_int_int_c_q0;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] tmp_reg_225;
reg   [0:0] tmp_reg_225_pp0_iter1_reg;
reg   [0:0] tmp_reg_225_pp0_iter2_reg;
reg   [0:0] tmp_reg_225_pp0_iter3_reg;
wire   [63:0] i_cast1_fu_146_p1;
reg   [63:0] i_cast1_reg_229;
wire   [0:0] icmp_ln29_fu_155_p2;
reg   [0:0] icmp_ln29_reg_234;
reg   [0:0] icmp_ln29_reg_234_pp0_iter1_reg;
reg   [0:0] icmp_ln29_reg_234_pp0_iter2_reg;
reg   [0:0] icmp_ln29_reg_234_pp0_iter3_reg;
reg  signed [31:0] shift_reg_V_load_reg_248;
reg  signed [31:0] fir_int_int_c_load_reg_253;
wire   [31:0] grp_fu_183_p2;
reg   [31:0] mul_ln34_reg_258;
reg   [31:0] ap_phi_mux_mul_pn_phi_fu_119_p4;
wire   [31:0] ap_phi_reg_pp0_iter0_mul_pn_reg_116;
reg   [31:0] ap_phi_reg_pp0_iter1_mul_pn_reg_116;
reg   [31:0] ap_phi_reg_pp0_iter2_mul_pn_reg_116;
reg   [31:0] ap_phi_reg_pp0_iter3_mul_pn_reg_116;
reg   [31:0] ap_phi_reg_pp0_iter4_mul_pn_reg_116;
wire   [63:0] zext_ln33_fu_167_p1;
wire    ap_block_pp0_stage0;
reg   [31:0] acc_fu_48;
wire   [31:0] acc_1_fu_190_p2;
wire    ap_loop_init;
reg   [7:0] i_fu_52;
wire   [7:0] add_ln28_fu_172_p2;
reg   [7:0] ap_sig_allocacmp_i_1;
wire    ap_block_pp0_stage0_01001;
wire   [6:0] empty_6_fu_151_p1;
wire   [6:0] add_ln33_fu_161_p2;
wire  signed [5:0] grp_fu_183_p0;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg    ap_loop_exit_ready_pp0_iter3_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
reg    ap_condition_143;
reg    ap_condition_279;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_done_reg = 1'b0;
end

fir_fir_Pipeline_Shift_Accum_Loop_shift_reg_V_RAM_AUTO_1R1W #(
    .DataWidth( 32 ),
    .AddressRange( 128 ),
    .AddressWidth( 7 ))
shift_reg_V_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(shift_reg_V_address0),
    .ce0(shift_reg_V_ce0),
    .we0(shift_reg_V_we0),
    .d0(shift_reg_V_q1),
    .address1(shift_reg_V_address1),
    .ce1(shift_reg_V_ce1),
    .we1(shift_reg_V_we1),
    .d1(x),
    .q1(shift_reg_V_q1)
);

fir_fir_Pipeline_Shift_Accum_Loop_fir_int_int_c_ROM_AUTO_1R #(
    .DataWidth( 32 ),
    .AddressRange( 128 ),
    .AddressWidth( 7 ))
fir_int_int_c_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(fir_int_int_c_address0),
    .ce0(fir_int_int_c_ce0),
    .q0(fir_int_int_c_q0)
);

fir_mul_6s_32s_32_2_1 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 6 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
mul_6s_32s_32_2_1_U1(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_183_p0),
    .din1(shift_reg_V_load_reg_248),
    .ce(1'b1),
    .dout(grp_fu_183_p2)
);

fir_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter3_reg == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            acc_fu_48 <= 32'd0;
        end else if ((ap_enable_reg_pp0_iter4 == 1'b1)) begin
            acc_fu_48 <= acc_1_fu_190_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_143)) begin
        if (((tmp_fu_138_p3 == 1'd0) & (icmp_ln29_fu_155_p2 == 1'd1))) begin
            ap_phi_reg_pp0_iter1_mul_pn_reg_116 <= mul;
        end else if ((1'b1 == 1'b1)) begin
            ap_phi_reg_pp0_iter1_mul_pn_reg_116 <= ap_phi_reg_pp0_iter0_mul_pn_reg_116;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((tmp_fu_138_p3 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            i_fu_52 <= add_ln28_fu_172_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_52 <= 8'd127;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        icmp_ln29_reg_234_pp0_iter1_reg <= icmp_ln29_reg_234;
        tmp_reg_225 <= ap_sig_allocacmp_i_1[32'd7];
        tmp_reg_225_pp0_iter1_reg <= tmp_reg_225;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
        icmp_ln29_reg_234_pp0_iter2_reg <= icmp_ln29_reg_234_pp0_iter1_reg;
        icmp_ln29_reg_234_pp0_iter3_reg <= icmp_ln29_reg_234_pp0_iter2_reg;
        tmp_reg_225_pp0_iter2_reg <= tmp_reg_225_pp0_iter1_reg;
        tmp_reg_225_pp0_iter3_reg <= tmp_reg_225_pp0_iter2_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_phi_reg_pp0_iter2_mul_pn_reg_116 <= ap_phi_reg_pp0_iter1_mul_pn_reg_116;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ap_phi_reg_pp0_iter3_mul_pn_reg_116 <= ap_phi_reg_pp0_iter2_mul_pn_reg_116;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        ap_phi_reg_pp0_iter4_mul_pn_reg_116 <= ap_phi_reg_pp0_iter3_mul_pn_reg_116;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_reg_225 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln29_reg_234 == 1'd0))) begin
        fir_int_int_c_load_reg_253 <= fir_int_int_c_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_fu_138_p3 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        i_cast1_reg_229[7 : 0] <= i_cast1_fu_146_p1[7 : 0];
        icmp_ln29_reg_234 <= icmp_ln29_fu_155_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_reg_225_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln29_reg_234_pp0_iter2_reg == 1'd0))) begin
        mul_ln34_reg_258 <= grp_fu_183_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_reg_225 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln29_reg_234 == 1'd0))) begin
        shift_reg_V_load_reg_248 <= shift_reg_V_q1;
    end
end

always @ (*) begin
    if (((tmp_reg_225_pp0_iter2_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        acc_out_ap_vld = 1'b1;
    end else begin
        acc_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_fu_138_p3 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter3_reg == 1'b1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_reg_225_pp0_iter3_reg == 1'd0) & (icmp_ln29_reg_234_pp0_iter3_reg == 1'd0))) begin
        ap_phi_mux_mul_pn_phi_fu_119_p4 = mul_ln34_reg_258;
    end else begin
        ap_phi_mux_mul_pn_phi_fu_119_p4 = ap_phi_reg_pp0_iter4_mul_pn_reg_116;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_i_1 = 8'd127;
    end else begin
        ap_sig_allocacmp_i_1 = i_fu_52;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        fir_int_int_c_ce0 = 1'b1;
    end else begin
        fir_int_int_c_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_279)) begin
        if ((icmp_ln29_fu_155_p2 == 1'd1)) begin
            shift_reg_V_address1 = 7'd0;
        end else if ((icmp_ln29_fu_155_p2 == 1'd0)) begin
            shift_reg_V_address1 = zext_ln33_fu_167_p1;
        end else begin
            shift_reg_V_address1 = 'bx;
        end
    end else begin
        shift_reg_V_address1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        shift_reg_V_ce0 = 1'b1;
    end else begin
        shift_reg_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((tmp_fu_138_p3 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln29_fu_155_p2 == 1'd1)) | ((tmp_fu_138_p3 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln29_fu_155_p2 == 1'd0)))) begin
        shift_reg_V_ce1 = 1'b1;
    end else begin
        shift_reg_V_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_reg_225 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln29_reg_234 == 1'd0))) begin
        shift_reg_V_we0 = 1'b1;
    end else begin
        shift_reg_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_fu_138_p3 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln29_fu_155_p2 == 1'd1))) begin
        shift_reg_V_we1 = 1'b1;
    end else begin
        shift_reg_V_we1 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign acc_1_fu_190_p2 = (ap_phi_mux_mul_pn_phi_fu_119_p4 + acc_fu_48);

assign acc_out = acc_fu_48;

assign add_ln28_fu_172_p2 = ($signed(ap_sig_allocacmp_i_1) + $signed(8'd255));

assign add_ln33_fu_161_p2 = ($signed(empty_6_fu_151_p1) + $signed(7'd127));

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_01001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_condition_143 = ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_condition_279 = ((tmp_fu_138_p3 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign ap_phi_reg_pp0_iter0_mul_pn_reg_116 = 'bx;

assign empty_6_fu_151_p1 = ap_sig_allocacmp_i_1[6:0];

assign fir_int_int_c_address0 = i_cast1_fu_146_p1;

assign grp_fu_183_p0 = fir_int_int_c_load_reg_253;

assign i_cast1_fu_146_p1 = ap_sig_allocacmp_i_1;

assign icmp_ln29_fu_155_p2 = ((ap_sig_allocacmp_i_1 == 8'd0) ? 1'b1 : 1'b0);

assign shift_reg_V_address0 = i_cast1_reg_229;

assign tmp_fu_138_p3 = ap_sig_allocacmp_i_1[32'd7];

assign zext_ln33_fu_167_p1 = add_ln33_fu_161_p2;

always @ (posedge ap_clk) begin
    i_cast1_reg_229[63:8] <= 56'b00000000000000000000000000000000000000000000000000000000;
end

endmodule //fir_fir_Pipeline_Shift_Accum_Loop