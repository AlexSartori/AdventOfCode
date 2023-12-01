positions = gets.split(',').map(&:to_i)
fuels = positions.map { |pivot| positions.sum { |x| (pivot - x).abs } }
puts fuels.min
