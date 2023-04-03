/*
	Filename: fir.cpp
		FIR lab wirtten for WES/CSE237C class at UCSD.
		Match filter
	INPUT:
		x: signal (chirp)

	OUTPUT:
		y: filtered output

*/

#include "fir.h"
#define N 128
#include "ap_int.h"
typedef ap_int<8> reg_t;
typedef ap_int<5> c_t;
void fir (data_t *y,data_t x){

	c_t c[N] = {10, 11, 11, 8, 3, -3, -8, -11, -11, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -11, -11, -8, -3, 3, 8, 11, 11, 10, 10, 10, 10, 10, 10, 10, 10, 11, 11, 8, 3, -3, -8, -11, -11, -10, -10, -10, -10, -10, -10, -10, -10, -11, -11, -8, -3, 3, 8, 11, 11, 10, 10, 10, 10, 10, 10, 10, 10, 11, 11, 8, 3, -3, -8, -11, -11, -10, -10, -10, -10, -10, -10, -10, -10, -11, -11, -8, -3, 3, 8, 11, 11, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10};
	
	// Write your code here
	static
	reg_t shift_reg[N];
	acc_t acc = 0;
	int i;
/*	Time_delay_loop:
	for (i = N - 1; i >= 0; i--) {
			shift_reg[i] = shift_reg[i - 1];
		}
		shift_reg[0] = x;

	MAC:
	for (i = N - 1; i >= 0 ; i--) {
		acc += shift_reg[i] * c[i];
		}

		*y = acc;
}
*/

	FIR:
	for (i = N - 1; i >= 0; i--) {

		shift_reg[i] = shift_reg[i - 1];
		acc += shift_reg[i] * c[i];
		}
		shift_reg[0] = x;
		acc += shift_reg[0] * c[0];
		*y = acc;
}



