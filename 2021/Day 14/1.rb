polymer = gets.strip.chars
rules = Hash.new

gets
while line = gets
  a, b = line.strip.split ' -> '
  rules[a] = b
end

(0...10).each do |step|
  new_poly = []
  polymer.each_cons(2) do |a, b|
    new_poly += [a, rules[[a,b].join'']]
  end
  new_poly.append polymer.last
  polymer = new_poly
end

freqs = Hash.new 0
polymer.each do |c|
  freqs[c] += 1
end

sol = freqs.invert.sort
puts sol.last[0] - sol.first[0]
