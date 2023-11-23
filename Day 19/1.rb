raw_blueprints = STDIN.read.split("\n")
input_regex = /Each ore robot costs ([0-9]+) ore. Each clay robot costs ([0-9]+) ore. Each obsidian robot costs ([0-9]+) ore and ([0-9]+) clay. Each geode robot costs ([0-9]+) ore and ([0-9]+) obsidian./

blueprints = raw_blueprints.to_h do |b|
    id, bp = b.split(": ")
    [id[9..].to_i, input_regex.match(bp).to_a[1..].map(&:to_i)]
end

ORE_ROBOT_PRICE_ORE = 0
CLAY_ROBOT_PRICE_ORE = 1
OBSIDIAN_ROBOT_PRICE_ORE = 2
OBSIDIAN_ROBOT_PRICE_CLAY = 3
GEODE_ROBOT_PRICE_ORE = 4
GEODE_ROBOT_PRICE_OBSIDIAN = 5

blueprints.each do |id, bp|
    puts "#{id}\n"
    puts "  Ore robot costs #{bp[ORE_ROBOT_PRICE_ORE]} ore\n"
    puts "  Clay robot costs #{bp[CLAY_ROBOT_PRICE_ORE]} ore\n"
    puts "  Obsidian robot costs #{bp[OBSIDIAN_ROBOT_PRICE_ORE]} ore and #{bp[OBSIDIAN_ROBOT_PRICE_CLAY]} clay\n"
    puts "  Geode robot costs #{bp[GEODE_ROBOT_PRICE_ORE]} ore and #{bp[GEODE_ROBOT_PRICE_OBSIDIAN]} obsidian\n"
end

blueprints.each do |id, bp|
    puts "Solving blueprint #{id}..."

    ore = 0
    clay = 0
    obsidian = 0
    geodes = 0

    ore_robots = 1
    clay_robots = 0
    obsidian_robots = 0
    geode_robots = 0

    minute = 1

    until minute == 25 do
        puts "    Minute #{minute}:"
        built_ore_robot = false
        built_clay_robot = false
        built_obsidian_robot = false
        built_geode_robot = false

        if ore >= bp[GEODE_ROBOT_PRICE_ORE] and obsidian >= bp[GEODE_ROBOT_PRICE_OBSIDIAN]
            ore -= bp[GEODE_ROBOT_PRICE_ORE]
            obsidian -= bp[GEODE_ROBOT_PRICE_OBSIDIAN]
            built_geode_robot = true
            puts "        Bought geode robot"
        end

        if ore >= bp[OBSIDIAN_ROBOT_PRICE_ORE] and clay >= bp[OBSIDIAN_ROBOT_PRICE_CLAY]
            ore -= bp[OBSIDIAN_ROBOT_PRICE_ORE]
            clay -= bp[OBSIDIAN_ROBOT_PRICE_CLAY]
            built_obsidian_robot = true
            puts "        Bought obsidian robot"
        end

        if ore >= bp[CLAY_ROBOT_PRICE_ORE]
            ore -= bp[CLAY_ROBOT_PRICE_ORE]
            built_clay_robot = true
            puts "        Bought clay robot"
        end

        if ore >= bp[ORE_ROBOT_PRICE_ORE]
            ore -= bp[ORE_ROBOT_PRICE_ORE]
            built_ore_robot = true
            puts "        Bought ore robot"
        end

        ore += ore_robots
        clay += clay_robots
        obsidian += obsidian_robots
        geodes += geode_robots

        ore_robots += 1 if built_ore_robot
        clay_robots += 1 if built_clay_robot
        obsidian_robots += 1 if built_obsidian_robot
        geode_robots += 1 if built_geode_robot

        puts "        Tot: #{ore} ore, #{clay} clay, #{obsidian} obsidian, #{geodes} geodes"

        minute += 1
    end

end