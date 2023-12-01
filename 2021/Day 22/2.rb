class Cuboid
  @x1, @y1, @z1 = 0, 0, 0
  @x2, @y2, @z2 = 0, 0, 0
  attr_accessor :x1, :y1, :z1, :x2, :y2, :z2

  def initialize(x1, y1, z1, x2, y2, z2)
    @x1, @y1, @z1 = x1, y1, z1
    @x2, @y2, @z2 = x2, y2, z2
  end

  def hash
    [@x1, @x2, @y1, @y2, @z1, @z2].hash
  end
  def eql?(c2)
    c2.class == self.class and c2.hash == self.hash
  end

  def volume
    (@x2-@x1+1) * (@y2-@y1+1) * (@z2-@z1+1)
  end

  def to_s
    inspect
  end

  def inspect
    "<#{@x1},#{@y1},#{@z1} 🠖 #{@x2},#{@y2},#{@z2}>"
  end

  def intersect?(c2)
    # return (c2.x1 <= @x2 and c2.x2 >= @x1 and c2.y1 <= @y2 and c2.y2 >= @y1 and c2.z1 <= @z2 and c2.z2 >= @z1)
    # (@x1 >= c2.x1 or @x2 <= c2.x2) and (@y1 >= c2.y1 or @y2 <= c2.y2) and (@z1 >= c2.z1 or @z2 <= c2.z2)
    !(@x1 > c2.x2 or @x2 < c2.x1 or @y1 > c2.y2 or @y2 < c2.y1 or @z1 > c2.z2 or @z2 < c2.z1)
  end

  def intersect(c2)
    return nil unless intersect?(c2)

    x_int =  [@x1, c2.x1].max, [@x2, c2.x2].min
    y_int =  [@y1, c2.y1].max, [@y2, c2.y2].min
    z_int =  [@z1, c2.z1].max, [@z2, c2.z2].min
  
    return Cuboid.new x_int[0], y_int[0], z_int[0], x_int[1], y_int[1], z_int[1]
  end

  def subtract(c)
    return [self] unless intersect? c
    res = []

    # Left and right slices
    res << Cuboid.new(@x1,    @y1, @z1, c.x1-1, @y2, @z2) if @x1 < c.x1
    res << Cuboid.new(c.x2+1, @y1, @z1, @x2,    @y2, @z2) if @x2 > c.x2

    # Front and rear slices (minus R/L)
    res << Cuboid.new([@x1,c.x1].max, @y1,    @z1, [@x2,c.x2].min, c.y1-1, @z2) if @y1 < c.y1
    res << Cuboid.new([@x1,c.x1].max, c.y2+1, @z1, [@x2,c.x2].min, @y2,    @z2) if @y2 > c.y2

    # Top and bottom (minus F/R/R/L)
    res << Cuboid.new([@x1,c.x1].max, [@y1,c.y1].max, @z1, [@x2,c.x2].min, [@y2,c.y2].min, c.z1-1) if @z1 < c.z1
    res << Cuboid.new([@x1,c.x1].max, [@y1,c.y1].max, c.z2+1, [@x2,c.x2].min, [@y2,c.y2].min, @z2) if @z2 > c.z2
    
    return res
  end
end


init_proc = []

while line = gets
  state, coords = line.strip.split ' '
  coords = coords.split(',').map { |c| c[2..].split('..').map &:to_i }
  x, y, z = coords
  c = Cuboid.new x[0], y[0], z[0], x[1], y[1], z[1]
  # next if x[0] < -50 or x[1] > 50 or y[0] < -50 or y[1] > 50 or z[0] < -50 or z[1] > 50
  
  init_proc << [c, state]
end

on_cuboids = []

until init_proc.empty?
  cube, state = init_proc.shift
  puts "\nInstruction: #{state} #{cube}"
  
  if state == 'off'
    on_cuboids = on_cuboids.map { |c| c.intersect?(cube) ? c.subtract(cube) : c }.flatten
  else # state == 'on'
    new_pieces = [cube]
    on_cuboids.each do |c|
        new_pieces = new_pieces.map { |p| p.intersect?(c) ? p.subtract(c) : p }.flatten
    end
    on_cuboids.append *new_pieces
  end
  
  puts "   Total on: #{on_cuboids.sum{ |x| x.volume }}"
end

