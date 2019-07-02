
all: all_linked static_linked
	@echo compiled: $(shell ./all_linked 2>&1)
	@echo static: $(shell ./static_linked 2>&1)

all_linked: main.o liba.o libb.o
	gcc $^ -o $@ -Wl,-trace-symbol=foo_symbol

liba.a: liba.o
libb.a: libb.o

static_linked: main.o liba.a libb.a
	gcc $< -o $@ -L. -la -lb -Wl,-trace-symbol=foo_symbol,-trace

clean:
	rm *.a *.o all_linked static_linked -f

liba.o libb.o main.o: Makefile
%.a: %.o
	ar rcs $@ $^
