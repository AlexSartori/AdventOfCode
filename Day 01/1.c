#include <stdlib.h>
#include <stdio.h>

#define N_MODULES 100
#define MAX_LINE_LENGTH 512


int n_modules = 0;
int modules[N_MODULES];
void read_modules(void);
int calc_fuel(void);

void read_modules() {
    FILE *f = fopen("input", "r");
    char buffer[MAX_LINE_LENGTH];
    while (fgets(buffer, MAX_LINE_LENGTH, f))
        modules[n_modules++] = atoi(buffer);
}

int calc_fuel() {
    int total = 0;
    for (int i = 0; i < n_modules; i++)
        total += (modules[i]/3) - 2;
    return total;
}

void main() {
    read_modules();
    printf("Total: %d\n", calc_fuel());
}
