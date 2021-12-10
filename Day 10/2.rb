score_map = Hash[')' => 1, ']' => 2, '}' => 3, '>' => 4]
closing_map = Hash['(' => ')', '[' => ']', '{' => '}', '<' => '>']
completions = []

while line = gets
  stack = []
  legal_line = true

  line.strip.chars.each do |c|
    if ['(', '[', '{', '<'].include? c
      stack.append c
    elsif c == closing_map[stack[-1]]
      stack.pop
    else
      legal_line = false
      break
    end
  end

  if legal_line
    completions.append stack.reverse.map { |c| closing_map[c] }
  end
end

scores = completions.map { |comp|
  comp.reduce(0) { |memo, c| memo * 5 + score_map[c] }
}

puts scores.sort[scores.length/2]
