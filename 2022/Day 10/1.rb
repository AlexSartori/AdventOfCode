$x = 1
$cycle = 1
$res = 0

def noop
    $cycle += 1
end

def add n
    $cycle += 1
    $x += n
end

def score
    return unless $cycle % 40 == 20
    puts "(#{$cycle}) X: #{$x}"
    $res += $cycle*$x
    puts "   res: #{$res}"
end

while l = gets do
    if l.strip == 'noop'
        noop
        score
    else
        n = l.split(' ')[1].to_i
        noop
        score
        add n
        score
    end
end

p $res
