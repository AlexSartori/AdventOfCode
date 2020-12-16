#include <stdlib.h>
#include <stdio.h>

#define GAME_SIZE (int)5e7

int game[GAME_SIZE];
int turn = 1, next_num;

int play(int n) {
    int next = game[n] == -1 ? 0 : turn - game[n];
    game[n] = turn;
    return next;
}

int main() {
    for (int i = 0; i < GAME_SIZE; i++)
        game[i] = -1;

    // Set up game
    int start[] = {11, 0, 1, 10, 5, 19};
    for (turn = 1; turn < 7; turn++)
        next_num = play(start[turn-1]);

    int target = 3e7;
    while (turn < target) {
        if (turn % 1000 == 0)
            printf("[%.1f\%]\r", turn*100.0f/target);
        next_num = play(next_num);
        turn++;
    }

    printf("\nResult: %d\n", next_num);
}
