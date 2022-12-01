$amph_to_hall = Hash['A' => 0, 'B' => 1, 'C' => 2, 'D' => 3]
$halls = ['A' => ['B', 'C'], 'B' => ['D', 'B'], 'C' => ['A', 'D'], 'D' => ['C', 'A']]
$corridor = ('.'*11).chars
$moving_costs = Hash['A' => 1, 'B' => 10, 'C' => 100, 'D' => 1000]
$min_cost = nil

TOP, BOT = 1, 0
A, B, C, D = 0, 1, 2, 3

def p_h
  puts "  |#{$corridor.join}|"
  puts "    |#{$halls[A][TOP]}|#{$halls[B][TOP]}|#{$halls[C][TOP]}|#{$halls[D][TOP]}|"
  puts "    |#{$halls[A][BOT]}|#{$halls[B][BOT]}|#{$halls[C][BOT]}|#{$halls[D][BOT]}|"
end

def backtrack()
  to_move = nil
  for h in 'ABCD'.chars
    if $halls[TOP] != h
      to_move = [h, TOP]
    elsif $halls[TOP] == '.' and $halls[BOT] == h
      to_move = [h, BOT]
    end
  end

  return 0 if to_move.nil?

  min = nil


end

backtrack
