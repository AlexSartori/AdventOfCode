lines = File.read('input').split.map &:to_i

last_n = nil
n_increases = 0

lines.each do |n|
  unless last_n.nil? then
    n_increases += 1 if n > last_n
  end

  last_n = n
end

puts n_increases
