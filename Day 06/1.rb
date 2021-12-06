fish = gets.split(',').map &:to_i

(0..79).each do |day|
  fish.append *([9] * fish.count(0))
  fish.map! { |f| f == 0 ? 6 : f - 1 }
end

puts fish.length
