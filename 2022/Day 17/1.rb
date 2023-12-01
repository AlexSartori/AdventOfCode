CHAMBER_W = 7
N_STEPS = 2022

pushes = gets.strip.chars
rocks = [
    ['####'.chars],
    ['.#.'.chars,
     '###'.chars,
     '.#.'.chars],
    ['..#'.chars,
     '..#'.chars,
     '###'.chars],
    ['#'.chars,
     '#'.chars,
     '#'.chars,
     '#'.chars],
    ['##'.chars,
     '##'.chars]
]
chamber = [['#']*CHAMBER_W]


def print_chamber chamber, rock, ry, rx
    puts "\n"
    rh, rw = rock.size, rock[0].size
    
    chamber.each_with_index do |chamber_line, y|
        if y >= ry and y < ry + rh
            rock_line = rock[y-ry]
            chamber_line.each_with_index do |cell, x|
                if x < rx or x >= rx+rw
                    print cell.gsub('.', '.').gsub('#', '█')
                else
                    print rock_line[x-rx].gsub('.', '.').gsub('#', '▒') if rock_line[x-rx] == '#'
                end
            end
            print "\n"
        else
            puts chamber_line.join('').gsub('.', '.').gsub('#', '█')
        end
    end
end


def rock_collides? chamber, rock, ry, rx
    rh, rw = rock.size, rock[0].size
    
    (0...rh).each do |ry_test|
        (0...rw).each do |rx_test|
            if rock[ry_test][rx_test] == '#' and chamber[ry+ry_test][rx+rx_test] == '#'
                return true
            end
        end
    end
    
    return false
end


step = 0
push_idx = 0
rock_idx = 0

while step < N_STEPS do
    rock = rocks[rock_idx]
    rock_idx = (rock_idx + 1) % rocks.size
    
    # Rock coords, h, and w
    rx, ry = 2, 0
    rh, rw = rock.size, rock[0].size
    
    # Create space for the new rock
    needed_space = 3 + rh
    nonempty_y = 0
    nonempty_y += 1 until chamber[nonempty_y].include? '#'
    (0...(needed_space - nonempty_y)).each do |_|
        chamber = [['.']*CHAMBER_W] + chamber 
    end
    ry = nonempty_y - needed_space if nonempty_y > needed_space
    
    # Draw chamber & rock
    if step % 1000 == 0
        print_chamber chamber, rock, ry, rx
        sleep(0.3)
    end
    
    falling = true
    while falling do
        # Check pushes
        push = pushes[push_idx]
        push_idx = (push_idx + 1) % pushes.size
        # puts "          Push: #{push}"
        rx -= 1 if push == '<' and rx > 0 and not rock_collides?(chamber, rock, ry, rx-1)
        rx += 1 if push == '>' and rx+rw < CHAMBER_W and not rock_collides?(chamber, rock, ry, rx+1)
        
        # print_chamber chamber, rock, ry, rx
        # sleep(0.1)
        
        # Fall down one unit
        if rock_collides? chamber, rock, ry+1, rx
            falling = false
        else
            ry += 1
            # print_chamber chamber, rock, ry, rx
            # sleep(0.1)
        end
        
        if not falling
            # Lay rock in the chamber
            (0...rh).each do |ry_test|
                (0...rw).each do |rx_test|
                    chamber[ry+ry_test][rx+rx_test] = rock[ry_test][rx_test] if rock[ry_test][rx_test] == '#'
                end
            end
            
            step += 1
        end
    end
end

nonempty_y = 0
nonempty_y += 1 until chamber[nonempty_y].include? '#'
puts (chamber.size - 1) - nonempty_y

