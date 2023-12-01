stack, moves = STDIN.read.split("\n\n").map{ |l| l.split("\n") }
stack = stack.map(&:chars).transpose().map(&:reverse)
  .select{ |l| l[0] =~ /[0-9]/ }
  .map{ |l| l[1..].join.strip.chars }
moves = moves.map{ |m| /([0-9]+).+([0-9]+).+([0-9]+)/.match(m).captures.map &:to_i }

moves.each do |n, from, to|
  stack[to-1].push *(stack[from-1].pop n)
end

p stack.map{ |x| x[-1] }.join
