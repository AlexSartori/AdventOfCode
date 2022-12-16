def cmp p1, p2
    c1, c2 = p1.class, p2.class
    
    if c1 == Integer and c2 == Array
        return cmp [p1], p2
    elsif c1 == Array and c2 == Integer
        return cmp p1, [p2]
    elsif c1 == Integer and c2 == Integer
        return p1 - p2
    else # c1 == Array and c2 == Array
        i, j = 0, 0
        
        loop do
            return -1 if i == p1.size and j < p2.size
            return  1 if j == p2.size and i < p1.size
            return  0 if i == p1.size and j == p2.size
            
            res = cmp p1[i], p2[j]
            return res unless res == 0
            
            i += 1
            j += 1
        end
    end
end

pairs = STDIN.each_line.select{|l| l.strip != ""}.map{ |l| eval l }
pairs << [[2]]
pairs << [[6]]

pairs.sort!{ |x, y| cmp x, y }
i1, i2 = pairs.index([[2]]), pairs.index([[6]])
p (i1+1) * (i2+1)
