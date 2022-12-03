p STDIN.each_line
  .map{|l| l.strip.chars.each_slice(l.size/2).reduce(&:intersection)[0]}
  .reduce(0){|s,c| s + (c > 'Z' ? c.ord-96 : c.ord-38)}

