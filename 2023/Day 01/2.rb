sum = 0

def get_digit s, idx
    if s[idx] >= '0' and s[idx] <= '9'
        return s[idx]
    elsif s[idx..idx+3] == "zero"
        return '0'
    elsif s[idx..idx+2] == "one"
        return '1'
    elsif s[idx..idx+2] == "two"
        return '2'
    elsif s[idx..idx+4] == "three"
        return '3'
    elsif s[idx..idx+3] == "four"
        return '4'
    elsif s[idx..idx+3] == "five"
        return '5'
    elsif s[idx..idx+2] == "six"
        return '6'
    elsif s[idx..idx+4] == "seven"
        return '7'
    elsif s[idx..idx+4] == "eight"
        return '8'
    elsif s[idx..idx+3] == "nine"
        return '9'
    else
        return nil
    end
end

def get_first_digit s
    idx = 0
    digit = nil
    
    while digit == nil do
        digit = get_digit s, idx
        idx += 1
    end
    
    return digit
end

def get_second_digit s
    idx = s.length - 1
    digit = nil
    
    while digit == nil do
        digit = get_digit s, idx
        idx -= 1
    end
    
    return digit
end


while l = gets do
    digit_1 = get_first_digit l
    digit_2 = get_second_digit l
    sum += (digit_1 + digit_2).to_i
end

p sum