CC?=gcc

# Detect OS and set linking flags appropriately.
OS=$(shell uname)

LDFLAGS=-lrustffi -L target/debug/ -L ~/.multirust/toolchains/nightly/lib/

ifeq ($(OS), Linux)
LDFLAGS+=-ldl -lpthread -lgcc_s -lc -lm -lrt
endif

ifeq ($(OS), Darwin)
LDFLAGS+=-lSystem -lc -lm
endif

test: test.c target/debug/librustffi.a
	$(CC) -o $@ $< $(CFLAGS) $(LDFLAGS)

target/debug/librustffi.a: src
	cargo build

clean:
	cargo clean
	rm -rf test
