score_map = Hash[')' => 3, ']' => 57, '}' => 1197, '>' => 25137]
pairs = Hash['(' => ')', '[' => ']', '{' => '}', '<' => '>']
illegals = []

while line = gets
  illegals << line.strip.chars.reduce([]) { |s, c| (s.respond_to? 'upcase') ? s : ('([{<'.include? c) ? (s << c) : (pairs[s[-1]] == c ? (s.pop;s) : c) }
end

puts illegals.select { |i| i.respond_to? 'upcase' }.sum { |c| score_map[c] }
