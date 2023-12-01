$segs_to_n = Hash[
  'abcefg' => 0,
  'cf' => 1,
  'acdeg' => 2,
  'acdfg' => 3,
  'bcdf' => 4,
  'abdfg' => 5,
  'abdefg' => 6,
  'acf' => 7,
  'abcdefg' => 8,
  'abcdfg' => 9
]

def decode_outputs(p, o)
  decoder = nil

  'abcdefg'.split('').permutation.each do |mapping|
    mapping = mapping.join ''
    mapping_ok = true

    (p + o).each do |symbol|
      translated = symbol.tr_s('abcdefg', mapping).chars.sort.join ''
      unless $segs_to_n.include? translated
        mapping_ok = false
        break
      end
    end

    decoder = mapping if mapping_ok
  end

  res = 0
  o.each_with_index do |segs, idx|
    translated = segs.tr_s('abcdefg', decoder).chars.sort.join ''
    res += $segs_to_n[translated] * 10**(o.length-1-idx)
  end

  return res
end


sum = 0
while line = gets
  patterns, output = line.strip.split('|').map &:split
  x = decode_outputs patterns, output
  sum += x
  puts "Entry: #{x} Sum: #{sum}"
end

puts sum
