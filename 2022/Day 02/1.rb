p STDIN.read.split("\n").reduce(0) { |s,l|
  l.split.map(&:ord).reduce { |t1,t2|
    res = ((t2-88)-(t1-65)+1) % 3
    t2-87+res*3
  } + s
}
