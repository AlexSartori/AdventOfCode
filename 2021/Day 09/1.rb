map = []

while line = gets
  map.append line.strip.split('').map &:to_i
end

low_points = []
h, w = map.length, map[0].length
(0...h).each do |y|
  (0...w).each do |x|
    point = map[y][x]
    if y > 0 and point >= map[y-1][x] then next end # North
    if y < h-1 and point >= map[y+1][x] then next end # South
    if x > 0 and point >= map[y][x-1] then next end # West
    if x < w-1 and point >= map[y][x+1] then next end # East
    low_points.append point
  end
end

puts low_points.sum { |risk| risk + 1 }
