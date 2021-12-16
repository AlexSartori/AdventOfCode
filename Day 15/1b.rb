G = []

while line = gets
  G << line.strip.chars.map(&:to_i)
end

h, w = G.length, G[0].length
dist = Hash.new
queue = (0...w).to_a.product (0...h).to_a

dist[[0,0]] = 0

until queue.empty?
  # Vertex with min distance
  u = queue.first
  queue.each { |n| u = n if not dist[n].nil? and not dist[u].nil? and dist[n] < dist[u] }
  queue.delete u
  if u == [[h-1,w-1]] then break end

  # Neighbors
  [[-1,0], [1,0], [0,-1], [0,1]].each do |x_off, y_off|
    x, y = u
    if x + x_off < 0 or x + x_off >= w or y + y_off < 0 or y + y_off >= h
      next
    else
      alt = dist[u] + G[y + y_off][x + x_off]
      v = [x+x_off, y+y_off]
      dist[v] = alt if dist[v].nil? or alt < dist[v]
    end
  end
  puts "Queue size: #{queue.size} / Dist dize: #{dist.size}"
end

puts dist[[h-1,w-1]]
