G = Hash.new

while line = gets
  a, b = line.strip.split '-'
  G[a] = [] unless G.include? a
  G[b] = [] unless G.include? b
  G[a] << b
  G[b] << a
end

$paths = 0
$path = []

def dfs(node)
  if node == 'end'
    $paths += 1
  else
    $path.append node
    G[node].each do |n|
      dfs(n) unless $path.include? n and n.upcase != n
    end
    $path.pop
  end
end

dfs 'start'
puts $paths
