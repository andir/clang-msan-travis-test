CFLAGS ?= -flto -fvisibility=hidden -fsanitize=cfi -fsanitize=memory -fno-omit-frame-pointer -g -O2
LDFLAGS ?= -fuse-ld=gold

all: test

test: test.o
	clang++ $(CFLAGS) $(LDFLAGS) $< -o test

test.o: test.cc
	clang++ $(CFLAGS) test.cc -c -o test.o
