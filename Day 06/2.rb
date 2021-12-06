fish = Hash.new(0)
gets.split(',').map(&:to_i).each { |v| fish[v] += 1 }

(0..255).each do |day|
  fish[9] = fish[0]
  fish[7] += fish[0]
  fish[0] = 0

  (0..8).each { |i| fish[i] = fish[i + 1] }
  
  fish[9] = 0
end

puts fish.values.sum
