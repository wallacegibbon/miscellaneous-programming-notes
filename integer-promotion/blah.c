#include <stdio.h>

/// This demo program is assuming that the size of `int` is the 4-byte and the size of `long` is 8-byte. (the `lp64` ABI)

/*
The output of this program (on gcc version 11.4.0 (Ubuntu 11.4.0-1ubuntu1~22.04))

	int a = -1;

	a < 0x7fffffff                          : 1
	a < 0x80000000                          : 0
	a < 2147483648                          : 1
	a < 0x80000000L                         : 1
	a < 0x80000000UL                        : 0
	a < 0x8000000000000000UL                : 0
	(unsigned int)a < 0x8000000000000000UL  : 1

*/

int main(int argc, const char **argv) {
	int a = -1;

	printf("\n\tint a = -1;\n\n");

	/// 0x7fffffff is an `int` literal
	printf("\ta < 0x7fffffff\t\t\t\t: %d\n", a < 0x7fffffff);

	/// 0x80000000 is an `unsigned int` literal
	printf("\ta < 0x80000000\t\t\t\t: %d\n", a < 0x80000000);

	/// 2147483648 (decimal representation of 0x80000000) is an `long int` literal
	/// Decimal literals have different promotion rules from octal and hexadecimal literals.
	printf("\ta < 2147483648\t\t\t\t: %d\n", a < 2147483648);

	/// 0x80000000L is an `long int` literal
	printf("\ta < 0x80000000L\t\t\t\t: %d\n", a < 0x80000000L);

	/// 0x80000000UL is an `unsigned long int` literal
	printf("\ta < 0x80000000UL\t\t\t: %d\n", a < 0x80000000UL);

	printf("\ta < 0x8000000000000000UL\t\t: %d\n", a < 0x8000000000000000UL);
	printf("\t(unsigned int)a < 0x8000000000000000UL\t: %d\n", (unsigned int)a < 0x8000000000000000UL);

	puts("");
	return 0;
}
