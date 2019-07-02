extern void (*foo_symbol)(void) __attribute((weak));
void call_foo();

int main(int argc, char **argv)
{
    call_foo();
    return 0;
}
