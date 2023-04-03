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
        conv2_i_i,
        acc_out,
        acc_out_ap_vld
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_state3 = 4'd4;
parameter    ap_ST_fsm_state4 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] mul;
input  [7:0] conv2_i_i;
output  [31:0] acc_out;
output   acc_out_ap_vld;

reg ap_idle;
reg acc_out_ap_vld;

(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_block_state1_pp0_stage0_iter0;
wire   [0:0] tmp_fu_136_p3;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_CS_fsm_state4;
wire    ap_block_state4_pp0_stage3_iter0;
reg   [6:0] shift_reg_V_address0;
reg    shift_reg_V_ce0;
reg    shift_reg_V_we0;
reg   [7:0] shift_reg_V_d0;
wire   [7:0] shift_reg_V_q0;
wire   [6:0] fir_int_int_c_address0;
reg    fir_int_int_c_ce0;
wire   [31:0] fir_int_int_c_q0;
reg   [7:0] i_1_reg_238;
reg   [0:0] tmp_reg_243;
wire   [63:0] zext_ln28_fu_144_p1;
reg   [63:0] zext_ln28_reg_247;
wire   [0:0] icmp_ln29_fu_153_p2;
reg   [0:0] icmp_ln29_reg_252;
reg  signed [7:0] shift_reg_V_load_reg_266;
wire    ap_CS_fsm_state2;
wire    ap_block_state2_pp0_stage1_iter0;
wire   [4:0] trunc_ln1679_fu_170_p1;
reg  signed [4:0] trunc_ln1679_reg_271;
wire  signed [31:0] mul_ln34_cast_fu_186_p1;
wire    ap_CS_fsm_state3;
wire    ap_block_state3_pp0_stage2_iter0;
reg   [31:0] ap_phi_reg_pp0_iter0_mul_pn_reg_114;
wire   [63:0] zext_ln33_fu_165_p1;
reg   [31:0] acc_fu_50;
wire   [31:0] acc_1_fu_203_p2;
wire    ap_loop_init;
reg   [7:0] i_fu_54;
wire   [7:0] add_ln28_fu_190_p2;
reg   [7:0] ap_sig_allocacmp_i_1;
wire   [6:0] trunc_ln28_fu_149_p1;
wire   [6:0] add_ln33_fu_159_p2;
wire   [12:0] mul_ln34_fu_180_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [3:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 4'd1;
#0 ap_done_reg = 1'b0;
end

fir_fir_Pipeline_Shift_Accum_Loop_shift_reg_V_RAM_AUTO_1R1W #(
    .DataWidth( 8 ),
    .AddressRange( 128 ),
    .AddressWidth( 7 ))
shift_reg_V_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(shift_reg_V_address0),
    .ce0(shift_reg_V_ce0),
    .we0(shift_reg_V_we0),
    .d0(shift_reg_V_d0),
    .q0(shift_reg_V_q0)
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

fir_mul_5s_8s_13_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 5 ),
    .din1_WIDTH( 8 ),
    .dout_WIDTH( 13 ))
