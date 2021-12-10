illegals = []
score_map = Hash[')' => 3, ']' => 57, '}' => 1197, '>' => 25137]

while line = gets
  stack = []

  line.strip.chars.each do |c|
    if ['(', '[', '{', '<'].include? c
      stack.append c
    elsif
        (c == ')' and stack[-1] == '(') or
        (c == ']' and stack[-1] == '[') or
        (c == '}' and stack[-1] == '{') or
        (c == '>' and stack[-1] == '<') then
      stack.pop
    else
      illegals.append c
      break
    end
  end
end

puts illegals.sum { |c| score_map[c] }
