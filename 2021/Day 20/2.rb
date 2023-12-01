$alg = gets.strip.chars
gets
map = []

while line = gets
  map.append line.strip.chars
end


def filter_map(map, it)
  h, w = map.length, map[0].length
  new_map = []

  for y in 0...(h+4)
    new_map << Array.new(w)
    for x in 0...(w+4)
      new_map[y][x] = filter_pixel(map, x-2, y-2, it)
    end
  end

  return new_map
end


def filter_pixel(map, x, y, it)
  h, w = map.length, map[0].length
  kernel = Array.new(3) { Array.new 3 }
  def_sym = it % 2 == 0 ? '.' : '#'

  for y_off in -1..1
    for x_off in -1..1
      yk, xk = 1 + y_off, 1 + x_off
      ym, xm = y + y_off, x + x_off
      px = (ym < 0 or ym >= h or xm < 0 or xm >= w) ? def_sym : map[ym][xm]
      kernel[yk][xk] = px
    end
  end

  idx = kernel.flatten.map{ |x| x == '.' ? '0' : '1' }.join.to_i(2)
  return $alg[idx]
end


def print_map(m)
  m.each { |r| puts r.join }
end


for it in 0..49
  puts "Enhancement ##{it}..."
  map = filter_map map, it
end

puts "Lit pixels: #{map.flatten.select{|x| x == '#'}.length}"
