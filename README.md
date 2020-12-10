# Advent of Code 2020
2020 has been a crazy year and... Some of this solutions are as well.

I'll try to use each day something different to solve the proposed problem.

#### Index:
- [Day 1](#day-1-report-repair): SQL
- [Day 2](#day-2-password-philosophy): x86 Assembly
- [Day 3](#day-3-toboggan-trajectory): Ruby
- [Day 4](#day-4-passport-processing): Perl
- [Day 5](#day-5-binary-boarding): PHP
- [Day 6](#day-6-custom-customs): QuickBASIC 4.5
- [Day 7](#day-7-handy-haversacks): JavaScript
- [Day 8](#day-8-handheld-halting): Java
- [Day 9](#day-9-encoding-error): CoffeeScript
- [Day 10](#day-10-adapter-array): Bash

---

## Intro
After saving Christmas [five years in a row](https://adventofcode.com/events), you've decided to take a vacation at a nice resort on a tropical island. Surely, Christmas will go on without you.

The tropical island has its own currency and is entirely cash-only. The gold coins used there have a little picture of a starfish; the locals just call them **stars**. None of the currency exchanges seem to have heard of them, but somehow, you'll need to find fifty of these coins by the time you arrive so you can pay the deposit on your room.

To save your vacation, you need to get all **fifty stars** by December 25th.

--- 

## Day 1: Report Repair
##### Part 1
Before you leave, the Elves in accounting just need you to fix your _expense report_ (your puzzle input); apparently, something isn't quite adding up. Specifically, they need you to _find the two entries that sum to_ `2020` and then multiply those two numbers together.

##### Part 2
The Elves in accounting are thankful for your help; one of them even offers you a starfish coin they had left over from a past vacation. They offer you a second one if you can find three numbers in your expense report that meet the same criteria.

---

## Day 2: Password Philosophy
#### Part 1
Your flight departs in a few days from the coastal airport; the easiest way down to the coast from here is via toboggan. The shopkeeper at the North Pole Toboggan Rental Shop is having a bad day. "Something's wrong with our computers; we can't log in!" You ask if you can take a look. Their password database seems to be a little corrupted: some of the passwords wouldn't have been allowed by the Official Toboggan Corporate Policy that was in effect when they were chosen. To try to debug the problem, they have created a list (your puzzle input) of passwords (according to the corrupted database) and the corporate policy when that password was set. Each line gives the password policy and then the password. The password policy indicates the lowest and highest number of times a given letter must appear for the password to be valid. How many passwords are valid according to their policies?

#### Part 2
While it appears you validated the passwords correctly, they don't seem to be what the Official Toboggan Corporate Authentication System is expecting. The shopkeeper suddenly realizes that he just accidentally explained the password policy rules from his old job at the sled rental place down the street! The Official Toboggan Corporate Policy actually works a little differently. Each policy actually describes two positions in the password, where `1` means the first character, `2` means the second character, and so on. (Be careful; Toboggan Corporate Policies have no concept of "index zero"!) Exactly one of these positions must contain the given letter. Other occurrences of the letter are irrelevant for the purposes of policy enforcement. How many passwords are valid according to the new interpretation of the policies?

---

## Day 3: Toboggan Trajectory
#### Part 1
With the toboggan login problems resolved, you set off toward the airport. While travel by toboggan might be easy, it's certainly not safe: there's very minimal steering and the area is covered in trees. You'll need to see which angles will take you near the fewest trees. Due to the local geology, trees in this area only grow on exact integer coordinates in a grid. You make a map (your puzzle input) of the open squares (`.`) and trees (`#`) you can see. These aren't the only trees, though; due to something you read about once involving arboreal genetics and biome stability, the same pattern repeats to the right many times. You start on the open square (`.`) in the top-left corner and need to reach the bottom (below the bottom-most row on your map). The toboggan can only follow a few specific slopes (you opted for a cheaper model that prefers rational numbers). Starting at the top-left corner of your map and following a slope of right 3 and down 1, how many trees would you encounter?

#### Part 2
Time to check the rest of the slopes - you need to minimize the probability of a sudden arboreal stop, after all. Determine the number of trees you would encounter if, for each of the following slopes, you start at the top-left corner and traverse the map all the way to the bottom:

- Right 1, down 1.
- Right 3, down 1. (This is the slope you already checked.)
- Right 5, down 1.
- Right 7, down 1.
- Right 1, down 2.

What do you get if you multiply together the number of trees encountered on each of the listed slopes?

---

## Day 4: Passport Processing
#### Part 1
You arrive at the airport only to realize that you grabbed your North Pole Credentials instead of your passport. While these documents are extremely similar, North Pole Credentials aren't issued by a country and therefore aren't actually valid documentation for travel in most of the world. It seems like you're not the only one having problems, though; a very long line has formed for the automatic passport scanners, and the delay could upset your travel itinerary. Due to some questionable network security, you realize you might be able to solve both of these problems at the same time. The automatic passport scanners are slow because they're having trouble detecting which passports have all required fields. The expected fields are as follows:

- `byr` (Birth Year)
- `iyr` (Issue Year)
- `eyr` (Expiration Year)
- `hgt` (Height)
- `hcl` (Hair Color)
- `ecl` (Eye Color)
- `pid` (Passport ID)
- `cid` (Country ID)

Passport data is validated in batch files (your puzzle input). Each passport is represented as a sequence of `key:value` pairs separated by spaces or newlines. Passports are separated by blank lines. Count the number of valid passports - those that have all required fields. Treat `cid` as optional. In your batch file, how many passports are valid?

#### Part 2
The line is moving more quickly now, but you overhear airport security talking about how passports with invalid data are getting through. Better add some data validation, quick! You can continue to ignore the cid field, but each other field has strict rules about what values are valid for automatic validation:

- `byr` (Birth Year) - four digits; at least 1920 and at most 2002.
- `iyr` (Issue Year) - four digits; at least 2010 and at most 2020.
- `eyr` (Expiration Year) - four digits; at least 2020 and at most 2030.
- `hgt` (Height) - a number followed by either cm or in:
    - If cm, the number must be at least 150 and at most 193.
    - If in, the number must be at least 59 and at most 76.
- `hcl` (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
- `ecl` (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
- `pid` (Passport ID) - a nine-digit number, including leading zeroes.
- `cid` (Country ID) - ignored, missing or not.

Count the number of valid passports - those that have all required fields and valid values. Continue to treat cid as optional. In your batch file, how many passports are valid?

---

## Day 5: Binary Boarding
#### Part 1
You board your plane only to discover a new problem: you dropped your boarding pass! You aren't sure which seat is yours, and all of the flight attendants are busy with the flood of people that suddenly made it through passport control. You write a quick program to use your phone's camera to scan all of the nearby boarding passes (your puzzle input); perhaps you can find your seat through process of elimination. Instead of zones or groups, this airline uses binary space partitioning to seat people. A seat might be specified like `FBFBBFFRLR`, where `F` means "front", `B` means "back", `L` means "left", and `R` means "right". The first 7 characters will either be `F` or `B`; these specify exactly one of the `128` rows on the plane (numbered `0` through `127`). Each letter tells you which half of a region the given seat is in. Start with the whole list of rows; the first letter indicates whether the seat is in the front (0 through 63) or the back (64 through 127). The next letter indicates which half of that region the seat is in, and so on until you're left with exactly one row. The last three characters will be either `L` or `R`; these specify exactly one of the `8` columns of seats on the plane (numbered `0` through `7`). The same process as above proceeds again, this time with only three steps. `L` means to keep the lower half, while `R` means to keep the upper half. As a sanity check, look through your list of boarding passes. What is the highest seat ID on a boarding pass?

#### Part 2
Ding! The "fasten seat belt" signs have turned on. Time to find your seat. It's a completely full flight, so your seat should be the only missing boarding pass in your list. However, there's a catch: some of the seats at the very front and back of the plane don't exist on this aircraft, so they'll be missing from your list as well. Your seat wasn't at the very front or back, though; the seats with IDs +1 and -1 from yours will be in your list. What is the ID of your seat?

---

## Day 6: Custom Customs
#### Part 1
As your flight approaches the regional airport where you'll switch to a much larger plane, customs declaration forms are distributed to the passengers. The form asks a series of 26 yes-or-no questions marked `a` through `z`. All you need to do is identify the questions for which anyone in your group answers "yes". Since your group is just you, this doesn't take very long. However, the person sitting next to you seems to be experiencing a language barrier and asks if you can help. For each of the people in their group, you write down the questions for which they answer "yes", one per line. Another group asks for your help, then another, and eventually you've collected answers from every group on the plane (your puzzle input). Each group's answers are separated by a blank line, and within each group, each person's answers are on a single line. For each group, count the number of questions to which anyone answered "yes". What is the sum of those counts?

#### Part 2
As you finish the last group's customs declaration, you notice that you misread one word in the instructions: you don't need to identify the questions to which *anyone* answered "yes"; you need to identify the questions to which *everyone* answered "yes"! For each group, count the number of questions to which everyone answered "yes". What is the sum of those counts?

---

## Day 7: Handy Haversacks
#### Part 1
You land at the regional airport in time for your next flight. In fact, it looks like you'll even have time to grab some food: all flights are currently delayed due to issues in luggage processing. Due to recent aviation regulations, many rules (your puzzle input) are being enforced about bags and their contents; bags must be color-coded and must contain specific quantities of other color-coded bags. Apparently, nobody responsible for these regulations considered how long they would take to enforce! You have a `shiny gold` bag. If you wanted to carry it in at least one other bag, how many different bag colors would be valid for the outermost bag? (In other words: how many colors can, eventually, contain at least one `shiny gold` bag?)

#### Part 2
It's getting pretty expensive to fly these days - not because of ticket prices, but because of the ridiculous number of bags you need to buy! Of course, the actual rules have a small chance of going several levels deeper than this example; be sure to count all of the bags, even if the nesting becomes topologically impractical! How many individual bags are required inside your single shiny gold bag?

---

## Day 8: Handheld Halting
#### Part 1
Your flight to the major airline hub reaches cruising altitude without incident. While you consider checking the in-flight menu for one of those drinks that come with a little umbrella, you are interrupted by the kid sitting next to you. Their handheld game console won't turn on! They ask if you can take a look. You narrow the problem down to a strange infinite loop in the boot code (your puzzle input) of the device. You should be able to fix it, but first you need to be able to run the code in isolation.
The boot code is represented as a text file with one instruction per line of text. Each instruction consists of an operation (`acc`, `jmp`, or `nop`) and an argument (a signed number like `+4` or `-20`).
- `acc` increases or decreases a single global value called the accumulator by the value given in the argument. For example, `acc +7` would increase the accumulator by `7`. The accumulator starts at `0`. After an acc instruction, the instruction immediately below it is executed next.
- `jmp` jumps to a new instruction relative to itself. The next instruction to execute is found using the argument as an offset from the `jmp` instruction; for example, `jmp +2` would skip the next instruction, `jmp +1` would continue to the instruction immediately below it, and `jmp -20` would cause the instruction `20` lines above to be executed next.
- `nop` stands for `No OPeration` - it does nothing. The instruction immediately below it is executed next.
Run your copy of the boot code. Immediately before any instruction is executed a second time, what value is in the accumulator?

#### Part 2
After some careful analysis, you believe that exactly one instruction is corrupted. Somewhere in the program, either a `jmp` is supposed to be a `nop`, or a `nop` is supposed to be a `jmp`. (No `acc` instructions were harmed in the corruption of this boot code.)
The program is supposed to terminate by attempting to execute an instruction immediately after the last instruction in the file. By changing exactly one `jmp` or `nop`, you can repair the boot code and make it terminate correctly. Fix the program so that it terminates normally by changing exactly one `jmp` (to `nop`) or `nop` (to `jmp`). What is the value of the accumulator after the program terminates?

## Day 9: Encoding Error
#### Part 1
With your neighbor happily enjoying their video game, you turn your attention to an open data port on the little screen in the seat in front of you. Though the port is non-standard, you manage to connect it to your computer through the clever use of several paperclips. Upon connection, the port outputs a series of numbers (your puzzle input). The data appears to be encrypted with the eXchange-Masking Addition System (XMAS) which, conveniently for you, is an old cypher with an important weakness. XMAS starts by transmitting a preamble of 25 numbers. After that, each number you receive should be the sum of any two of the 25 immediately previous numbers. The two numbers will have different values, and there might be more than one such pair. The first step of attacking the weakness in the XMAS data is to find the first number in the list (after the preamble) which is not the sum of two of the 25 numbers before it. What is the first number that does not have this property?

#### Part 2
The final step in breaking the XMAS encryption relies on the invalid number you just found: you must find a contiguous set of at least two numbers in your list which sum to the invalid number from step 1. To find the encryption weakness, add together the smallest and largest number in this contiguous range; What is the encryption weakness in your XMAS-encrypted list of numbers?

## Day 10: Adapter Array
#### Part 1
Patched into the aircraft's data port, you discover weather forecasts of a massive tropical storm. Before you can figure out whether it will impact your vacation plans, however, your device suddenly turns off! Its battery is dead. You'll need to plug it in. There's only one problem: the charging outlet near your seat produces the wrong number of jolts. Always prepared, you make a list of all of the joltage adapters in your bag. Each of your joltage adapters is rated for a specific output joltage (your puzzle input). Any given adapter can take an input `1`, `2`, or `3` jolts lower than its rating and still produce its rated output joltage.
In addition, your device has a built-in joltage adapter rated for `3` jolts higher than the highest-rated adapter in your bag. Treat the charging outlet near your seat as having an effective joltage rating of `0`. Since you have some time to kill, you might as well test all of your adapters. Wouldn't want to get to your resort and realize you can't even charge your device! If you use every adapter in your bag at once, what is the distribution of joltage differences between the charging outlet, the adapters, and your device?
Find a chain that uses all of your adapters to connect the charging outlet to your device's built-in adapter and count the joltage differences between the charging outlet, the adapters, and your device. What is the number of 1-jolt differences multiplied by the number of 3-jolt differences?

#### Part 2
To completely determine whether you have enough adapters, you'll need to figure out how many different ways they can be arranged. Every arrangement needs to connect the charging outlet to your device. The previous rules about when adapters can successfully connect still apply. You glance back down at your bag and try to remember why you brought so many adapters; there must be more than a trillion valid ways to arrange them! Surely, there must be an efficient way to count the arrangements. What is the total number of distinct ways you can arrange the adapters to connect the charging outlet to your device?

---

*Copyright 2020, Alessandro Sartori, problem statements taken from [adventofcode.com](https://adventofcode.com)*
