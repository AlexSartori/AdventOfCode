#include <stdlib.h>
#include <stdio.h>

#define PROG_SIZE 150


int prog_size = 0;
int program[PROG_SIZE];
void load_program();
void copy_memory(int[], int[]);
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

  fclose(f);
}

void copy_memory(int src[], int dst[]) {
  for (int i = 0; i < PROG_SIZE; i++)
    dst[i] = src[i];
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

  int noun, verb, backup[PROG_SIZE];
  copy_memory(program, backup);

  for (noun = 0; noun <= 99; noun++) {
    for (verb = 0; verb <= 99; verb++) {
      copy_memory(backup, program);
      program[1] = noun;
      program[2] = verb;
      execute_program();
      if (program[0] == 19690720)
        break;
    }
    if (program[0] == 19690720)
      break;
  }

  printf("Result: %d\n", program[0]);
  printf("Noun: %d, Verb: %d, 100*N+V: %d\n", noun, verb, 100*noun+verb);
  return 0;
}
