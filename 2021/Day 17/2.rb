require 'set'

coords = gets.split(': ')[1].split(', ')
$x1, $x2 = coords[0][2..].split('..').map &:to_i
$y1, $y2 = coords[1][2..].split('..').map &:to_i

# Target = (1+Vx)*(Vx/2) = Vx/2 + Vx^2/2
# Vx^2 + Vx - 2t = 0
# Vx[1,2] = (-1 +- \/[1 + 8t])/2 = {}

def target(vx)
    return (1+vx)*(vx/2)
end

$valid_vxs = Set.new
def check_vx(vx)
    v, x, steps = vx, vx, 1
    while x <= $x2 and v > 0
        $valid_vxs.add [vx, steps] if x >= $x1 and x <= $x2
        v -= 1
        x += v
        steps += 1
    end
end


for vx in (1..$x2)
    check_vx(vx)
end

velocities = Set.new
for vx, steps in $valid_vxs
    if steps == 1
        for vy in $y1..$y2
            velocities.add [vx, vy]
        end
    end
end

puts velocities
