games = Hash.new

while l = gets do
    l = l.split(': ')
    game = l[0].split(' ')[1].to_i
    line = l[1].split(';')
    games[game] = line
end


r_max, g_max, b_max = 12, 13, 14
pwr_sum = 0

games.each do |g_id, extractions|
    r, g, b = 0, 0, 0

    extractions.each do |game|
        r_match = /[0-9]+ red/.match(game)
        g_match = /[0-9]+ green/.match(game)
        b_match = /[0-9]+ blue/.match(game)
        
        r_match = r_match.nil? ? 0 : r_match[0].to_i
        g_match = g_match.nil? ? 0 : g_match[0].to_i
        b_match = b_match.nil? ? 0 : b_match[0].to_i

        r = r_match if r_match > r
        g = g_match if g_match > g
        b = b_match if b_match > b
    end

    game_pwr = r * g * b
    pwr_sum += game_pwr
end

p pwr_sum
