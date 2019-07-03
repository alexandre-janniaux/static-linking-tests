#include <stdio.h>

extern void (*foo_symbol)(void);

void collide() { fprintf(stderr, "Collide from libb.c"); }
static void foo()
{
    fprintf(stderr, "foo from libb\n");
    collide();
}

void (*foo_symbol)(void) = foo;
