res = 0

while line = gets
  patterns, output = line.strip.split('|').map &:split
  res += output.select { |x| [2, 4, 3, 7].include? x.length }.length
end

puts res
