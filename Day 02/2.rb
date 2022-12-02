p STDIN.read.split("\n").reduce(0) { |s,l|
  s + l.split.map(&:ord).reduce { |t1,t2|
    ch = ((t1-65) + (t2-88) + 2) % 3
    3*(t2-88) + (ch+1)
  }
}
