#include <stdlib.h>
#include <stdio.h>

char range_min[] = "265275", range_max[] = "781584";

void add_one(char psw[]) {
    int i = 0, carry = 1;
    while (psw[i] != '\0') i++;

    for (i--; i >= 0; i--) {
        int sum = (psw[i] - '0') + carry;
        psw[i] = (sum % 10) + '0';
        carry = sum/10;
    }

    if (carry != 0)
        printf("[ERR] Integer overflow\n");
}

int has_2_adjacent_equal_digits(char psw[]) {
    for (int i = 0; psw[i] != '\0'; i++) {
        int size = 1;
        while (psw[i+1] && psw[i] == psw[i+1])
            ++size && ++i;
        if (size == 2)
            return 1;
    }
    return 0;
}

void next_non_decreasing(char psw[]) {
    add_one(psw);

    for (int i = 1; psw[i] != '\0'; i++)
        if (psw[i] < psw[i-1])
            for (int k = i; psw[k] != '\0'; k++)
                psw[k] = psw[i-1];
}

int lesser_than(const char* a, const char* b) {
    for (int i = 0; a[i] && b[i]; i++)
        if (a[i] > b[i])
            return 0;
        else if (a[i] < b[i])
            return 1;
    return 0; // Equal (or different length, TODO)
}

int main() {
    int tot = 0;

    do {
        if (has_2_adjacent_equal_digits(range_min))
            tot++;
        next_non_decreasing(range_min);
    } while (lesser_than(range_min, range_max));

    printf("Tot: %d\n", tot);
    return 0;
}
