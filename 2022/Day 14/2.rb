cave = []
paths = STDIN.each_line.map{ |l| l.split(" -> ").map{ |p| p.split(',').map &:to_i } }
coords = paths.each_with_object([]){ |c, v| v.concat c }.uniq
x_min, x_max = 300, 700
y_max = coords.map{|c|c[1]}.max + 2
w = x_max - x_min + 1
h = y_max + 1

for _ in 0...h do
    cave << ('.'*w).chars
end

paths << [[x_min, h-1], [x_max+1, h-1]]

paths.each do |path|
    for i in 0...(path.size-1) do
        from, to = path[i], path[i+1]
        x1, y1 = from
        x2, y2 = to
        
        for y in ([y1,y2].min)..([y1,y2].max) do
            for x in ([x1,x2].min)..([x1,x2].max) do
                cave[y][x-x_min] = '#'
            end
        end
    end
end

stop_sand = false
tot_grains = 0

until stop_sand do
    sy, sx = 0, 500-x_min
    falling = true
    
    while falling and not stop_sand do
        if sy+1 == h # Falls outside below
            stop_sand = true
        elsif cave[sy+1][sx] == '.' # Falls straight down
            sy += 1
        elsif sx-1 < 0 # Falls outside on the left
            stop_sand = true
        elsif cave[sy+1][sx-1] == '.' # Moves to the left
            sx -= 1
        elsif sx+1 >= w # Falls outside on the right
            stop_sand = true
        elsif cave[sy+1][sx+1] == '.' # Moves to the right
            sx += 1
        else
            falling = false
        end
    end
    
    tot_grains += 1 unless stop_sand
    cave[sy][sx] = 'o' unless falling
    stop_sand = true if sy == 0 and not falling

#    if tot_grains % 100 == 0 or stop_sand
#        system "clear"
#        cave.each_with_index do |r, y|
#            puts "#{y} #{r.join('').gsub('#', '█').gsub('.', ' ').gsub('o', '░')}"
#        end
#        sleep(0.2)
#    end
end

p tot_grains
