x, z, aim = 0, 0, 0

while l = gets do
  dir, val = l.split
  if dir == 'down' then aim += val.to_i end
  if dir == 'up' then aim -= val.to_i end
  if dir == 'forward' then
    x += val.to_i
    z += aim*val.to_i
  end
end

puts "#{x}x#{z} = #{x*z}"
