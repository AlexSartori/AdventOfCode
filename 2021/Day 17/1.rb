coords = gets.split(': ')[1].split(', ')
x1, x2 = coords[0][2..].split('..').map &:to_i
y1, y2 = coords[1][2..].split('..').map &:to_i

puts "#{x1}..#{x2}   -   #{y1}..#{y2}"

# Target = (1+Vx)*(Vx/2) = Vx/2 + Vx^2/2
# Vx^2 + Vx - 2t = 0
# Vx[1,2] = (-1 +- \/[1 + 8t])/2 = {}

def vx(t)
    c = -2*t
    delta = Math.sqrt(1 - 4*c)
    return [(-1 + delta)/2, (-1 - delta)/2]
end


velocities_x = []
for v in (x1..x2).map{|t|vx(t)}.flatten
    velocities_x.append(v) if v % 1 == 0 and v > 0
end

vy = ([y1, y2].min + 1).abs
puts vy
max_y = (1+vy)*(vy/2.to_f)
puts max_y
