extern void (*foo_symbol)(void) __attribute((weak));
void call_foo();

__attribute__((visibility("default")))
int main(int argc, char **argv)
{
    call_foo();
    return 0;
}
