#include <stdio.h>

/// This demo program is assuming that the size of `int` is the 4-byte and the size of `long` is 8-byte. (the `lp64` ABI)

static inline char smaller_or_greater(int value) {
	return value != 0 ? '<' : '>';
}

int main(int argc, const char **argv) {
	int a = -1;

	/// 0x7fffffff is an `int` literal
	printf("a(%d) %c 0x7fffffff\n", a, smaller_or_greater(a < 0x7fffffff));

	/// 0x80000000 is an `unsigned int` literal
	printf("a(%d) %c 0x80000000\n", a, smaller_or_greater(a < 0x80000000));

	/// 2147483648 (decimal representation of 0x80000000) is an `long int` literal
	/// Decimal literals have different promotion rules from octal and hexadecimal literals.
	printf("a(%d) %c 2147483648\n", a, smaller_or_greater(a < 2147483648));

	/// 0x80000000L is an `long int` literal
	printf("a(%d) %c 0x80000000L\n", a, smaller_or_greater(a < 0x80000000L));

	/// 0x80000000UL is an `unsigned long int` literal
	printf("a(%d) %c 0x80000000UL\n", a, smaller_or_greater(a < 0x80000000UL));

	printf("a(%d) %c 0x8000000000000000UL\n", a, smaller_or_greater(a < 0x8000000000000000UL));

	return 0;
}
