x, z = 0, 0

while l = gets do
  dir, val = l.split
  if dir == 'forward' then x += val.to_i end
  if dir == 'down' then z += val.to_i end
  if dir == 'up' then z -= val.to_i end
end

puts "#{x}x#{z} = #{x*z}"
