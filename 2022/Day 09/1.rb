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
    h, t = [0,0], [0,0]
    visited = Set[t]
    
    while l = gets do
        dir, n = l.strip.split ' '
        
        for i in 0...n.to_i do
            h = move h, dir
            t = follow h, t
            visited.add t
        end
    end
    
    p visited.size
end

main
