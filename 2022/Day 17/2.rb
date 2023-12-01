CHAMBER_W = 7
N_STEPS = 1000000000000

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
cache = Hash.new
add_to_final_h = nil


def print_chamber chamber
    puts "\n"
    
    chamber.each_with_index do |chamber_line, y|
        chamber_line.each_with_index do |cell, x|
            print cell.gsub('.', '.').gsub('#', '█')
        end
        print "\n"
        puts chamber_line.join('').gsub('.', '.').gsub('#', '█')
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
    
    # Find first non-empty row
    needed_space = 3 + rh
    nonempty_y = 0
    nonempty_y += 1 until chamber[nonempty_y].include? '#'
    
    # Create space for the new rock
    (0...(needed_space - nonempty_y)).each do |_|
        chamber = [['.']*CHAMBER_W] + chamber 
    end
    ry = nonempty_y - needed_space if nonempty_y > needed_space
    
    
    falling = true
    while falling do
        # Check pushes
        push = pushes[push_idx]
        push_idx = (push_idx + 1) % pushes.size
        rx -= 1 if push == '<' and rx > 0 and not rock_collides?(chamber, rock, ry, rx-1)
        rx += 1 if push == '>' and rx+rw < CHAMBER_W and not rock_collides?(chamber, rock, ry, rx+1)
        
        # Fall down one unit
        if rock_collides? chamber, rock, ry+1, rx
            falling = false
        else
            ry += 1
        end
    end
    
    # Lay rock in the chamber
    (0...rh).each do |ry_test|
        (0...rw).each do |rx_test|
            chamber[ry+ry_test][rx+rx_test] = rock[ry_test][rx_test] if rock[ry_test][rx_test] == '#'
        end
    end
    
    step += 1
    
    
    # Check cache
    next if step < 10
    nonempty_y = 0
    nonempty_y += 1 until chamber[nonempty_y].include? '#'
    key = [chamber[nonempty_y..(nonempty_y+8)].join(''), rock_idx, push_idx]
    
    if cache.has_key? key
        puts "Loop found: #{key}"
        steps_before_loop, h_at_loop_start = cache[key]
        curr_step, curr_h = step, chamber.size - nonempty_y - 1  # -1 => the floor
        loop_steps_len = curr_step - steps_before_loop
        loop_reps = ((N_STEPS - steps_before_loop)/(loop_steps_len)).floor
        loop_h = curr_h - h_at_loop_start
        step = steps_before_loop + (loop_steps_len * loop_reps)
        puts "Curr step: #{curr_step} - skipping to step: #{step}"
        add_to_final_h = loop_h * (loop_reps - 1)
        cache.clear
    else
        cache[key] = [step, (chamber.size-1) - nonempty_y]
    end
end

nonempty_y = 0
nonempty_y += 1 until chamber[nonempty_y].include? '#'
puts (chamber.size - nonempty_y - 1) + add_to_final_h

