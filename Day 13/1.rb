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


pairs = STDIN.read.split("\n\n").map{ |p| p.split("\n").map{ |l| eval l } }
sum = 0

pairs.each_with_index do |pair, i|
    x = cmp pair[0], pair[1]
    sum += (i + 1) if x < 0
end

p sum
