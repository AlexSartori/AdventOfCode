positions = gets.split(',').map(&:to_i)

fuels = positions.map {
  |pivot| positions.sum { |x|
    steps = (pivot - x).abs
    (steps*(1+steps)/2)
  }
}

puts fuels.min
