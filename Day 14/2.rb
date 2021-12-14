polymer = gets.strip.chars
$rules = Hash.new

gets
while line = gets
  a, b = line.strip.split ' -> '
  $rules[a] = b
end

$steps = 40
$freqs = Hash.new 0
$memo = Hash.new

def expand(a, b, level)
  if level == $steps
    return
  else
    memo_k = [a,b,level]
    if $memo.include? memo_k
      $memo[memo_k].each { |k, v| $freqs[k] += v }
    else
      f = $freqs.dup

      c = $rules[a+b]
      $freqs[c] += 1
      expand a, c, level + 1
      expand c, b, level + 1

      $memo[memo_k] = Hash.new 0
      f.each { |k, v| $memo[memo_k][k] = $freqs[k] - f[k] }
    end
  end
end

puts "Polymer: #{polymer.join ''}"
polymer.each { |c| $freqs[c] += 1 }

polymer.each_cons(2) do |a, b|
  expand a, b, 0
end

sol = $freqs.invert.sort
puts sol.last[0] - sol.first[0]
