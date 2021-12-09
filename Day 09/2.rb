require 'matrix'

$map = []

while line = gets
  $map.append line.strip.split('').map &:to_i
end

low_points = []
h, w = $map.length, $map[0].length
(0...h).each do |y|
  (0...w).each do |x|
    point = $map[y][x]
    if y > 0 and point >= $map[y-1][x] then next end # North
    if y < h-1 and point >= $map[y+1][x] then next end # South
    if x > 0 and point >= $map[y][x-1] then next end # West
    if x < w-1 and point >= $map[y][x+1] then next end # East
    low_points.append [x, y]
  end
end

$basins = Matrix.build(h, w) { |r, c| 0 }
$b_sizes = []
$b_idx = 1

def expand_basin (x, y)
  h, w, = $map.length, $map[0].length
  if $basins[y,x] == $b_idx or $map[y][x] == 9 then return 0 end

  $basins[y,x] = $b_idx
  size = 1

  size += expand_basin(x-1, y) if x > 0   and $map[y][x-1] != 9
  size += expand_basin(x+1, y) if x < w-1 and $map[y][x+1] != 9
  size += expand_basin(x, y-1) if y > 0   and $map[y-1][x] != 9
  size += expand_basin(x, y+1) if y < h-1 and $map[y+1][x] != 9

  return size
end

low_points.each do |x, y| 
  $b_sizes.append expand_basin x, y
  $b_idx += 1
end

puts $b_sizes.sort[-3..-1].reduce { |memo, n| memo * n }
