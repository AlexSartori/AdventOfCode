p STDIN.each_line.select{ |l|
  a,b,c,d = l.split(/,|-/).map &:to_i
  (a>=c and b<=d) or (a<=c and b>=d)
}.count
