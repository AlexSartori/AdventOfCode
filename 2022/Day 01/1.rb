p STDIN.read.split("\n\n").map{|v|v.split.map(&:to_i).sum}.sort.max

