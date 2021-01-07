## Introduction

Santa has become stranded at the edge of the Solar System while delivering presents to other planets! To accurately calculate his position in space, safely align his warp drive, and return to Earth in time to save Christmas, he needs you to bring him measurements from fifty stars. Collect stars by solving puzzles. Two puzzles will be made available on each day in the Advent calendar; the second puzzle is unlocked when you complete the first. Each puzzle grants one star. Good luck!

---

## Day 1: The Tyranny of the Rocket Equation
#### Part 1
The Elves quickly load you into a spacecraft and prepare to launch. At the first Go / No Go poll, every Elf is Go until the Fuel Counter-Upper. They haven't determined the amount of fuel required yet. Fuel required to launch a given module is based on its mass. Specifically, to find the fuel required for a module, take its mass, divide by `3`, round down, and subtract `2`.
The Fuel Counter-Upper needs to know the total fuel requirement. To find it, individually calculate the fuel needed for the mass of each module (your puzzle input), then add together all the fuel values.
What is the sum of the fuel requirements for all of the modules on your spacecraft?

#### Part 2
During the second Go / No Go poll, the Elf in charge of the Rocket Equation Double-Checker stops the launch sequence. Apparently, you forgot to include additional fuel for the fuel you just added. Fuel itself requires fuel just like a module - take its mass, divide by `3`, round down, and subtract `2`. However, that fuel also requires fuel, and that fuel requires fuel, and so on. Any mass that would require negative fuel should instead be treated as if it requires zero fuel; the remaining mass, if any, is instead handled by wishing really hard, which has no mass and is outside the scope of this calculation.
So, for each module mass, calculate its fuel and add it to the total. Then, treat the fuel amount you just calculated as the input mass and repeat the process, continuing until a fuel requirement is zero or negative.
What is the sum of the fuel requirements for all of the modules on your spacecraft when also taking into account the mass of the added fuel?

---

## Day 2: 1202 Program Alarm
#### Part 1
On the way to your gravity assist around the Moon, your ship computer beeps angrily about a "1202 program alarm". On the radio, an Elf is already explaining how to handle the situation: "Don't worry, that's perfectly norma--" The ship computer bursts into flames. You notify the Elves that the computer's magic smoke seems to have escaped. "That computer ran Intcode programs like the gravity assist program it was working on; surely there are enough spare parts up there to build a new Intcode computer! An Intcode program is a list of integers separated by commas (like `1,0,0,3,99`). To run one, start by looking at the first integer (called position `0`). Here, you will find an opcode - either `1`, `2`, or `99`. The opcode indicates what to do; for example, `99` means that the program is finished and should immediately halt. Encountering an unknown opcode means something went wrong. Opcode `1` adds together numbers read from two positions and stores the result in a third position. The three integers immediately after the opcode tell you these three positions - the first two indicate the positions from which you should read the input values, and the third indicates the position at which the output should be stored. Opcode `2` works exactly like opcode `1`, except it multiplies the two inputs instead of adding them. Again, the three integers after the opcode indicate where the inputs and outputs are, not their values. Once you have a working computer, the first step is to restore the gravity assist program (your puzzle input) to the "1202 program alarm" state it had just before the last computer caught fire. To do this, before running the program, replace position `1` with the value `12` and replace position `2` with the value `2`. What value is left at position `0` after the program halts?

#### Part 2
"Good, the new computer seems to be working correctly! Keep it nearby during this mission - you'll probably use it again. Real Intcode computers support many more features than your new one, but we'll let you know what they are as you need them". "However, your current priority should be to complete your gravity assist around the Moon. For this mission to succeed, we should settle on some terminology for the parts you've already built". Intcode programs are given as a list of integers; these values are used as the initial state for the computer's memory. When you run an Intcode program, make sure to start by initializing memory to the program's values. A position in memory is called an address. Opcodes (like `1`, `2`, or `99`) mark the beginning of an instruction. The values used immediately after an opcode, if any, are called the instruction's parameters. The instruction `99` contains only an opcode and has no parameters. The address of the current instruction is called the instruction pointer; it starts at `0`. After an instruction finishes, the instruction pointer increases by the number of values in the instruction; until you add more instructions to the computer, this is always `4` (`1` opcode + `3` parameters) for the add and multiply instructions. (The halt instruction would increase the instruction pointer by `1`, but it halts the program instead). "With terminology out of the way, we're ready to proceed. To complete the gravity assist, you need to determine what pair of inputs produces the output `19690720`". The inputs should still be provided to the program by replacing the values at addresses `1` and `2`, just like before. In this program, the value placed in address `1` is called the noun, and the value placed in address `2` is called the verb. Each of the two input values will be between `0` and `99`, inclusive. Once the program has halted, its output is available at address `0`, also just like before. Each time you try a pair of inputs, make sure you first reset the computer's memory to the values in the program (your puzzle input) - in other words, don't reuse memory from a previous attempt.
Find the input noun and verb that cause the program to produce the output `19690720`. What is 100 * noun + verb?

---

## Day 3: Crossed Wires
#### Part 1
The gravity assist was successful, and you're well on your way to the Venus refueling station. During the rush back on Earth, the fuel management system wasn't completely installed, so that's next on the priority list. Opening the front panel reveals a jumble of wires. Specifically, two wires are connected to a central port and extend outward on a grid. You trace the path each wire takes as it leaves the central port, one wire per line of text (your puzzle input). The wires twist and turn, but the two wires occasionally cross paths. To fix the circuit, you need to find the intersection point closest to the central port. Because the wires are on a grid, use the Manhattan distance for this measurement. While the wires do technically cross right at the central port where they both start, this point does not count, nor does a wire count as crossing with itself.
What is the Manhattan distance from the central port to the closest intersection?

![wires](Day%2003/wires_1.png)

#### Part 2
It turns out that this circuit is very timing-sensitive; you actually need to minimize the signal delay. To do this, calculate the number of steps each wire takes to reach each intersection; choose the intersection where the sum of both wires' steps is lowest. If a wire visits a position on the grid multiple times, use the steps value from the first time it visits that position when calculating the total value of a specific intersection. The number of steps a wire takes is the total number of grid squares the wire has entered to get to that location, including the intersection being considered.
What is the fewest combined steps the wires must take to reach an intersection?

---
Problem statements extrapolated from [adventofcode.com](https://adventofcode.com). Solutions and visualizations by me.
