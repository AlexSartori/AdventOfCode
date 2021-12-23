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
- [Day 8: Seven Segment Search](#day-8-seven-segment-search)
- [Day 9: Smoke Basin](#day-9-smoke-basin)
- [Day 10: Syntax Scoring](#day-10-syntax-scoring)
- [Day 11: Dumbo Octopus](#day-11-dumbo-octopus)
- [Day 12: Passage Pathing](#day-12-passage-pathing)
- [Day 13: Transparent Origami](#day-13-transparent-origami)
- [Day 14:](#day-14)
- [Day 15:](#day-15)
- [Day 16:](#day-16)
- [Day 17:](#day-17)
- [Day 18:](#day-18)
- [Day 19:](#day-19)
- [Day 20:](#day-20)
- [Day 21:](#day-21)
- [Day 22:](#day-22)
- [Day 23:](#day-23)
- [Day 24:](#day-24)
- [Day 25:](#day-25)


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

## Day 8: Seven Segment Search

#### Part 1
You barely reach the safety of the cave when the whale smashes into the cave mouth, collapsing it. Sensors indicate another exit to this cave at a much greater depth, so you have no choice but to press on.  As your submarine slowly makes its way through the cave system, you notice that the four-digit seven-segment displays in your submarine are malfunctioning; they must have been damaged during the escape. You'll be in a lot of trouble without them, so you'd better figure out what's wrong. Each digit of a seven-segment display is rendered by turning on or off any of seven segments named `a` through `g`:

```
  0:      1:      2:      3:      4:
 aaaa    ....    aaaa    aaaa    ....
b    c  .    c  .    c  .    c  b    c
b    c  .    c  .    c  .    c  b    c
 ....    ....    dddd    dddd    dddd
e    f  .    f  e    .  .    f  .    f
e    f  .    f  e    .  .    f  .    f
 gggg    ....    gggg    gggg    ....

  5:      6:      7:      8:      9:
 aaaa    aaaa    aaaa    aaaa    aaaa
b    .  b    .  .    c  b    c  b    c
b    .  b    .  .    c  b    c  b    c
 dddd    dddd    ....    dddd    dddd
.    f  e    f  .    f  e    f  .    f
.    f  e    f  .    f  e    f  .    f
 gggg    gggg    ....    gggg    gggg
```

The problem is that the signals which control the segments have been mixed up on each display. The submarine is still trying to display numbers by producing output on signal wires `a` through `g`, but those wires are connected to segments randomly. Worse, the wire/segment connections are mixed up separately for each four-digit display! (All of the digits within a display use the same connections, though).
So, you might know that only signal wires b and g are turned on, but that doesn't mean segments `b` and `g` are turned on: the only digit that uses two segments is `1`, so it must mean segments `c` and `f` are meant to be on. With just that information, you still can't tell which wire (`b`/`g`) goes to which segment (`c`/`f`). For that, you'll need to collect more information.
For each display, you watch the changing signals for a while, make a note of all ten unique signal patterns you see, and then write down a single four digit output value (your puzzle input). Using the signal patterns, you should be able to work out which pattern corresponds to which digit.
Each entry consists of ten unique signal patterns, a `|` delimiter, and finally the four digit output value. Within an entry, the same wire/segment connections are used (but you don't know what the connections actually are). The unique signal patterns correspond to the ten different ways the submarine tries to render a digit using the current wire/segment connections. Because `7` is the only digit that uses three segments, `dab` in the above example means that to render a `7`, signal lines `d`, `a`, and `b` are on. Because `4` is the only digit that uses four segments, `eafb` means that to render a `4`, signal lines `e`, `a`, `f`, and `b` are on.
Using this information, you should be able to work out which combination of signal wires corresponds to each of the ten digits. Then, you can decode the four digit output value. Unfortunately, in the above example, all of the digits in the output value (`cdfeb` `fcadb` `cdfeb` `cdbaf`) use five segments and are more difficult to deduce. For now, focus on the easy digits. Because the digits 1, 4, 7, and 8 each use a unique number of segments, you should be able to tell which combinations of signals correspond to those digits.
In the output values, how many times do digits 1, 4, 7, or 8 appear?

#### Part 2
Through a little deduction, you should now be able to determine the remaining digits. For each entry, determine all of the wire/segment connections and decode the four-digit output values. What do you get if you add up all of the output values?

---

## Day 9: Smoke Basin

#### Part 1
These caves seem to be lava tubes. Parts are even still volcanically active; small hydrothermal vents release smoke into the caves that slowly settles like rain. If you can model how the smoke flows through the caves, you might be able to avoid it and be that much safer. The submarine generates a heightmap of the floor of the nearby caves for you (your puzzle input). Smoke flows to the lowest point of the area it's in.
Your first goal is to find the low points - the locations that are lower than any of its adjacent locations. Most locations have four adjacent locations (up, down, left, and right); locations on the edge or corner of the map have three or two adjacent locations, respectively. (Diagonal locations do not count as adjacent). The risk level of a low point is `1` plus its height.
Find all of the low points on your heightmap. What is the sum of the risk levels of all low points on your heightmap?

#### Part 2
Next, you need to find the largest basins so you know what areas are most important to avoid. A basin is all locations that eventually flow downward to a single low point. Therefore, every low point has a basin, although some basins are very small. Locations of height 9 do not count as being in any basin, and all other locations will always be part of exactly one basin. The size of a basin is the number of locations within the basin, including the low point.
What do you get if you multiply together the sizes of the three largest basins?

---

## Day 10: Syntax Scoring

#### Part 1
You ask the submarine to determine the best route out of the deep-sea cave, but it only replies:

`Syntax error in navigation subsystem on line: all of them`

All of them?! The damage is worse than you thought. You bring up a copy of the navigation subsystem (your puzzle input).
The navigation subsystem syntax is made of several lines containing chunks. There are one or more chunks on each line, and chunks contain zero or more other chunks. Adjacent chunks are not separated by any delimiter; if one chunk stops, the next chunk (if any) can immediately start. Every chunk must open and close with one of four legal pairs of matching characters:

- If a chunk opens with `(`, it must close with `)`.
- If a chunk opens with `[`, it must close with `]`.
- If a chunk opens with `{`, it must close with `}`.
- If a chunk opens with `<`, it must close with `>`.

So, `()` is a legal chunk that contains no other chunks, as is `[]`. More complex but valid chunks include `([])`, `{()()()}`, `<([{}])>`, `[<>({}){}[([])<>]]`, and even `(((((((((())))))))))`.
Some lines are incomplete, but others are corrupted. Find and discard the corrupted lines first. A corrupted line is one where a chunk closes with the wrong character - that is, where the characters it opens and closes with do not form one of the four legal pairs listed above.
Examples of corrupted chunks include `(]`, `{()()()`, `(((()))`, and `<([]){()}[{}])`. Such a chunk can appear anywhere within a line, and its presence causes the whole line to be considered corrupted. Some of the lines aren't corrupted, just incomplete; you can ignore these lines for now.
Stop at the first incorrect closing character on each corrupted line.
Did you know that syntax checkers actually have contests to see who can get the high score for syntax errors in a file? It's true! To calculate the syntax error score for a line, take the first illegal character on the line and look it up in the following table:

- `)`: `3` points.
- `]`: `57` points.
- `}`: `1197` points.
- `>`: `25137` points.

Find the first illegal character in each corrupted line of the navigation subsystem. What is the total syntax error score for those errors?

#### Part 2
Now, discard the corrupted lines. The remaining lines are incomplete.
Incomplete lines don't have any incorrect characters - instead, they're missing some closing characters at the end of the line. To repair the navigation subsystem, you just need to figure out the sequence of closing characters that complete all open chunks in the line. You can only use closing characters (), ], }, or >), and you must add them in the correct order so that only legal pairs are formed and all chunks end up closed.
Did you know that autocomplete tools also have contests? It's true! The score is determined by considering the completion string character-by-character.
Start with a total score of `0`. Then, for each character, multiply the total score by `5` and then increase the total score by the point value given for the character in the following table:

- `)`: `1` point.
- `]`: `2` points.
- `}`: `3` points.
- `>`: `4` points.

Autocomplete tools are an odd bunch: the winner is found by sorting all of the scores and then taking the middle score. Find the completion string for each incomplete line, score the completion strings, and sort the scores. What is the middle score?

---

## Day 11: Dumbo Octopus

#### Part 1
You enter a large cavern full of rare bioluminescent dumbo octopuses! They seem to not like the Christmas lights on your submarine, so you turn them off for now.
There are 100 octopuses arranged neatly in a 10 by 10 grid. Each octopus slowly gains energy over time and flashes brightly for a moment when its energy is full. Although your lights are off, maybe you could navigate through the cave without disturbing the octopuses if you could predict when the flashes of light will happen.
Each octopus has an energy level - your submarine can remotely measure the energy level of each octopus (your puzzle input).
The energy level of each octopus is a value between `0` and `9`. You can model the energy levels and flashes of light in steps. During a single step, the following occurs:

- First, the energy level of each octopus increases by `1`.
- Then, any octopus with an energy level greater than `9` flashes. This increases the energy level of all adjacent octopuses by `1`, including octopuses that are diagonally adjacent. If this causes an octopus to have an energy level greater than `9`, it also flashes. This process continues as long as new octopuses keep having their energy level increased beyond `9`. (An octopus can only flash at most once per step).
- Finally, any octopus that flashed during this step has its energy level set to` 0`, as it used all of its energy to flash.

Adjacent flashes can cause an octopus to flash on a step even if it begins that step with very little energy.
Given the starting energy levels of the dumbo octopuses in your cavern, simulate 100 steps. How many total flashes are there after 100 steps?

#### Part 2
It seems like the individual flashes aren't bright enough to navigate. However, you might have a better option: the flashes seem to be synchronizing!
If you can calculate the exact moments when the octopuses will all flash simultaneously, you should be able to navigate through the cavern. What is the first step during which all octopuses flash?

---

## Day 12: Passage Pathing

#### Part 1
With your submarine's subterranean subsystems subsisting suboptimally, the only way you're getting out of this cave anytime soon is by finding a path yourself. Not just a path - the only way to know if you've found the best path is to find all of them.
Fortunately, the sensors are still mostly working, and so you build a rough map of the remaining caves (your puzzle input).
This is a list of how all of the caves are connected. You start in the cave named `start`, and your destination is the cave named `end`.
Your goal is to find the number of distinct paths that start at start, end at end, and don't visit small caves more than once. There are two types of caves: big caves (written in uppercase) and small caves (written in lowercase). It would be a waste of time to visit any small cave more than once, but big caves are large enough that it might be worth visiting them multiple times. So, all paths you find should visit small caves at most once, and can visit big caves any number of times.
How many paths through this cave system are there that visit small caves at most once?

#### Part 2
After reviewing the available paths, you realize you might have time to visit a single small cave twice. Specifically, big caves can be visited any number of times, a single small cave can be visited at most twice, and the remaining small caves can be visited at most once. However, the caves named `start` and `end` can only be visited exactly once each: once you leave the `start` cave, you may not return to it, and once you reach the `end` cave, the path must end immediately.
Given these new rules, how many paths through this cave system are there?

---

## Day 13: Transparent Origami

#### Part 1
You reach another volcanically active part of the cave. It would be nice if you could do some kind of thermal imaging so you could tell ahead of time which caves are too hot to safely enter.
Fortunately, the submarine seems to be equipped with a thermal camera! When you activate it, you are greeted with:

`Congratulations on your purchase! To activate this infrared thermal imaging camera system, please enter the code found on page 1 of the manual.`

Apparently, the Elves have never used this feature. To your surprise, you manage to find the manual; as you go to open it, page 1 falls out. It's a large sheet of transparent paper! The transparent paper is marked with random dots and includes instructions on how to fold it up (your puzzle input).
The first section is a list of dots on the transparent paper. `0,0` represents the top-left coordinate. The first value, `x`, increases to the right. The second value, `y`, increases downward. So, the coordinate `3,0` is to the right of `0,0`, and the coordinate `0,7` is below `0,0`.
Then, there is a list of fold instructions. Each instruction indicates a line on the transparent paper and wants you to fold the paper up (for horizontal `y=...` lines) or left (for vertical `x=...` lines).
The transparent paper is pretty big, so for now, focus on just completing the first fold.
How many dots are visible after completing just the first fold instruction on your transparent paper?

#### Part 2
Finish folding the transparent paper according to the instructions. The manual says the code is always eight capital letters.
What code do you use to activate the infrared thermal imaging camera system?

---

## Day 14:
#### Part 1
#### Part 2

---

## Day 15:
#### Part 1
#### Part 2

---

## Day 16:
#### Part 1
#### Part 2

---

## Day 17:
#### Part 1
#### Part 2

---

## Day 18:
#### Part 1
#### Part 2

---

## Day 19:
#### Part 1
#### Part 2

---

## Day 20:
#### Part 1
#### Part 2

---

## Day 21:
#### Part 1
#### Part 2

---

## Day 22:
#### Part 1
#### Part 2

---

## Day 23:
#### Part 1
#### Part 2

---

## Day 24:
#### Part 1
#### Part 2

---

## Day 25:
#### Part 1
#### Part 2


---

*Problem statements extrapolated from [adventofcode.com](https://adventofcode.com)*
