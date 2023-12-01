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
  puts "Lvl: #{lvl} " + ' '*(lvl*1) + 'In: ' + pair_to_str(p) + " #{l_add} #{r_add}"
  ret = nil

  if p.respond_to?('odd?')
    if p < 10
      x = p + l_add + r_add
      ret = x < 10 ? [x, 0, 0] : reduce(x, 0, 0, lvl)
    else
      x = (p + l_add + r_add).to_f/2
      # puts "Lvl: #{lvl} " + ' '*(lvl*1) + "Splitting"
      ret = reduce(Pair.new(x.floor, x.ceil), 0, 0, lvl)
    end
  elsif p.r.respond_to?('odd?') and p.l.respond_to?('odd?') and lvl >= 4
    puts "Lvl: #{lvl} " + ' '*(lvl*1) + "Exploding"
    ret = [0, p.l + l_add, p.r + r_add]
  else
    a, b = p.l, p.r
    _l1, _r1, _l2, _r2 = 0, 0, 0, 0
    l_ret, r_ret = 0, 0

    begin
      puts '        ' + ' '*lvl + '---'
      a, _l1, _r1 = reduce a, l_add, _l2, lvl+1
      b, _l2, _r2 = reduce b, _r1, r_add, lvl+1
      puts ' '*lvl + "        a: #{pair_to_str a}  /  b: #{pair_to_str b}"
      l_ret += _l1
      r_ret += _r2
      l_add = r_add = 0
    end until _r1 == 0 and _l2 == 0

   ret = Pair.new(a, b), l_ret, r_ret
  end

  puts ' '*lvl + "       Returning: #{pair_to_str ret[0]} #{ret[1]} #{ret[2]}"
  return ret
end

def pair_to_str(p)
  (p.respond_to? 'odd?') ? p.to_s : ('[' + pair_to_str(p.l) +',' + pair_to_str(p.r) + ']')
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
