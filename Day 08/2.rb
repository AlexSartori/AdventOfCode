map = []
while l = gets do
    map.append l.strip.chars.map &:to_i
end

$h, $w = map.size, map[0].size

def calc_score(map, y, x)
    score = 1
    
    # Up
    yi = y
    yi -= 1 until yi == 0 or (map[yi][x] >= map[y][x] and yi != y)
    puts "#{y-yi}"
    score *= y-yi
    
    # Down
    yi = y
    yi += 1 until yi == $h-1 or (map[yi][x] >= map[y][x] and yi != y)
    puts "#{yi-y}"
    score *= yi-y
    
    # Right
    xi = x
    xi += 1 until xi == $w-1 or (map[y][xi] >= map[y][x] and x != xi)
    puts "#{xi-x}"
    score *= xi-x
    
    # Left
    xi = x
    xi -= 1 until xi == 0 or (map[y][xi] >= map[y][x] and x != xi)
    puts "#{x-xi}"
    score *= x-xi
    
    puts "==> #{score}"
    return score
end

max_s = 0
for y in 0...$h do
    for x in 0...$w do
        puts "   x:#{x}, y:#{y}"
        s = calc_score map, y, x
        max_s = s if s > max_s
    end
end

puts "\n\n#{max_s}"
