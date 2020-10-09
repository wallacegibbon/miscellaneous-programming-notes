/**
 * this is an example for the "labels as values" feature of GCC.
 *
 * After the code being loaded, the addresses of functions won't change.
 * And label addresses won't change either.
 *
 * running:
 *
 * $ gcc ops.c -o ops && ./ops
 * > ops is initialized
 *  this is op1
 *  this is op2
 *
 */

#include <stdio.h>

void **ops = NULL;

void
blah(void *op)
{
	// "tmp" does NOT have to be static, but being static is more efficient.
	static void *tmp[] = {&&op1, &&op2};
	if (op)
		goto* op;
	else
		goto init;

op1:
	printf("this is op1\n");
	return;

op2:
	printf("this is op2\n");
	return;

init:
	printf("ops is initialized\n");
	ops = tmp;
}


int
main(int argc, char **argv)
{
	blah(0);
	blah(ops[0]);
	blah(ops[1]);
	return 0;
}

