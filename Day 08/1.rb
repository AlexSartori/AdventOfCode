map = []
visible = []

while l = gets do
    map.append l.strip.chars.map &:to_i
    visible << [0]*map[-1].size
end

h, w = map.size, map[0].size

for y in 0...h do
    # Look from L to R
    tallest = -1
    for x in 0...w do
        visible[y][x] = 1 if map[y][x] > tallest
        tallest = [tallest, map[y][x]].max
    end
    
    # Look from R to L
    tallest = -1
    for x in (w-1).downto(0) do
        visible[y][x] = 1 if map[y][x] > tallest
        tallest = [tallest, map[y][x]].max
    end
end

for x in 0...w do
    # Look from T to B
    tallest = -1
    for y in 0...h do
        visible[y][x] = 1 if map[y][x] > tallest
        tallest = [tallest, map[y][x]].max
    end
    
    # Look from B to T
    tallest = -1
    for y in (h-1).downto(0) do
        visible[y][x] = 1 if map[y][x] > tallest
        tallest = [tallest, map[y][x]].max
    end
end

p visible.map(&:sum).sum
