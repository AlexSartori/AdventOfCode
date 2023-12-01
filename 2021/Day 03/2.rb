lines = []
while l = gets do lines.append l.strip end

def count_in_col (lines, idx, char)
  columns = lines[0].chars

  lines.drop(1).each do |line|
    line.chars.each_with_index do |c, i|
      columns[i] += c
    end
  end
  
  return columns[idx].count char
end

oxygen, co2 = 0, 0

tmp = lines.map do |x| x.dup end
bit_idx = 0
while tmp.length > 1 do
  bit = count_in_col(tmp, bit_idx, '1') >= count_in_col(tmp, bit_idx, '0') ? '1' : '0'
  tmp = tmp.select { |x| x[bit_idx] == bit }
  bit_idx += 1
end
oxygen = tmp[0].to_i(2)

tmp = lines.map do |x| x.dup end
bit_idx = 0
while tmp.length > 1 do
  bit = count_in_col(tmp, bit_idx, '0') <= count_in_col(tmp, bit_idx, '1') ? '0' : '1'
  tmp = tmp.select { |x| x[bit_idx] == bit }
  bit_idx += 1
end
co2 = tmp[0].to_i(2)

puts "#{oxygen}x#{co2} = #{oxygen*co2}"
