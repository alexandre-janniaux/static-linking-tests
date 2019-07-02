#include <stdio.h>

extern void (*foo_symbol)(void);

static void foo()
{
    fprintf(stderr, "foo from libb\n");
}

void (*foo_symbol)(void) = foo;
