G = []

while line = gets
  G << line.strip.chars.map(&:to_i)
end

h, w = G.length, G[0].length
h2, w2 = h*5, w*5
risks = []
risks << Array.new(w2, -1) while risks.size < h2

risks[0][0] = 0
end_risk = nil

loop do
  (0...h2).each do |y|
    (0...w2).each do |x|
      next if x == 0 and y == 0
      cell = G[y%h][x%w] + (y/h) + (x/w)
      cell = (cell-1) % 9 + 1

      if x == 0
        risks[y][x] = risks[y-1][x] + cell
      elsif y == 0
        risks[y][x] = risks[y][x-1] + cell
      else
        risks[y][x] = [risks[y][x-1], risks[y-1][x]].min + cell
      end

      unless end_risk.nil? # First iteration
        if x < w-1 and risks[y][x+1] + cell < risks[y][x]
          risks[y][x] = risks[y][x+1] + cell
        end
        if y < h-1 and risks[y+1][x] + cell < risks[y][x]
          risks[y][x] = risks[y+1][x] + cell
        end
      end
    end
  end

  break if risks[h2-1][w2-1] == end_risk
  end_risk = risks[h2-1][w2-1]
end

puts end_risk
