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
$visited_twice = nil

def dfs(node)
  if node == 'end'
    $paths += 1
  else
    $path.append node
    G[node].each do |n|
      if n.upcase != n and $path.include?(n)
        if $visited_twice.nil? and n != 'start'
          $visited_twice = n
          dfs n
          $visited_twice = nil
        end
      else
        dfs(n)
      end
    end
    $path.pop
  end
end

dfs 'start'
puts $paths
