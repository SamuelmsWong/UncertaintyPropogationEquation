module dsp_16mul(A, B, O, A_SIGNED, B_SIGNED); // A * B = O
	input [15:0]	A;
	input [15:0]	B;
	input		A_SIGNED;
	input		B_SIGNED;



	output [31:0]	O;

	/*
	 *	Refer to SB_MAC16 DSP Functional Model
	 */
	SB_MAC16 i_sbmac16
	(
	.A(A),
	.B(B),
	.C(8'b00000000), // default
	.D(8'b00000000), // default
	.O(O),
	.CLK(),
	.CE(1'b1), // default
	.IRSTTOP(1'b0), // default
	.IRSTBOT(1'b0), // default
	.ORSTTOP(1'b0), // default
	.ORSTBOT(1'b0), // default
	.AHOLD(1'b0), // default
	.BHOLD(1'b0), // default
	.CHOLD(1'b0), // default
	.DHOLD(1'b0), // default
	.OHOLDTOP(1'b0), // default
	.OHOLDBOT(1'b0), // default
	.OLOADTOP(1'b0),
	.OLOADBOT(1'b0),
	.ADDSUBTOP(1'b0),
	.ADDSUBBOT(1'b0),
	.CI(1'b0), // default
	.CO(), // default
	.ACCUMCI(1'b0), // default
	.ACCUMCO(), // default
	.SIGNEXTIN(1'b0), // default
	.SIGNEXTOUT(), // default
	);

	/*
	 *	Refer to SB_MAC16 DSP Functional Model
	 */
	defparam i_sbmac16.NEG_TRIGGER = 1'b0; // Set clock polarity to rising edge

	defparam i_sbmac16.C_REG = 1'b0; // C0: default
	defparam i_sbmac16.A_REG = 1'b0; // C1: A is non-register
	defparam i_sbmac16.B_REG = 1'b0; // C2: B is non-register
	defparam i_sbmac16.D_REG = 1'b0; // C3: default

	defparam i_sbmac16.TOP_8x8_MULT_REG = 1'b0; // C4: Top multiply is non-register
	defparam i_sbmac16.BOT_8x8_MULT_REG = 1'b0; // C5: Bot multiply is non-register
	defparam i_sbmac16.PIPELINE_16x16_MULT_REG1 = 1'b0; // C6: 16bit multiply is non-register
	defparam i_sbmac16.PIPELINE_16x16_MULT_REG2 = 1'b0; // C7: multiply result is non-register

	defparam i_sbmac16.TOPOUTPUT_SELECT = 2'b11; // C9-8: Top output is upper 16 bits of 16x16 mul
	defparam i_sbmac16.TOPADDSUB_LOWERINPUT = 2'b00; // C11-10: default
	defparam i_sbmac16.TOPADDSUB_UPPERINPUT = 1'b0; // C12: default
	defparam i_sbmac16.TOPADDSUB_CARRYSELECT = 2'b00; // C14-13: default

	defparam i_sbmac16.BOTOUTPUT_SELECT = 2'b11; // C16-15: Bot output is lower 16 bits of 16x16 mul
	defparam i_sbmac16.BOTADDSUB_UPPERINPUT = 1'b0; // C17: default
	defparam i_sbmac16.BOTADDSUB_LOWERINPUT = 2'b00; // C19-18: default
	defparam i_sbmac16.BOTADDSUB_CARRYSELECT = 2'b00; // C21-20: default

	defparam i_sbmac16.MODE_8x8 = 1'b0; // C22: Not 8x8 power save mode
	if (A_SIGNED) begin
		defparam i_sbmac16.A_SIGNED = 1'b1; // C23: A is signed
	end
	else begin
		defparam i_sbmac16.A_SIGNED = 1'b0; // C23: A is unsigned
	end
	if (B_SIGNED) begin
		defparam i_sbmac16.B_SIGNED = 1'b1; // C24: B is signed
	end
	else begin
		defparam i_sbmac16.B_SIGNED = 1'b0; // C24: B is unsigned
	end

endmodule