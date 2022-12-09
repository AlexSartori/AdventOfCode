require 'set'

def move h, dir
    y, x = h
    
    if dir == 'U'
        return [y-1, x]
    elsif dir == 'D'
        return [y+1, x]
    elsif dir == 'R'
        return [y, x+1]
    else
        return [y, x-1]
    end
    
    return [y, x]
end

def follow h, t
    hy, hx = h
    ty, tx = t
    
    return t if (hy-ty).abs <= 1 and (hx-tx).abs <= 1
    
    if hx == tx
        ty += (hy > ty) ? 1 : -1
    elsif hy == ty
        tx += (hx > tx) ? 1 : -1
    else
        ty += (hy > ty) ? 1 : -1
        tx += (hx > tx) ? 1 : -1
    end
    
    return [ty, tx]
end

def main
    h = [0,0]
    t = []
    visited = Set[[0,0]]
    
    for i in 1..9 do
        t << [0,0]
    end
    
    while l = gets do
        dir, n = l.strip.split ' '
        
        for i in 0...n.to_i do
            h = move h, dir
            
            t[0] = follow h, t[0]
            for idx in 1...(t.size)
                t[idx] = follow t[idx-1], t[idx]
            end
            
            visited.add t[-1]
        end
    end
    
    p visited.size
end

main
