class Pair
  @l, @r = 0, 0
  attr_accessor :l, :r
  def initialize(l, r)
    @l, @r = l, r
  end
end

def str_to_pair(str, idx)
  if str[idx].ord >= '0'.ord and str[idx].ord <= '9'.ord
    return str[idx].to_i, idx+1
  elsif str[idx] == '['
    a, idx = str_to_pair str, idx+1
    b, idx = str_to_pair str, idx+1
    p = Pair.new a, b
    return p, idx+1
  else
    puts "Parse error, unexpected character: #{str[idx]}"
  end
end

def reduce(p, l_add, r_add, lvl)
  puts "Lvl: #{lvl} " + ' '*(lvl*2) + "In: #{l_add} -> " + pair_to_str(p) + " <- #{r_add}"
  ret = nil

  if p.respond_to?('odd?')
    if p < 10
      x = p + l_add + r_add
      ret = x < 10 ? [x, 0, 0] : reduce(x, 0, 0, lvl)
    else
      x = (p + l_add + r_add).to_f/2
      puts "Lvl: #{lvl} " + ' '*(lvl*2) + "Splitting"
      ret = reduce(Pair.new(x.floor, x.ceil), 0, 0, lvl)
    end
  elsif p.r.respond_to?('odd?') and p.l.respond_to?('odd?') and lvl >= 4
    puts "Lvl: #{lvl} " + ' '*(lvl*2) + "Exploding [#{p.l+l_add},#{p.r+r_add}]"
    ret = [0, p.l + l_add, p.r + r_add]
  else
    a, _l1, _r1 = reduce(p.l, l_add, 0, lvl+1)
    b, _l2, _r2 = reduce(p.r, _r1, r_add, lvl+1)
    a, _l1, _r1 = reduce(a, 0, _l2, lvl+1) if _l2 != 0
    puts ' '*(lvl*2) + "       a: #{pair_to_str a}  /  b: #{pair_to_str b}"
    ret = [Pair.new(a, b), _l1, _r2]
  end

  puts ' '*(lvl*2) + "       Returning: #{ret[1]} <- #{pair_to_str ret[0]} -> #{ret[2]}"
  return ret
end

def pair_to_str(p)
  (p.respond_to? 'odd?') ? p.to_s : ('[' + pair_to_str(p.l) + ',' + pair_to_str(p.r) + ']')
end

def magnitude(p)
  if p.respond_to? 'odd?'
    return p
  else
    return magnitude(p.l)*3 + magnitude(p.r)*2
  end
end

p = str_to_pair(gets.strip, 0)[0]
while line = gets
   p = Pair.new(p, str_to_pair(line.strip, 0)[0])
end

puts "Pair: #{pair_to_str p}"
red, x, y = reduce p, 0, 0, 0
puts "Reduced: #{pair_to_str red}"
puts "Magnitude: #{magnitude red}"
