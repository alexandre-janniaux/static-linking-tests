CFLAGS = -fvisibility=hidden

all: all_linked static_linked static_linked_without_collide
	@echo compiled: $(shell ./all_linked 2>&1)
	@echo static: $(shell ./static_linked 2>&1)

all_linked: main.o liba.o libb.o
	gcc $^ -o $@ -Wl,-trace-symbol=foo_symbol

liba.a: liba.o
libb.a: libb.o

static_linked: main.o libb.o
	gcc $^ -o $@ -L. -la -Wl,-trace-symbol=foo_symbol,-trace

static_linked_collide: main.o libb.o libc3.o
	gcc $^ -o $@ -L. -la -Wl,-trace-symbol=foo_symbol,-trace

intermediate.o: main.o libb.o
	ld -r $^ -o $@
	objcopy --localize-hidden $@ #--strip-unneeded

static_linked_without_collide: intermediate.o libc3.o
	gcc $^ -o $@ -L. -la -Wl,-trace-symbol=foo_symbol,-trace

static_linked: liba.a

clean:
	rm *.a *.o all_linked static_linked -f

liba.o libb.o main.o: Makefile
%.a: %.o
	ar rcs $@ $^
