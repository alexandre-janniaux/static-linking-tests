#include <stdio.h>

extern void (*foo_symbol)(void) __attribute((weak));

static void foo()
{
    fprintf(stderr, "foo from liba\n");
}

void (*foo_symbol)(void) = foo;

void call_foo() { (*foo_symbol)(); }
