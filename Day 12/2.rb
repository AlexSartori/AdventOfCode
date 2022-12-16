$grid = STDIN.read.split("\n").map(&:chars)
$steps = []
$s, $e = nil, nil
$h, $w = $grid.size, $grid[0].size

$grid.each_with_index do |row, y|
    $steps << [-1] * row.size
    _s, _e = row.index('S'), row.index('E')
    row.map! &:ord
    $s = [_s, y] unless _s.nil?
    $e = [_e, y] unless _e.nil?
end

def should_move from, to
    fy, fx, ty, tx = *to, *from
    return false if fy < 0 or fy >= $h or fx < 0 or fx >= $w
    return false if ty < 0 or ty >= $h or tx < 0 or tx >= $w
    return false if $grid[ty][tx] > $grid[fy][fx] + 1
    return true
end

def recursive_walk y, x
    n = $steps[y][x]

    for y_off, x_off in [[-1, 0], [0, 1], [1, 0], [0, -1]] do 
        if should_move([y, x], [y+y_off, x+x_off]) and ($steps[y+y_off][x+x_off] == -1 or $steps[y+y_off][x+x_off] > n + 1)
            $steps[y+y_off][x+x_off] = n + 1
            recursive_walk y+y_off, x+x_off
        end
    end
end


$steps[$e[1]][$e[0]] = 0
$grid[$s[1]][$s[0]] = 'a'.ord
$grid[$e[1]][$e[0]] = 'z'.ord

recursive_walk $e[1], $e[0]

min_a = nil
$grid.each_with_index do |r, y|
    r.each_with_index do |c, x|
        if c == 'a'.ord and (min_a.nil? or $steps[y][x] < min_a)
            min_a = $steps[y][x] if $steps[y][x] != -1
        end
    end
end

p min_a
