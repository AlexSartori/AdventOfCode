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
- [Day 11](#day-11-seating-system): Python 3

Unsurprisingly, this is taking too much time and university exams are approaching. I'll try to keep up with the Advent of Code but I'll stick with the languages I know the most or I'm trying to learn. It's been fun spending an entire afternoon learning BASIC.
- [Day 12](#day-12-rain-risk): Python 3
- [Day 13](#day-13-shuttle-search): Python 3, C+CUDA
- [Day 14](#day-14-docking-data): Python 3
- [Day 15](#day-15-rambunctious-recitation): C
- [Day 16](#day-16-ticket-transletion): Python 3
- [Day 17](#day-17-conway-cubes): Python 3
- [Day 18](#day-18-operation-order): Python 3
- [Day 19](#day-19-monster-messages): Python 3
- [Day 20](#day-20-jurassic-jigsaw): Python 3
- [Day 21](#day-21-allergen-assessment): Python 3
- [Day 22](#day-22-crab-combat): Python 3
- [Day 23](#day-23-crab-cups): Python 3

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

---

## Day 9: Encoding Error
#### Part 1
With your neighbor happily enjoying their video game, you turn your attention to an open data port on the little screen in the seat in front of you. Though the port is non-standard, you manage to connect it to your computer through the clever use of several paperclips. Upon connection, the port outputs a series of numbers (your puzzle input). The data appears to be encrypted with the eXchange-Masking Addition System (XMAS) which, conveniently for you, is an old cypher with an important weakness. XMAS starts by transmitting a preamble of 25 numbers. After that, each number you receive should be the sum of any two of the 25 immediately previous numbers. The two numbers will have different values, and there might be more than one such pair. The first step of attacking the weakness in the XMAS data is to find the first number in the list (after the preamble) which is not the sum of two of the 25 numbers before it. What is the first number that does not have this property?

#### Part 2
The final step in breaking the XMAS encryption relies on the invalid number you just found: you must find a contiguous set of at least two numbers in your list which sum to the invalid number from step 1. To find the encryption weakness, add together the smallest and largest number in this contiguous range; What is the encryption weakness in your XMAS-encrypted list of numbers?

---

## Day 10: Adapter Array
#### Part 1
Patched into the aircraft's data port, you discover weather forecasts of a massive tropical storm. Before you can figure out whether it will impact your vacation plans, however, your device suddenly turns off! Its battery is dead. You'll need to plug it in. There's only one problem: the charging outlet near your seat produces the wrong number of jolts. Always prepared, you make a list of all of the joltage adapters in your bag. Each of your joltage adapters is rated for a specific output joltage (your puzzle input). Any given adapter can take an input `1`, `2`, or `3` jolts lower than its rating and still produce its rated output joltage.
In addition, your device has a built-in joltage adapter rated for `3` jolts higher than the highest-rated adapter in your bag. Treat the charging outlet near your seat as having an effective joltage rating of `0`. Since you have some time to kill, you might as well test all of your adapters. Wouldn't want to get to your resort and realize you can't even charge your device! If you use every adapter in your bag at once, what is the distribution of joltage differences between the charging outlet, the adapters, and your device?
Find a chain that uses all of your adapters to connect the charging outlet to your device's built-in adapter and count the joltage differences between the charging outlet, the adapters, and your device. What is the number of 1-jolt differences multiplied by the number of 3-jolt differences?

#### Part 2
To completely determine whether you have enough adapters, you'll need to figure out how many different ways they can be arranged. Every arrangement needs to connect the charging outlet to your device. The previous rules about when adapters can successfully connect still apply. You glance back down at your bag and try to remember why you brought so many adapters; there must be more than a trillion valid ways to arrange them! Surely, there must be an efficient way to count the arrangements. What is the total number of distinct ways you can arrange the adapters to connect the charging outlet to your device?

---

## Day 11: Seating System
#### Part 1
Your plane lands with plenty of time to spare. The final leg of your journey is a ferry that goes directly to the tropical island where you can finally start your vacation. As you reach the waiting area to board the ferry, you realize you're so early, nobody else has even arrived yet! By modeling the process people use to choose (or abandon) their seat in the waiting area, you're pretty sure you can predict the best place to sit. You make a quick map of the seat layout (your puzzle input).
The seat layout fits neatly on a grid. Each position is either floor (`.`), an empty seat (`L`), or an occupied seat (`#`).
Now, you just need to model the people who will be arriving shortly. Fortunately, people are entirely predictable and always follow a simple set of rules. All decisions are based on the number of occupied seats adjacent to a given seat (one of the eight positions immediately up, down, left, right, or diagonal from the seat). The following rules are applied to every seat simultaneously:

- If a seat is empty (`L`) and there are no occupied seats adjacent to it, the seat becomes occupied.
- If a seat is occupied (`#`) and four or more seats adjacent to it are also occupied, the seat becomes empty.
- Otherwise, the seat's state does not change.

Floor (`.`) never changes; seats don't move, and nobody sits on the floor.
Simulate your seating area by applying the seating rules repeatedly until no seats change state. How many seats end up occupied?

#### Part 2
As soon as people start to arrive, you realize your mistake. People don't just care about adjacent seats - they care about the first seat they can see in each of those eight directions! Now, instead of considering just the eight immediately adjacent seats, consider the first seat in each of those eight directions. Also, people seem to be more tolerant than you expected: it now takes five or more visible occupied seats for an occupied seat to become empty (rather than four or more from the previous rules). The other rules still apply: empty seats that see no occupied seats become occupied, seats matching no rule don't change, and floor never changes.
Given the new visibility method and the rule change for occupied seats becoming empty, once equilibrium is reached, how many seats end up occupied?

---

## Day 12: Rain Risk
#### Part 1
Your ferry made decent progress toward the island, but the storm came in faster than anyone expected. The ferry needs to take evasive actions! Unfortunately, the ship's navigation computer seems to be malfunctioning; rather than giving a route directly to safety, it produced extremely circuitous instructions. When the captain uses the PA system to ask if anyone can help, you quickly volunteer. The navigation instructions (your puzzle input) consists of a sequence of single-character actions paired with integer input values. After staring at them for a few minutes, you work out what they probably mean:

- Action `N` means to move north by the given value.
- Action `S` means to move south by the given value.
- Action `E` means to move east by the given value.
- Action `W` means to move west by the given value.
- Action `L` means to turn left the given number of degrees.
- Action `R` means to turn right the given number of degrees.
- Action `F` means to move forward by the given value in the direction the ship is currently facing.

The ship starts by facing east. Only the `L` and `R` actions change the direction the ship is facing. Figure out where the navigation instructions lead. What is the Manhattan distance between that location and the ship's starting position?

#### Part 2
Before you can give the destination to the captain, you realize that the actual action meanings were printed on the back of the instructions the whole time. Almost all of the actions indicate how to move a waypoint which is relative to the ship's position:

- Action `N` means to move the waypoint north by the given value.
- Action `S` means to move the waypoint south by the given value.
- Action `E` means to move the waypoint east by the given value.
- Action `W` means to move the waypoint west by the given value.
- Action `L` means to rotate the waypoint around the ship left (counter-clockwise) the given number of degrees.
- Action `R` means to rotate the waypoint around the ship right (clockwise) the given number of degrees.
- Action `F` means to move forward to the waypoint a number of times equal to the given value.

The waypoint starts `10` units east and `1` unit north relative to the ship. The waypoint is relative to the ship; that is, if the ship moves, the waypoint moves with it. Figure out where the navigation instructions actually lead. What is the Manhattan distance between that location and the ship's starting position?

---

## Day 13: Shuttle Search
#### Part 1
Your ferry can make it safely to a nearby port, but it won't get much further. When you call to book another ship, you discover that no ships embark from that port to your vacation island. You'll need to get from the port to the nearest airport. Fortunately, a shuttle bus service is available to bring you from the sea port to the airport! Each bus has an ID number that also indicates how often the bus leaves for the airport. Bus schedules are defined based on a timestamp that measures the number of minutes since some fixed reference point in the past. At timestamp `0`, every bus simultaneously departed from the sea port. After that, each bus travels to the airport, then various other locations, and finally returns to the sea port to repeat its journey forever. The time this loop takes a particular bus is also its ID number: the bus with ID `5` departs from the sea port at timestamps `0`, `5`, `10`, `15`, and so on. The bus with ID `11` departs at `0`, `11`, `22`, `33`, and so on. If you are there when the bus departs, you can ride that bus to the airport! Your notes (your puzzle input) consist of two lines. The first line is your estimate of the earliest timestamp you could depart on a bus. The second line lists the bus IDs that are in service according to the shuttle company; entries that show `x` must be out of service, so you decide to ignore them. To save time once you arrive, your goal is to figure out the earliest bus you can take to the airport. (There will be exactly one such bus.) What is the ID of the earliest bus you can take to the airport multiplied by the number of minutes you'll need to wait for that bus?

#### Part 2
The shuttle company is running a contest: one gold coin for anyone that can find the earliest timestamp such that the first bus ID departs at that time and each subsequent listed bus ID departs at that subsequent minute. (The first line in your input is no longer relevant.) An `x` in the schedule means there are no constraints on what bus IDs must depart at that time. The only bus departures that matter are the listed bus IDs at their specific offsets from `t`. Those bus IDs can depart at other times, and other bus IDs can depart at those times. What is the earliest timestamp such that all of the listed bus IDs depart at offsets matching their positions in the list?

---

## Day 14: Docking Data
#### Part 1
As your ferry approaches the sea port, the captain asks for your help again. The computer system that runs this port isn't compatible with the docking program on the ferry, so the docking parameters aren't being correctly initialized in the docking program's memory. After a brief inspection, you discover that the sea port's computer system uses a strange bitmask system in its initialization program. Although you don't have the correct decoder chip handy, you can emulate it in software! The initialization program (your puzzle input) can either update the bitmask or write a value to memory. Values and memory addresses are both 36-bit unsigned integers. The bitmask is always given as a string of `36` bits, written with the most significant bit (representing `2^35`) on the left and the least significant bit (`2^0`, that is, the `1`s bit) on the right. The current bitmask is applied to values immediately before they are written to memory: a `0` or `1` overwrites the corresponding bit in the value, while an `X` leaves the bit in the value unchanged. To initialize your ferry's docking program, you need the sum of all values left in memory after the initialization program completes. (The entire 36-bit address space begins initialized to the value 0 at every address.) Execute the initialization program. What is the sum of all values left in memory after it completes?

#### Part 2
For some reason, the sea port's computer system still can't communicate with your ferry's docking program. It must be using version 2 of the decoder chip! A version 2 decoder chip doesn't modify the values being written at all. Instead, it acts as a memory address decoder. Immediately before a value is written to memory, each bit in the bitmask modifies the corresponding bit of the destination memory address in the following way:

- If the bitmask bit is `0`, the corresponding memory address bit is unchanged.
- If the bitmask bit is `1`, the corresponding memory address bit is overwritten with `1`.
- If the bitmask bit is `X`, the corresponding memory address bit is floating.

A floating bit is not connected to anything and instead fluctuates unpredictably. In practice, this means the floating bits will take on all possible values, potentially causing many memory addresses to be written all at once! The entire 36-bit address space still begins initialized to the value `0` at every address, and you still need the sum of all values left in memory at the end of the program. Execute the initialization program using an emulator for a version 2 decoder chip. What is the sum of all values left in memory after it completes?

---

## Day 15: Rambunctious Recitation
#### Part 1
You catch the airport shuttle and try to book a new flight to your vacation island. Due to the storm, all direct flights have been cancelled, but a route is available to get around the storm. You take it. While you wait for your flight, you decide to check in with the Elves back at the North Pole. They're playing a memory game and are ever so excited to explain the rules! In this game, the players take turns saying numbers. They begin by taking turns reading from a list of starting numbers (your puzzle input). Then, each turn consists of considering the most recently spoken number:

- If that was the first time the number has been spoken, the current player says `0`.
- Otherwise, the number had been spoken before; the current player announces how many turns apart the number is from when it was previously spoken.

So, after the starting numbers, each turn results in that player speaking aloud either `0` (if the last number is new) or an age (if the last number is a repeat). (The game ends when the Elves get sick of playing or dinner is ready, whichever comes first.)
Their question for you is: what will be the `2020th` number spoken?

#### Part 2
Impressed, the Elves issue you a challenge: determine the `30000000th` number spoken. Given your starting numbers, what will be the `30000000th` number spoken?

---

## Day 16: Ticket Translation
#### Part 1
As you're walking to yet another connecting flight, you realize that one of the legs of your re-routed trip coming up is on a high-speed train. However, the train ticket you were given is in a language you don't understand. You should probably figure out what it says before you get to the train station after the next flight. Unfortunately, you can't actually read the words on the ticket. You can, however, read the numbers, and so you figure out the fields these tickets must have and the valid ranges for values in those fields. You collect the rules for ticket fields, the numbers on your ticket, and the numbers on other nearby tickets for the same train service (via the airport security cameras) together into a single document you can reference (your puzzle input).
The rules for ticket fields specify a list of fields that exist somewhere on the ticket and the valid ranges of values for each field. For example, a rule like `class: 1-3 or 5-7` means that one of the fields in every ticket is named `class` and can be any value in the ranges `1-3` or `5-7` (inclusive, such that `3` and `5` are both valid in this field, but `4` is not). Each ticket is represented by a single line of comma-separated values. The values are the numbers on the ticket in the order they appear; every ticket has the same format: the first number is always the same specific field, the second number is always a different specific field, and so on - you just don't know what each position actually means! Start by determining which tickets are completely invalid; these are tickets that contain values which aren't valid for any field. Ignore your ticket for now. It doesn't matter which position corresponds to which field; you can identify invalid nearby tickets by considering only whether tickets contain values that are not valid for any field.
Adding together all of the invalid values produces your ticket scanning error rate. Consider the validity of the nearby tickets you scanned. What is your ticket scanning error rate?

#### Part 2
Now that you've identified which tickets contain invalid values, discard those tickets entirely. Use the remaining valid tickets to determine which field is which. Using the valid ranges for each field, determine what order the fields appear on the tickets. The order is consistent between all tickets: if seat is the third field, it is the third field on every ticket, including your ticket. Once you work out which field is which, look for the six fields on your ticket that start with the word departure. What do you get if you multiply those six values together?

---

## Day 17: Conway cubes
#### Part 1
As your flight slowly drifts through the sky, the Elves at the Mythical Information Bureau at the North Pole contact you. They'd like some help debugging a malfunctioning experimental energy source aboard one of their super-secret imaging satellites. The experimental energy source is based on cutting-edge technology: a set of Conway Cubes contained in a pocket dimension! When you hear it's having problems, you can't help but agree to take a look. The pocket dimension contains an infinite 3-dimensional grid. At every integer 3-dimensional coordinate (`x,y,z`), there exists a single cube which is either active or inactive. In the initial state of the pocket dimension, almost all cubes start inactive. The only exception to this is a small flat region of cubes (your puzzle input); the cubes in this region start in the specified active (`#`) or inactive (`.`) state. The energy source then proceeds to boot up by executing six cycles.
Each cube only ever considers its neighbors: any of the `26` other cubes where any of their coordinates differ by at most `1`. During a cycle, all cubes simultaneously change their state according to the following rules:

- If a cube is active and exactly `2` or `3` of its neighbors are also active, the cube remains active. Otherwise, the cube becomes inactive.
- If a cube is inactive but exactly `3` of its neighbors are active, the cube becomes active. Otherwise, the cube remains inactive.

The engineers responsible for this experimental energy source would like you to simulate the pocket dimension and determine what the configuration of cubes should be at the end of the six-cycle boot process. Even though the pocket dimension is 3-dimensional, this initial state represents a small 2-dimensional slice of it. Starting with your given initial configuration, simulate six cycles. How many cubes are left in the active state after the sixth cycle?

#### Part 2
For some reason, your simulated results don't match what the experimental energy source engineers expected. Apparently, the pocket dimension actually has four spatial dimensions, not three. The pocket dimension contains an infinite 4-dimensional grid. At every integer 4-dimensional coordinate (`x,y,z,w`), there exists a single cube (really, a hypercube) which is still either active or inactive. Each cube only ever considers its neighbors: any of the `80` other cubes where any of their coordinates differ by at most `1`. The initial state of the pocket dimension still consists of a small flat region of cubes. Furthermore, the same rules for cycle updating still apply: during each cycle, consider the number of active neighbors of each cube. Even though the pocket dimension is 4-dimensional, the initial state represents a small 2-dimensional slice of it.  Starting with your given initial configuration, simulate six cycles in a 4-dimensional space. How many cubes are left in the active state after the sixth cycle?

---

## Day 18: Operation Order
#### Part 1
As you look out the window and notice a heavily-forested continent slowly appear over the horizon, you are interrupted by the child sitting next to you. They're curious if you could help them with their math homework. Unfortunately, it seems like this "math" follows different rules than you remember. The homework (your puzzle input) consists of a series of expressions that consist of addition (`+`), multiplication (`*`), and parentheses (`(...)`). Just like normal math, parentheses indicate that the expression inside must be evaluated before it can be used by the surrounding expression. Addition still finds the sum of the numbers on both sides of the operator, and multiplication still finds the product. However, the rules of operator precedence have changed. Rather than evaluating multiplication before addition, the operators have the same precedence, and are evaluated left-to-right regardless of the order in which they appear. Before you can help with the homework, you need to understand it yourself. Evaluate the expression on each line of the homework; what is the sum of the resulting values?

#### Part 2
You manage to answer the child's questions and they finish part 1 of their homework, but get stuck when they reach the next section: advanced math. Now, addition and multiplication have different precedence levels, but they're not the ones you're familiar with. Instead, addition is evaluated before multiplication. What do you get if you add up the results of evaluating the homework problems using these new rules?


## Day 19: Monster Messages
#### Part 1
You land in an airport surrounded by dense forest. As you walk to your high-speed train, the Elves at the Mythical Information Bureau contact you again. They think their satellite has collected an image of a sea monster! Unfortunately, the connection to the satellite is having problems, and many of the messages sent back from the satellite have been corrupted. They sent you a list of the rules valid messages should obey and a list of received messages they've collected so far (your puzzle input). The rules for valid messages (the top part of your puzzle input) are numbered and build upon each other .Some rules, like `3: "b"`, simply match a single character (in this case, `b`). The remaining rules list the sub-rules that must be followed; for example, the rule `0: 1 2` means that to match rule `0`, the text being checked must match rule `1`, and the text after the part that matched rule `1` must then match rule `2`. Some of the rules have multiple lists of sub-rules separated by a pipe (`|`). This means that at least one list of sub-rules must match. For example, the rule `2: 1 3 | 3 1` means that to match rule `2`, the text being checked must match rule `1` followed by rule `3` or it must match rule `3` followed by rule `1`.
Fortunately, there are no loops in the rules, so the list of possible matches will be finite. The received messages (the bottom part of your puzzle input) need to be checked against the rules so you can determine which are valid and which are corrupted. Your goal is to determine the number of messages that completely match rule `0`. How many messages completely match rule `0`?

#### Part 2
As you look over the list of messages, you realize your matching rules aren't quite right. To fix them, completely replace rules `8: 42` and `11: 42 31` with the following:
```
8: 42 | 42 8
11: 42 31 | 42 11 31
```
This small change has a big impact: now, the rules do contain loops, and the list of messages they could hypothetically match is infinite. You'll need to determine how these changes affect which messages are valid. Fortunately, many of the rules are unaffected by this change; it might help to start by looking at which rules always match the same set of values and how those rules (especially rules `42` and `31`) are used by the new versions of rules `8` and `11`. (Remember, you only need to handle the rules you have; building a solution that could handle any hypothetical combination of rules would be significantly more difficult). After updating rules `8` and `11`, how many messages completely match rule `0`?

---

## Day 20: Jurassic Jigsaw
#### Part 1
The high-speed train leaves the forest and quickly carries you south. You can even see a desert in the distance! Since you have some spare time, you might as well see if there was anything interesting in the image the Mythical Information Bureau satellite captured. After decoding the satellite messages, you discover that the data actually contains many small images created by the satellite's camera array. The camera array consists of many cameras; rather than produce a single square image, they produce many smaller square image tiles that need to be reassembled back into a single image. Each camera in the camera array returns a single monochrome image tile with a random unique ID number. The tiles (your puzzle input) arrived in a random order. Worse yet, the camera array appears to be malfunctioning: each image tile has been rotated and flipped to a random orientation. Your first task is to reassemble the original image by orienting the tiles so they fit together. To show how the tiles should be reassembled, each tile's image data includes a border that should line up exactly with its adjacent tiles. All tiles have this border, and the border lines up exactly when the tiles are both oriented correctly. Tiles at the edge of the image also have this border, but the outermost edges won't line up with any other tiles.
To check that you've assembled the image correctly, multiply the IDs of the four corner tiles together. Assemble the tiles into an image. What do you get if you multiply together the IDs of the four corner tiles?

#### Part 2
Now, you're ready to check the image for sea monsters. The borders of each tile are not part of the actual image; start by removing them. Now, you're ready to search for sea monsters! Because your image is monochrome, a sea monster will look like this:
```
                  #
#    ##    ##    ###
 #  #  #  #  #  #   
```
When looking for this pattern in the image, the spaces can be anything; only the `#` need to match. Also, you might need to rotate or flip your image before it's oriented correctly to find sea monsters. Determine how rough the waters are in the sea monsters' habitat by counting the number of `#` that are not part of a sea monster.

---

## Day 21: Allergen Assessment
#### Part 1
You reach the train's last stop and the closest you can get to your vacation island without getting wet. There aren't even any boats here, but nothing can stop you now: you build a raft. You just need a few days' worth of food for your journey. You don't speak the local language, so you can't read any ingredients lists. However, sometimes, allergens are listed in a language you do understand. You should be able to use this information to determine which ingredient contains which allergen and work out which foods are safe to take with you on your trip. You start by compiling a list of foods (your puzzle input), one food per line. Each line includes that food's ingredients list followed by some or all of the allergens the food contains. Each allergen is found in exactly one ingredient. Each ingredient contains zero or one allergen. Allergens aren't always marked; when they're listed (as in `(contains nuts, shellfish)` after an ingredients list), the ingredient that contains each listed allergen will be somewhere in the corresponding ingredients list. However, even if an allergen isn't listed, the ingredient that contains that allergen could still be present: maybe they forgot to label it, or maybe it was labeled in a language you don't know.
The first step is to determine which ingredients can't possibly contain any of the allergens in any food in your list. Determine which ingredients cannot possibly contain any of the allergens in your list. How many times do any of those ingredients appear?

#### Part 2
Now that you've isolated the inert ingredients, you should have enough information to figure out which ingredient contains which allergen. Arrange the ingredients alphabetically by their allergen and separate them by commas to produce your canonical dangerous ingredient list. (There should not be any spaces in your canonical dangerous ingredient list). Time to stock your raft with supplies. What is your canonical dangerous ingredient list?

---

## Day 22: Crab Combat
#### Part 1
It only takes a few hours of sailing the ocean on a raft for boredom to sink in. Fortunately, you brought a small deck of space cards! You'd like to play a game of Combat, and there's even an opponent available: a small crab that climbed aboard your raft before you left. Fortunately, it doesn't take long to teach the crab the rules. Before the game starts, split the cards so each player has their own deck (your puzzle input). Then, the game consists of a series of rounds: both players draw their top card, and the player with the higher-valued card wins the round. The winner keeps both cards, placing them on the bottom of their own deck so that the winner's card is above the other card. If this causes a player to have all of the cards, they win, and the game ends.
Once the game ends, you can calculate the winning player's score. The bottom card in their deck is worth the value of the card multiplied by 1, the second-from-the-bottom card is worth the value of the card multiplied by 2, and so on. With 10 cards, the top card is worth the value on the card multiplied by 10. Play the small crab in a game of Combat using the two decks you just dealt. What is the winning player's score?

#### Part 2
You lost to the small crab! Fortunately, crabs aren't very good at recursion. To defend your honor as a Raft Captain, you challenge the small crab to a game of Recursive Combat. Recursive Combat still starts by splitting the cards into two decks (you offer to play with the same starting decks as before - it's only fair). Then, the game consists of a series of rounds with a few changes:

- Before either player deals a card, if there was a previous round in this game that had exactly the same cards in the same order in the same players' decks, the game instantly ends in a win for player 1. Previous rounds from other games are not considered. (This prevents infinite games of Recursive Combat, which everyone agrees is a bad idea.)
- Otherwise, this round's cards must be in a new configuration; the players begin the round by each drawing the top card of their deck as normal.
- If both players have at least as many cards remaining in their deck as the value of the card they just drew, the winner of the round is determined by playing a new game of Recursive Combat (see below).
- Otherwise, at least one player must not have enough cards left in their deck to recurse; the winner of the round is the player with the higher-value card.

As in regular Combat, the winner of the round (even if they won the round by winning a sub-game) takes the two cards dealt at the beginning of the round and places them on the bottom of their own deck (again so that the winner's card is above the other card). Note that the winner's card might be the lower-valued of the two cards if they won the round due to winning a sub-game. If collecting cards by winning the round causes a player to have all of the cards, they win, and the game ends. During a round of Recursive Combat, if both players have at least as many cards in their own decks as the number on the card they just dealt, the winner of the round is determined by recursing into a sub-game of Recursive Combat. To play a sub-game of Recursive Combat, each player creates a new deck by making a copy of the next cards in their deck (the quantity of cards copied is equal to the number on the card they drew to trigger the sub-game). During this sub-game, the game that triggered it is on hold and completely unaffected; no cards are removed from players' decks to form the sub-game. Defend your honor as Raft Captain by playing the small crab in a game of Recursive Combat using the same two decks as before. What is the winning player's score?

---

## Day 23: Crab Cups
#### Part 1
The small crab challenges you to a game! The crab is going to mix up some cups, and you have to predict where they'll end up. The cups will be arranged in a circle and labeled clockwise (your puzzle input). Before the crab starts, it will designate the first cup in your list as the current cup. The crab is then going to do `100` moves. Each move, the crab does the following actions:

- The crab picks up the three cups that are immediately clockwise of the current cup. They are removed from the circle; cup spacing is adjusted as necessary to maintain the circle.
- The crab selects a destination cup: the cup with a label equal to the current cup's label minus one. If this would select one of the cups that was just picked up, the crab will keep subtracting one until it finds a cup that wasn't just picked up. If at any point in this process the value goes below the lowest value on any cup's label, it wraps around to the highest value on any cup's label instead.
- The crab places the cups it just picked up so that they are immediately clockwise of the destination cup. They keep the same order as when they were picked up.
- The crab selects a new current cup: the cup which is immediately clockwise of the current cup.

After the crab is done, what order will the cups be in? Starting after the cup labeled `1`, collect the other cups' labels clockwise into a single string with no extra characters; each number except `1` should appear exactly once. Using your labeling, simulate `100` moves. What are the labels on the cups after cup `1`?

#### Part 2
Due to what you can only assume is a mistranslation (you're not exactly fluent in Crab), you are quite surprised when the crab starts arranging many cups in a circle on your raft - one million (`1000000`) in total. Your labeling is still correct for the first few cups; after that, the remaining cups are just numbered in an increasing fashion starting from the number after the highest number in your list and proceeding one by one until one million is reached. In this way, every number from one through one million is used exactly once. After discovering where you made the mistake in translating Crab Numbers, you realize the small crab isn't going to do merely `100` moves; the crab is going to do ten million (`10000000`) moves! The crab is going to hide your stars - one each - under the two cups that will end up immediately clockwise of cup `1`. You can have them if you predict what the labels on those cups will be when the crab is finished. Determine which two cups will end up immediately clockwise of cup `1`. What do you get if you multiply their labels together?

---

*Copyright 2020, Alessandro Sartori, problem statements taken from [adventofcode.com](https://adventofcode.com)*
