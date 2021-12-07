CC = gcc
LD = $(CC)
RM = rm -f
OMPFLAGS = -fopenmp
CFLAGS = -Wall -O2 -march=native -fomit-frame-pointer

ifneq ($(OS), Windows_NT)
	ifneq ($(shell grep -o ARM /proc/cpuinfo),)
		CFLAGS += -mfpu=neon
	endif
endif

LDFLAGS = -s -lrt

PROJ = tests benchmark
OBJS_CORE = hefty1.o
OBJS_TESTS = $(OBJS_CORE) tests.o
OBJS_BENCHMARK = $(OBJS_CORE) benchmark.o
OBJS_RM = hefty1.o

all: $(PROJ)

check: tests
	@echo 'Running tests'
	@./tests | tee TESTS-OUT
	@diff -U0 TESTS-OK TESTS-OUT && echo PASSED || echo FAILED

tests: $(OBJS_TESTS)
	$(LD) $(LDFLAGS) $(OBJS_TESTS) -o $@

benchmark: $(OBJS_BENCHMARK)
	$(LD) $(LDFLAGS) $(OBJS_BENCHMARK) -o $@

benchmark.o: benchmark.c
	$(CC) -c $(CFLAGS) $*.c

.c.o:
	$(CC) -c $(CFLAGS) $*.c

hefty1.o: hefty1.h
tests.o: hefty1.h
benchmark.o: hefty1.h

clean:
	$(RM) $(PROJ)
	$(RM) $(OBJS_TESTS) $(OBJS_BENCHMARK)
	$(RM) $(OBJS_RM)
	$(RM) TESTS-OUT