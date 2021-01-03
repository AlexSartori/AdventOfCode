#include <stdlib.h>
#include <stdio.h>

#define PROG_SIZE 150


int prog_size = 0;
int program[PROG_SIZE];
void load_program();
void execute_program();

void load_program() {
  FILE *f = fopen("input", "r");
  char buffer[10], c;
  int i = 0;

  while ((c=fgetc(f)) != EOF)
    if (c != ',')
      buffer[i++] = c;
    else {
      buffer[i] = '\0';
      i = 0;
      program[prog_size++] = atoi(buffer);
    }
}

void execute_program() {
  int PC = 0;
  while (program[PC] != 99) {
    int op = program[PC++];
    int addr1 = program[PC++];
    int addr2 = program[PC++];
    int dst = program[PC++];

    if (op == 1)
      program[dst] = program[addr1] + program[addr2];
    else if (op == 2)
      program[dst] = program[addr1] * program[addr2];
    else
      printf("Error: unknown operator at PC=%d: %d\n", PC-4, op);
  }
}

int main() {
  load_program();
  program[1] = 12;
  program[2] = 2;
  execute_program();
  printf("Result: %d\n", program[0]);
  return 0;
}