mul_5s_8s_13_1_1_U1(
    .din0(trunc_ln1679_reg_271),
    .din1(shift_reg_V_load_reg_266),
    .dout(mul_ln34_fu_180_p2)
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
        ap_CS_fsm <= ap_ST_fsm_state1;
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
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1) & (ap_loop_init == 1'b1))) begin
        acc_fu_50 <= 32'd0;
    end else if (((tmp_reg_243 == 1'd0) & (1'b1 == ap_CS_fsm_state4))) begin
        acc_fu_50 <= acc_1_fu_203_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln29_reg_252 == 1'd0) & (tmp_reg_243 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_phi_reg_pp0_iter0_mul_pn_reg_114 <= mul_ln34_cast_fu_186_p1;
    end else if (((icmp_ln29_fu_153_p2 == 1'd1) & (tmp_fu_136_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        ap_phi_reg_pp0_iter0_mul_pn_reg_114 <= mul;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1) & (ap_loop_init == 1'b1))) begin
        i_fu_54 <= 8'd127;
    end else if (((tmp_reg_243 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        i_fu_54 <= add_ln28_fu_190_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        i_1_reg_238 <= ap_sig_allocacmp_i_1;
        tmp_reg_243 <= ap_sig_allocacmp_i_1[32'd7];
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_fu_136_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        icmp_ln29_reg_252 <= icmp_ln29_fu_153_p2;
        zext_ln28_reg_247[7 : 0] <= zext_ln28_fu_144_p1[7 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln29_reg_252 == 1'd0) & (tmp_reg_243 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        shift_reg_V_load_reg_266 <= shift_reg_V_q0;
        trunc_ln1679_reg_271 <= trunc_ln1679_fu_170_p1;
    end
end

always @ (*) begin
    if (((tmp_fu_136_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        acc_out_ap_vld = 1'b1;
    end else begin
        acc_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((ap_start_int == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

assign ap_ST_fsm_state3_blk = 1'b0;

assign ap_ST_fsm_state4_blk = 1'b0;

always @ (*) begin
    if (((tmp_fu_136_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_i_1 = 8'd127;
    end else begin
        ap_sig_allocacmp_i_1 = i_fu_54;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        fir_int_int_c_ce0 = 1'b1;
    end else begin
        fir_int_int_c_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln29_reg_252 == 1'd0) & (tmp_reg_243 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        shift_reg_V_address0 = zext_ln28_reg_247;
    end else if (((icmp_ln29_fu_153_p2 == 1'd1) & (tmp_fu_136_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        shift_reg_V_address0 = 7'd0;
    end else if (((icmp_ln29_fu_153_p2 == 1'd0) & (tmp_fu_136_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        shift_reg_V_address0 = zext_ln33_fu_165_p1;
    end else begin
        shift_reg_V_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((icmp_ln29_reg_252 == 1'd0) & (tmp_reg_243 == 1'd0) & (1'b1 == ap_CS_fsm_state2)) | ((icmp_ln29_fu_153_p2 == 1'd0) & (tmp_fu_136_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1)) | ((icmp_ln29_fu_153_p2 == 1'd1) & (tmp_fu_136_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1)))) begin
        shift_reg_V_ce0 = 1'b1;
    end else begin
        shift_reg_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln29_reg_252 == 1'd0) & (tmp_reg_243 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        shift_reg_V_d0 = shift_reg_V_q0;
    end else if (((icmp_ln29_fu_153_p2 == 1'd1) & (tmp_fu_136_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        shift_reg_V_d0 = conv2_i_i;
    end else begin
        shift_reg_V_d0 = 'bx;
    end
end

always @ (*) begin
    if ((((icmp_ln29_reg_252 == 1'd0) & (tmp_reg_243 == 1'd0) & (1'b1 == ap_CS_fsm_state2)) | ((icmp_ln29_fu_153_p2 == 1'd1) & (tmp_fu_136_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1)))) begin
        shift_reg_V_we0 = 1'b1;
    end else begin
        shift_reg_V_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((tmp_fu_136_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign acc_1_fu_203_p2 = (ap_phi_reg_pp0_iter0_mul_pn_reg_114 + acc_fu_50);

assign acc_out = acc_fu_50;

assign add_ln28_fu_190_p2 = ($signed(i_1_reg_238) + $signed(8'd255));

assign add_ln33_fu_159_p2 = ($signed(trunc_ln28_fu_149_p1) + $signed(7'd127));

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = (ap_start_int == 1'b0);
end

assign ap_block_state2_pp0_stage1_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage2_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage3_iter0 = ~(1'b1 == 1'b1);

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign fir_int_int_c_address0 = zext_ln28_fu_144_p1;

assign icmp_ln29_fu_153_p2 = ((ap_sig_allocacmp_i_1 == 8'd0) ? 1'b1 : 1'b0);

assign mul_ln34_cast_fu_186_p1 = $signed(mul_ln34_fu_180_p2);

assign tmp_fu_136_p3 = ap_sig_allocacmp_i_1[32'd7];

assign trunc_ln1679_fu_170_p1 = fir_int_int_c_q0[4:0];

assign trunc_ln28_fu_149_p1 = ap_sig_allocacmp_i_1[6:0];

assign zext_ln28_fu_144_p1 = ap_sig_allocacmp_i_1;

assign zext_ln33_fu_165_p1 = add_ln33_fu_159_p2;

always @ (posedge ap_clk) begin
    zext_ln28_reg_247[63:8] <= 56'b00000000000000000000000000000000000000000000000000000000;
end

endmodule //fir_fir_Pipeline_Shift_Accum_Loop