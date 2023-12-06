#include <stdio.h>

void a();

int main(int argc, const char **argv) {
	a();
	return 0;
}

void c() {
	*(int *)0 = 32;
}

void b() {
	c();
}

void a() {
	b();
}
