p STDIN.each_line.select{ |l|
  a,b,c,d = l.split(/,|-/).map &:to_i
  not (b<c or a>d)
}.count
