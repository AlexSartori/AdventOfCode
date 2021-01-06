#include <stdlib.h>
#include <stdio.h>

#define MAX_WIRE_LENGTH 400
#define max(a, b) (a > b ? a : b)
#define min(a, b) (a < b ? a : b)

typedef struct {
    int x, y;
} point_t;

point_t wire_1[MAX_WIRE_LENGTH], wire_2[MAX_WIRE_LENGTH];
int wire_1_len, wire_2_len;

void load_wires();
point_t intersect(point_t, point_t, point_t, point_t);

int main() {
    load_wires();

    int closest = -1;
    for (int i = 0; i < wire_1_len - 1; i++) {
        point_t p1 = wire_1[i], p2 = wire_1[i+1];
        for (int j = 0; j < wire_2_len - 1; j++) {
            point_t p3 = wire_2[j], p4 = wire_2[j+1];
            point_t inter = intersect(p1, p2, p3, p4);
            int dist = abs(inter.x) + abs(inter.y);
            if (dist != 0 && (dist < closest || closest == -1))
                closest = dist;
        }
    }

    printf("\nClosest: %d\n", closest);
    return 0;
}

void load_wires() {
    FILE *f = fopen("input", "r");
    point_t* wire = wire_1;
    int* wire_len = &wire_1_len;
    int x = 0, y = 0, buf_idx = 0;
    char c, dir, buf[8];

    point_t p; p.x = p.y = 0;
    wire[(*wire_len)++] = p;

    while ((c = fgetc(f)) != EOF) {
        if (c == ',' || c == '\n') {
            buf[buf_idx] = '\0';
            buf_idx = 0;
            int val = atoi(buf);
            point_t p; p.x = x; p.y = y;

            if (dir == 'R' || dir == 'L')
                p.x = (x += val * (dir == 'R' ? 1 : -1));
            else if (dir == 'U' || dir == 'D')
                p.y = (y += val * (dir == 'D' ? 1 : -1));
            wire[(*wire_len)++] = p;

            if (c == '\n') {
                wire = wire_2;
                wire_len = &wire_2_len;
                x = y = buf_idx = 0;
            }
        } else if (c >= '0' && c <= '9') {
            buf[buf_idx++] = c;
        } else {
            dir = c;
        }
    }

    fclose(f);
}

point_t intersect(point_t p1, point_t p2, point_t p3, point_t p4) {
    point_t p; p.x = p.y = 0;
    int orient1, orient2;
    orient1 = (p1.x == p2.x) ? 1 : 0;
    orient2 = (p3.x == p4.x) ? 1 : 0;

    if (orient1 == orient2)
        return p;

    if (orient2 == 1) {
        point_t tmp = p1;
        p1 = p3; p3 = tmp;

        tmp = p2;
        p2 = p4; p4 = tmp;
    }

    // Segment A is now vertical and segment B is horizontal
    if (p1.x < min(p3.x, p4.x) || p1.x > max(p3.x, p4.x))
        return p;

    if (p3.y < min(p1.y, p2.y) || p3.y > max(p1.y, p2.y))
        return p;

    p.x = p1.x;
    p.y = p3.y;
    return p;
}
