CC?=gcc
LDFLAGS=-lrustffi -L target/debug/ -L ~/.multirust/toolchains/nightly/lib/ -ldl -lpthread -lgcc_s -lc -lm -lrt

test: test.c target/debug/librustffi.a
	$(CC) -o $@ $< $(CFLAGS) $(LDFLAGS)

target/debug/librustffi.a: src
	cargo build

clean:
	cargo clean
	rm -rf test
