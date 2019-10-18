// Capability test for empty __VA_ARGS__ GNU hack.
// Based on the example provided by:
// https://gcc.gnu.org/onlinedocs/cpp/Variadic-Macros.html

#include <cstdio>

#define eprintf(format, ...) fprintf (stderr, format, ##__VA_ARGS__)

int main() {
    eprintf("");
    eprintf("%d %d", 1, 2);
}
