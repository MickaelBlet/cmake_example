#include "example0.h"
#include "example1.h"

int main(int argc, char* argv[]) {
    (void)argc;
    (void)argv;
    lib0::Example example0;
    example0.example();
    lib1::Example example1;
    example1.example();
    return 0;
}