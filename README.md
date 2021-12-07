# Advent of Code 2021

Previous year: [2020 branch](https://github.com/AlexSartori/AdventOfCode/tree/2020)

#### Index:
- [Day 1: Sonar Sweep](#day-1-sonar-sweep)
- [Day 2: Dive!](#day-2-dive)
- [Day 3: Binary Diagnostic](#day-3-binary-diagnostic)
- [Day 4: Giant Squid](#day-4-giant-squid)
- [Day 5: Hydrothermal Venture](#day-5-hydrothermal-venture)
- [Day 6: Lanterfish](#day-6-lanternfish)
- [Day 7: The Treachery of Whales](#day-7-the-treachery-of-whales)

---

## Day 1: Sonar Sweep

#### Part 1
You're minding your own business on a ship at sea when the overboard alarm goes off! You rush to see if you can help. Apparently, one of the Elves tripped and accidentally sent the sleigh keys flying into the ocean!
Before you know it, you're inside a submarine the Elves keep ready for situations like this. It's covered in Christmas lights (because of course it is), and it even has an experimental antenna that should be able to track the keys if you can boost its signal strength high enough; there's a little meter that indicates the antenna's signal strength by displaying 0-50 stars.
Your instincts tell you that in order to save Christmas, you'll need to get all fifty stars by December 25th.
Collect stars by solving puzzles. Two puzzles will be made available on each day in the Advent calendar; the second puzzle is unlocked when you complete the first. Each puzzle grants one star. Good luck!
As the submarine drops below the surface of the ocean, it automatically performs a sonar sweep of the nearby sea floor. On a small screen, the sonar sweep report (your puzzle input) appears: each line is a measurement of the sea floor depth as the sweep looks further and further away from the submarine.
The first order of business is to figure out how quickly the depth increases, just so you know what you're dealing with - you never know if the keys will get carried into deeper water by an ocean current or a fish or something.
To do this, count the number of times a depth measurement increases from the previous measurement. (There is no measurement before the first measurement.)
How many measurements are larger than the previous measurement?

#### Part 2
Considering every single measurement isn't as useful as you expected: there's just too much noise in the data.
Instead, consider sums of a three-measurement sliding window. Your goal now is to count the number of times the sum of measurements in this sliding window increases from the previous sum. Consider sums of a three-measurement sliding window. How many sums are larger than the previous sum?

---

## Day 2: Dive!

#### Part 1
Now, you need to figure out how to pilot this thing.
It seems like the submarine can take a series of commands like `forward 1`, `down 2`, or `up 3`:

- `forward X` increases the horizontal position by `X` units.
- `down X` increases the depth by `X` units.
- `up X` decreases the depth by `X` units.

Note that since you're on a submarine, down and up affect your depth, and so they have the opposite result of what you might expect. The submarine seems to already have a planned course (your puzzle input). You should probably figure out where it's going. Your horizontal position and depth both start at 0. Calculate the horizontal position and depth you would have after following the planned course. What do you get if you multiply your final horizontal position by your final depth?

#### Part 2
Based on your calculations, the planned course doesn't seem to make any sense. You find the submarine manual and discover that the process is actually slightly more complicated. In addition to horizontal position and depth, you'll also need to track a third value, aim, which also starts at 0. The commands also mean something entirely different than you first thought:

- `down X` increases your aim by `X` units.
- `up X` decreases your aim by `X` units.
- `forward X` does two things:
  - It increases your horizontal position by `X` units.
  - It increases your depth by your aim multiplied by `X`.

Again note that since you're on a submarine, down and up do the opposite of what you might expect: "down" means aiming in the positive direction.
Using this new interpretation of the commands, calculate the horizontal position and depth you would have after following the planned course. What do you get if you multiply your final horizontal position by your final depth?

---

## Day 3: Binary Diagnostic

#### Part 1
The submarine has been making some odd creaking noises, so you ask it to produce a diagnostic report just in case. The diagnostic report (your puzzle input) consists of a list of binary numbers which, when decoded properly, can tell you many useful things about the conditions of the submarine. The first parameter to check is the power consumption. You need to use the binary numbers in the diagnostic report to generate two new binary numbers (called the gamma rate and the epsilon rate). The power consumption can then be found by multiplying the gamma rate by the epsilon rate. Each bit in the gamma rate can be determined by finding the most common bit in the corresponding position of all numbers in the diagnostic report. The epsilon rate is calculated in a similar way; rather than use the most common bit, the least common bit from each position is used.
Use the binary numbers in your diagnostic report to calculate the gamma rate and epsilon rate, then multiply them together. What is the power consumption of the submarine? (Be sure to represent your answer in decimal, not binary).

#### Part 2
Next, you should verify the life support rating, which can be determined by multiplying the oxygen generator rating by the CO2 scrubber rating. Both the oxygen generator rating and the CO2 scrubber rating are values that can be found in your diagnostic report - finding them is the tricky part. Both values are located using a similar process that involves filtering out values until only one remains. Before searching for either rating value, start with the full list of binary numbers from your diagnostic report and consider just the first bit of those numbers. Then:

- Keep only numbers selected by the bit criteria for the type of rating value for which you are searching. Discard numbers which do not match the bit criteria.
- If you only have one number left, stop; this is the rating value for which you are searching.
- Otherwise, repeat the process, considering the next bit to the right.

The bit criteria depends on which type of rating value you want to find:

- To find oxygen generator rating, determine the most common value (`0` or `1`) in the current bit position, and keep only numbers with that bit in that position. If `0` and `1` are equally common, keep values with a `1` in the position being considered.
- To find CO2 scrubber rating, determine the least common value (`0` or `1`) in the current bit position, and keep only numbers with that bit in that position. If `0` and `1` are equally common, keep values with a `0` in the position being considered.

Use the binary numbers in your diagnostic report to calculate the oxygen generator rating and CO2 scrubber rating, then multiply them together. What is the life support rating of the submarine? (Be sure to represent your answer in decimal, not binary).

---

## Day 4: Giant Squid

#### Part 1
You're already almost 1.5km (almost a mile) below the surface of the ocean, already so deep that you can't see any sunlight. What you can see, however, is a giant squid that has attached itself to the outside of your submarine. Maybe it wants to play bingo? Bingo is played on a set of boards each consisting of a 5x5 grid of numbers. Numbers are chosen at random, and the chosen number is marked on all boards on which it appears. (Numbers may not appear on all boards.) If all numbers in any row or any column of a board are marked, that board wins. (Diagonals don't count). The submarine has a bingo subsystem to help passengers (currently, you and the giant squid) pass the time. It automatically generates a random order in which to draw numbers and a random set of boards (your puzzle input). 
The score of the winning board can now be calculated. Start by finding the sum of all unmarked numbers on that board; Then, multiply that sum by the number that was just called when the board won to get the final score. To guarantee victory against the giant squid, figure out which board will win first. What will your final score be if you choose that board?

#### Part 2
On the other hand, it might be wise to try a different strategy: let the giant squid win. You aren't sure how many bingo boards a giant squid could play at once, so rather than waste time counting its arms, the safe thing to do is to figure out which board will win last and choose that one. That way, no matter which boards it picks, it will win for sure.
Figure out which board will win last. Once it wins, what would its final score be?

---

## Day 5: Hydrothermal Venture

#### Part 1
You come across a field of hydrothermal vents on the ocean floor! These vents constantly produce large, opaque clouds, so it would be best to avoid them if possible. They tend to form in lines; the submarine helpfully produces a list of nearby lines of vents (your puzzle input) for you to review. Each line of vents is given as a line segment in the format `x1,y1 -> x2,y2` where `x1,y1` are the coordinates of one end the line segment and `x2,y2` are the coordinates of the other end. These line segments include the points at both ends. For now, only consider horizontal and vertical lines: lines where either `x1 = x2` or `y1 = y2`. To avoid the most dangerous areas, you need to determine the number of points where at least two lines overlap.
Consider only horizontal and vertical lines. At how many points do at least two lines overlap?

#### Part 2
Unfortunately, considering only horizontal and vertical lines doesn't give you the full picture; you need to also consider diagonal lines. Because of the limits of the hydrothermal vent mapping system, the lines in your list will only ever be horizontal, vertical, or a diagonal line at exactly 45 degrees. You still need to determine the number of points where at least two lines overlap. Consider all of the lines. At how many points do at least two lines overlap?

---

## Day 6: Lanternfish

#### Part 1
The sea floor is getting steeper. Maybe the sleigh keys got carried this way? A massive school of glowing lanternfish swims past. They must spawn quickly to reach such large numbers - maybe exponentially quickly? You should model their growth rate to be sure. Although you know nothing about this specific species of lanternfish, you make some guesses about their attributes. Surely, each lanternfish creates a new lanternfish once every 7 days. However, this process isn't necessarily synchronized between every lanternfish - one lanternfish might have 2 days left until it creates another lanternfish, while another might have 4. So, you can model each fish as a single number that represents the number of days until it creates a new lanternfish. Furthermore, you reason, a new lanternfish would surely need slightly longer before it's capable of producing more lanternfish: two more days for its first cycle. Realizing what you're trying to do, the submarine automatically produces a list of the ages of several hundred nearby lanternfish (your puzzle input). Find a way to simulate lanternfish. How many lanternfish would there be after 80 days?

#### Part 2
Suppose the lanternfish live forever and have unlimited food and space. Would they take over the entire ocean? How many lanternfish would there be after 256 days?

---

## Day 7: The Treachery of Whales

#### Part 1
A giant whale has decided your submarine is its next meal, and it's much faster than you are. There's nowhere to run! Suddenly, a swarm of crabs (each in its own tiny submarine - it's too deep for them otherwise) zooms in to rescue you! They seem to be preparing to blast a hole in the ocean floor; sensors indicate a massive underground cave system just beyond where they're aiming! The crab submarines all need to be aligned before they'll have enough power to blast a large enough hole for your submarine to get through. However, it doesn't look like they'll be aligned before the whale catches you! Maybe you can help? There's one major catch - crab submarines can only move horizontally. You quickly make a list of the horizontal position of each crab (your puzzle input). Crab submarines have limited fuel, so you need to find a way to make all of their horizontal positions match while requiring them to spend as little fuel as possible.
Determine the horizontal position that the crabs can align to using the least fuel possible. How much fuel must they spend to align to that position?

#### Part 2
The crabs don't seem interested in your proposed solution. Perhaps you misunderstand crab engineering? As it turns out, crab submarine engines don't burn fuel at a constant rate. Instead, each change of 1 step in horizontal position costs 1 more unit of fuel than the last: the first step costs 1, the second step costs 2, the third step costs 3, and so on. As each crab moves, moving further becomes more expensive. This changes the best horizontal position to align them all on; Determine the horizontal position that the crabs can align to using the least fuel possible so they can make you an escape route! How much fuel must they spend to align to that position?

---

*Problem statements extrapolated from [adventofcode.com](https://adventofcode.com)*
