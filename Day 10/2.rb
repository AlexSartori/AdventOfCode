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

def crt
    px = ($cycle-1) % 40
    lit = (px >= $x-1 and px <= $x+1)

    print (lit ? '#' : ' ')
    
    if px == 39
        print "\n"
    end
end

while l = gets do
    if l.strip == 'noop'
        crt
        noop
    else
        crt
        n = l.split(' ')[1].to_i
        noop
        crt
        add n
    end
end
