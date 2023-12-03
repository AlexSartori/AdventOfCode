games = Hash.new

while l = gets do
    l = l.split(': ')
    game = l[0].split(' ')[1].to_i
    line = l[1].split(';')
    games[game] = line
end


r_max, g_max, b_max = 12, 13, 14
id_sum = 0

games.each do |g_id, extractions|
    possible = true

    extractions.each do |game|
        r = /[0-9]+ red/.match(game)
        g = /[0-9]+ green/.match(game)
        b = /[0-9]+ blue/.match(game)
        
        r = r.nil? ? 0 : r[0].to_i
        g = g.nil? ? 0 : g[0].to_i
        b = b.nil? ? 0 : b[0].to_i
        
        if r <= r_max and g <= g_max and b <= b_max then
            p "#{g_id} possible: #{r} #{g} #{b}"
        else
            p "#{g_id} impossible: #{r} #{g} #{b}"
            possible = false
        end
    end

    if possible then
        id_sum += g_id
    end
end

p id_sum
