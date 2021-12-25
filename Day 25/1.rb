grid = []
grid2 = []
while line = gets
  grid << line.strip.chars
  grid2 << line.strip.chars
end

def p_g(g)
  g.each { |r| puts r.join }
end

h, w = grid.size, grid[0].size
step = 0

while true
  puts "Step: #{step}"
  still = true

  for dir in ['e', 's']
    for y in (0...h)
      for x in (0...w)
        if dir == 'e' and grid[y][x] == '>'
          if x+1 < w and grid[y][x+1] == '.'
            grid2[y][x+1] = '>'
            grid2[y][x] = '.'
            still = false
          elsif x == w-1 and grid[y][0] == '.'
            grid2[y][0] = '>'
            grid2[y][x] = '.'
            still = false
          else
            grid2[y][x] = '>'
          end
        elsif dir == 's' and grid[y][x] == 'v'
          if y+1 < h and grid[y+1][x] == '.'
            grid2[y+1][x] = 'v'
            grid2[y][x] = '.'
            still = false
          elsif y == h-1 and grid[0][x] == '.'
            grid2[0][x] = 'v'
            grid2[y][x] = '.'
            still = false
          end
        else
          grid2[y][x] = grid[y][x] if grid2[y][x] == '.'
        end
      end
    end
    grid = grid2.map {|r| r.dup}
  end

  step += 1
  
  if still
    puts "\nFinished moving at step #{step}:"
    p_g grid
    break
  end
end
