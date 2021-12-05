class Segment
  attr_accessor :x1, :y1, :x2, :y2
  def initialize(x1, y1, x2, y2)
    @x1 = x1
    @y1 = y1
    @x2 = x2
    @y2 = y2
  end
end


segments = []
max_x, max_y = 0, 0

while line = gets do
  a, b = line.strip.split ' -> '
  x1, y1 = a.split(',').map &:to_i
  x2, y2 = b.split(',').map &:to_i
  segments.append(Segment.new x1, y1, x2, y2)

  max_x = [max_x, x1, x2].max
  max_y = [max_y, y1, y2].max
end

map = Array.new(max_y+1) { Array.new(max_x+1, 0) }
overlaps = 0

segments.each do |seg|
  x1, y1, x2, y2 = seg.x1, seg.y1, seg.x2, seg.y2
  n_points = [(x2 - x1).abs, (y2 - y1).abs].max
  x_points = x1 < x2 ? x1.upto(x2) : x1.downto(x2)
  x_points = x_points.to_a*(n_points+1) if x1 == x2
  y_points = y1 < y2 ? y1.upto(y2) : y1.downto(y2)
  
  x_points.zip(y_points).each do |x, y|
    x = seg.x1 if x.nil?
    y = seg.y1 if y.nil?
    map[y][x] += 1
    overlaps += 1 if map[y][x] == 2
  end
end

puts overlaps
