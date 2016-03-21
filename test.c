#include <stdio.h>
#include <inttypes.h>

int32_t * get_rust_int();

int main() {
    int32_t * x = get_rust_int();
    printf("%d\n", * x);
    return 0;
}
