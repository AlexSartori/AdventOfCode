sum = 0

def get_first_digit s
    idx = 0
    
    until s[idx] >= '0' and s[idx] <= '9' do
        idx += 1
    end

    return s[idx]
end

def get_second_digit s
    idx = s.length - 1
    
    until s[idx] >= '0' and s[idx] <= '9' do
        idx -= 1
    end

    return s[idx]
end


while l = gets do
    digit_1 = get_first_digit l
    digit_2 = get_second_digit l
    sum += (digit_1 + digit_2).to_i
end

p sum