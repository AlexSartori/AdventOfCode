G = []

while line = gets
  G << line.strip.chars.map(&:to_i)
end

h, w = G.length, G[0].length
risks = []
risks << Array.new(w, -1) while risks.size < h

risks[0][0] = 0
end_risk = nil

loop do
  (0...h).each do |y|
    (0...w).each do |x|
      next if x == 0 and y == 0

      if x == 0
        risks[y][x] = risks[y-1][x] + G[y][x]
      elsif y == 0
        risks[y][x] = risks[y][x-1] + G[y][x]
      else
        risks[y][x] = [risks[y][x-1], risks[y-1][x]].min + G[y][x]

        unless end_risk.nil? # First iteration
          if x < w-1 and risks[y][x+1] + G[y][x] < risks[y][x]
            risks[y][x] = risks[y][x+1] + G[y][x]
          end
          if y < h-1 and risks[y+1][x] + G[y][x] < risks[y][x]
            risks[y][x] = risks[y+1][x] + G[y][x]
          end
        end
      end
    end
  end

  break if risks[h-1][w-1] == end_risk
  end_risk = risks[h-1][w-1]
end

risks.each do |row|
  # puts row.join ","
end

puts end_risk
