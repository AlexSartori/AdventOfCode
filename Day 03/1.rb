columns = gets.strip.chars

while line = gets do
  line.strip.chars.each_with_index do |c, i|
    columns[i] += c
  end
end

gamma, epsilon = '', ''

columns.each do |col|
  if col.count('1') >= col.count('0')
    gamma += '1'
    epsilon += '0'
  else
    gamma += '0'
    epsilon += '1'
  end
end

puts "#{gamma} x #{epsilon}"
gamma, epsilon = gamma.to_i(2), epsilon.to_i(2)
puts "#{gamma}x#{epsilon} = #{gamma*epsilon}"
