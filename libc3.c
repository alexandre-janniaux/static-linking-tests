#include <stdio.h>


void collide() { fprintf(stderr, "I collide from libc3.c"); }

static void foo()
{
    fprintf(stderr, "foo from libc3\n");
    collide();
}
