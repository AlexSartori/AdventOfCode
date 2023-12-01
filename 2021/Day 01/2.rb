lines = File.read('input').split.map &:to_i

n_increases = 0
win1, win2 = lines.take(3).sum, lines.drop(1).take(3).sum

(3...lines.length).each do |i|
  n_increases += 1 if win2 > win1
  win1 = win2
  win2 += lines[i] - lines[i-3]
end

puts n_increases
