$grid = []
$flashes = 0

while line = gets
    $grid << line.strip.chars.map(&:to_i)
end

$h, $w = $grid.length, $grid[0].length

def flash(x, y)
    $grid[y][x] = 0
    $flashes += 1
    inc_neighbors(x, y)
end

def inc_neighbors(x, y)
    (-1..1).each do |y_off|
        if y + y_off < 0 or y + y_off >= $h then next end
        
        (-1..1).each do |x_off|
            if x + x_off < 0 or x + x_off >= $w then next end
            if x_off == 0 and y_off == 0 then next end
        
            $grid[y+y_off][x+x_off] += 1 if $grid[y+y_off][x+x_off] != 0
            
            if $grid[y+y_off][x+x_off] > 9
                flash(x + x_off, y + y_off)
            end
        end
    end
end

(0...100).each do |step|
    # Increase all nodes
    $grid.map! { |row| row.map! { |c| c+1 } }
    
    # Flash nodes > 9
    (0...$h).each do |y|
        (0...$w).each do |x|
            if $grid[y][x] > 9
                flash(x, y)
            end
        end
    end
end

puts $flashes
