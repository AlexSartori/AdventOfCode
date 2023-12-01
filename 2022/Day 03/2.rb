p STDIN.each_slice(3)
  .map{|g| g.map{|x|x.strip.chars}.reduce(&:intersection)[0]}
  .reduce(0){|s,c| s + (c > 'Z' ? c.ord-96 : c.ord-38)}

